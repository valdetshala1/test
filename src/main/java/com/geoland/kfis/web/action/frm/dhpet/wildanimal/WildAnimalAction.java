package com.geoland.kfis.web.action.frm.dhpet.wildanimal;

import com.geoland.kfis.model.DhpetWildAnimals;
import com.geoland.kfis.persistence.dao.DAOFactory;
// TODO: Auto-generated Javadoc

/**
 * The Class WildAnimalAction.
 *
 * @author Fisnik Aliu, GEO&LAND
 * @created Oct 8, 2014 9:38:16 AM
 * @Version 1.0
 */
public class WildAnimalAction extends WildAnimalBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -2637712912058361331L;
	
	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form() {
		if(dhpetWildAnimalId!=null) {
			DhpetWildAnimals wa = DAOFactory.getFactory().getDhpetWildAnimalsDAO().get(dhpetWildAnimalId);
			setDhpetWildAnimals(wa);
		}
		return "form";
	}
	
	/**
	 * Grid.
	 *
	 * @return the string
	 */
	public String grid() {
		return "grid";
	}
	
	/**
	 * Popup report.
	 *
	 * @return the string
	 */
	public String popupReport(){
		return "popupReport";
	}
	
	/**
	 * Page.
	 *
	 * @return the string
	 */
	public String page() {
		return "page";
	}
	
	/**
	 * Board.
	 *
	 * @return the string
	 */
	public String board(){
		if(dhpetWildAnimalId!=null) {
			DhpetWildAnimals wa = DAOFactory.getFactory().getDhpetWildAnimalsDAO().get(dhpetWildAnimalId);
			setDhpetWildAnimals(wa);
		}
		
		return "board";
	}
	
}
