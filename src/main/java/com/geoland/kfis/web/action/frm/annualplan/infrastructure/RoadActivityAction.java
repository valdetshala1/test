package com.geoland.kfis.web.action.frm.annualplan.infrastructure;

import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Activitystatus;

// TODO: Auto-generated Javadoc
/**
 * The Class RoadActivityAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Oct 27, 2014 , 2:24:01 PM
 */
public class RoadActivityAction extends RoadActivityBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	
	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(roadActivityId!=null){
			roadActivity=DAOFactory.getFactory().getRoadActivityDAO().get(roadActivityId);
			activity=DAOFactory.getFactory().getActivityDAO().get(roadActivity.getActivity().getId());
			setActivityStatus(DAOFactory.getFactory().getActivityStatusDAO().get(roadActivity.getActivityStatus().getId()));
			
			Activitystatus s=roadActivity.getActivityStatus().getStatus();
			Activitystatus annualPlanningStatus = roadActivity.getActivity().getAnnualPlanning().getAnnualPlanningStatus().getStatus();
//			Short opl = getUser().getOrganisation().getOperLevel();
			Character opl = getUser().getOrganisation().getOperLevelVal();
			decisionStatus=(opl=='C' && s==Activitystatus.SUBMITTED  && annualPlanningStatus==Activitystatus.SUBMITTED);
			if(s==approved && opl=='M')
				edit=false;
			else if(s==replan && opl!='R')
				edit=true;
			else if((s==Activitystatus.SUBMITTED || s==rejected) && opl!='C')
				edit=true;
			else if((s==rejected || s==approved) && opl=='C')
				edit=true;
			else if(s==rejected)
				edit=true;
			else if((s!=Activitystatus.NEW && s!=Activitystatus.REPLANNED ) && annualPlanningStatus==Activitystatus.REPLANNED)
				edit=true;
			if(annualPlanningStatus==approved && s==approved && opl!='M')
				edit=true;
			if(s==approved && annualPlanningStatus!=approved)
				edit=true;
			if(s.equals(Activitystatus.REPLANNED) && !annualPlanningStatus.equals(Activitystatus.REPLANNED)){
				edit=true;
				decisionStatus=false;
			}
		}
		if(roadId!=null)
			road=DAOFactory.getFactory().getRoadDAO().get(roadId);
		
		if(annualPlanId!=null)
			setAnnualPlan(DAOFactory.getFactory().getAnnualPlanningDAO().get(annualPlanId));
		return "form";
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
	 * Page.
	 *
	 * @return the string
	 */
	public String page(){
		return "page";
	}
	
	
}
