package com.geoland.kfis.web.action.ads.logistic.vehicle;

import com.geoland.kfis.model.Vehicle;
import com.geoland.kfis.persistence.hibernate.usertypes.Fueltype;
import com.geoland.kfis.persistence.hibernate.usertypes.Month;
import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class VehicleBaseAction.
 *
 * @author Festim Krasniqi,GEO&LAND
 * @created May 21, 2014 1:57:18 PM
 * @Version 1.0
 */
public class VehicleBaseAction extends BaseActionSupport{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -6619396323755512179L;
	
	/** The vehicle id. */
	protected Long vehicleId;
	
	/** The vehicle. */
	protected Vehicle vehicle;
	
	/** The fuel type list. */
	protected Fueltype[] fuelTypeList=Fueltype.values();
	
	/** The month list. */
	protected Month[] monthList=Month.values();
	
	/**
	 * Gets the vehicle id.
	 *
	 * @return the vehicle id
	 */
	public Long getVehicleId() {
		return vehicleId;
	}
	
	/**
	 * Sets the vehicle id.
	 *
	 * @param vehicleId the new vehicle id
	 */
	public void setVehicleId(Long vehicleId) {
		this.vehicleId = vehicleId;
	}
	
	/**
	 * Gets the vehicle.
	 *
	 * @return the vehicle
	 */
	public Vehicle getVehicle() {
		return vehicle;
	}
	
	/**
	 * Sets the vehicle.
	 *
	 * @param vehicle the new vehicle
	 */
	public void setVehicle(Vehicle vehicle) {
		this.vehicle = vehicle;
	}
	
	/**
	 * Gets the fuel type list.
	 *
	 * @return the fuel type list
	 */
	public Fueltype[] getFuelTypeList() {
		return fuelTypeList;
	}
	
	/**
	 * Sets the fuel type list.
	 *
	 * @param fuelTypeList the new fuel type list
	 */
	public void setFuelTypeList(Fueltype[] fuelTypeList) {
		this.fuelTypeList = fuelTypeList;
	}
	
	/**
	 * Gets the month list.
	 *
	 * @return the monthList
	 */
	public Month[] getMonthList() {
		return monthList;
	}
	
	/**
	 * Sets the month list.
	 *
	 * @param monthList the monthList to set
	 */
	public void setMonthList(Month[] monthList) {
		this.monthList = monthList;
	}
	
}
