package com.geoland.kfis.web.action.affref;

import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class AffRefProjectsAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 2.0
 * @created Nov 29, 2017 , 11:54:07 AM
 */
public class AffRefProjectsAction  extends AffRefProjectsBaseAction{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	
	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(affrefprojectId!=null){
			affRefProjects=DAOFactory.getFactory().getAffRefProjectsDAO().get(affrefprojectId);
			if(affRefProjects.getAffRefProjects()!=null){
				parentId=affRefProjects.getAffRefProjects().getId();
			}
		
		}
		if(parentId!=null){
			ref=DAOFactory.getFactory().getAffRefProjectsDAO().get(parentId);
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
