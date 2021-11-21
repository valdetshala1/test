package com.geoland.kfis.web.action.frm.annualplan.protection;

import com.geoland.kfis.model.Activity;
import com.geoland.kfis.model.ActivityStatus;
import com.geoland.kfis.model.ActivityStatusDoc;
import com.geoland.kfis.model.AnnualPlanning;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.ProtectionActivity;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Activitystatus;
import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class ProtectionActivityBaseAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Oct 29, 2014 , 2:03:47 PM
 */
public class ProtectionActivityBaseAction extends BaseActionSupport {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The protection. */
	protected ProtectionActivity protection;
	
	/** The domain id. */
	protected Long domainId;
	
	/** The protection id. */
	protected Long protectionId;
	
	/** The activity. */
	protected Activity activity;
	
	/** The activity id. */
	protected Long activityId;
	
	/** The annualplan id. */
	protected Long annualplanId;
	
	/** The annualplan. */
	protected AnnualPlanning annualplan;
	
	/** The employee. */
	protected Employee employee;
	
	/** The pro replanned. */
	protected Activitystatus proReplanned=Activitystatus.REPLANNED;
	
	/** The pro rejected. */
	protected Activitystatus proRejected=Activitystatus.REJECTED;
	
	/** The pro approved. */
	protected Activitystatus proApproved=Activitystatus.APPROVED;
	
	/** The pro submitted. */
	protected Activitystatus proSubmitted=Activitystatus.SUBMITTED;
	
	/** The activity status. */
	protected ActivityStatus activityStatus;
	
	/** The mun view. */
	protected boolean munView=false;
	
	/** The hide toolbar. */
	protected boolean hideToolbar=false;
	
	/** The kfa view. */
	protected boolean kfaView=false;
	
	/** The ann status. */
	protected Activitystatus annStatus;
	
	/** The doc. */
	protected ActivityStatusDoc doc;
	
	/** The bar code img. */
	protected String barCodeImg;
	
	/** The muperiod id. */
	protected Long muperiodId;
	
	/**
	 * Control proces on page.
	 */
	public void controlProcesOnPage(){
		employee = DAOFactory.getFactory().getPartyUserDAO().getEmployee(getUser().getUser().getId());
		if(protection!=null){
			Activitystatus slvStatus=protection.getActivityStatus().getStatus();
			annStatus = annualplan.getAnnualPlanningStatus().getStatus();
			if(employee.getOrganisation().getOperLevelVal()=='C'){
				if(slvStatus==Activitystatus.SUBMITTED && annStatus==Activitystatus.SUBMITTED){
					kfaView=true;
				}else {
					hideToolbar=true;
					kfaView=false;
				}
				
			}else if (employee.getOrganisation().getOperLevelVal()=='R' && !(protection.getId()==null || slvStatus==Activitystatus.NEW ||( slvStatus==Activitystatus.REPLANNED && annStatus==Activitystatus.REPLANNED))) {
				hideToolbar=true;
				
			}else if(employee.getOrganisation().getOperLevelVal()=='R' && annStatus==Activitystatus.APPROVED ){
				hideToolbar=true;
			}
			else if(employee.getOrganisation().getOperLevelVal()=='M' && slvStatus!=Activitystatus.APPROVED ){
				hideToolbar=true;
			}
			
		}
	}
	
	/**
	 * Gets the annualplan id.
	 *
	 * @return the annualplan id
	 */
	public Long getAnnualplanId() {
		return annualplanId;
	}
	
	/**
	 * Sets the annualplan id.
	 *
	 * @param annualplanId the new annualplan id
	 */
	public void setAnnualplanId(Long annualplanId) {
		this.annualplanId = annualplanId;
	}
	
	/**
	 * Gets the protection.
	 *
	 * @return the protection
	 */
	public ProtectionActivity getProtection() {
		return protection;
	}
	
	/**
	 * Sets the protection.
	 *
	 * @param protection the new protection
	 */
	public void setProtection(ProtectionActivity protection) {
		this.protection = protection;
	}
	
	/**
	 * Gets the protection id.
	 *
	 * @return the protection id
	 */
	public Long getProtectionId() {
		return protectionId;
	}
	
	/**
	 * Sets the protection id.
	 *
	 * @param protectionId the new protection id
	 */
	public void setProtectionId(Long protectionId) {
		this.protectionId = protectionId;
	}
	
	/**
	 * Gets the domain id.
	 *
	 * @return the domain id
	 */
	public Long getDomainId() {
		return domainId;
	}
	
	/**
	 * Sets the domain id.
	 *
	 * @param domainId the new domain id
	 */
	public void setDomainId(Long domainId) {
		this.domainId = domainId;
	}
	
	/**
	 * Gets the activity.
	 *
	 * @return the activity
	 */
	public Activity getActivity() {
		return activity;
	}
	
	/**
	 * Sets the activity.
	 *
	 * @param activity the new activity
	 */
	public void setActivity(Activity activity) {
		this.activity = activity;
	}
	
