package com.geoland.kfis.web.action.frm.annualplan.seedling;

import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Activitystatus;

// TODO: Auto-generated Javadoc
/**
 * The Class SeedActivityAction.
 *
 * @author Fisnik Aliu, GEO&LAND
 * @created Oct 20, 2014 11:39:11 AM
 * @Version 1.0
 */
public class SeedActivityAction extends SeedActivityBaseAction{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -895848344225909630L;
	
	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		forestInstituteUser=isForestInstituteUser();
		if(seedActivityId!=null) {
			seedActivity = DAOFactory.getFactory().getSeedActivityDAO().get(seedActivityId);
			activity=DAOFactory.getFactory().getActivityDAO().get(seedActivity.getActivity().getId());
			if(activity!=null){
				planedGeom=activity.getPlanedGeom()!=null?activity.getPlanedGeom().toString():"";
				implementPlanedGeom=activity.getImplementedGeom()!=null?activity.getImplementedGeom().toString():"";
			}
			setActivityStatus(DAOFactory.getFactory().getActivityStatusDAO().get(seedActivity.getActivityStatus().getId()));
			Activitystatus s=seedActivity.getActivityStatus().getStatus();
			Activitystatus annualPlanningStatus = seedActivity.getActivity().getAnnualPlanning().getAnnualPlanningStatus().getStatus();
			decisionStatus=(!forestInstituteUser && s==Activitystatus.SUBMITTED && "R".equals(seedActivity.getWorkStage()) && annualPlanningStatus==Activitystatus.SUBMITTED);
			if(s==Activitystatus.NEW && forestInstituteUser)
				foPr=true;
			if(s==Activitystatus.APPROVED && forestInstituteUser)
				foIm=true;
			if((s==Activitystatus.APPROVED || s==Activitystatus.SUBMITTED) && !forestInstituteUser && (annualPlanningStatus==Activitystatus.APPROVED || annualPlanningStatus==Activitystatus.SUBMITTED))
				centralPlan=true;
			
			edit=(foPr==false && foIm==false && centralPlan==false && decisionStatus==false);
			if(s==Activitystatus.APPROVED && !annualPlanningStatus.equals(Activitystatus.APPROVED))
				edit=true;
			if(seedActivity.getPlValue()!=null && !forestInstituteUser)
				edit=true;
			if(seedActivity.getImValue()!=null)
				edit=true;
			if(s==Activitystatus.REJECTED || annualPlanningStatus==Activitystatus.REJECTED)
				edit=true;
			else if((s!=Activitystatus.NEW && s!=Activitystatus.REPLANNED ) && annualPlanningStatus==Activitystatus.REPLANNED)
				edit=true;
			if(s.equals(Activitystatus.REPLANNED) && !annualPlanningStatus.equals(Activitystatus.REPLANNED)){
				edit=true;
				decisionStatus=false;
			}
		}
		if(annualplanId!=null)
			 annualplan = DAOFactory.getFactory().getAnnualPlanningDAO().get(annualplanId);	
		return "form";
	}
	
	/**
	 * Page.
	 *
	 * @return the string
	 */
	public String page(){
		return "page";
	}
	
	/**
	 * Grid.
	 *
	 * @return the string
	 */
	public String grid(){
		return "grid";
	}
	
	/**
	 * Plan page.
	 *
	 * @return the string
	 */
	public String planPage(){
		forestInstituteUser=isForestInstituteUser();
		if(seedActivityId!=null) {
			seedActivity = DAOFactory.getFactory().getSeedActivityDAO().get(seedActivityId);
			activity=DAOFactory.getFactory().getActivityDAO().get(seedActivity.getActivity().getId());
			if(activity!=null){
				planedGeom=activity.getPlanedGeom()!=null?activity.getPlanedGeom().toString():"";
				implementPlanedGeom=activity.getImplementedGeom()!=null?activity.getImplementedGeom().toString():"";
			}
			setActivityStatus(DAOFactory.getFactory().getActivityStatusDAO().get(seedActivity.getActivityStatus().getId()));
			Activitystatus s=seedActivity.getActivityStatus().getStatus();
			Activitystatus annualPlanningStatus = seedActivity.getActivity().getAnnualPlanning().getAnnualPlanningStatus().getStatus();
			decisionStatus=(!forestInstituteUser && s==Activitystatus.SUBMITTED && "R".equals(seedActivity.getWorkStage()) && annualPlanningStatus==Activitystatus.SUBMITTED);
			if(s==Activitystatus.NEW && forestInstituteUser)
				foPr=true;
			if(s==Activitystatus.APPROVED && forestInstituteUser)
				foIm=true;
			if((s==Activitystatus.APPROVED || s==Activitystatus.SUBMITTED) && !forestInstituteUser && (annualPlanningStatus==Activitystatus.APPROVED || annualPlanningStatus==Activitystatus.SUBMITTED))
				centralPlan=true;
			
			edit=(foPr==false && foIm==false && centralPlan==false && decisionStatus==false);
			if(s==Activitystatus.APPROVED && !annualPlanningStatus.equals(Activitystatus.APPROVED))
				edit=true;
			if(seedActivity.getPlValue()!=null && !forestInstituteUser)
				edit=true;
			if(seedActivity.getImValue()!=null)
				edit=true;
			if(s==Activitystatus.REJECTED || annualPlanningStatus==Activitystatus.REJECTED)
				edit=true;
			else if((s!=Activitystatus.NEW && s!=Activitystatus.REPLANNED ) && annualPlanningStatus==Activitystatus.REPLANNED)
				edit=true;
			if(s.equals(Activitystatus.REPLANNED) && !annualPlanningStatus.equals(Activitystatus.REPLANNED)){
				edit=true;
				decisionStatus=false;
			}
		}
		if(annualplanId!=null)
			 annualplan = DAOFactory.getFactory().getAnnualPlanningDAO().get(annualplanId);
		return "plan_page";
	}
}
