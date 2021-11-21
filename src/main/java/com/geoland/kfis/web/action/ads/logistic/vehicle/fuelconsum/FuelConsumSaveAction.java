/**
 * 
 */
package com.geoland.kfis.web.action.ads.logistic.vehicle.fuelconsum;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class FuelConsumSaveAction.
 *
 * @author Festim Krasniqi,GEO&LAND
 * @created Jun 4, 2014 11:26:17 AM
 * @Version 1.0
 */
public class FuelConsumSaveAction extends FuelConsumBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -2191366685348963509L;

	/** The employee. */
	private Employee employee;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		employee=getUser().getEmployee();
		if(employee==null)
			addActionError("");
		if(getFuelConsum().getVehicle().getId()==null)
			addFieldError("fuelConsum.vehicle.id", getMessage("fuel.consum.vehicle.id.empty"));
		if(getFuelConsum().getEmployeeByDriverId().getId()==null)
			addFieldError("fuelConsum.employeeByDriverId.id", getMessage("fuel.consum.employee.by.driver.id.empty"));
		if(getFuelConsum().getLiter()==null){
			addFieldError("fuelConsum.liter", getMessage("fuel.consum.liter.empty"));
		}
		if (!getFieldErrors().isEmpty() || !getActionErrors().isEmpty()) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exits", "true");
		}
	}
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		if(getFuelConsum().getId()==null){
			getFuelConsum().setCreatedTime(new Date());
			getFuelConsum().setEmployeeByCreatedBy(employee);
		}
		getFuelConsum().setCurrentUser(getUser().getUser());
		DAOFactory.getFactory().getFuelConsumDAO().save(getFuelConsum());
		
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

