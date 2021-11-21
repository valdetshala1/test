/**
 * 
 */
package com.geoland.kfis.web.action.frm.annualplan.privaterequest;

import java.io.InputStream;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.PrivateRequestDoc;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class PrivateRequestDocGenerator.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 4:37:11 PM, Jan 7, 2015
 */
public class PrivateRequestDocGenerator extends PrivateRequestBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 2261757390434201526L;
	
	/** The attachment id. */
	protected Long attachmentId;
	
	/** The doc stream. */
	protected InputStream docStream;
	
	/** The attachment. */
	protected PrivateRequestDoc attachment;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		if(attachmentId!=null){
			attachment=DAOFactory.getFactory().getPrivateRequestDocDAO().get(attachmentId);
			if(attachment!=null && attachment.getDoc()==null){
				addFieldError("", "");
			}
		}else{
			addFieldError("", "");
		}
		
		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response= ServletActionContext.getResponse();
			response.addHeader("errors_exist", "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		generateAttachment(attachment.getDoc(),attachment.getDocName(), attachment.getDocType());
		 
		return NONE;
	}

	/**
	 * Gets the attachment id.
	 *
	 * @return the attachmentId
	 */
	public Long getAttachmentId() {
		return attachmentId;
	}

	/**
	 * Sets the attachment id.
	 *
	 * @param attachmentId the attachmentId to set
	 */
	public void setAttachmentId(Long attachmentId) {
		this.attachmentId = attachmentId;
	}

	/**
	 * Gets the doc stream.
	 *
	 * @return the docStream
	 */
	public InputStream getDocStream() {
		return docStream;
	}

	/**
	 * Sets the doc stream.
	 *
	 * @param docStream the docStream to set
	 */
	public void setDocStream(InputStream docStream) {
		this.docStream = docStream;
	}

	/**
	 * Gets the attachment.
	 *
	 * @return the attachment
	 */
	public PrivateRequestDoc getAttachment() {
		return attachment;
	}

	/**
	 * Sets the attachment.
	 *
	 * @param attachment the attachment to set
	 */
	public void setAttachment(PrivateRequestDoc attachment) {
		this.attachment = attachment;
	}

}
