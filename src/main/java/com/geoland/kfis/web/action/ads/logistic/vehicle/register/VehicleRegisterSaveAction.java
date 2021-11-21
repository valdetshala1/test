package com.geoland.kfis.web.action.ads.logistic.vehicle.register;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;
// TODO: Auto-generated Javadoc

/**
 * The Class VehicleRegisterSaveAction.
 *
 * @author Festim Krasniqi,GEO&LAND
 * @created May 21, 2014 1:57:43 PM
 * @Version 1.0
 */
public class VehicleRegisterSaveAction extends
		VehicleRegisterBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -8145710319504722565L;

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
		if (getVehicleRegister().getVehicle().getId() == null)
			addFieldError("vehicleRegister.vehicle.id",
					getMessage("vehicleRegister.vehicle.empty"));
		if (getVehicleRegister().getRegisteredDate() == null)
			addFieldError("vehicleRegister.registeredDate",
					getMessage("vehicleRegister.registeredDate.empty"));
		if (getVehicleRegister().getValideToDate() == null)
			addFieldError("vehicleRegister.valideToDate",
					getMessage("vehicleRegister.valideToDate.empty"));
		if(compareDates(getVehicleRegister().getRegisteredDate(), getVehicleRegister().getValideToDate()))
			addFieldError("vehicleRegister.valideToDate", getMessage("contract.invalid.date"));
		
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

		getVehicleRegister().setEmployee(employee);
		getVehicleRegister().setCreatedTime(new Date());
		DAOFactory.getFactory().getVehicleRegisterDAO()
				.save(getVehicleRegister());
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
