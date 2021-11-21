package com.geoland.kfis.web.action.frm.dhpet.huntgroundeval;

import com.geoland.kfis.persistence.dao.DAOFactory;


// TODO: Auto-generated Javadoc
/**
 * The Class HuntGroundEvalAction.
 *
 * @author Fisnik Aliu, GEO&LAND
 * @created Oct 7, 2014 9:49:33 AM
 * @Version 1.0
 */
public class HuntGroundEvalAction extends HuntGroundEvalBaseAction{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -4934653538253265745L;
	
	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(dhpetHuntGroundEvalId!=null) {
			dhpetHuntGroundEval=DAOFactory.getFactory().getDhpetHuntGroundEvalDAO().get(dhpetHuntGroundEvalId);
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
