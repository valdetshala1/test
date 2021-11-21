package com.geoland.kfis.web.action.ads.logistic.vehicle.service;

import com.geoland.kfis.model.VehicleServiceMaintenance;
import com.geoland.kfis.persistence.dao.DAOFactory;
// TODO: Auto-generated Javadoc

/**
 * The Class VehicleServiceMaintenanceAction.
 *
 * @author Festim Krasniqi,GEO&LAND
 * @created May 21, 2014 1:57:43 PM
 * @Version 1.0
 */
public class VehicleServiceMaintenanceAction extends VehicleServiceMaintenanceBaseAction{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 4008790766941626493L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form() {

		if (vehicleServiceMaintenanceId != null) {
			VehicleServiceMaintenance lv = DAOFactory.getFactory().getVehicleServiceMaintenanceDAO()
					.get(vehicleServiceMaintenanceId);
			setVehicleServiceMaintenance(lv);
		}
		return "form";
	}

	/**
	 * Grid.
	 *
	 * @return the string
	 */
	public String grid() {
		return "grid";
	}

	/**
	 * Page.
	 *
	 * @return the string
	 */
	public String page() {
		return "page";
	}
}
