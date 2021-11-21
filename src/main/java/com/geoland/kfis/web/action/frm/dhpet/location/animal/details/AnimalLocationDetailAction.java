/**
 * 
 */
package com.geoland.kfis.web.action.frm.dhpet.location.animal.details;

import com.geoland.kfis.model.DhpetAnimalLocationDetail;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class AnimalLocationDetailAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Dec 21, 2015, 2:15:04 PM
 */
public class AnimalLocationDetailAction extends AnimalLocationDetailBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 9139698386564125125L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(locationDetailId!=null)
			setLocationDetail(DAOFactory.getFactory().getDhpetAnimalLocationDetailDAO().get(locationDetailId));
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
		if(animalLocationId!=null){
			if(locationDetailId==null)
				setLocationDetail(new DhpetAnimalLocationDetail());
			locationDetail.setDhpetAnimalLocation(DAOFactory.getFactory().getDhpetAnimalLocationDAO().get(animalLocationId));
		}
		return "page";
	}
}
