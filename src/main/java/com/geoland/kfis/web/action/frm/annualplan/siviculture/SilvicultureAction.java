package com.geoland.kfis.web.action.frm.annualplan.siviculture;

import org.apache.commons.codec.binary.Base64;

import com.geoland.kfis.persistence.dao.DAOFactory;
// TODO: Auto-generated Javadoc

/**
 * The Class SilvicultureAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Oct 20, 2014 , 11:32:26 AM
 */
public class SilvicultureAction extends SilvicultureBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(annualplanId!=null){
			setAnnualplan(DAOFactory.getFactory().getAnnualPlanningDAO().get(annualplanId));
		}
		if(silvicultureId!=null){
			silviculture=DAOFactory.getFactory().getStandSilvicultureActivityDAO().get(silvicultureId);
			setActivity(DAOFactory.getFactory().getActivityDAO().get(silviculture.getActivity().getId()));
			stand=DAOFactory.getFactory().getStandDAO().get(silviculture.getStand().getId());
			employee = DAOFactory.getFactory().getPartyUserDAO().getEmployee(getUser().getUser().getId());
			activityStatus=DAOFactory.getFactory().getActivityStatusDAO().get(silviculture.getActivityStatus().getId());
			if(silviculture.getActivity()!=null && silviculture.getActivity().getQrCode()!=null )
				barCodeImg=new String(Base64.encodeBase64(silviculture.getActivity().getQrCode()));
	
		}
		controlProcesOnPage();
		
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
	public String  page(){
		return "page";
	}
	
	/**
	 * Slv activity popup.
	 *
	 * @return the string
	 */
	public String slv_activity_popup(){
		return "slv_activity_popup";
	}
	
	/**
	 * Plan page.
	 *
	 * @return the string
	 */
	public String  plan_page(){
		if(silvicultureId!=null){
			silviculture=DAOFactory.getFactory().getStandSilvicultureActivityDAO().get(silvicultureId);
			setActivity(DAOFactory.getFactory().getActivityDAO().get(silviculture.getActivity().getId()));
			stand=DAOFactory.getFactory().getStandDAO().get(silviculture.getStand().getId());
			employee = DAOFactory.getFactory().getPartyUserDAO().getEmployee(getUser().getUser().getId());
			activityStatus=DAOFactory.getFactory().getActivityStatusDAO().get(silviculture.getActivityStatus().getId());
			if(silviculture.getActivity()!=null && silviculture.getActivity().getQrCode()!=null )
				barCodeImg=new String(Base64.encodeBase64(silviculture.getActivity().getQrCode()));

		}else if(standId!=null){
			setStand(DAOFactory.getFactory().getStandDAO().get(standId));
		}
		if(annualplanId!=null)
			 annualplan = DAOFactory.getFactory().getAnnualPlanningDAO().get(annualplanId);		
		controlProcesOnPage();	
		return "plan_page";
		}
	

}
