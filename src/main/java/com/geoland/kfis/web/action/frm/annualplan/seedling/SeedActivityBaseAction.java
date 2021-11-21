package com.geoland.kfis.web.action.frm.annualplan.seedling;

import com.geoland.kfis.model.Activity;
import com.geoland.kfis.model.ActivityStatus;
import com.geoland.kfis.model.ActivityStatusDoc;
import com.geoland.kfis.model.AnnualPlanning;
import com.geoland.kfis.model.SeedActivity;
import com.geoland.kfis.persistence.hibernate.usertypes.Activitystatus;
import com.geoland.kfis.persistence.hibernate.usertypes.Prodtype;
import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class SeedActivityBaseAction.
 *
 * @author Fisnik Aliu, GEO&LAND
 * @created Oct 20, 2014 11:25:44 AM
 * @Version 1.0
 */
public class SeedActivityBaseAction extends BaseActionSupport{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -1438109186328569729L;
	
	/** The seed activity id. */
	protected Long seedActivityId;
	
	/** The seed activity. */
	protected SeedActivity seedActivity;
	
	/** The activity id. */
	protected Long activityId;
	
	/** The activity. */
	protected Activity activity;
	
	/** The activity list. */
	protected String activityList;
	
	/** The annualplan id. */
	protected Long annualplanId;
	
	/** The annualplan. */
	protected AnnualPlanning annualplan;
	
	/** The new status. */
	protected Activitystatus newStatus=Activitystatus.NEW;
	
	/** The rejected. */
	protected Activitystatus rejected=Activitystatus.REJECTED;
	
	/** The replan. */
	protected Activitystatus replan=Activitystatus.REPLANNED;
	
	/** The approved. */
	protected Activitystatus approved=Activitystatus.APPROVED;
	
	/** The activity status. */
	protected ActivityStatus activityStatus;
	
	/** The decision status. */
	protected boolean decisionStatus;
	
	/** The fo pr. */
	protected boolean foPr=false;
	
	/** The fo im. */
	protected boolean foIm=false;
	
	/** The central plan. */
	protected boolean centralPlan=false;
	
	/** The edit. */
	protected boolean edit=false;
	
	/** The doc. */
	protected ActivityStatusDoc doc;
	
	/** The forest institute user. */
	protected boolean forestInstituteUser;
	
	/** The prodtype list. */
	protected Prodtype[] prodtypeList=Prodtype.values();
	
	/** The planed geom. */
	protected String planedGeom;
	
	/** The implement planed geom. */
	protected String implementPlanedGeom;
	
	/**
	 * Gets the activity list.
	 *
	 * @return the activity list
	 */
	public String getActivityList() {
		return activityList;
	}
	
	/**
	 * Sets the activity list.
	 *
	 * @param activityList the new activity list
	 */
	public void setActivityList(String activityList) {
		this.activityList = activityList;
	}
	
	/**
	 * Gets the seed activity id.
	 *
	 * @return the seed activity id
	 */
	public Long getSeedActivityId() {
		return seedActivityId;
	}
	
	/**
	 * Sets the seed activity id.
	 *
	 * @param seedActivityId the new seed activity id
	 */
	public void setSeedActivityId(Long seedActivityId) {
		this.seedActivityId = seedActivityId;
	}
	
	/**
	 * Gets the seed activity.
	 *
	 * @return the seed activity
	 */
	public SeedActivity getSeedActivity() {
		return seedActivity;
	}
	
