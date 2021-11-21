/**
 * 
 */
package com.geoland.kfis.web.action.frm.dhpet.huntedanimals.details;

import com.geoland.kfis.model.DhpetHuntedAnimalDetail;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class HuntedAnimalDetailAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Dec 22, 2015, 10:14:22 AM
 */
public class HuntedAnimalDetailAction extends HuntedAnimalDetailBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -2757218310382697630L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(huntDetailId!=null)
			setHuntDetail(DAOFactory.getFactory().getDhpetHuntedAnimalDetailDAO().get(huntDetailId));
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
		if(huntAnimalId!=null){
			if(huntDetail==null)
				setHuntDetail(new DhpetHuntedAnimalDetail());
			
			huntDetail.setDhpetHuntedAnimals(DAOFactory.getFactory().getDhpetHuntedAnimalsDAO().get(huntAnimalId));
		}
		return "page";
	}
}
