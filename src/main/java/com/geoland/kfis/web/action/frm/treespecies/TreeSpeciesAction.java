package com.geoland.kfis.web.action.frm.treespecies;

import com.geoland.kfis.persistence.dao.DAOFactory;
 
// TODO: Auto-generated Javadoc
/**
 * The Class TreeSpeciesAction.
 *
 * @author Detjana Kastrati, GEO&LAND
 * @version 1.0
 * @created Feb 3, 2015, 4:40:15 PM
 */
public class TreeSpeciesAction extends TreeSpeciesBaseAction {


	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -5739461905009366391L;
	
	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(treespeciesId != null){
			treespecies=DAOFactory.getFactory().getTreeSpeciesDAO().get(treespeciesId);
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
