package com.geoland.kfis.web.action.hrm.payroll;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.EmployeeSalaryPayrollAdjustment;
import com.geoland.kfis.persistence.dao.DAOFactory;

/**
 * 
 * Class PayrollAdjustmentDelete
 * @author BEKIM BAJRAKTARI
 * @created 04.05.2020 12:36:09
 * @Version 1.0
 */
public class PayrollAdjustmentDelete extends PayrollBaseAction{

	private static final long serialVersionUID = -8088396038360638226L;
	
	@Override
	public void validate() {
		if(payrollId==null) {
			addFieldError("salary.employee.firstName", getMessage("hrml.employee.salary.employee.empty"));
		}	

		if(adjustmentId==null ) {
			addActionError( getMessage("hrml.employee.salary.payroll.adjustment.id.empty"));
		}			
		
		
		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exists", "true");
		}		
	}

	
	@Override
	public String execute() throws Exception {
		
		EmployeeSalaryPayrollAdjustment espa = DAOFactory.getFactory().getEmployeeSalaryPayrollAdjustmentDAO().get(adjustmentId);
		DAOFactory.getFactory().getEmployeeSalaryPayrollAdjustmentDAO().delete(espa);
		
		if(payrollId != null){
			payroll = DAOFactory.getFactory().getEmployeeSalaryPayrollDAO().get(payrollId);
			
			salary = payroll.getEmployeeSalary();
			
			cal(payroll.getId());
			
			adjustments = DAOFactory.getFactory().getEmployeeSalaryPayrollAdjustmentDAO().getEmployeeSalaryPayrollAdjustments(payroll.getId());
		}		
		
		return SUCCESS;
	}
	
	

}
