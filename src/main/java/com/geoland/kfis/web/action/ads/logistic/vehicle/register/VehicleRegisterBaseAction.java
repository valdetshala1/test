package com.geoland.kfis.web.action.ads.logistic.vehicle.register;

import com.geoland.kfis.model.VehicleRegister;
import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class VehicleRegisterBaseAction.
 *
 * @author Festim Krasniqi,GEO&LAND
 * @created May 21, 2014 1:57:43 PM
 * @Version 1.0
 */
public class VehicleRegisterBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 7097394051988581552L;
	
	/** The vehicle register id. */
	protected Long vehicleRegisterId;
	
	/** The vehicle register. */
	protected VehicleRegister vehicleRegister;
	
	/**
	 * Gets the vehicle register id.
	 *
	 * @return the vehicle register id
	 */
	public Long getVehicleRegisterId() {
		return vehicleRegisterId;
	}
	
	/**
	 * Sets the vehicle register id.
	 *
	 * @param vehicleRegisterId the new vehicle register id
	 */
	public void setVehicleRegisterId(Long vehicleRegisterId) {
		this.vehicleRegisterId = vehicleRegisterId;
	}
	
	/**
	 * Gets the vehicle register.
	 *
	 * @return the vehicle register
	 */
	public VehicleRegister getVehicleRegister() {
		return vehicleRegister;
	}
	
	/**
	 * Sets the vehicle register.
	 *
	 * @param vehicleRegister the new vehicle register
	 */
	public void setVehicleRegister(VehicleRegister vehicleRegister) {
		this.vehicleRegister = vehicleRegister;
	}
	
	

}
