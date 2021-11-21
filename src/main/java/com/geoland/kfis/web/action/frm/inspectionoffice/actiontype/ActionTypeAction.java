package com.geoland.kfis.web.action.frm.inspectionoffice.actiontype;

import com.geoland.kfis.persistence.dao.DAOFactory;


// TODO: Auto-generated Javadoc
/**
 * The Class ActionTypeAction.
 *
 * @author Detjana Kastrati, GEO&LAND
 * @version 1.0
 * @created Feb 27, 2015, 9:23:14 AM
 */
public class ActionTypeAction extends ActionTypeBaseAction {

	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -2413762777077518388L;
	
	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(actionTypeId!=null){
			actionType=DAOFactory.getFactory().getInspActionTypeDAO().get(actionTypeId);
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
