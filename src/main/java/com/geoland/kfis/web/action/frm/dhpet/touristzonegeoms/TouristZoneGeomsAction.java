package com.geoland.kfis.web.action.frm.dhpet.touristzonegeoms;

import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class TouristZoneGeomsAction.
 *
 * @author Ardiana Demolli, Geo&Land
 * Jan 28, 2016, 3:23:19 PM
 * v2.0
 */
public class TouristZoneGeomsAction extends TouristZoneGeomsBaseAction{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(touristZoneGeomsId != null)
			touristZoneGeoms = DAOFactory.getFactory().getDhpetTouristZoneGeomsDAO().get(touristZoneGeomsId);
		return "form";
	}
	
	/**
	 * Page.
	 *
	 * @return the string
	 */
	public String page(){
		return "page";
	}
	
	/**
	 * Grid.
	 *
	 * @return the string
	 */
	public String grid(){
		return "grid";
	}
}
