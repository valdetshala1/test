/**
 * 
 */
package com.geoland.kfis.web.action.mer.strategy.refsubproject;

import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class RefSubProjectAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 4:03:12 PM, Mar 27, 2015
 */
public class RefSubProjectAction extends RefSubProjectBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1849475987031624564L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(refSubProjectId!=null)
			setRefSubProject(DAOFactory.getFactory().getMerRefSubProjectDAO().get(refSubProjectId));
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
