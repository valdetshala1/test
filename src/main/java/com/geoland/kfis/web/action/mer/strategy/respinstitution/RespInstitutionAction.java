/**
 * 
 */
package com.geoland.kfis.web.action.mer.strategy.respinstitution;

import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class RespInstitutionAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 1:43:59 PM, Mar 26, 2015
 */
public class RespInstitutionAction extends RespInstitutionBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 6103968298809601671L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(institutionId!=null)
			setInstitution(DAOFactory.getFactory().getMerRespInstitutionDAO().get(institutionId));
		
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
