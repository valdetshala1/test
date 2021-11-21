/**
 * 
 */
package com.geoland.kfis.web.action.ads.procurement.tenderrequest.dossierquestion;

import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class DossierQuestionAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 10:13:42 AM, Oct 8, 2014
 */
public class DossierQuestionAction extends DossierQuestionBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 8814401368952027075L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(dossierQuestionId!=null)
			setDossierQuestion(DAOFactory.getFactory().getPrcmtDossierQuestionDAO().get(dossierQuestionId));
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
