/**
 * 
 */
package com.geoland.kfis.web.action.ads.procurement.tenderrequest.dossierquestion;

import com.geoland.kfis.model.PrcmtDossierQuestion;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class DossierQuestionBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 10:13:16 AM, Oct 8, 2014
 */
public class DossierQuestionBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -4984768566988642464L;

	/** The dossier question id. */
	protected Long dossierQuestionId;
	
	/** The dossier question. */
	protected PrcmtDossierQuestion dossierQuestion;
	
	/**
	 * Gets the dossier question id.
	 *
	 * @return the dossierQuestionId
	 */
	public Long getDossierQuestionId() {
		return dossierQuestionId;
	}
	
	/**
	 * Sets the dossier question id.
	 *
	 * @param dossierQuestionId the dossierQuestionId to set
	 */
	public void setDossierQuestionId(Long dossierQuestionId) {
		this.dossierQuestionId = dossierQuestionId;
	}
	
	/**
	 * Gets the dossier question.
	 *
	 * @return the dossierQuestion
	 */
	public PrcmtDossierQuestion getDossierQuestion() {
		return dossierQuestion;
	}
	
	/**
	 * Sets the dossier question.
	 *
	 * @param dossierQuestion the dossierQuestion to set
	 */
	public void setDossierQuestion(PrcmtDossierQuestion dossierQuestion) {
		this.dossierQuestion = dossierQuestion;
	}
	
	
}
