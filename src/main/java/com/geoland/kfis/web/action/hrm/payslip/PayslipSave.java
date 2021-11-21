package com.geoland.kfis.web.action.hrm.payslip;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.EmployeeSalary;
import com.geoland.kfis.model.EmployeeSalaryPayroll;
import com.geoland.kfis.persistence.dao.DAOFactory;

/**
 * 
 * Class PayrollSalaryTakeover
 * 
 * @author BEKIM BAJRAKTARI
 * @created 20.04.2020 14:07:48
 * @Version 1.0
 */
public class PayslipSave extends PayslipBaseAction {
	
	
	private static final long serialVersionUID = 1L;

	@Override
	public void validate() {
		
		
		if(createPayslipAll==false && salary.getId()==null) {
			addFieldError("salary", getMessage("hrml.employee.salary.empty"));
			
			if(salary.getEmployee().getId()==null) {
				addFieldError("salary.employee.firstName", getMessage("hrml.employee.salary.employee.empty"));
			}
		}
		
		if(salary.getEmployee().getId() != null) {
			Long fiscalYear = payroll.getFiscalYear();
			Short payMonth = payroll.getPayMonth();
			boolean checkIfEmployeeWithPayslipExists = DAOFactory.getFactory().getEmployeeSalaryDAO().checkIfEmployeeWithPayslipExists(salary.getEmployee().getId(), fiscalYear,  payMonth);
			if(checkIfEmployeeWithPayslipExists) {
				addFieldError("salary.employee.firstName", getMessage("hrml.employee.salary.payslip.exists"));
			}
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
		
			
		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exists", "true");
		}			
	}
	
	
	@Override
	public String execute() throws Exception {
		BoPaySlip bo = new BoPaySlip();

		if(createPayslipAll) {
			Long fiscalYear = payroll.getFiscalYear();
			Short payMonth = payroll.getPayMonth();
			Date payrollDate = payroll.getPayrollDate();
			
			List<EmployeeSalary> list = DAOFactory.getFactory().getEmployeeSalaryDAO().getEmployeeWithoutPayslip(fiscalYear, payMonth);
			for (EmployeeSalary es : list) {
				EmployeeSalaryPayroll pr = new EmployeeSalaryPayroll(); 
				pr.setFiscalYear(fiscalYear);
				pr.setPayMonth(payMonth);
				pr.setPayrollDate(payrollDate);
				bo.savePayslip(es, pr, getUser().getPerson());
			}
			
		}else {
			bo.savePayslip(salary, payroll, getUser().getPerson());
		}
		
		
		return SUCCESS;
	}
	


}
