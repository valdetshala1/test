/**
 * 
 */
package com.geoland.kfis.web.action.ads.procurement.complaint;

import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class TenderComplaintAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 10:34:58 AM, Nov 18, 2014
 */
public class TenderComplaintAction extends TenderComplaintBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -5293493143663179983L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(complaintId!=null)
			setComplaint(DAOFactory.getFactory().getPrcmtTenderComplaintDAO().get(complaintId));
		
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
