package com.geoland.kfis.web.action.ads.logistic.vehicle;

import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;
// TODO: Auto-generated Javadoc

/**
 * The Class VehicleSaveAction.
 *
 * @author Festim Krasniqi,GEO&LAND
 * @created May 21, 2014 1:57:26 PM
 * @Version 1.0
 */
public class VehicleSaveAction extends VehicleBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -5560675035593316190L;
	
	/** The employee. */
	private Employee employee;

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		employee=getUser().getEmployee();
		if(employee==null){
			addActionError("");
		}
		if (getVehicle().getOrganisation().getId() == null)
			addFieldError("vehicle.organisation.id",getMessage("vehicle.organisation.empty"));
		if (StringUtils.isEmpty(getVehicle().getDestination()))
			addFieldError("vehicle.destination", getMessage("vehicle.destination.empty"));
		if (StringUtils.isEmpty(getVehicle().getBrand()))
			addFieldError("vehicle.brand", getMessage("vehicle.brand.empty"));
		if (StringUtils.isEmpty(getVehicle().getType()))
			addFieldError("vehicle.type", getMessage("vehicle.type.empty"));
		int actualYear= Calendar.getInstance().get(Calendar.YEAR);
		if (getVehicle().getYearProduct() == null)
			addFieldError("vehicle.yearProduct", getMessage("vehicle.yearProduct.empty"));
		else if( getVehicle().getYearProduct()>actualYear)
			addFieldError("vehicle.yearProduct", getMessage("vehicle.yearProduct.bigger_than_current_year"));
		if (StringUtils.isEmpty(getVehicle().getPlateNumber()))
			addFieldError("vehicle.plateNumber",getMessage("vehicle.plateNumber.empty"));
		if (getVehicle().getFirstRegistration() == null)
			addFieldError("vehicle.firstRegistration",getMessage("vehicle.firstRegistration.empty"));
		if (getVehicle().getNumberOfSeats() == null)
			addFieldError("vehicle.numberOfSeats",getMessage("vehicle.numberOfSeats.empty"));
		if (StringUtils.isEmpty(getVehicle().getEngineCode()))
			addFieldError("vehicle.engineCode",getMessage("vehicle.engineCode.empty"));

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
		if(getVehicle().getId()==null){
			getVehicle().setCreatedDate(new Date());
			getVehicle().setEmployee(employee);
		}
		getVehicle().setCurrentUser(getUser().getUser());
		DAOFactory.getFactory().getVehicleDAO().save(getVehicle());
		return SUCCESS;
	}
}
