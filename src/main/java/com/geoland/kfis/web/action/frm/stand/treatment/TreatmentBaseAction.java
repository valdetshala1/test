package com.geoland.kfis.web.action.frm.stand.treatment;

import com.geoland.kfis.model.ShapeStandTreatment;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class TreatmentBaseAction.
 */
public class TreatmentBaseAction extends BaseActionSupport {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The treatment. */
	protected ShapeStandTreatment treatment;
	
	/** The treatment id. */
	protected long treatmentId;
	
	/** The stand id. */
	protected long standId;
	
	/**
	 * Gets the treatment.
	 *
	 * @return the treatment
	 */
	public ShapeStandTreatment getTreatment() {
		return treatment;
	} 
	
	/**
	 * Sets the treatment.
	 *
	 * @param treatment the new treatment
	 */
	public void setTreatment(ShapeStandTreatment treatment) {
		this.treatment = treatment;
	}
	
	/**
	 * Gets the treatment id.
	 *
	 * @return the treatment id
	 */
	public long getTreatmentId() {
		return treatmentId;
	}
	
	/**
	 * Sets the treatment id.
	 *
	 * @param treatmentId the new treatment id
	 */
	public void setTreatmentId(long treatmentId) {
		this.treatmentId = treatmentId;
	}
	
	/**
	 * Gets the stand id.
	 *
	 * @return the stand id
	 */
	public long getStandId() {
		return standId;
	}
	
	/**
	 * Sets the stand id.
	 *
	 * @param standId the new stand id
	 */
	public void setStandId(long standId) {
		this.standId = standId;
	}
	

}
