package com.geoland.kfis.web.action.frm.dhpet.wildanimal.animalrequest;

import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class AnimalRequestAction.
 */
public class AnimalRequestAction extends AnimalRequestBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(animalRequestId!=null){
			animalsRequest=DAOFactory.getFactory().getDhpetWildAnimalsRequestDAO().get(animalRequestId);
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
