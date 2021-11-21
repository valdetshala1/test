package com.geoland.kfis.web.action.hrm.salary;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.persistence.dao.DAOFactory;

/**
 * 
 * Class SalarySaveAction
 * 
 * @author BEKIM BAJRAKTARI
 * @created 15.04.2020 09:30:53
 * @Version 1.0
 */
public class DeductionSaveAction extends SalaryBaseAction {

	private static final long serialVersionUID = 1L;

	@Override
	public void validate() {

		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exists", "true");
		}		
	}
	
	
	@Override
	public String execute() throws Exception {
		DAOFactory.getFactory().getEmployeeSalaryAdjustmentDAO().save(adjustment);
		return SUCCESS;
	}
}
