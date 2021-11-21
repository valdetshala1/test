package com.geoland.kfis.web.action.ads.legalsector.lawsuit;

import com.geoland.kfis.persistence.dao.DAOFactory;
// TODO: Auto-generated Javadoc

/**
 * The Class LawSuitAction.
 *
 * @author ADELINA GASHI, GEO&LAND
 * @created May 30, 2014 9:26:04 AM
 * @Version 1.0
 */
public class LawSuitAction extends LawSuitBaseAction{

/** The Constant serialVersionUID. */
private static final long serialVersionUID = 1L;
	
	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(lawsuitId!=null){
			lawsuit=DAOFactory.getFactory().getLawSuitDAO().get(lawsuitId);
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
		return "page";
	}
	
	/**
	 * Popup.
	 *
	 * @return the string
	 */
	public String popup(){
		return "popup";
	}
	
	/**
	 * Report generator.
	 *
	 * @return the string
	 */
	public String reportGenerator(){
		return "report_generator";
	}	
}
