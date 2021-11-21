/**
 * 
 */
package com.geoland.kfis.web.action.ads.dp;

import java.io.File;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.DpMngmtAttach;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.Constants;


// TODO: Auto-generated Javadoc
/**
 * The Class DpDocEditAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 1:07:25 PM, Apr 27, 2015
 */
public class DpDocEditAction extends DpBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The person. */
	private Person person;
	
	/** The file. */
	private File file;
	
	/** The doc name. */
	private String docName;
	
	/** The doc type. */
	private String docType;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		person=getUser().getPerson();
		if(person==null)
			addActionError("login.user.employee.role.empty");
		
		if(docId!=null)
			doc=DAOFactory.getFactory().getDpMngmtAttachDAO().get(docId);
		else addFieldError("", getMessage(""));
		
		if(file==null)
			addFieldError("file", getMessage("employee.file.content.empty"));
		
		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response=ServletActionContext.getResponse();
			response.addHeader(Constants.ERRORS_EXITS, "true");
		}
		
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		doc.setPersonByUpdatedby(person);
		doc.setUpdated(new Date());
		doc.setDoc(getFileBytes(file));
		doc.setDocName(docName);
		doc.setDocType(docType);
		
		DAOFactory.getFactory().getDpMngmtAttachDAO().save(doc);
		return SUCCESS;
	}

	/**
	 * Gets the person.
	 *
	 * @return the person
	 */
	public Person getPerson() {
		return person;
	}

	/**
	 * Sets the person.
	 *
	 * @param person the person to set
	 */
	public void setPerson(Person person) {
		this.person = person;
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
	 * Gets the doc name.
	 *
	 * @return the docName
	 */
	public String getDocName() {
		return docName;
	}

	/**
	 * Sets the doc name.
	 *
	 * @param docName the docName to set
	 */
	public void setDocName(String docName) {
		this.docName = docName;
	}

	/**
	 * Gets the doc type.
	 *
	 * @return the docType
	 */
	public String getDocType() {
		return docType;
	}

	/**
	 * Sets the doc type.
	 *
	 * @param docType the docType to set
	 */
	public void setDocType(String docType) {
		this.docType = docType;
	}
	
	

}
