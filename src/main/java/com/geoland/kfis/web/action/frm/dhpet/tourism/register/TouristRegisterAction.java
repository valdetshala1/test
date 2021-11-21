/**
 * 
 */
package com.geoland.kfis.web.action.frm.dhpet.tourism.register;

import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class TouristRegisterAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Jan 27, 2016, 3:31:29 PM
 */
public class TouristRegisterAction extends TouristRegisterBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -255125040522954923L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(registerId!=null)
			register=DAOFactory.getFactory().getDhpetTouristRegisterDAO().get(registerId);
		
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
