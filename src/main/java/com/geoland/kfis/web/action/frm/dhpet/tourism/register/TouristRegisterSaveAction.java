/**
 * 
 */
package com.geoland.kfis.web.action.frm.dhpet.tourism.register;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class TouristRegisterSaveAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Jan 27, 2016, 3:33:39 PM
 */
public class TouristRegisterSaveAction extends TouristRegisterBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -6719213561158637424L;
	
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
		
		if(register!=null && (register.getDhpetLocation()==null || (register.getDhpetLocation()!=null && register.getDhpetLocation().getId()==null)))
			addFieldError("register.dhpetLocation", getMessage("dhpet.animal.capacity.location.empty"));
		
		if(register!=null && (register.getDhpetTouristPurpose()==null || (register.getDhpetTouristPurpose()!=null && register.getDhpetTouristPurpose().getId()==null)))
			addFieldError("register.dhpetTouristPurpose", getMessage("register.dhpetTouristPurpose.empty"));
		
		if(register!=null && register.getStartDate()==null)
			addFieldError("register.startDate", getMessage("payment.start.date.empty"));
		
		if(register!=null && register.getEndDate()==null)
			addFieldError("register.endDate", getMessage("end.date.empty"));
		
		if(register!=null && register.getTouristNumber()==null)
			addFieldError("register.touristNumber", getMessage("register.touristNumber.empty"));
		
		
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
		if(register.getId()==null){
			register.setEmployee(employee);
			register.setCreatedDate(new Date());
		}
		User user = getUser().getUser();
		register.setCurrentUser(user);
		DAOFactory.getFactory().getDhpetTouristRegisterDAO().save(register);
		
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
