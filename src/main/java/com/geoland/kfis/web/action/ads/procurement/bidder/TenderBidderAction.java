/**
 * 
 */
package com.geoland.kfis.web.action.ads.procurement.bidder;

import com.geoland.kfis.persistence.dao.DAOFactory;


// TODO: Auto-generated Javadoc
/**
 * The Class TenderBidderAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 10:27:41 AM, Oct 3, 2014
 */
public class TenderBidderAction extends TenderBidderBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -8749054311989589029L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(bidderId!=null){
			setBidder(DAOFactory.getFactory().getPrcmtTenderBidderDAO().get(bidderId));
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
}
