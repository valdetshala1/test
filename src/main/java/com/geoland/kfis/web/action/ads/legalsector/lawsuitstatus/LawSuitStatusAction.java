package com.geoland.kfis.web.action.ads.legalsector.lawsuitstatus;

import com.geoland.kfis.persistence.dao.DAOFactory;
// TODO: Auto-generated Javadoc

/**
 * The Class LawSuitStatusAction.
 *
 * @author ADELINA GASHI, GEO&LAND
 * @created Jun 4, 2014 4:36:50 PM
 * @Version 1.0
 */
public class LawSuitStatusAction extends LawSuitStatusBaseAction{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(lawSuitStatusId!=null){
			lawSuitStatus=DAOFactory.getFactory().getLawsuitStatusDAO().get(lawSuitStatusId);
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
	
}
