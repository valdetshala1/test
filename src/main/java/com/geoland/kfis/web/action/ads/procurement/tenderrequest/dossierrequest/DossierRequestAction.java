/**
 * 
 */
package com.geoland.kfis.web.action.ads.procurement.tenderrequest.dossierrequest;

import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class DossierRequestAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 2:04:44 PM, Oct 7, 2014
 */
public class DossierRequestAction extends DossierRequestBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -3868851605901504087L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(dossierRequestId!=null){
			setDossierRequest(DAOFactory.getFactory().getPrcmtDossierRequestDAO().get(dossierRequestId));
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
