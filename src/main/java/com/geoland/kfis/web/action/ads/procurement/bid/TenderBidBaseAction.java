/**
 * 
 */
package com.geoland.kfis.web.action.ads.procurement.bid;

import java.io.File;

import com.geoland.kfis.model.PrcmtTenderBid;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class TenderBidBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 3:49:37 PM, Oct 3, 2014
 */
public class TenderBidBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -3638427858548600056L;
	
	/** The bid id. */
	protected Long bidId;
	
	/** The bid. */
	protected PrcmtTenderBid bid;
	
	/** The file. */
	protected File file;
	
	/** The hide save. */
	protected boolean hideSave;
	
	/**
	 * Gets the bid id.
	 *
	 * @return the bidId
	 */
	public Long getBidId() {
		return bidId;
	}
	
	/**
	 * Sets the bid id.
	 *
	 * @param bidId the bidId to set
	 */
	public void setBidId(Long bidId) {
		this.bidId = bidId;
	}
	
	/**
	 * Gets the bid.
	 *
	 * @return the bid
	 */
	public PrcmtTenderBid getBid() {
		return bid;
	}
	
	/**
	 * Sets the bid.
	 *
	 * @param bid the bid to set
	 */
	public void setBid(PrcmtTenderBid bid) {
		this.bid = bid;
	}
	
	/**
	 * Gets the serialversionuid.
	 *
	 * @return the serialversionuid
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	/**
	 * Gets the file.
	 *
	 * @return the file
	 */
	public File getFile() {
		return file;
	}
	
	/**
	 * Sets the file.
	 *
	 * @param file the file to set
	 */
	public void setFile(File file) {
		this.file = file;
	}
	
	/**
	 * Checks if is hide save.
	 *
	 * @return the hideSave
	 */
	public boolean isHideSave() {
		return hideSave;
	}
	
	/**
	 * Sets the hide save.
	 *
	 * @param hideSave the hideSave to set
	 */
	public void setHideSave(boolean hideSave) {
		this.hideSave = hideSave;
	}
	
	
}
