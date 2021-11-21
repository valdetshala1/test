/**
 * 
 */
package com.geoland.kfis.web.action.ads.finance.contractor;

import com.geoland.kfis.model.Contractor;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class ContractorBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Sep 5, 2014, 2:11:28 PM
 */
public class ContractorBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -7134067016723327824L;

	/** The contractor id. */
	protected Long contractorId;
	
	/** The contractor. */
	protected Contractor contractor;
	
	/**
	 * Gets the contractor id.
	 *
	 * @return the contractorId
	 */
	public Long getContractorId() {
		return contractorId;
	}
	
	/**
	 * Sets the contractor id.
	 *
	 * @param contractorId the contractorId to set
	 */
	public void setContractorId(Long contractorId) {
		this.contractorId = contractorId;
	}
	
	/**
	 * Gets the contractor.
	 *
	 * @return the contractor
	 */
	public Contractor getContractor() {
		return contractor;
	}
	
	/**
	 * Sets the contractor.
	 *
	 * @param contractor the contractor to set
	 */
	public void setContractor(Contractor contractor) {
		this.contractor = contractor;
	}
	
}
