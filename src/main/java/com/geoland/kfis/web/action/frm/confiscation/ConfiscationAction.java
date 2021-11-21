/**
 * 
 */
package com.geoland.kfis.web.action.frm.confiscation;

import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class ConfiscationAction.
 *
 * @author ADELINA GASHI, GEO&LAND
 * @created Aug 9, 2016 , 10:20:34 AM
 * @Version 1.0
 */
public class ConfiscationAction extends ConfiscationBaseAction{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -2784573753965905211L;
	
	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(confiscationId!=null){
			confiscation=DAOFactory.getFactory().getConfiscationDAO().get(confiscationId);
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
	
	/**
	 * Report generator.
	 *
	 * @return the string
	 */
	public String reportGenerator(){
		return "reportGenerator";
	}
	

}