	/**
	 * Sets the seed activity.
	 *
	 * @param seedActivity the new seed activity
	 */
	public void setSeedActivity(SeedActivity seedActivity) {
		this.seedActivity = seedActivity;
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
	 * Gets the new status.
	 *
	 * @return the newStatus
	 */
	public Activitystatus getNewStatus() {
		return newStatus;
	}
	
	/**
	 * Sets the new status.
	 *
	 * @param newStatus the newStatus to set
	 */
	public void setNewStatus(Activitystatus newStatus) {
		this.newStatus = newStatus;
	}
	
	/**
	 * Gets the rejected.
	 *
	 * @return the rejected
	 */
	public Activitystatus getRejected() {
		return rejected;
	}
	
	/**
	 * Sets the rejected.
	 *
	 * @param rejected the rejected to set
	 */
	public void setRejected(Activitystatus rejected) {
		this.rejected = rejected;
	}
	
	/**
	 * Gets the replan.
	 *
	 * @return the replan
	 */
	public Activitystatus getReplan() {
		return replan;
	}
	
	/**
	 * Sets the replan.
	 *
	 * @param replan the replan to set
	 */
	public void setReplan(Activitystatus replan) {
		this.replan = replan;
	}
	
	/**
	 * Gets the approved.
	 *
	 * @return the approved
	 */
	public Activitystatus getApproved() {
		return approved;
	}
	
	/**
	 * Sets the approved.
	 *
	 * @param approved the approved to set
	 */
	public void setApproved(Activitystatus approved) {
		this.approved = approved;
	}
	
	/**
	 * Gets the activity status.
	 *
	 * @return the activityStatus
	 */
	public ActivityStatus getActivityStatus() {
		return activityStatus;
	}
	
	/**
	 * Sets the activity status.
	 *
	 * @param activityStatus the activityStatus to set
	 */
	public void setActivityStatus(ActivityStatus activityStatus) {
		this.activityStatus = activityStatus;
	}
	
	/**
	 * Checks if is decision status.
	 *
	 * @return the decisionStatus
	 */
	public boolean isDecisionStatus() {
		return decisionStatus;
	}
	
	/**
	 * Sets the decision status.
	 *
	 * @param decisionStatus the decisionStatus to set
	 */
	public void setDecisionStatus(boolean decisionStatus) {
		this.decisionStatus = decisionStatus;
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
	 * Sets the forest institute user.
	 *
	 * @param forestInstituteUser the forestInstituteUser to set
	 */
	public void setForestInstituteUser(boolean forestInstituteUser) {
		this.forestInstituteUser = forestInstituteUser;
	}
	
	/**
	 * Checks if is fo pr.
	 *
	 * @return the foPr
	 */
	public boolean isFoPr() {
		return foPr;
	}
	
	/**
	 * Sets the fo pr.
	 *
	 * @param foPr the foPr to set
	 */
	public void setFoPr(boolean foPr) {
		this.foPr = foPr;
	}
	
	/**
	 * Checks if is fo im.
	 *
	 * @return the foIm
	 */
	public boolean isFoIm() {
		return foIm;
	}
	
	/**
	 * Sets the fo im.
	 *
	 * @param foIm the foIm to set
	 */
	public void setFoIm(boolean foIm) {
		this.foIm = foIm;
	}
	
	/**
	 * Checks if is central plan.
	 *
	 * @return the centralPlan
	 */
	public boolean isCentralPlan() {
		return centralPlan;
	}
	
	/**
	 * Sets the central plan.
	 *
	 * @param centralPlan the centralPlan to set
	 */
	public void setCentralPlan(boolean centralPlan) {
		this.centralPlan = centralPlan;
	}
	
	/**
	 * Forest institute user.
	 *
	 * @return the forestInstituteUser
	 */
	public boolean forestInstituteUser() {
		return forestInstituteUser;
	}
	
	/**
	 * Checks if is edits the.
	 *
	 * @return the edit
	 */
	public boolean isEdit() {
		return edit;
	}
	
	/**
	 * Sets the edits the.
	 *
	 * @param edit the edit to set
	 */
	public void setEdit(boolean edit) {
		this.edit = edit;
	}
	
	/**
	 * Gets the prodtype list.
	 *
	 * @return the prodtype list
	 */
	public Prodtype[] getProdtypeList() {
		return prodtypeList;
	}
	
	/**
	 * Sets the prodtype list.
	 *
	 * @param prodtypeList the new prodtype list
	 */
	public void setProdtypeList(Prodtype[] prodtypeList) {
		this.prodtypeList = prodtypeList;
	}
	
	/**
	 * Gets the planed geom.
	 *
	 * @return the planedGeom
	 */
	public String getPlanedGeom() {
		return planedGeom;
	}
	
	/**
	 * Sets the planed geom.
	 *
	 * @param planedGeom the planedGeom to set
	 */
	public void setPlanedGeom(String planedGeom) {
		this.planedGeom = planedGeom;
	}
	
	/**
	 * Gets the implement planed geom.
	 *
	 * @return the implementPlanedGeom
	 */
	public String getImplementPlanedGeom() {
		return implementPlanedGeom;
	}
	
	/**
	 * Sets the implement planed geom.
	 *
	 * @param implementPlanedGeom the implementPlanedGeom to set
	 */
	public void setImplementPlanedGeom(String implementPlanedGeom) {
		this.implementPlanedGeom = implementPlanedGeom;
	}
}
