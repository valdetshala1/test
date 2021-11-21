package com.geoland.kfis.web.action.frm.annualplan.activitydomain;

import com.geoland.kfis.model.ActivityDomain;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class ActivityDomainBaseAction.
 */
public class ActivityDomainBaseAction extends BaseActionSupport{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The activity domain. */
	protected ActivityDomain activityDomain;
	
	/** The activity domain id. */
	protected Long activityDomainId;
	
	/** The parent id. */
	protected Long parentId;
	
	/** The ref. */
	protected ActivityDomain ref;
	
	/**
	 * Gets the ref.
	 *
	 * @return the ref
	 */
	public ActivityDomain getRef() {
		return ref;
	}
	
	/**
	 * Sets the ref.
	 *
	 * @param ref the new ref
	 */
	public void setRef(ActivityDomain ref) {
		this.ref = ref;
	}
	
	/**
	 * Gets the activity domain.
	 *
	 * @return the activity domain
	 */
	public ActivityDomain getActivityDomain() {
		return activityDomain;
	}
	
	/**
	 * Sets the activity domain.
	 *
	 * @param activityDomain the new activity domain
	 */
	public void setActivityDomain(ActivityDomain activityDomain) {
		this.activityDomain = activityDomain;
	}
	
	/**
	 * Gets the activity domain id.
	 *
	 * @return the activity domain id
	 */
	public Long getActivityDomainId() {
		return activityDomainId;
	}
	
	/**
	 * Sets the activity domain id.
	 *
	 * @param activityDomainId the new activity domain id
	 */
	public void setActivityDomainId(Long activityDomainId) {
		this.activityDomainId = activityDomainId;
	}
	
	/**
	 * Gets the parent id.
	 *
	 * @return the parent id
	 */
	public Long getParentId() {
		return parentId;
	}
	
	/**
	 * Sets the parent id.
	 *
	 * @param parentId the new parent id
	 */
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}
	
	
	
}
