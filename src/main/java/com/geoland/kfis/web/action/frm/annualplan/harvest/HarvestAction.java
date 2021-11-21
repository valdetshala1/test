package com.geoland.kfis.web.action.frm.annualplan.harvest;

import org.apache.commons.codec.binary.Base64;

import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Activitystatus;

// TODO: Auto-generated Javadoc
/**
 * The Class HarvestAction.
 */
public class HarvestAction extends HarvestBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -4204366631412991801L;
	
	/**
	 * Stand plan page.
	 *
	 * @return the string
	 */
	public String standPlanPage(){
		Character opl = getUser().getOrganisation().getOperLevelVal();
		if(standharvestId != null){
			standharvest = DAOFactory.getFactory().getStandHarvestActivityDAO().get(standharvestId);
			setStand(DAOFactory.getFactory().getStandDAO().get(standharvest.getStand().getId()));
			
			setActivity(DAOFactory.getFactory().getActivityDAO().get(standharvest.getActivity().getId()));
			setActivityStatus(DAOFactory.getFactory().getActivityStatusDAO().get(standharvest.getActivityStatus().getId()));
			
			Activitystatus s=standharvest.getActivityStatus().getStatus();
			Activitystatus annualPlanningStatus = standharvest.getActivity().getAnnualPlanning().getAnnualPlanningStatus().getStatus();
//			Short opl = getUser().getOrganisation().getOperLevel();
			
			decisionStatus=(opl=='C' && s==Activitystatus.SUBMITTED && "P".equals(standharvest.getWorkStage()) && annualPlanningStatus==Activitystatus.SUBMITTED);
			if(s==terrain_done && opl=='M')
				edit=false;
			else if((s==replan || s==approved) && opl!='R')
				edit=true;
			else if((s==Activitystatus.SUBMITTED || s==rejected) && opl!='C')
				edit=true;
			else if((s==rejected || s==approved || s==terrain_done) && opl=='C')
				edit=true;
			else if(s==rejected)
				edit=true;
			else if((s!=Activitystatus.NEW && s!=Activitystatus.REPLANNED ) && annualPlanningStatus==Activitystatus.REPLANNED)
				edit=true;
			if((s==terrain_done || s==approved) && annualPlanningStatus!=approved)
				edit=true;
			if(annualPlanningStatus==approved && s==terrain_done && opl!='M')
				edit=true;
			if(s.equals(Activitystatus.REPLANNED) && !annualPlanningStatus.equals(Activitystatus.REPLANNED)){
				edit=true;
				decisionStatus=false;
			 }
			if(standharvest.getActivity()!=null && standharvest.getActivity().getQrCode()!=null )
				barCodeImg=new String(Base64.encodeBase64(standharvest.getActivity().getQrCode()));
		}
		if(!"M".equals(opl.toString()) && hasMeasuredVolume(stand))
			standgrowth=true;
		if(annualplanId!=null)
			 annualplan = DAOFactory.getFactory().getAnnualPlanningDAO().get(annualplanId);	
		
		return "stand_plan_page";
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
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		Character opl = getUser().getOrganisation().getOperLevelVal();
		if(standharvestId != null){
			standharvest = DAOFactory.getFactory().getStandHarvestActivityDAO().get(standharvestId);
			stand = DAOFactory.getFactory().getStandDAO().get(standharvest.getStand().getId());
			
			setActivity(DAOFactory.getFactory().getActivityDAO().get(standharvest.getActivity().getId()));
			setActivityStatus(DAOFactory.getFactory().getActivityStatusDAO().get(standharvest.getActivityStatus().getId()));
			
			Activitystatus s=standharvest.getActivityStatus().getStatus();
			Activitystatus annualPlanningStatus = standharvest.getActivity().getAnnualPlanning().getAnnualPlanningStatus().getStatus();
//			Short opl = getUser().getOrganisation().getOperLevel();
			
			decisionStatus=(opl=='C' && s==Activitystatus.SUBMITTED && "P".equals(standharvest.getWorkStage()) && annualPlanningStatus==Activitystatus.SUBMITTED);
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
			else if((s!=Activitystatus.NEW || s!=Activitystatus.REPLANNED ) && annualPlanningStatus==Activitystatus.REPLANNED)
				edit=true;
			
			if(s==approved && annualPlanningStatus!=approved)
				edit=true;
			if(annualPlanningStatus==approved && s==approved && opl!='M')
				edit=true;
			if(standharvest.getImFireVolume()!=null && standharvest.getImPulpVolume()!=null && standharvest.getImTechVolume()!=null)
				edit=true;
			if(s.equals(Activitystatus.REPLANNED) && !annualPlanningStatus.equals(Activitystatus.REPLANNED))
				edit=true;
			if(standharvest.getActivity()!=null && standharvest.getActivity().getQrCode()!=null )
				barCodeImg=new String(Base64.encodeBase64(standharvest.getActivity().getQrCode()));

		}
		if(opl!='M')
			standgrowth=true;
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
}
