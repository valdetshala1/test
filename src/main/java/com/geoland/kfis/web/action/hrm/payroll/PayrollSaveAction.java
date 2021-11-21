package com.geoland.kfis.web.action.hrm.payroll;

import java.math.BigDecimal;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.EmployeeSalaryAdjustment;
import com.geoland.kfis.model.FinancialType;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.hrm.payslip.BoPaySlip;

/**
 * 
 * Class PayrollSaveAction
 * 
 * @author BEKIM BAJRAKTARI
 * @created 15.04.2020 09:30:53
 * @Version 1.0
 */
public class PayrollSaveAction extends PayrollBaseAction {

	private static final long serialVersionUID = 1L;


	/**
	 * 1. finance type by deduction must be unique
	 * 2. if finance type is inserted, than other fields of deduction are required 
	 * 3. year salary is required. other field can be computed automatically
	 * 4. Additional or bonus can be inserted. 
	 * 4. Flag for automatic calculation should be add to salary DB table    
	 * 5. employee has unique salary. validation is active only when salary is new
	 */
	@Override
	public void validate() {
		
		/*validate salary for employee only by new salary*/
		if(salary.getId()==null) {
			if(salary.getEmployee().getId()==null) {
				addFieldError("salary.employee.firstName", getMessage("hrml.employee.salary.employee.empty"));
			}

			if(salary.getEmployee().getId()!=null) {
				boolean bEmplyoee = DAOFactory.getFactory().getEmployeeSalaryDAO().checkIfEmployeeSalaryExists(salary.getEmployee().getId());
				if(bEmplyoee) {
					addFieldError("salary.employee.firstName", getMessage("hrml.employee.salary.exists"));
				}
			}
		}
		
		if(payroll==null || payroll.getId()==null) {
			addFieldError("salary.employee.firstName", getMessage("hrml.employee.salary.employee.empty"));
		}		

		if(payroll.getFiscalYear() == null) {
			addFieldError("payroll.fiscalYear", getMessage("hrml.employee.salary.payroll.fiscalYear.empty"));
		}

		if(payroll.getPayMonth() == null) {
			addFieldError("payroll.payMonth", getMessage("hrml.employee.salary.payroll.payMonth.empty"));
		}		
		
		if(payroll.getPayrollDate() == null) {
			addFieldError("payroll.payrollDate", getMessage("hrml.employee.salary.payroll.payrollDate.empty"));
		}		

		if(adjustment.getAmountPercentage()!=null) {
			adjustment.setAmount(new BigDecimal(0.0));
		}else if(adjustment.getAmount()==null) {
			addFieldError("adjustment.amount", getMessage("hrml.employee.salary.adjustment.amount.empty"));
		}
		
		Long financialTypeId = adjustment.getFinancialType().getId();
		if(financialTypeId!=null && salary.getEmployee().getId()!=null && payroll.getFiscalYear()!=null & payroll.getPayMonth()!=null) {
			boolean bCheck = DAOFactory.getFactory().getEmployeeSalaryPayrollAdjustmentDAO().checkIfAdjustmentExists(salary.getEmployee().getId(), financialTypeId, payroll.getFiscalYear(), payroll.getPayMonth());
			if(bCheck) {
				addFieldError("adjustment.financialType.name", getMessage("hrml.employee.salary.adjustment.financialType.name.exists"));
			}
		}		
		
		if(payroll.getId()!=null){
			adjustments = DAOFactory.getFactory().getEmployeeSalaryPayrollAdjustmentDAO().getEmployeeSalaryPayrollAdjustments(payroll.getId());
		}
		
		
		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exists", "true");
		}		
	}
	
	
	@Override
	public String execute() throws Exception {
		Person createdBy = getUser().getPerson();
		Date createdDate = new Date();
//		BoPaySlip bo = new BoPaySlip();
//		bo.savePayslip(salary, payroll, createdBy);
		
		if(payroll.getId()!=null){
			 payroll=DAOFactory.getFactory().getEmployeeSalaryPayrollDAO().get(payroll.getId());
		}
		
		Long financialTypeId = adjustment.getFinancialType().getId();
		if(financialTypeId!=null) {
			FinancialType financialType = DAOFactory.getFactory().getFinancialTypeDAO().get(financialTypeId);
			adjustment.setCreatedBy(createdBy);
			adjustment.setCreatedDate(createdDate);
			adjustment.setEmployee(payroll.getEmployee());
			adjustment.setEmployeeSalaryPayroll(payroll);
			
			BigDecimal amountPercentage = adjustment.getAmountPercentage();
			if(amountPercentage!=null) {
				amountPercentage = amountPercentage.divide(new BigDecimal(100.0));
				adjustment.setAmountPercentage(amountPercentage);
			}			
			
			adjustment.setFinancialType(financialType);
			if(adjustment.getAdjustmentDate()==null) {
				adjustment.setAdjustmentDate(createdDate);
			}
			
			adjustment = DAOFactory.getFactory().getEmployeeSalaryPayrollAdjustmentDAO().save(adjustment);
			
			cal(payroll.getId());
		}		
		
		if(payroll.getId()!=null){
			adjustments = DAOFactory.getFactory().getEmployeeSalaryPayrollAdjustmentDAO().getEmployeeSalaryPayrollAdjustments(payroll.getId());
		}
		
		return SUCCESS;
	}
}
