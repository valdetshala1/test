package com.geoland.kfis.web.action.hrm.employee.document;

import java.io.File;

import com.geoland.kfis.model.EmployeeDocument;
import com.geoland.kfis.persistence.hibernate.usertypes.Document;
import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class DocumentBaseAction.
 *
 * @author ADELINA GASHI, GEO&LAND
 * @created May 22, 2014 10:19:37 AM
 * @Version 1.0
 */
public class DocumentBaseAction  extends BaseActionSupport {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The document id. */
	protected Long documentId;
	
	/** The employee document. */
	protected EmployeeDocument employeeDocument;
	
	/** The file document. */
	protected File fileDocument;
	
	/** The document type list. */
	protected Document[] documentTypeList=Document.values();
	
	/**
	 * Gets the document id.
	 *
	 * @return the document id
	 */
	public Long getDocumentId() {
		return documentId;
	}
	
	/**
	 * Sets the document id.
	 *
	 * @param documentId the new document id
	 */
	public void setDocumentId(Long documentId) {
		this.documentId = documentId;
	}
	
	/**
	 * Gets the employee document.
	 *
	 * @return the employee document
	 */
	public EmployeeDocument getEmployeeDocument() {
		return employeeDocument;
	}
	
	/**
	 * Sets the employee document.
	 *
	 * @param employeeDocument the new employee document
	 */
	public void setEmployeeDocument(EmployeeDocument employeeDocument) {
		this.employeeDocument = employeeDocument;
	}
	
	/**
	 * Gets the document type list.
	 *
	 * @return the document type list
	 */
	public Document[] getDocumentTypeList() {
		return documentTypeList;
	}
	
	/**
	 * Sets the document type list.
	 *
	 * @param documentTypeList the new document type list
	 */
	public void setDocumentTypeList(Document[] documentTypeList) {
		this.documentTypeList = documentTypeList;
	}
	
	/**
	 * Gets the file document.
	 *
	 * @return the file document
	 */
	public File getFileDocument() {
		return fileDocument;
	}
	
	/**
	 * Sets the file document.
	 *
	 * @param fileDocument the new file document
	 */
	public void setFileDocument(File fileDocument) {
		this.fileDocument = fileDocument;
	}

	
	
}
