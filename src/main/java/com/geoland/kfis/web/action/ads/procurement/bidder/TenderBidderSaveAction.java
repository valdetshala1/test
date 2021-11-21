/**
 * 
 */
package com.geoland.kfis.web.action.ads.procurement.bidder;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class TenderBidderSaveAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 10:28:48 AM, Oct 3, 2014
 */
public class TenderBidderSaveAction extends TenderBidderBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 2710793977539134112L;
	
	/** The employee. */
	private Employee employee;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		employee=getUser().getEmployee();
		if(employee==null)
			addActionError("");
		
		if(bidder!=null && StringUtils.isEmpty(bidder.getCompanyName()))
			addFieldError("bidder.comopanyName", getMessage("bidder.comopanyName.empty"));
		
		if(bidder!=null && StringUtils.isEmpty(bidder.getFiscalNumber()))
			addFieldError("bidder.fiscalNumber", getMessage("bidder.fiscalNumber.empty"));
		
		if(bidder!=null && StringUtils.isEmpty(bidder.getBusinessNumber()))
			addFieldError("bidder.businessNumber", getMessage("contractor.business.number"));
		
		if(hasFieldErrors()){
			HttpServletResponse response=ServletActionContext.getResponse();
			response.addHeader("errors_exist", "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		bidder.setCreatedDate(new Date());
		bidder.setEmployee(employee);
		bidder.setCurrentUser(getUser().getUser());
		DAOFactory.getFactory().getPrcmtTenderBidderDAO().save(bidder);
		return SUCCESS;
	}

}
