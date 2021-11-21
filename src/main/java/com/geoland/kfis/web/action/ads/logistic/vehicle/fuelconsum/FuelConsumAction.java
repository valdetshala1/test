/**
 * 
 */
package com.geoland.kfis.web.action.ads.logistic.vehicle.fuelconsum;

import com.geoland.kfis.model.FuelConsum;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class FuelConsumAction.
 *
 * @author Festim Krasniqi,GEO&LAND
 * @created Jun 4, 2014 11:18:01 AM
 * @Version 1.0
 */
public class FuelConsumAction extends FuelConsumBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 650325346918635383L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(fuelConsumId!=null){
			FuelConsum fc=DAOFactory.getFactory().getFuelConsumDAO().get(fuelConsumId);
			setFuelConsum(fc);
		}
		return "form";
	}
	
	/**
	 * Grid.
	 *
	 * @return the string
	 */
	public String grid(){
		return "grid";
	}
	
	/**
	 * Page.
	 *
	 * @return the string
	 */
	public String page(){
		return "page";
	}
}
