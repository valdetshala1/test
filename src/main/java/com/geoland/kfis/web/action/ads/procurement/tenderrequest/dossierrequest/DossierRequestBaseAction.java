/**
 * 
 */
package com.geoland.kfis.web.action.ads.procurement.tenderrequest.dossierrequest;

import com.geoland.kfis.model.PrcmtDossierRequest;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class DossierRequestBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 2:03:55 PM, Oct 7, 2014
 */
public class DossierRequestBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -8809597794645477331L;

	/** The dossier request id. */
	protected Long dossierRequestId;
	
	/** The dossier request. */
	protected PrcmtDossierRequest dossierRequest;
	
	/** The tender request id. */
	protected Long tenderRequestId;
	
	/**
	 * Gets the dossier request id.
	 *
	 * @return the dossierRequestId
	 */
	public Long getDossierRequestId() {
		return dossierRequestId;
	}
	
	/**
	 * Sets the dossier request id.
	 *
	 * @param dossierRequestId the dossierRequestId to set
	 */
	public void setDossierRequestId(Long dossierRequestId) {
		this.dossierRequestId = dossierRequestId;
	}
	
	/**
	 * Gets the dossier request.
	 *
	 * @return the dossier request
	 */
	public PrcmtDossierRequest getDossierRequest() {
		return dossierRequest;
	}
	
	/**
	 * Sets the dossier request.
	 *
	 * @param dossierRequest the new dossier request
	 */
	public void setDossierRequest(PrcmtDossierRequest dossierRequest) {
		this.dossierRequest = dossierRequest;
	}
	
	/**
	 * Gets the tender request id.
	 *
	 * @return the tender request id
	 */
	public Long getTenderRequestId() {
		return tenderRequestId;
	}
	
	/**
	 * Sets the tender request id.
	 *
	 * @param tenderRequestId the tenderRequestId to set
	 */
	public void setTenderRequestId(Long tenderRequestId) {
		this.tenderRequestId = tenderRequestId;
	}
	
	
}
