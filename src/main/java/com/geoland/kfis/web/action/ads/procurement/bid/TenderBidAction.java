/**
 * 
 */
package com.geoland.kfis.web.action.ads.procurement.bid;

import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class TenderBidAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 3:50:18 PM, Oct 3, 2014
 */
public class TenderBidAction extends TenderBidBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 3363993333022476104L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(bidId!=null){
			setBid(DAOFactory.getFactory().getPrcmtTenderBidDAO().get(bidId));
		}
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
	
	/**
	 * Evaluation popup.
	 *
	 * @return the string
	 */
	public String evaluationPopup(){
		if(bidId!=null){
			setBid(DAOFactory.getFactory().getPrcmtTenderBidDAO().get(bidId));
		}
		return "evaluationPopup";
	}
	
	/**
	 * Complaint popup.
	 *
	 * @return the string
	 */
	public String complaintPopup(){
		if(bidId!=null){
			setBid(DAOFactory.getFactory().getPrcmtTenderBidDAO().get(bidId));
		}
		return "complaintPopup";
	}
	
	/**
	 * Report generator.
	 *
	 * @return the string
	 */
	public String reportGenerator(){
		if(bidId!=null){
			setBid(DAOFactory.getFactory().getPrcmtTenderBidDAO().get(bidId));
		}
		return "report_generator";
	}
}
