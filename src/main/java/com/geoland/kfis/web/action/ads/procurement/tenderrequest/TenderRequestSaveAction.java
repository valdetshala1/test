/**
 * 
 */
package com.geoland.kfis.web.action.ads.procurement.tenderrequest;

import java.io.File;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.PrcmtTenderStatus;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Protenderstatus;

// TODO: Auto-generated Javadoc
/**
 * The Class TenderRequestSaveAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 2:18:14 PM, Oct 2, 2014
 */
public class TenderRequestSaveAction extends TenderRequestBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The file att. */
	private File fileAtt;
	
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
		
		if (tenderRequest!=null &&  StringUtils.isEmpty(tenderRequest.getDeclareOfNeeds())){
			addFieldError("tenderRequest.declareOfNeeds", getMessage("tenderRequest.declareOfNeeds.validate"));
		}
		if (tenderRequest!=null &&  StringUtils.isEmpty(tenderRequest.getDesignationOfRequest())){
			addFieldError("tenderRequest.designationOfRequest", getMessage("tenderRequest.designationOfRequest.validate"));
		}
		if(tenderRequest!=null && tenderRequest.getOrganisation().getId()==null)
			addFieldError("tenderRequest.organisation", getMessage("contract.organisation.empty"));
		if(tenderRequest!=null && fileAtt==null)
			addFieldError("attachment", getMessage("tender.request.file.empty"));
		
		if (!getFieldErrors().isEmpty()) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exist", "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		
		tenderStatus=new PrcmtTenderStatus();
		tenderStatus.setCreatedDate(new Date());
		tenderStatus.setEmployee(employee);
		tenderStatus.setPrcmtTenderRequest(tenderRequest);
		tenderStatus.setStatus(Protenderstatus.NEW);
		tenderRequest.setPrcmtTenderStatus(tenderStatus);
		tenderRequest.setPprcNotification(false);
		tenderRequest.setCreatedDate(new Date());
		tenderRequest.setEmployee(employee);
		User user=getUser().getUser();
		tenderRequest.setCurrentUser(user);
		DAOFactory.getFactory().getPrcmtTenderRequestDAO().save(tenderRequest);
		tenderStatus.setCurrentUser(user);
		DAOFactory.getFactory().getPrcmtTenderStatusDAO().save(tenderStatus);
		
		if(fileAtt!=null){
			attachment.setComment(tenderStatus.getComment());
			attachment.setCreatedDate(new Date());
			attachment.setEmployee(employee);
			attachment.setPrcmtTenderStatus(tenderStatus);
		
			attachment.setDoc(getFileBytes(fileAtt));
			attachment.setCurrentUser(user);
			DAOFactory.getFactory().getPrcmtTenderStatusDocDAO().save(attachment);
		}
		
		
		return SUCCESS;
	}
	
	/**
	 * Gets the file att.
	 *
	 * @return the fileAtt
	 */
	public File getFileAtt() {
		return fileAtt;
	}

	/**
	 * Sets the file att.
	 *
	 * @param fileAtt the fileAtt to set
	 */
	public void setFileAtt(File fileAtt) {
		this.fileAtt = fileAtt;
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
