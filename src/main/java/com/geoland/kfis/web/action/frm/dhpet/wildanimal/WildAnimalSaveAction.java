package com.geoland.kfis.web.action.frm.dhpet.wildanimal;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class WildAnimalSaveAction.
 *
 * @author Fisnik Aliu, GEO&LAND
 * @created Oct 8, 2014 9:38:39 AM
 * @Version 1.0
 */
public class WildAnimalSaveAction extends WildAnimalBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 5221877990108711269L;
	
	/** The employee. */
	private Employee employee;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	public void validate() {
		employee=getUser().getEmployee();
		if(employee==null){
			addActionError("");
		}
		if(dhpetWildAnimals!=null && StringUtils.isEmpty(dhpetWildAnimals.getNameAl().trim()))
			addFieldError("dhpetWildAnimals.nameAl", getMessage("dhpet.wild.animals.name.al.empty"));
		if(dhpetWildAnimals!=null && StringUtils.isEmpty(dhpetWildAnimals.getNameEn().trim()))
			addFieldError("dhpetWildAnimals.nameEn", getMessage("dhpet.wild.animals.name.en.empty"));
		if(dhpetWildAnimals!=null && StringUtils.isEmpty(dhpetWildAnimals.getNameSr().trim()))
			addFieldError("dhpetWildAnimals.nameSr", getMessage("dhpet.wild.animals.name.al.empty"));
		
		if(hasFieldErrors() || hasActionErrors()) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exists", "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	public String execute() {
		if(dhpetWildAnimals.getId()==null){
			dhpetWildAnimals.setCreatedDate(new Date());
			dhpetWildAnimals.setEmployee(employee);
		}else {
			dhpetWildAnimals.setEmployee(dhpetWildAnimals.getEmployee());
		}
		User user = getUser().getUser();
		getDhpetWildAnimals().setCurrentUser(user);
		DAOFactory.getFactory().getDhpetWildAnimalsDAO().save(getDhpetWildAnimals());
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
	 * @param employee the new employee
	 */
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
}
