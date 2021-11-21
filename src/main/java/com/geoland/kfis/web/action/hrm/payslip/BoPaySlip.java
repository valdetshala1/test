package com.geoland.kfis.web.action.hrm.payslip;

import java.math.BigDecimal;
import java.math.MathContext;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Year;
import java.time.YearMonth;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

import com.geoland.kfis.model.EmployeeSalary;
import com.geoland.kfis.model.EmployeeSalaryAdjustment;
import com.geoland.kfis.model.EmployeeSalaryPayroll;
import com.geoland.kfis.model.EmployeeSalaryPayrollAdjustment;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.hrm.payroll.PayrollStatus;
import com.geoland.kfis.web.action.hrm.salary.SalaryCalculationType;

/**
 * 
 * Class BoPaySlip
 * @author BEKIM BAJRAKTARI
 * @created 04.05.2020 10:35:25
 * @Version 1.0
 */
public class BoPaySlip {
	
	protected static SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd.MM.yyyy");
	protected static SimpleDateFormat DATE_FORMAT1 = new SimpleDateFormat("dd/MM/yyyy");
	protected static SimpleDateFormat TIMESTAMP_FORMAT = new SimpleDateFormat("dd.MM.yyyy HH:mm:ss");

	
	
	public void savePayslip(EmployeeSalary salary, EmployeeSalaryPayroll payroll, Person user) throws ParseException {
		Person createdBy = user;
		Date createdDate = new Date();
		
		if(salary.getId() != null) {
			salary = DAOFactory.getFactory().getEmployeeSalaryDAO().get(salary.getId());
		}
		
		if(payroll!=null && payroll.getId() == null) {
			payroll.setStatus(PayrollStatus.NEW.name()); //NEW=New Payslip, CAL=Calculation Successful , FIN=The calendar run has been finalized. You can no longer make changes.
//			System.out.println( PayrollStatus.NEW.toString() );                      
//			System.out.println( PayrollStatus.NEW.name() );                          
//			System.out.println( PayrollStatus.valueOf( "NEW" ).name() );             
//			System.out.println( Enum.valueOf( PayrollStatus.class, "NEW" ).name() ); 			
		}
		
		payroll.setEmployee(salary.getEmployee());
		payroll.setEmployeeSalary(salary);
		
		BigDecimal sample = new BigDecimal(0.0);
		BigDecimal calcDeductions = calcDeductions(salary);
		MathContext precision = new MathContext(2); // example 2 setPrecisionYouWant
		
//		BigDecimal divide = salary.getBasicsalary().divide(new BigDecimal(12.0), MathContext.DECIMAL128);
//		BigDecimal divide2 = salary.getBasicsalary().divide(new BigDecimal(12.0), RoundingMode.HALF_EVEN);
		
		BigDecimal salarymonth = salary.getBasicsalary().divide(new BigDecimal(12.0), precision);
		BigDecimal netpay = salarymonth.subtract(calcDeductions);
		
		payroll.setTaxpay(calcDeductions);
		payroll.setGrosspay(salary.getGrosssalary());
		payroll.setNetpay(netpay);
		
		String query = "select sum(grosspay) as grosspay from thrm_employee_salary_payroll where " +
		"employee_id = " + payroll.getEmployee().getId() + " and fiscal_year = "  + payroll.getFiscalYear();
		List<?> view = DAOFactory.getFactory().getEmployeeSalaryPayrollDAO().getDataView(new String[]{"grosspay"}, new String[]{"STRING"}, query);
		if(view!=null && view.size() == 1){
			Object object = view.get(0);
			if(object != null && !object.equals("null")) {
				BigDecimal salaryyear = new BigDecimal(object.toString());
				payroll.setSalaryyear(salaryyear);
			}else {
				payroll.setSalaryyear(new BigDecimal(0.0));	
			}
		}else {
			payroll.setSalaryyear(new BigDecimal(0.0));
		}
		
		payroll.setSalarymonth(salarymonth);
		payroll.setHoursworked(sample);
		
		Long fiscalYear = payroll.getFiscalYear();
		Short payMonth = payroll.getPayMonth();
		
		int LastDayOfMonth = YearMonth.of(fiscalYear.intValue(), payMonth.intValue()).lengthOfMonth();
		Date firstDayOfMonth = DATE_FORMAT.parse("01." +  payMonth + "." + fiscalYear);
		Date lastDayOfMonth = DATE_FORMAT.parse( LastDayOfMonth + "." + payMonth + "." + fiscalYear);

		
		payroll.setStartDate(firstDayOfMonth);
		payroll.setEndDate(lastDayOfMonth);
		
		payroll.setCreatedBy(createdBy);
		payroll.setCreatedDate(createdDate);
		
		DAOFactory.getFactory().getEmployeeSalaryPayrollDAO().save(payroll);
		
		for (EmployeeSalaryAdjustment salaryAdjustment : salary.getEmployeeSalaryAdjustments()) {
			EmployeeSalaryPayrollAdjustment payrollAdjustment = new EmployeeSalaryPayrollAdjustment();

			payrollAdjustment.setCalculationType(salaryAdjustment.getCalculationType());
			payrollAdjustment.setAmountType(salaryAdjustment.getAmountType());
			payrollAdjustment.setAdjustmentDate(salaryAdjustment.getAdjustmentDate());
			payrollAdjustment.setAmount(salaryAdjustment.getAmount());
			payrollAdjustment.setHoursworked(salaryAdjustment.getHoursworked());
			payrollAdjustment.setHourlyrate(salaryAdjustment.getHourlyrate());
			payrollAdjustment.setEmployee(salaryAdjustment.getEmployee());
			payrollAdjustment.setFinancialType(salaryAdjustment.getFinancialType());
			payrollAdjustment.setAmountPercentage(salaryAdjustment.getAmountPercentage());
			payrollAdjustment.setEmployeeSalaryPayroll(payroll);
			payrollAdjustment.setCreatedBy(createdBy);
			payrollAdjustment.setCreatedDate(createdDate);

			DAOFactory.getFactory().getEmployeeSalaryPayrollAdjustmentDAO().save(payrollAdjustment);			
		}		
	}
	
	/*
	Salary Type = B (Gross), N (Net)
	Calculation Type={1,2,3,4}
	1=ADDS (Salary additions)
	2=DEDUCTIONS (Salary deductions)
	3=NOP (Only row calculation. No Salary impacts)
	4=NET (Only row calculation. By status CAL and FIN the net amount caluculated)
	*/	
	protected BigDecimal calcDeductions(EmployeeSalary salary) {
		BigDecimal deductions = new BigDecimal(0.0);
		for (EmployeeSalaryAdjustment adjustment : salary.getEmployeeSalaryAdjustments()) {
			if(SalaryCalculationType.SUB.name().equals(adjustment.getCalculationType())) {
				deductions = deductions.add(adjustment.getAmount());
			}
		}
		
		return deductions;
	}	
	
	public Date convertToDateViaInstant(LocalDateTime dateToConvert) {
	    return java.util.Date
	      .from(dateToConvert.atZone(ZoneId.systemDefault())
	      .toInstant());
	}
	
	public Date convertToDateViaInstant(LocalDate dateToConvert) {
	    return java.util.Date.from(dateToConvert.atStartOfDay()
	      .atZone(ZoneId.systemDefault())
	      .toInstant());
	}	
	
	static int LastDayOfMonth(int Y, int M) {
	    return LocalDate.of(Y, M, 1).getMonth().length(Year.of(Y).isLeap());
	}	
}
