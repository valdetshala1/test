/**
 * 
 */
package com.geoland.kfis.web.action.ads.procurement.tenderrequest;

import java.io.File;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.PrcmtTenderStatus;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Protenderstatus;

// TODO: Auto-generated Javadoc
/**
 * The Class CancelTenderSaveAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 1:11:39 PM, Nov 24, 2014
 */
public class CancelTenderSaveAction extends TenderRequestBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -5738055760955984876L;
	
	/** The file. */
	private File file;
	
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
		
		if(file==null)
			addFieldError("file", getMessage("tender.request.file.empty"));
		if(tenderRequest==null ||(tenderRequest!=null && tenderRequest.getId()==null))
			addFieldError("", "");
		
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
		tenderStatus=new PrcmtTenderStatus();
		tenderStatus.setCreatedDate(new Date());
		tenderStatus.setEmployee(employee);
		tenderStatus.setPrcmtTenderRequest(tenderRequest);
		tenderStatus.setStatus(Protenderstatus.CANCELED);
		tenderRequest=DAOFactory.getFactory().getPrcmtTenderRequestDAO().get(tenderRequest.getId());
		tenderRequest.setPrcmtTenderStatus(tenderStatus);
		DAOFactory.getFactory().getPrcmtTenderRequestDAO().save(tenderRequest);
		DAOFactory.getFactory().getPrcmtTenderStatusDAO().save(tenderStatus);
		
		if(file!=null){
			
			attachment.setComment(tenderStatus.getComment());
			attachment.setCreatedDate(new Date());
			attachment.setEmployee(employee);
			attachment.setPrcmtTenderStatus(tenderStatus);
			
			attachment.setDoc(getFileBytes(file));
			
			DAOFactory.getFactory().getPrcmtTenderStatusDocDAO().save(attachment);
		}
		return SUCCESS;
	}

	/**
	 * Gets the file.
	 *
	 * @return the file
	 */
	public File getFile() {
		return file;
	}

	/**
	 * Sets the file.
	 *
	 * @param file the file to set
	 */
	public void setFile(File file) {
		this.file = file;
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
