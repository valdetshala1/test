package com.geoland.kfis.web.action.pub;

import com.geoland.kfis.persistence.dao.DAOFactory;
// TODO: Auto-generated Javadoc

/**
 * The Class PublishAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created May 5, 2015 , 4:00:11 PM
 */
public class PublishAction extends PublishBaseAction{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(publishingId!=null){
			publishing=DAOFactory.getFactory().getPublishingDAO().get(publishingId);
		}
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
