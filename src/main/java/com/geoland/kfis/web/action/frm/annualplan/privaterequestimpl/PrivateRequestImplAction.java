package com.geoland.kfis.web.action.frm.annualplan.privaterequestimpl;

import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class PrivateRequestImplAction.
 */
public class PrivateRequestImplAction extends PrivateRequestImplBaseAction{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(privateRequestImplId!=null){
			privateRequestImpl=DAOFactory.getFactory().getPrivateRequestImplDAO().get(privateRequestImplId);
		}
		if(privateRequestId!=null){
			privateRequest=DAOFactory.getFactory().getPrivateRequestDAO().get(privateRequestId);
			setActivity(DAOFactory.getFactory().getActivityDAO().get(privateRequest.getActivity().getId()));
			
		}
		
		return "form";
		
	}
	
	/**
	 * Grid.
	 *
	 * @return the string
	 */
	public String grid(){
		if(privateRequestId!=null){
			privateRequest=DAOFactory.getFactory().getPrivateRequestDAO().get(privateRequestId);
		}
		
		return "grid";
	}
	
	/**
	 * Marking.
	 *
	 * @return the string
	 */
	public String marking(){
		
		if(privateRequestImplId!=null){
			privateRequestImpl=DAOFactory.getFactory().getPrivateRequestImplDAO().get(privateRequestImplId);
		}
		if(privateRequestId!=null){
			privateRequest=DAOFactory.getFactory().getPrivateRequestDAO().get(privateRequestId);
			setActivity(DAOFactory.getFactory().getActivityDAO().get(privateRequest.getActivity().getId()));
			
		}
		return "marking";
	}
	
	/**
	 * Page.
	 *
	 * @return the string
	 */
	public String page(){
		if(privateRequestId!=null){
			privateRequest=DAOFactory.getFactory().getPrivateRequestDAO().get(privateRequestId);
		}
		return "page";
	}
	

}
