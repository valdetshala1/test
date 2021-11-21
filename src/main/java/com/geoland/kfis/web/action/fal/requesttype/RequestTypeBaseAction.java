package com.geoland.kfis.web.action.fal.requesttype;

import com.geoland.kfis.model.RequestType;
import com.geoland.kfis.persistence.hibernate.usertypes.Periodtype;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class RequestTypeBaseAction.
 *
 * @author Ardiana Demolli, Geo&Land
 * Dec 18, 2015, 9:34:12 AM
 * v2.0
 */
public class RequestTypeBaseAction extends BaseActionSupport{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The request type. */
	protected RequestType requestType;
	
	/** The request type id. */
	protected Long requestTypeId;
	
	/** The periodtypes. */
	protected Periodtype[] periodtypes = Periodtype.values();

	
	/**
	 * Gets the request type.
	 *
	 * @return the request type
	 */
	public RequestType getRequestType() {
		return requestType;
	}
	
	/**
	 * Sets the request type.
	 *
	 * @param requestType the new request type
	 */
	public void setRequestType(RequestType requestType) {
		this.requestType = requestType;
	}
	
	/**
	 * Gets the request type id.
	 *
	 * @return the request type id
	 */
	public Long getRequestTypeId() {
		return requestTypeId;
	}
	
	/**
	 * Sets the request type id.
	 *
	 * @param requestTypeId the new request type id
	 */
	public void setRequestTypeId(Long requestTypeId) {
		this.requestTypeId = requestTypeId;
	}
	
	/**
	 * Gets the periodtypes.
	 *
	 * @return the periodtypes
	 */
	public Periodtype[] getPeriodtypes() {
		return periodtypes;
	}
	
	/**
	 * Sets the periodtypes.
	 *
	 * @param periodtypes the new periodtypes
	 */
	public void setPeriodtypes(Periodtype[] periodtypes) {
		this.periodtypes = periodtypes;
	}

	
}
