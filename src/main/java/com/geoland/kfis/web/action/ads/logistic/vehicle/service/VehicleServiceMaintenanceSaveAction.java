package com.geoland.kfis.web.action.ads.logistic.vehicle.service;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;
// TODO: Auto-generated Javadoc

/**
 * The Class VehicleServiceMaintenanceSaveAction.
 *
 * @author Festim Krasniqi,GEO&LAND
 * @created May 21, 2014 1:57:43 PM
 * @Version 1.0
 */
public class VehicleServiceMaintenanceSaveAction extends
		VehicleServiceMaintenanceBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 915146416370231307L;

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
		if (getVehicleServiceMaintenance().getVehicle().getId()== null)
			addFieldError("vehicleServiceMaintenance.vehicle.id",
					getMessage("vehicleServiceMaintenance.vehicle.empty"));
		if (StringUtils.isEmpty(getVehicleServiceMaintenance()
				.getExpenditureType()))
			addFieldError("vehicleServiceMaintenance.expenditureType",
					getMessage("vehicleServiceMaintenance.expenditureType.empty"));
		if (getVehicleServiceMaintenance().getValue() == null)
			addFieldError("vehicleServiceMaintenance.value",
					getMessage("vehicleServiceMaintenance.value.empty"));
		if (getVehicleServiceMaintenance().getDateService() == null)
			addFieldError("vehicleServiceMaintenance.dateService",
					getMessage("vehicleServiceMaintenance.dateService.empty"));

		if(compareDates(getVehicleServiceMaintenance().getDateService(), getVehicleServiceMaintenance().getDateValid()))
			addFieldError("vehicleServiceMaintenance.dateValid", getMessage("contract.invalid.date"));
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

		getVehicleServiceMaintenance().setEmployee(employee);
		getVehicleServiceMaintenance().setCreatedTime(new Date());
		DAOFactory.getFactory().getVehicleServiceMaintenanceDAO()
				.save(getVehicleServiceMaintenance());

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
