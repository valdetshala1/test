package com.geoland.kfis.web.action.hrm.salary;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.EmployeeSalaryAdjustment;
import com.geoland.kfis.persistence.dao.DAOFactory;

/**
 * 
 * Class SalaryAdjustmentDelete
 * @author BEKIM BAJRAKTARI
 * @created 04.05.2020 12:37:34
 * @Version 1.0
 */
public class SalaryAdjustmentDelete extends SalaryBaseAction{

	private static final long serialVersionUID = -8088396038360638226L;
	
	@Override
	public void validate() {
		if(salaryId==null) {
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
		EmployeeSalaryAdjustment esa = DAOFactory.getFactory().getEmployeeSalaryAdjustmentDAO().get(adjustmentId);
		DAOFactory.getFactory().getEmployeeSalaryAdjustmentDAO().delete(esa);
		
		if(salaryId != null){
			salary = DAOFactory.getFactory().getEmployeeSalaryDAO().get(getSalaryId());
			adjustments = DAOFactory.getFactory().getEmployeeSalaryAdjustmentDAO().getEmployeeSalaryAdjustments(salary.getEmployee().getId());
		}
		
		return SUCCESS;
	}
	
	

}