	/**
	 * Gets the annualplan.
	 *
	 * @return the annualplan
	 */
	public AnnualPlanning getAnnualplan() {
		return annualplan;
	}
	
	/**
	 * Sets the annualplan.
	 *
	 * @param annualplan the new annualplan
	 */
	public void setAnnualplan(AnnualPlanning annualplan) {
		this.annualplan = annualplan;
	}
	
	/**
	 * Gets the activity id.
	 *
	 * @return the activity id
	 */
	public Long getActivityId() {
		return activityId;
	}
	
	/**
	 * Sets the activity id.
	 *
	 * @param activityId the new activity id
	 */
	public void setActivityId(Long activityId) {
		this.activityId = activityId;
	}
	
	/**
	 * Gets the pro replanned.
	 *
	 * @return the pro replanned
	 */
	public Activitystatus getProReplanned() {
		return proReplanned;
	}
	
	/**
	 * Sets the pro replanned.
	 *
	 * @param proReplanned the new pro replanned
	 */
	public void setProReplanned(Activitystatus proReplanned) {
		this.proReplanned = proReplanned;
	}
	
	/**
	 * Gets the pro rejected.
	 *
	 * @return the pro rejected
	 */
	public Activitystatus getProRejected() {
		return proRejected;
	}
	
	/**
	 * Sets the pro rejected.
	 *
	 * @param proRejected the new pro rejected
	 */
	public void setProRejected(Activitystatus proRejected) {
		this.proRejected = proRejected;
	}
	
	/**
	 * Gets the pro approved.
	 *
	 * @return the pro approved
	 */
	public Activitystatus getProApproved() {
		return proApproved;
	}
	
	/**
	 * Sets the pro approved.
	 *
	 * @param proApproved the new pro approved
	 */
	public void setProApproved(Activitystatus proApproved) {
		this.proApproved = proApproved;
	}
	
	/**
	 * Gets the pro submitted.
	 *
	 * @return the pro submitted
	 */
	public Activitystatus getProSubmitted() {
		return proSubmitted;
	}
	
	/**
	 * Sets the pro submitted.
	 *
	 * @param proSubmitted the new pro submitted
	 */
	public void setProSubmitted(Activitystatus proSubmitted) {
		this.proSubmitted = proSubmitted;
	}
	
	/**
	 * Checks if is mun view.
	 *
	 * @return true, if is mun view
	 */
	public boolean isMunView() {
		return munView;
	}
	
	/**
	 * Sets the mun view.
	 *
	 * @param munView the new mun view
	 */
	public void setMunView(boolean munView) {
		this.munView = munView;
	}
	
	/**
	 * Checks if is hide toolbar.
	 *
	 * @return true, if is hide toolbar
	 */
	public boolean isHideToolbar() {
		return hideToolbar;
	}
	
	/**
	 * Sets the hide toolbar.
	 *
	 * @param hideToolbar the new hide toolbar
	 */
	public void setHideToolbar(boolean hideToolbar) {
		this.hideToolbar = hideToolbar;
	}
	
	/**
	 * Checks if is kfa view.
	 *
	 * @return true, if is kfa view
	 */
	public boolean isKfaView() {
		return kfaView;
	}
	
	/**
	 * Sets the kfa view.
	 *
	 * @param kfaView the new kfa view
	 */
	public void setKfaView(boolean kfaView) {
		this.kfaView = kfaView;
	}

	/**
	 * Gets the activity status.
	 *
	 * @return the activity status
	 */
	public ActivityStatus getActivityStatus() {
		return activityStatus;
	}

	/**
	 * Sets the activity status.
	 *
	 * @param activityStatus the new activity status
	 */
	public void setActivityStatus(ActivityStatus activityStatus) {
		this.activityStatus = activityStatus;
	}

	/**
	 * Gets the doc.
	 *
	 * @return the doc
	 */
	public ActivityStatusDoc getDoc() {
		return doc;
	}

	/**
	 * Sets the doc.
	 *
	 * @param doc the doc to set
	 */
	public void setDoc(ActivityStatusDoc doc) {
		this.doc = doc;
	}

	/**
	 * Gets the bar code img.
	 *
	 * @return the bar code img
	 */
	public String getBarCodeImg() {
		return barCodeImg;
	}

	/**
	 * Sets the bar code img.
	 *
	 * @param barCodeImg the new bar code img
	 */
	public void setBarCodeImg(String barCodeImg) {
		this.barCodeImg = barCodeImg;
	}

	/**
	 * Gets the muperiod id.
	 *
	 * @return the muperiod id
	 */
	public Long getMuperiodId() {
		return muperiodId;
	}

	/**
	 * Sets the muperiod id.
	 *
	 * @param muperiodId the new muperiod id
	 */
	public void setMuperiodId(Long muperiodId) {
		this.muperiodId = muperiodId;
	}
	
}
