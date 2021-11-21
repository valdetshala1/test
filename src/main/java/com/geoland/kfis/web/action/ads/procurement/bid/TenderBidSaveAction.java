/**
 * 
 */
package com.geoland.kfis.web.action.ads.procurement.bid;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class TenderBidSaveAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 3:50:47 PM, Oct 3, 2014
 */
public class TenderBidSaveAction extends TenderBidBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -8012946589494290723L;
	
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
		
		if(bid!=null && bid.getPrcmtTenderBidder().getId()==null)
			addFieldError("bid.prcmtTenderBidder.id", getMessage("bid.prcmtTenderBidder.id.empty"));
		
		if(bid!=null && bid.getPrcmtTenderRequest().getId()==null)
			addFieldError("bid.prcmtTenderRequest.id", getMessage("bid.prcmtTenderRequest.id.empty"));
		
		if(bid!=null && bid.getBidValue()==null)
			addFieldError("bid.bidValue", getMessage("bid.bidValue.empty"));
		
//		if(file==null)
//			addFieldError("file", getMessage("tender.request.file.empty"));
		
		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response=ServletActionContext.getResponse();
			response.addHeader("errors_exist", "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		bid.setEmployee(employee);
		bid.setCreatedDate(new Date());
		if(file!=null){
			bid.setDoc(getFileBytes(file));
		}else if(bid.getId()!=null){
			Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
			SQLQuery sqlQuery= session.createSQLQuery("select doc from tprcmt_tender_bid  where id="+bid.getId());
			sqlQuery.addScalar("doc");
			Object ob1 = sqlQuery.uniqueResult();
			bid.setDoc((byte[])ob1);
		}
		DAOFactory.getFactory().getPrcmtTenderBidDAO().save(bid);
		
		return SUCCESS;
	}
}
