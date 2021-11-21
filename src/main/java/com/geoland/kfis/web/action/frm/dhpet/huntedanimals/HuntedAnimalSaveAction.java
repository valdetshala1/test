/**
 * 
 */
package com.geoland.kfis.web.action.frm.dhpet.huntedanimals;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class HuntedAnimalSaveAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 4:19:14 PM, Mar 17, 2015
 */
public class HuntedAnimalSaveAction extends HuntedAnimalBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -4819063277949028522L;
	
	/** The employee. */
	private Employee employee;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		employee=getUser().getEmployee();
		if(employee==null)
			addActionError("login.user.employee.role.empty");

		if(hunt!=null && (hunt.getDhpetAnnualPlan()==null || (hunt.getDhpetAnnualPlan()!=null && hunt.getDhpetAnnualPlan().getId()==null)))
			addFieldError("hunt.dhpetLocation", getMessage("fin.input.year.empty"));
		if(hunt!=null && (hunt.getDhpetWildAnimals()==null || (hunt.getDhpetWildAnimals()!=null && hunt.getDhpetWildAnimals().getId()==null)))
			addFieldError("hunt.dhpetWildAnimals",getMessage("dhpet.wild.animals.empty"));
		if(hunt!=null && hunt.getDate()==null)
			addFieldError("hunt.date", getMessage("mer.execution.date.empty"));
		if(hunt!=null && hunt.getAnimalsNumber()==null)
			addFieldError("hunt.animalsNumber", getMessage("hunt.animalsNumber.empty"));
		
		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response=ServletActionContext.getResponse();
			response.addHeader("errors_exist", "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		Date cdate=new Date();
		hunt.setCreatedDate(cdate);
		hunt.setEmployee(employee);
		User user = getUser().getUser();
		hunt.setCurrentUser(user);
		
		DAOFactory.getFactory().getDhpetHuntedAnimalsDAO().save(hunt);
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
