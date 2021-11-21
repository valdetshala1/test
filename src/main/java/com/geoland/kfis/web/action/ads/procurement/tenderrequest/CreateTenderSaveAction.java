package com.geoland.kfis.web.action.ads.procurement.tenderrequest;

import java.io.File;
import java.io.FileInputStream;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class CreateTenderSaveAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Oct 8, 2014 , 3:12:51 PM
 */
public class CreateTenderSaveAction extends TenderRequestBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 7592920604547634575L;
	
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
		tenderStatus.setCreatedDate(new Date());
		tenderStatus.setEmployee(employee);
		tenderStatus.setPrcmtTenderRequest(tenderRequest);
		
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
			byte[] bFile = new byte[(int) file.length()];
			try {
				FileInputStream fileInputStream = new FileInputStream(file);
				fileInputStream.read(bFile);
				
				fileInputStream.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
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
