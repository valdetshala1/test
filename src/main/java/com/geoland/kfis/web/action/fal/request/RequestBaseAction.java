package com.geoland.kfis.web.action.fal.request;

import com.geoland.kfis.model.CadParcelRequest;
import com.geoland.kfis.model.Request;
import com.geoland.kfis.model.RequestStatus;
import com.geoland.kfis.persistence.hibernate.usertypes.Requeststatus;
import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class RequestBaseAction.
 *
 * @author Ardiana Demolli, Geo&Land
 * Nov 18, 2015, 3:10:59 PM
 * v2.0
 */
public class RequestBaseAction extends BaseActionSupport{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The lease request. */
	protected Request leaseRequest;
	
	/** The request status. */
	protected RequestStatus requestStatus;
	
	/** The cad parcel request. */
	protected CadParcelRequest cadParcelRequest;
	
	/** The request id. */
	protected Long requestId;
	
	/** The request status id. */
	protected Long requestStatusId;
	
	/** The geometry. */
	protected String geometry;
	
	/** The json details. */
	protected String jsonDetails;
	
	/** The doc names. */
	protected String docNames;
	
	/** The doc exts. */
	protected String docExts;
	
	/** The approved rejected. */
	protected String approvedRejected;
	
	/** The request statuses. */
	protected Requeststatus requestStatuses[]= Requeststatus.values();
	
	/** The period type. */
	protected String periodType;
	
	/** The period price. */
	protected String periodPrice;
	
	/**
	 * Gets the request status.
	 *
	 * @return the request status
	 */
	public RequestStatus getRequestStatus() {
		return requestStatus;
	}
	
	/**
	 * Sets the request status.
	 *
	 * @param requestStatus the new request status
	 */
	public void setRequestStatus(RequestStatus requestStatus) {
		this.requestStatus = requestStatus;
	}
	
	/**
	 * Gets the cad parcel request.
	 *
	 * @return the cad parcel request
	 */
	public CadParcelRequest getCadParcelRequest() {
		return cadParcelRequest;
	}
	
	/**
	 * Sets the cad parcel request.
	 *
	 * @param cadParcelRequest the new cad parcel request
	 */
	public void setCadParcelRequest(CadParcelRequest cadParcelRequest) {
		this.cadParcelRequest = cadParcelRequest;
	}
	
	/**
	 * Gets the request id.
	 *
	 * @return the request id
	 */
	public Long getRequestId() {
		return requestId;
	}
	
	/**
	 * Sets the request id.
	 *
	 * @param requestId the new request id
	 */
	public void setRequestId(Long requestId) {
		this.requestId = requestId;
	}
	
	/**
	 * Gets the request status id.
	 *
	 * @return the request status id
	 */
	public Long getRequestStatusId() {
		return requestStatusId;
	}
	
	/**
	 * Sets the request status id.
	 *
	 * @param requestStatusId the new request status id
	 */
	public void setRequestStatusId(Long requestStatusId) {
		this.requestStatusId = requestStatusId;
	}
	
	/**
	 * Gets the geometry.
	 *
	 * @return the geometry
	 */
	public String getGeometry() {
		return geometry;
	}
	
	/**
	 * Sets the geometry.
	 *
	 * @param geometry the new geometry
	 */
	public void setGeometry(String geometry) {
		this.geometry = geometry;
	}
	
	/**
	 * Gets the json details.
	 *
	 * @return the json details
	 */
	public String getJsonDetails() {
		return jsonDetails;
	}
	
	/**
	 * Sets the json details.
	 *
	 * @param jsonDetails the new json details
	 */
	public void setJsonDetails(String jsonDetails) {
		this.jsonDetails = jsonDetails;
	}
	
	/**
	 * Gets the lease request.
	 *
	 * @return the lease request
	 */
	public Request getLeaseRequest() {
		return leaseRequest;
	}
	
	/**
	 * Sets the lease request.
	 *
	 * @param leaseRequest the new lease request
	 */
	public void setLeaseRequest(Request leaseRequest) {
		this.leaseRequest = leaseRequest;
	}
	
	/**
	 * Gets the doc names.
	 *
	 * @return the doc names
	 */
	public String getDocNames() {
		return docNames;
	}
	
	/**
	 * Sets the doc names.
	 *
	 * @param docNames the new doc names
	 */
	public void setDocNames(String docNames) {
		this.docNames = docNames;
	}
	
	/**
	 * Gets the doc exts.
	 *
	 * @return the doc exts
	 */
	public String getDocExts() {
		return docExts;
	}
	
	/**
	 * Sets the doc exts.
	 *
	 * @param docExts the new doc exts
	 */
	public void setDocExts(String docExts) {
		this.docExts = docExts;
	}
	
	/**
	 * Gets the approved rejected.
	 *
	 * @return the approved rejected
	 */
	public String getApprovedRejected() {
		return approvedRejected;
	}
	
	/**
	 * Sets the approved rejected.
	 *
	 * @param approvedRejected the new approved rejected
	 */
	public void setApprovedRejected(String approvedRejected) {
		this.approvedRejected = approvedRejected;
	}
	
	/**
	 * Gets the request statuses.
	 *
	 * @return the request statuses
	 */
	public Requeststatus[] getRequestStatuses() {
		return requestStatuses;
	}
	
	/**
	 * Sets the request statuses.
	 *
	 * @param requestStatuses the new request statuses
	 */
	public void setRequestStatuses(Requeststatus[] requestStatuses) {
		this.requestStatuses = requestStatuses;
	}
	
	/**
	 * Gets the period type.
	 *
	 * @return the period type
	 */
	public String getPeriodType() {
		return periodType;
	}
	
	/**
	 * Sets the period type.
	 *
	 * @param periodType the new period type
	 */
	public void setPeriodType(String periodType) {
		this.periodType = periodType;
	}
	
	/**
	 * Gets the period price.
	 *
	 * @return the period price
	 */
	public String getPeriodPrice() {
		return periodPrice;
	}
	
	/**
	 * Sets the period price.
	 *
	 * @param periodPrice the new period price
	 */
	public void setPeriodPrice(String periodPrice) {
		this.periodPrice = periodPrice;
	}
	
}
