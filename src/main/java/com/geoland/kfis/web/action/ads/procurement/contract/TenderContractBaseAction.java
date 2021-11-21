/**
 * 
 */
package com.geoland.kfis.web.action.ads.procurement.contract;

import java.io.File;

import com.geoland.kfis.model.Contract;
import com.geoland.kfis.model.ContractDoc;
import com.geoland.kfis.model.Contractor;
import com.geoland.kfis.model.PrcmtTenderBid;
import com.geoland.kfis.model.PrcmtTenderBidder;
import com.geoland.kfis.model.PrcmtTenderRequest;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class TenderContractBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 1:24:41 PM, Nov 19, 2014
 */
public class TenderContractBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 7852954536265106028L;

	/** The bid id. */
	protected Long bidId;
	
	/** The bid. */
	protected PrcmtTenderBid bid;
	
	/** The bidder id. */
	protected Long bidderId;
	
	/** The bidder. */
	protected PrcmtTenderBidder bidder;
	
	/** The tender id. */
	protected Long tenderId;
	
	/** The tender. */
	protected PrcmtTenderRequest tender;
	
	/** The contract. */
	protected Contract contract;
	
	/** The contractor. */
	protected Contractor contractor;
	
	/** The doc. */
	protected ContractDoc doc;
	
	/** The file. */
	protected File file;
	
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
	
	/**
	 * Gets the tender id.
	 *
	 * @return the tenderId
	 */
	public Long getTenderId() {
		return tenderId;
	}
	
	/**
	 * Sets the tender id.
	 *
	 * @param tenderId the tenderId to set
	 */
	public void setTenderId(Long tenderId) {
		this.tenderId = tenderId;
	}
	
	/**
	 * Gets the tender.
	 *
	 * @return the tender
	 */
	public PrcmtTenderRequest getTender() {
		return tender;
	}
	
	/**
	 * Sets the tender.
	 *
	 * @param tender the tender to set
	 */
	public void setTender(PrcmtTenderRequest tender) {
		this.tender = tender;
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
	
	/**
	 * Gets the contract.
	 *
	 * @return the contract
	 */
	public Contract getContract() {
		return contract;
	}
	
	/**
	 * Sets the contract.
	 *
	 * @param contract the contract to set
	 */
	public void setContract(Contract contract) {
		this.contract = contract;
	}
	
	/**
	 * Gets the doc.
	 *
	 * @return the doc
	 */
	public ContractDoc getDoc() {
		return doc;
	}
	
	/**
	 * Sets the doc.
	 *
	 * @param doc the doc to set
	 */
	public void setDoc(ContractDoc doc) {
		this.doc = doc;
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
}
