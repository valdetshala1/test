package com.geoland.kfis.web.action.mer.project;

import com.geoland.kfis.persistence.dao.DAOFactory;
// TODO: Auto-generated Javadoc

/**
 * The Class ProjectAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Mar 25, 2015 , 4:56:02 PM
 */
public class ProjectAction extends ProjectBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(projectId!=null){
			project=DAOFactory.getFactory().getMerProjectDAO().get(projectId);
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
		if(projId!=null){
			project=DAOFactory.getFactory().getMerProjectDAO().get(projId);
		}
		return "page";
	}
	

}
