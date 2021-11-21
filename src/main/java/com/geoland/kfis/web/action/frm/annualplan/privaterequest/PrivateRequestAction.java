package com.geoland.kfis.web.action.frm.annualplan.privaterequest;

import com.geoland.kfis.model.Activity;
import com.geoland.kfis.model.PrivateRequest;
import com.geoland.kfis.persistence.dao.DAOFactory;
// TODO: Auto-generated Javadoc

/**
 * The Class PrivateRequestAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Oct 20, 2014 , 11:32:26 AM
 */
public class PrivateRequestAction extends PrivateRequestBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		String sqlActivityDomian="select * from tfrm_activity_domain where code='DTNKM'";
		activityDomain=DAOFactory.getFactory().getActivityDomainDAO().executeSQLQuery(sqlActivityDomian).get(0);
		userIsForestOwner=userIsForestOwner();
		if(annualplanId!=null){
			setAnnualplan(DAOFactory.getFactory().getAnnualPlanningDAO().get(annualplanId));
			controlNewRequest(annualplan);
		}
		if(privateRequestId!=null){
			privateRequest=DAOFactory.getFactory().getPrivateRequestDAO().get(privateRequestId);
			editable=canEdit(privateRequest);
			privateRequest.setRequester(DAOFactory.getFactory().getPersonDAO().get(privateRequest.getRequester().getId()));
			setActivity(DAOFactory.getFactory().getActivityDAO().get(privateRequest.getActivity().getId()));

		}else{
			if(userIsForestOwner){
				privateRequest=new PrivateRequest();
				requester=DAOFactory.getFactory().getPersonDAO().get(getUser().getPerson().getId());
				privateRequest.setRequester(requester);
				
			}
			activity=new Activity();
			activity.setActivityDomain(activityDomain);
		}
		
		return "form";
	}
	
	/**
	 * Parcel detail popup.
	 *
	 * @return the string
	 */
	public String parcelDetailPopup(){
		if(parcelDetailId!=null){
//			String query="Select * from tparcel_detail d where d.cadparcelid="+cadParcId;
//			parcelDetail=DAOFactory.getFactory().getParcelDetailDAO().executeSQLQuery(query).get(0);
			parcelDetail=DAOFactory.getFactory().getParcelDetailDAO().get(parcelDetailId);
		}
		return "parcelDetailPopup";
	}
	
	/**
	 * Submit popup.
	 *
	 * @return the string
	 */
	public String submitPopup(){
		if(privateRequestId!=null){
			privateRequest=DAOFactory.getFactory().getPrivateRequestDAO().get(privateRequestId);
			annualplan=privateRequest.getActivity().getAnnualPlanning();
		}
		return "submitPopup";
	}
	
	/**
	 * Transport popup.
	 *
	 * @return the string
	 */
	public String transportPopup(){
		if(privateRequestId!=null){
			privateRequest=DAOFactory.getFactory().getPrivateRequestDAO().get(privateRequestId);
			annualplan=privateRequest.getActivity().getAnnualPlanning();
		}
		return "transportPopup";
	}
	
	/**
	 * Grid.
	 *
	 * @return the string
	 */
	public String grid(){
		userIsForestOwner=userIsForestOwner();
		if(privateRequestId!=null){
			privateRequest=DAOFactory.getFactory().getPrivateRequestDAO().get(privateRequestId);
		}
		return "grid";
	}
	
	/**
	 * Payment popup.
	 *
	 * @return the string
	 */
	public String paymentPopup(){
		if(privateRequestId!=null){
			privateRequest=DAOFactory.getFactory().getPrivateRequestDAO().get(privateRequestId);
		}
		return "paymentPopup";
	}
	
	
	/**
	 * Control.
	 *
	 * @return the string
	 */
	public String control(){
		if(privateRequestId!=null){
			privateRequest=DAOFactory.getFactory().getPrivateRequestDAO().get(privateRequestId);
		}
		return "control";
	}
	
	/**
	 * Page.
	 *
	 * @return the string
	 */
	public String  page(){
		String sqlActivityDomian="select * from tfrm_activity_domain where code='DTNKM'";
		activityDomain=DAOFactory.getFactory().getActivityDomainDAO().executeSQLQuery(sqlActivityDomian).get(0);
		
		if(annualplanId!=null){
			setAnnualplan(DAOFactory.getFactory().getAnnualPlanningDAO().get(annualplanId));
			controlNewRequest(annualplan);
		}
		
		userIsForestOwner=userIsForestOwner();
		if(privateRequest==null && userIsForestOwner){
			privateRequest=new PrivateRequest();
			requester=DAOFactory.getFactory().getPersonDAO().get(getUser().getPerson().getId());
			privateRequest.setRequester(requester);
			
		}
		activity=new Activity();
		activity.setActivityDomain(activityDomain);
		
		return "page";
	}



}
