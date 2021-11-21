package com.geoland.kfis.web.action.ads.logistic.vehicle.register;

import com.geoland.kfis.model.VehicleRegister;
import com.geoland.kfis.persistence.dao.DAOFactory;
// TODO: Auto-generated Javadoc

/**
 * The Class VehicleRegisterAction.
 *
 * @author Festim Krasniqi,GEO&LAND
 * @created May 21, 2014 1:57:43 PM
 * @Version 1.0
 */
public class VehicleRegisterAction extends VehicleRegisterBaseAction{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 3132842899812983524L;

/**
 * Form.
 *
 * @return the string
 */
public String form(){
		if(vehicleRegisterId!=null){
			VehicleRegister lvr=DAOFactory.getFactory().getVehicleRegisterDAO().get(vehicleRegisterId);
			setVehicleRegister(lvr);
		}
		return "form";
	}
	
	/**
	 * List.
	 *
	 * @return the string
	 */
	public String list(){
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
