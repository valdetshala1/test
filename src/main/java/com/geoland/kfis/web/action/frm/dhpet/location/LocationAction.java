package com.geoland.kfis.web.action.frm.dhpet.location;

import com.geoland.kfis.model.DhpetLocation;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class LocationAction.
 *
 * @author Fisnik Aliu, GEO&LAND
 * @created Oct 3, 2014 11:29:39 AM
 * @Version 1.0
 */
public class LocationAction extends LocationBaseAction{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 6367797267100850587L;
	
	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(dhpetLocationId!=null) {
			DhpetLocation dl = DAOFactory.getFactory().getDhpetLocationDAO().get(dhpetLocationId);
			setDhpetLocation(dl);
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
		if(isHuntingOwnerUser()){
		huntingOwner=getUser().getPerson();	
		}
		return "page";
	}
	
	/**
	 * Board.
	 *
	 * @return the string
	 */
	public String board(){
		if(dhpetLocationId!=null) {
			DhpetLocation dl = DAOFactory.getFactory().getDhpetLocationDAO().get(dhpetLocationId);
			setDhpetLocation(dl);
		}
		
		return "board";
	}
	
	/**
	 * Report generator.
	 *
	 * @return the string
	 */
	public String reportGenerator(){
		tableList=getTableNames();
		return "report_generator";
	}
	
	/**
	 * Map page.
	 *
	 * @return the string
	 */
	public String map_page(){
		if(isHuntingOwnerUser()){
			huntingOwner=getUser().getPerson();	
			}
		return "map_page";
	}
}
