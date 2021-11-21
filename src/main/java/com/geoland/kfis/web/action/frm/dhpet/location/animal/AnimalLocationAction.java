/**
 * 
 */
package com.geoland.kfis.web.action.frm.dhpet.location.animal;

import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class AnimalLocationAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 4:41:57 PM, Mar 10, 2015
 */
public class AnimalLocationAction extends AnimalLocationBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -5890272666558072883L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(animalId!=null)
			setAnimal(DAOFactory.getFactory().getDhpetAnimalLocationDAO().get(animalId));
		
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
