package com.geoland.kfis.web.action.ads.logistic.vehicle;

import com.geoland.kfis.model.Vehicle;
import com.geoland.kfis.persistence.dao.DAOFactory;
// TODO: Auto-generated Javadoc

/**
 * The Class VehicleAction.
 *
 * @author Festim Krasniqi,GEO&LAND
 * @created May 21, 2014 1:57:05 PM
 * @Version 1.0
 */
public class VehicleAction extends VehicleBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 2632837906201427457L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form() {

		if (vehicleId != null) {
			Vehicle lv = DAOFactory.getFactory().getVehicleDAO()
					.get(vehicleId);
			setVehicle(lv);
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
	 * Profile.
	 *
	 * @return the string
	 */
	public String profile() {
		if (vehicleId != null) {
			vehicle=DAOFactory.getFactory().getVehicleDAO().get(vehicleId);
		}
		return "profile";
	}

	/**
	 * Page.
	 *
	 * @return the string
	 */
	public String page() {
		return "page";
	}
	
	/**
	 * Report generator.
	 *
	 * @return the string
	 */
	public String reportGenerator(){
		return "report_generator";
	}
}
