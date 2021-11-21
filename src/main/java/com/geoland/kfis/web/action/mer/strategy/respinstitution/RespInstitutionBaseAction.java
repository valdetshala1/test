/**
 * 
 */
package com.geoland.kfis.web.action.mer.strategy.respinstitution;

import com.geoland.kfis.model.MerRespInstitution;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class RespInstitutionBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 1:42:43 PM, Mar 26, 2015
 */
public class RespInstitutionBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -726578952932492394L;

	/** The institution id. */
	protected Long institutionId;
	
	/** The institution. */
	protected MerRespInstitution institution;
	
	/**
	 * Gets the institution id.
	 *
	 * @return the institutionId
	 */
	public Long getInstitutionId() {
		return institutionId;
	}
	
	/**
	 * Sets the institution id.
	 *
	 * @param institutionId the institutionId to set
	 */
	public void setInstitutionId(Long institutionId) {
		this.institutionId = institutionId;
	}
	
	/**
	 * Gets the institution.
	 *
	 * @return the institution
	 */
	public MerRespInstitution getInstitution() {
		return institution;
	}
	
	/**
	 * Sets the institution.
	 *
	 * @param institution the institution to set
	 */
	public void setInstitution(MerRespInstitution institution) {
		this.institution = institution;
	}
	
}
