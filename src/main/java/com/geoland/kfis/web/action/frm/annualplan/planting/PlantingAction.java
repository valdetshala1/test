/**
 * 
 */
package com.geoland.kfis.web.action.frm.annualplan.planting;

import org.apache.commons.codec.binary.Base64;

import com.geoland.kfis.model.AnnualPlanningStatus;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Activitystatus;

// TODO: Auto-generated Javadoc
/**
 * The Class PlantingAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 11:30:27 AM, Oct 20, 2014
 */
public class PlantingAction extends PlantingBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 5961028304404917921L;
	
	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		Character opl = getUser().getOrganisation().getOperLevelVal();
		if(plantingId!=null){
			setPlanting(DAOFactory.getFactory().getStandPlantingActivityDAO().get(plantingId));
			setActivity(DAOFactory.getFactory().getActivityDAO().get(planting.getActivity().getId()));
			if(activity!=null){
				plantPlanedGeom=activity.getPlanedGeom()!=null?activity.getPlanedGeom().toString():"";
				implementPlanedGeom=activity.getImplementedGeom()!=null?activity.getImplementedGeom().toString():"";
			}
			setStand(DAOFactory.getFactory().getStandDAO().get(planting.getStand().getId()));
			setActivityStatus(DAOFactory.getFactory().getActivityStatusDAO().get(planting.getActivityStatus().getId()));
			Activitystatus s=planting.getActivityStatus().getStatus();
			Activitystatus annualPlanningStatus = planting.getActivity().getAnnualPlanning().getAnnualPlanningStatus().getStatus();
//			Short opl = getUser().getOrganisation().getOperLevel();
			
			decisionStatus=(opl=='C' && s==Activitystatus.SUBMITTED && "P".equals(planting.getWorkStage()) && annualPlanningStatus==Activitystatus.SUBMITTED);
			if(s==approved && opl=='R')
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
			if(annualPlanningStatus==approved && s==approved && opl!='R')
				edit=true;
//			if("D".equals(planting.getWorkStage()))
//				edit=true;
			if(s.equals(Activitystatus.REPLANNED) && !annualPlanningStatus.equals(Activitystatus.REPLANNED)){
				edit=true;
				decisionStatus=false;
			}
			if(planting.getSeedlingInventoryPOS()!=null){
				fromInventory=true;
				setInventoryPos(DAOFactory.getFactory().getSeedlingInventoryPosDAO().get(planting.getSeedlingInventoryPOS().getId()));
				if(inventoryPos.getSeedlingInventory().getSeedActivity()!=null)
					fromForestInstitute="Y";
			}
			if(planting.getActivity()!=null && planting.getActivity().getQrCode()!=null )
				barCodeImg=new String(Base64.encodeBase64(planting.getActivity().getQrCode()));
		
		}
		if(annualplanId!=null)
			setAnnualplan(DAOFactory.getFactory().getAnnualPlanningDAO().get(annualplanId));
		return "form";
	}
	
	/**
	 * Plan page.
	 *
	 * @return the string
	 */
	public String planPage(){
		Character opl = getUser().getOrganisation().getOperLevelVal();
		if(plantingId!=null){
			setPlanting(DAOFactory.getFactory().getStandPlantingActivityDAO().get(plantingId));
			
			setActivity(DAOFactory.getFactory().getActivityDAO().get(planting.getActivity().getId()));
			if(activity!=null){
				plantPlanedGeom=activity.getPlanedGeom()!=null?activity.getPlanedGeom().toString():"";
				implementPlanedGeom=activity.getImplementedGeom()!=null?activity.getImplementedGeom().toString():"";
			}
			setActivityStatus(DAOFactory.getFactory().getActivityStatusDAO().get(planting.getActivityStatus().getId()));
			AnnualPlanningStatus planStatus = planting.getActivity().getAnnualPlanning().getAnnualPlanningStatus();
			Activitystatus s=planting.getActivityStatus().getStatus();
//			planting.getActivityStatus().setStatus(s);
//			Short opl = getUser().getOrganisation().getOperLevel();
			
			decisionStatus=(opl=='C' && s==Activitystatus.SUBMITTED && "P".equals(planting.getWorkStage()) && planStatus.getStatus()==Activitystatus.SUBMITTED);
			if(s==approved && opl=='R')
				edit=false;
			else if(s==replan && opl!='R')
				edit=true;
			else if((s==Activitystatus.SUBMITTED || s==rejected) && opl!='C')
				edit=true;
			else if((s==rejected || s==approved) && opl=='C')
				edit=true;
			else if(s==rejected)
				edit=true;
			else if((s!=Activitystatus.NEW && s!=Activitystatus.REPLANNED ) && planStatus.getStatus()==Activitystatus.REPLANNED)
				edit=true;
			if(planStatus.getStatus()==approved && s==approved && opl!='R')
				edit=true;
			
			if("D".equals(planting.getWorkStage()))
				edit=true;
			if(s.equals(Activitystatus.REPLANNED) && !planStatus.getStatus().equals(Activitystatus.REPLANNED))
				edit=true;
			
			if(planting.getSeedlingInventoryPOS()!=null){
				fromInventory=true;
				setInventoryPos(DAOFactory.getFactory().getSeedlingInventoryPosDAO().get(planting.getSeedlingInventoryPOS().getId()));
				if(inventoryPos.getSeedlingInventory().getSeedActivity()!=null)
					fromForestInstitute="Y";
			}
			stand=DAOFactory.getFactory().getStandDAO().get(planting.getStand().getId());
			
			if(planting.getActivity()!=null && planting.getActivity().getQrCode()!=null )
				barCodeImg=new String(Base64.encodeBase64(planting.getActivity().getQrCode()));
		
		}else if(standId!=null)
			setStand(DAOFactory.getFactory().getStandDAO().get(standId));
		standGeom=stand.getTheGeom().toString();
		if(annualplanId!=null)
			 annualplan = DAOFactory.getFactory().getAnnualPlanningDAO().get(annualplanId);	
		return "plan_page";
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
