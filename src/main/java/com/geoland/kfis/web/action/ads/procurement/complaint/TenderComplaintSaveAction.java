/**
 * 
 */
package com.geoland.kfis.web.action.ads.procurement.complaint;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.PrcmtTenderStatus;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Protenderstatus;

// TODO: Auto-generated Javadoc
/**
 * The Class TenderComplaintSaveAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 10:37:01 AM, Nov 18, 2014
 */
public class TenderComplaintSaveAction extends TenderComplaintBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -7178777673460744982L;
	
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
		
		if(complaint!=null && complaint.getPrcmtTenderBid().getId()==null)
			addFieldError("complaint.prcmtTenderBid", getMessage("bid.id.empty"));
		
		if(complaint!=null && StringUtils.isEmpty(complaint.getDocName()))
				addFieldError("complaint.docName", getMessage("complaint.docName.empty"));
		
		if(complaint!=null && StringUtils.isEmpty(complaint.getComplaint()))
			addFieldError("complaint.complaint", getMessage("complaint.complaint.empty"));
		
		if(complaint!=null && StringUtils.isEmpty(complaint.getDocType()))
			addFieldError("complaint.docType", getMessage("complaint.docType.empty"));
		
		if(complaint!=null && file==null)
			addFieldError("complaint.doc", getMessage("tender.request.file.empty"));
		
		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response=ServletActionContext.getResponse();
			response.addHeader("errrors_exist", "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		complaint.setEmployee(employee);
		complaint.setCreatedDate(new Date());
		
		if(file!=null){
			complaint.setDoc(getFileBytes(file));
		}
		DAOFactory.getFactory().getPrcmtTenderComplaintDAO().save(complaint);
		
		complaint.getPrcmtTenderBid().setPrcmtTenderRequest(DAOFactory.getFactory().getPrcmtTenderRequestDAO().get(complaint.getPrcmtTenderBid().getPrcmtTenderRequest().getId()));
		if(complaint.getPrcmtTenderBid().getPrcmtTenderRequest().getPrcmtTenderStatus().getStatus()!=Protenderstatus.PENDING){
			PrcmtTenderStatus tenderStatus = new PrcmtTenderStatus();
			tenderStatus.setCreatedDate(new Date());
			tenderStatus.setEmployee(employee);
			tenderStatus.setPrcmtTenderRequest(complaint.getPrcmtTenderBid().getPrcmtTenderRequest());
			tenderStatus.setStatus(Protenderstatus.PENDING);
			DAOFactory.getFactory().getPrcmtTenderStatusDAO().save(tenderStatus);
			
			complaint.getPrcmtTenderBid().getPrcmtTenderRequest().setPrcmtTenderStatus(tenderStatus);
			DAOFactory.getFactory().getPrcmtTenderRequestDAO().save(complaint.getPrcmtTenderBid().getPrcmtTenderRequest());
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
