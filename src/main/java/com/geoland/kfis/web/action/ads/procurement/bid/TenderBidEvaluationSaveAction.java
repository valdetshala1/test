package com.geoland.kfis.web.action.ads.procurement.bid;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.PrcmtTenderStatus;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Protenderstatus;
// TODO: Auto-generated Javadoc

/**
 * The Class TenderBidEvaluationSaveAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Oct 10, 2014 , 2:11:01 PM
 */
public class TenderBidEvaluationSaveAction extends TenderBidBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -1911369141609116672L;
	
	/** The employee. */
	private Employee employee;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		employee=getUser().getEmployee();
		if(employee==null)
			addFieldError("", "");
		
		if(bid!=null && bid.getId()==null){
			addFieldError("bid.id",	getMessage("bid.id.empty"));
		}
		else if(bid.isSelected()){
			String sqlQuery="select count(*) from tprcmt_tender_bid bid left join tprcmt_tender_request req on req.id=bid.tender_request_id where bid.selected=true and bid.id !="+bid.getId()+" and req.id="+bid.getPrcmtTenderRequest().getId();
			Integer count=DAOFactory.getFactory().getPrcmtTenderBidDAO().countQuery(sqlQuery);
			if(count>0){
				addFieldError("selected", getMessage("bid.evaluation.selected"));
			}
		}
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
		boolean sel=bid.isSelected();
		String note=bid.getNote();
		bid=DAOFactory.getFactory().getPrcmtTenderBidDAO().get(bid.getId());
		bid.setSelected(sel);
		bid.setNote(note);
		DAOFactory.getFactory().getPrcmtTenderBidDAO().save(bid);
		
		bid.setPrcmtTenderRequest(DAOFactory.getFactory().getPrcmtTenderRequestDAO().get(bid.getPrcmtTenderRequest().getId()));
		if(bid.getPrcmtTenderRequest().getPrcmtTenderStatus().getStatus()!=Protenderstatus.SELECTED){
			PrcmtTenderStatus tenderStatus = new PrcmtTenderStatus();
			tenderStatus.setCreatedDate(new Date());
			tenderStatus.setEmployee(employee);
			tenderStatus.setPrcmtTenderRequest(bid.getPrcmtTenderRequest());
			tenderStatus.setStatus(Protenderstatus.SELECTED);
			DAOFactory.getFactory().getPrcmtTenderStatusDAO().save(tenderStatus);
			
			bid.getPrcmtTenderRequest().setPrcmtTenderStatus(tenderStatus);
			DAOFactory.getFactory().getPrcmtTenderRequestDAO().save(bid.getPrcmtTenderRequest());
		}
		return SUCCESS;
	}

	/**
	 * Gets the employee.
	 *
	 * @return the employee
	 */
	public Employee getEmployee() {
		return employee;
	}

	/**
	 * Sets the employee.
	 *
	 * @param employee the employee to set
	 */
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
}
