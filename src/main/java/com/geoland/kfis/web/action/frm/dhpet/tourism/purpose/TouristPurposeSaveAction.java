/**
 * 
 */
package com.geoland.kfis.web.action.frm.dhpet.tourism.purpose;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class TouristPurposeSaveAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Jan 25, 2016, 1:40:16 PM
 */
public class TouristPurposeSaveAction extends TouristPurposeBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -7021976155130116723L;
	
	/** The employee. */
	private Employee employee;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		employee=getUser().getEmployee();
		if(employee==null)
			addActionError("employee.empty");
		
		if(purpose!=null && (purpose.getName()==null || StringUtils.isEmpty(purpose.getName())))
				addFieldError("purpose.name", getMessage("dhpet.wild.animals.name.al.empty"));
		
		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exist", "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		if(purpose.getId()==null){
			purpose.setEmployee(employee);
			purpose.setCreatedDate(new Date());
		}
		User user = getUser().getUser();
		purpose.setCurrentUser(user);
		DAOFactory.getFactory().getDhpetTouristPurposeDAO().save(purpose);
		
		return SUCCESS;
	}

	/**
	 * Gets the employee.
	 *
	 * @return the employee
	 */
	public Employee getEmployee() {
		return employee;
	}

	/**
	 * Sets the employee.
	 *
	 * @param employee the employee to set
	 */
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
	
}
