/**
 * 
 */
package com.geoland.kfis.web.action.frm.dhpet.tourism.purpose;

import com.geoland.kfis.model.DhpetTouristPurpose;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class TouristPurposeBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Jan 25, 2016, 1:39:44 PM
 */
public class TouristPurposeBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -5125498199104459716L;

	/** The purpose id. */
	protected Long purposeId;
	
	/** The purpose. */
	protected DhpetTouristPurpose purpose;
	
	/**
	 * Gets the purpose id.
	 *
	 * @return the purposeId
	 */
	public Long getPurposeId() {
		return purposeId;
	}
	
	/**
	 * Sets the purpose id.
	 *
	 * @param purposeId the purposeId to set
	 */
	public void setPurposeId(Long purposeId) {
		this.purposeId = purposeId;
	}
	
	/**
	 * Gets the purpose.
	 *
	 * @return the purpose
	 */
	public DhpetTouristPurpose getPurpose() {
		return purpose;
	}
	
	/**
	 * Sets the purpose.
	 *
	 * @param purpose the purpose to set
	 */
	public void setPurpose(DhpetTouristPurpose purpose) {
		this.purpose = purpose;
	}
	
	
}
