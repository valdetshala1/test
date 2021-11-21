package com.geoland.kfis.web.action.pub;

import com.geoland.kfis.model.Publishing;
import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class PublishBaseAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created May 5, 2015 , 4:00:19 PM
 */
public class PublishBaseAction extends BaseActionSupport{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The publishing. */
	protected Publishing publishing;
	
	/** The publishing id. */
	protected Long publishingId;
	
	/**
	 * Gets the publishing.
	 *
	 * @return the publishing
	 */
	public Publishing getPublishing() {
		return publishing;
	}
	
	/**
	 * Sets the publishing.
	 *
	 * @param publishing the new publishing
	 */
	public void setPublishing(Publishing publishing) {
		this.publishing = publishing;
	}
	
	/**
	 * Gets the publishing id.
	 *
	 * @return the publishing id
	 */
	public Long getPublishingId() {
		return publishingId;
	}
	
	/**
	 * Sets the publishing id.
	 *
	 * @param publishingId the new publishing id
	 */
	public void setPublishingId(Long publishingId) {
		this.publishingId = publishingId;
	}
	
	
	

}
