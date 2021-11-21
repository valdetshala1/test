/**
 * 
 */
package com.geoland.kfis.web.action.frm.dhpet.animalcapacity;

import com.geoland.kfis.model.DhpetAnimalCapacity;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class AnimalCapacityAction.
 *
 * @author Fisnik Aliu, GEO&LAND
 * @created Oct 2, 2014 11:35:11 AM
 * @Version 1.0
 */
public class AnimalCapacityAction extends AnimalCapacityBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 6765970137177045074L;
	
	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(dhpetAnimalCapacityId!=null){
			DhpetAnimalCapacity dac = DAOFactory.getFactory().getDhpetAnimalCapacityDAO().get(dhpetAnimalCapacityId);
			setDhpetAnimalCapacity(dac);
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
