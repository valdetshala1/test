package com.geoland.kfis.web.action.fal.requesttype;

import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class RequestTypeAction.
 *
 * @author Ardiana Demolli, Geo&Land
 * Dec 18, 2015, 9:37:08 AM
 * v2.0
 */
public class RequestTypeAction extends RequestTypeBaseAction{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(requestTypeId!=null)
			requestType = DAOFactory.getFactory().getRequestTypeDAO().get(requestTypeId);
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
