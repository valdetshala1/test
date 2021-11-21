package com.geoland.kfis.web.action.ads.logistic.vehicle.service;

import com.geoland.kfis.model.VehicleServiceMaintenance;
import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class VehicleServiceMaintenanceBaseAction.
 *
 * @author Festim Krasniqi,GEO&LAND
 * @created May 21, 2014 1:57:43 PM
 * @Version 1.0
 */
public class VehicleServiceMaintenanceBaseAction extends BaseActionSupport{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -6923250714838885235L;
	
	/** The vehicle service maintenance id. */
	protected Long vehicleServiceMaintenanceId;
	
	/** The vehicle service maintenance. */
	protected VehicleServiceMaintenance vehicleServiceMaintenance;
	
	/**
	 * Gets the vehicle service maintenance id.
	 *
	 * @return the vehicle service maintenance id
	 */
	public Long getVehicleServiceMaintenanceId() {
		return vehicleServiceMaintenanceId;
	}
	
	/**
	 * Sets the vehicle service maintenance id.
	 *
	 * @param vehicleServiceMaintenanceId the new vehicle service maintenance id
	 */
	public void setVehicleServiceMaintenanceId(Long vehicleServiceMaintenanceId) {
		this.vehicleServiceMaintenanceId = vehicleServiceMaintenanceId;
	}
	
	/**
	 * Gets the vehicle service maintenance.
	 *
	 * @return the vehicle service maintenance
	 */
	public VehicleServiceMaintenance getVehicleServiceMaintenance() {
		return vehicleServiceMaintenance;
	}
	
	/**
	 * Sets the vehicle service maintenance.
	 *
	 * @param vehicleServiceMaintenance the new vehicle service maintenance
	 */
	public void setVehicleServiceMaintenance(
			VehicleServiceMaintenance vehicleServiceMaintenance) {
		this.vehicleServiceMaintenance = vehicleServiceMaintenance;
	}
	

}
