package com.geoland.kfis.web.action.ads.logistic.vehicle.staffassign;

import com.geoland.kfis.model.VehicleStaffAssign;
import com.geoland.kfis.persistence.dao.DAOFactory;
// TODO: Auto-generated Javadoc

/**
 * The Class VehicleStaffAssignAction.
 *
 * @author Festim Krasniqi,GEO&LAND
 * @created May 21, 2014 1:57:34 PM
 * @Version 1.0
 */
public class VehicleStaffAssignAction extends VehicleStaffAssignBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 8438178422394895074L;
	
	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(vehicleStaffAssignId!=null){
			VehicleStaffAssign vsa=DAOFactory.getFactory().getVehicleStaffAssignDAO().get(vehicleStaffAssignId);
			setVehicleStaffAssign(vsa);
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
