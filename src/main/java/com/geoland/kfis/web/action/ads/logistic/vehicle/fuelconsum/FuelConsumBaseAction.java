/**
 * 
 */
package com.geoland.kfis.web.action.ads.logistic.vehicle.fuelconsum;


import com.geoland.kfis.model.FuelConsum;
import com.geoland.kfis.persistence.hibernate.usertypes.Fueltype;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class FuelConsumBaseAction.
 *
 * @author Festim Krasniqi,GEO&LAND
 * @created Jun 4, 2014 11:16:00 AM
 * @Version 1.0
 */
public class FuelConsumBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 7547303282158622915L;

	/** The fuel consum id. */
	protected Long fuelConsumId;
	
	/** The fuel consum. */
	protected FuelConsum fuelConsum;
	
	/** The fuel type list. */
	protected Fueltype[] fuelTypeList=Fueltype.values();
	
	/**
	 * Gets the fuel consum id.
	 *
	 * @return the fuelConsumId
	 */
	public Long getFuelConsumId() {
		return fuelConsumId;
	}
	
	/**
	 * Sets the fuel consum id.
	 *
	 * @param fuelConsumId the fuelConsumId to set
	 */
	public void setFuelConsumId(Long fuelConsumId) {
		this.fuelConsumId = fuelConsumId;
	}
	
	/**
	 * Gets the fuel consum.
	 *
	 * @return the fuelConsum
	 */
	public FuelConsum getFuelConsum() {
		return fuelConsum;
	}
	
	/**
	 * Sets the fuel consum.
	 *
	 * @param fuelConsum the fuelConsum to set
	 */
	public void setFuelConsum(FuelConsum fuelConsum) {
		this.fuelConsum = fuelConsum;
	}
	
	/**
	 * Gets the fuel type list.
	 *
	 * @return the fuelTypeList
	 */
	public Fueltype[] getFuelTypeList() {
		return fuelTypeList;
	}
	
	/**
	 * Sets the fuel type list.
	 *
	 * @param fuelTypeList the fuelTypeList to set
	 */
	public void setFuelTypeList(Fueltype[] fuelTypeList) {
		this.fuelTypeList = fuelTypeList;
	}
}
