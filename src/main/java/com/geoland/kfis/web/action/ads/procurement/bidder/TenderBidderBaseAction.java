/**
 * 
 */
package com.geoland.kfis.web.action.ads.procurement.bidder;

import com.geoland.kfis.model.PrcmtTenderBidder;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class TenderBidderBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 10:27:02 AM, Oct 3, 2014
 */
public class TenderBidderBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 3012972548799750208L;

	/** The bidder id. */
	protected Long bidderId;
	
	/** The bidder. */
	protected PrcmtTenderBidder bidder;
	
	/**
	 * Gets the bidder id.
	 *
	 * @return the bidderId
	 */
	public Long getBidderId() {
		return bidderId;
	}
	
	/**
	 * Sets the bidder id.
	 *
	 * @param bidderId the bidderId to set
	 */
	public void setBidderId(Long bidderId) {
		this.bidderId = bidderId;
	}
	
	/**
	 * Gets the bidder.
	 *
	 * @return the bidder
	 */
	public PrcmtTenderBidder getBidder() {
		return bidder;
	}
	
	/**
	 * Sets the bidder.
	 *
	 * @param bidder the bidder to set
	 */
	public void setBidder(PrcmtTenderBidder bidder) {
		this.bidder = bidder;
	}
	
}
