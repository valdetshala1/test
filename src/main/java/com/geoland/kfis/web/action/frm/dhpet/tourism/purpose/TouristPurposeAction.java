/**
 * 
 */
package com.geoland.kfis.web.action.frm.dhpet.tourism.purpose;

import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class TouristPurposeAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Jan 25, 2016, 1:40:03 PM
 */
public class TouristPurposeAction extends TouristPurposeBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -5273082017173673470L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(purposeId!=null)
			purpose=DAOFactory.getFactory().getDhpetTouristPurposeDAO().get(purposeId);
		
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
