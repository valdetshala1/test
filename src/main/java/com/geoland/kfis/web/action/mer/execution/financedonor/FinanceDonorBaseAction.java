/**
 * 
 */
package com.geoland.kfis.web.action.mer.execution.financedonor;

import com.geoland.kfis.model.MerFinanceDonor;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class FinanceDonorBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 9:31:15 AM, Mar 31, 2015
 */
public class FinanceDonorBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 5306397863631926311L;

	/** The donor id. */
	protected Long donorId;
	
	/** The donor. */
	protected MerFinanceDonor donor;
	
	/**
	 * Gets the donor id.
	 *
	 * @return the donorId
	 */
	public Long getDonorId() {
		return donorId;
	}
	
	/**
	 * Sets the donor id.
	 *
	 * @param donorId the donorId to set
	 */
	public void setDonorId(Long donorId) {
		this.donorId = donorId;
	}
	
	/**
	 * Gets the donor.
	 *
	 * @return the donor
	 */
	public MerFinanceDonor getDonor() {
		return donor;
	}
	
	/**
	 * Sets the donor.
	 *
	 * @param donor the donor to set
	 */
	public void setDonor(MerFinanceDonor donor) {
		this.donor = donor;
	}
	
}
