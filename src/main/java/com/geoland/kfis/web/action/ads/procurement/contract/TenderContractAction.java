/**
 * 
 */
package com.geoland.kfis.web.action.ads.procurement.contract;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.PrcmtTenderBidder;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class TenderContractAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 1:25:21 PM, Nov 19, 2014
 */
public class TenderContractAction extends TenderContractBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -7841517962727930838L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(tenderId!=null){
			tender=DAOFactory.getFactory().getPrcmtTenderRequestDAO().get(tenderId);
			
			String query="select bidder.* from tprcmt_tender_bidder bidder left join tprcmt_tender_bid bid on bidder.id=bid.bidder_id " +
					"left join tprcmt_tender_request request on request.id=bid.tender_request_id where bid.selected=true and request.id="+tenderId;
			
			List<PrcmtTenderBidder> list=DAOFactory.getFactory().getPrcmtTenderBidderDAO().executeSQLQuery(query);
			if(list.size()>0)
				bidder=list.get(0);
			else{
				HttpServletResponse response=ServletActionContext.getResponse();
				response.addHeader("no_bidder_selected", "true");
			}
		}
		return "form";
	}
	
}
