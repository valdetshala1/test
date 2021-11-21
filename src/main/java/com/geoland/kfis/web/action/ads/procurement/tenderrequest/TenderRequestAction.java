/**
 * 
 */
package com.geoland.kfis.web.action.ads.procurement.tenderrequest;

import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Protenderstatus;


// TODO: Auto-generated Javadoc
/**
 * The Class TenderRequestAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 2:17:53 PM, Oct 2, 2014
 */
public class TenderRequestAction extends TenderRequestBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -2672842717751615372L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(tenderRequestId!=null){
			tenderRequest=DAOFactory.getFactory().getPrcmtTenderRequestDAO().get(tenderRequestId);
			Protenderstatus s=tenderRequest.getPrcmtTenderStatus().getStatus();
			if(s!=null && s!=Protenderstatus.NEW && s!=Protenderstatus.APPROVED && s!=Protenderstatus.REJECTED && s!=Protenderstatus.TENDERDONE)
				showTabs=true;
			hideButtons=(s==selected || s==pending || s==contracted || s==canceled);
			hidePopupButtons=(s==contracted || s==canceled);
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
	 * Analyse popup.
	 *
	 * @return the string
	 */
	public String analysePopup(){
		if(tenderRequestId!=null){
			tenderRequest=DAOFactory.getFactory().getPrcmtTenderRequestDAO().get(tenderRequestId);
		}
		return "analysePopup";
	}
	
	/**
	 * Creates the tender popup.
	 *
	 * @return the string
	 */
	public String createTenderPopup(){
		if(tenderRequestId!=null){
			tenderRequest=DAOFactory.getFactory().getPrcmtTenderRequestDAO().get(tenderRequestId);
		}
		return "createTenderPopup";
	}
	
	/**
	 * Notify PPRC.
	 *
	 * @return the string
	 */
	public String notifyPPRC(){
		if(tenderRequestId!=null){
			tenderRequest=DAOFactory.getFactory().getPrcmtTenderRequestDAO().get(tenderRequestId);
		}
		return "notifyPPRC";
	}
	
	/**
	 * Tab.
	 *
	 * @return the string
	 */
	public String tab(){
		if(tenderRequestId!=null){
			tenderRequest=DAOFactory.getFactory().getPrcmtTenderRequestDAO().get(tenderRequestId);
			Protenderstatus s=tenderRequest.getPrcmtTenderStatus().getStatus();
			if(s!=null && s!=Protenderstatus.NEW && s!=Protenderstatus.APPROVED && s!=Protenderstatus.REJECTED && s!=Protenderstatus.TENDERDONE)
				showTabs=true;
			hideButtons=(s==selected || s==pending || s==contracted || s==canceled);
			hidePopupButtons=(s==contracted || s==canceled);
				
		}
		return "tab";
	}
	
	/**
	 * Proceed.
	 *
	 * @return the string
	 */
	public String proceed(){
		if(tenderRequestId!=null)
			tenderRequest=DAOFactory.getFactory().getPrcmtTenderRequestDAO().get(tenderRequestId);
		
		return "proceed";
	}
	
	/**
	 * Cancel tender.
	 *
	 * @return the string
	 */
	public String cancelTender(){
		if(tenderRequestId!=null)
			tenderRequest=DAOFactory.getFactory().getPrcmtTenderRequestDAO().get(tenderRequestId);
			
		return "cancel_tender";
	}
	
	/**
	 * Republish.
	 *
	 * @return the string
	 */
	public String republish(){
		if(tenderRequestId!=null)
			setTenderRequest(DAOFactory.getFactory().getPrcmtTenderRequestDAO().get(tenderRequestId));
		
		return "republish";
	}
	
	/**
	 * Report generator.
	 *
	 * @return the string
	 */
	public String reportGenerator(){
		statusList=Protenderstatus.values();
		return "report_generator";
	}
}

