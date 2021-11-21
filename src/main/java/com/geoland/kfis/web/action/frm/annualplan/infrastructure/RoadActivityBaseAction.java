package com.geoland.kfis.web.action.frm.annualplan.infrastructure;

import java.util.List;

import com.geoland.kfis.model.Activity;
import com.geoland.kfis.model.ActivityStatus;
import com.geoland.kfis.model.ActivityStatusDoc;
import com.geoland.kfis.model.AnnualPlanning;
import com.geoland.kfis.model.Road;
import com.geoland.kfis.model.RoadActivity;
import com.geoland.kfis.model.RoadImplDeclare;
import com.geoland.kfis.persistence.hibernate.usertypes.Activitystatus;
import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class RoadActivityBaseAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Oct 27, 2014 , 2:23:33 PM
 */
public class RoadActivityBaseAction  extends BaseActionSupport{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The road activity. */
	protected RoadActivity roadActivity;
	
	/** The road activity id. */
	protected Long roadActivityId;
	
	/** The activity id. */
	protected Long activityId;
	
	/** The activity. */
	protected Activity activity;
	
	/** The annual plan id. */
	protected Long annualPlanId;
	
	/** The annual plan. */
	protected AnnualPlanning annualPlan;
	
	/** The activity list. */
	protected String activityList;
	
	/** The road. */
	protected Road road;
	
	/** The road id. */
	protected Long roadId;
	
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
	
	/** The edit. */
	protected boolean edit;
	
	/** The doc. */
	protected ActivityStatusDoc doc;
	
	/** The pl line. */
	protected String plLine;
	
	/**
	 * Find start M.
	 *
	 * @param rd the rd
	 * @return min startM from all  data in RoadImplDeclare
	 */
	protected double findStartM(List<RoadImplDeclare> rd){
		double rez=rd.get(0).getImStartM();
		for(RoadImplDeclare r:rd.subList(1,rd.size())){
			if(r.getImStartM()<rez){
				rez=r.getImStartM();
			}
		}
		return rez;
	}
	
	/**
	 * Find end M.
	 *
	 * @param rd the rd
	 * @return max endM from all data in RoadImplDeclare
	 */
	protected double findEndM(List<RoadImplDeclare> rd){
		double rez=rd.get(0).getImEndM();
		for(RoadImplDeclare r:rd.subList(1,rd.size())){
			if(r.getImEndM()>rez){
				rez=r.getImEndM();
			}
		}
		return rez;
	}
	
	/**
	 * Gets the road activity.
	 *
	 * @return the road activity
	 */
	public RoadActivity getRoadActivity() {
		return roadActivity;
	}
	
	/**
	 * Sets the road activity.
	 *
	 * @param roadActivity the new road activity
	 */
	public void setRoadActivity(RoadActivity roadActivity) {
		this.roadActivity = roadActivity;
	}
	
	/**
	 * Gets the road activity id.
	 *
	 * @return the road activity id
	 */
	public Long getRoadActivityId() {
		return roadActivityId;
	}
	
	/**
	 * Sets the road activity id.
	 *
	 * @param roadActivityId the new road activity id
	 */
	public void setRoadActivityId(Long roadActivityId) {
		this.roadActivityId = roadActivityId;
	}
	
	/**
	 * Gets the activity id.
	 *
	 * @return the activityId
	 */
	public Long getActivityId() {
		return activityId;
	}
	
	/**
	 * Sets the activity id.
	 *
	 * @param activityId the activityId to set
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
	 * @param activity the activity to set
	 */
	public void setActivity(Activity activity) {
		this.activity = activity;
	}
	
	/**
	 * Gets the annual plan id.
	 *
	 * @return the annualPlanId
	 */
	public Long getAnnualPlanId() {
		return annualPlanId;
	}
	
	/**
	 * Sets the annual plan id.
	 *
	 * @param annualPlanId the annualPlanId to set
	 */
	public void setAnnualPlanId(Long annualPlanId) {
		this.annualPlanId = annualPlanId;
	}
	
	/**
	 * Gets the annual plan.
	 *
	 * @return the annualPlan
	 */
	public AnnualPlanning getAnnualPlan() {
		return annualPlan;
	}
	
	/**
	 * Sets the annual plan.
	 *
	 * @param annualPlan the annualPlan to set
	 */
	public void setAnnualPlan(AnnualPlanning annualPlan) {
		this.annualPlan = annualPlan;
	}
	
	/**
	 * Gets the activity list.
	 *
	 * @return the activityList
	 */
	public String getActivityList() {
		return activityList;
	}
	
	/**
	 * Sets the activity list.
	 *
	 * @param activityList the activityList to set
	 */
	public void setActivityList(String activityList) {
		this.activityList = activityList;
	}
	
	/**
	 * Gets the road.
	 *
	 * @return the road
	 */
	public Road getRoad() {
		return road;
	}
	
	/**
	 * Sets the road.
	 *
	 * @param road the road to set
	 */
	public void setRoad(Road road) {
		this.road = road;
	}
	
	/**
	 * Gets the road id.
	 *
	 * @return the roadId
	 */
	public Long getRoadId() {
		return roadId;
	}
	
	/**
	 * Sets the road id.
	 *
	 * @param roadId the roadId to set
	 */
	public void setRoadId(Long roadId) {
		this.roadId = roadId;
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
	 * Gets the pl line.
	 *
	 * @return the pl line
	 */
	public String getPlLine() {
		return plLine;
	}
	
	/**
	 * Sets the pl line.
	 *
	 * @param plLine the new pl line
	 */
	public void setPlLine(String plLine) {
		this.plLine = plLine;
	}
	
}
