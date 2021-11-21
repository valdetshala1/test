/**
 * 
 */
package com.geoland.kfis.web.action.frm.dhpet.huntedanimals;

import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class HuntedAnimalAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 4:18:56 PM, Mar 17, 2015
 */
public class HuntedAnimalAction extends HuntedAnimalBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 3374936353020165588L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(huntId!=null)
			setHunt(DAOFactory.getFactory().getDhpetHuntedAnimalsDAO().get(huntId));
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
