/**
 * 
 */
package com.geoland.kfis.web.action.adm.bpartner;

import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class BPartnerAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 4:26:25 PM, Feb 11, 2015
 */
public class BPartnerAction extends BPartnerBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -4912593026257726429L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(bpartnerId!=null){
			bpartner = DAOFactory.getFactory().getBPartnerDAO().get(bpartnerId);
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
