/**
 * 
 */
package com.geoland.kfis.web.action.ads.procurement.document;

import java.io.InputStream;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.PrcmtTenderStatusDoc;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class ProcurementDocumentAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 3:40:35 PM, Oct 10, 2014
 */
public class ProcurementDocumentAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -3044855759159126537L;
	
	/** The tender attachment id. */
	protected Long tenderAttachmentId;
	
	/** The attachment. */
	protected PrcmtTenderStatusDoc attachment;
	
	/** The name. */
	private String name; //holds name of downloaded file
    
    /** The input stream. */
    private InputStream inputStream; //holds stream of downloaded file
    
    /** The description. */
    private String description; //holds the content type of the downloaded file
    
    /** The content disposition. */
    private String contentDisposition;
	
	/** The content type. */
	private String contentType;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		if(tenderAttachmentId!=null){
			attachment=DAOFactory.getFactory().getPrcmtTenderStatusDocDAO().get(tenderAttachmentId);
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
        setName(attachment.getDocName());
		StringTokenizer st=new StringTokenizer(attachment.getDocType(),".");
		String s=st.nextToken();
		setDescription("application/"+s);
		setContentType("application/"+s);
		setContentDisposition("inline; filename=" + attachment.getDocName());
		setInputStream(generateAttachment(attachment.getDoc(),attachment.getDocName(), attachment.getDocType()));
		  
		return SUCCESS;
	}
	
	/**
	 * Gets the tender attachment id.
	 *
	 * @return the tenderAttachmentId
	 */
	public Long getTenderAttachmentId() {
		return tenderAttachmentId;
	}
	
	/**
	 * Sets the tender attachment id.
	 *
	 * @param tenderAttachmentId the tenderAttachmentId to set
	 */
	public void setTenderAttachmentId(Long tenderAttachmentId) {
		this.tenderAttachmentId = tenderAttachmentId;
	}

	/**
	 * Gets the attachment.
	 *
	 * @return the attachment
	 */
	public PrcmtTenderStatusDoc getAttachment() {
		return attachment;
	}

	/**
	 * Sets the attachment.
	 *
	 * @param attachment the attachment to set
	 */
	public void setAttachment(PrcmtTenderStatusDoc attachment) {
		this.attachment = attachment;
	}

	/**
	 * Gets the serialversionuid.
	 *
	 * @return the serialversionuid
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	/**
	 * Gets the name.
	 *
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * Sets the name.
	 *
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * Gets the input stream.
	 *
	 * @return the inputStream
	 */
	public InputStream getInputStream() {
		return inputStream;
	}

	/**
	 * Sets the input stream.
	 *
	 * @param inputStream the inputStream to set
	 */
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	/**
	 * Gets the description.
	 *
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * Sets the description.
	 *
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * Gets the content disposition.
	 *
	 * @return the contentDisposition
	 */
	public String getContentDisposition() {
		return contentDisposition;
	}

	/**
	 * Sets the content disposition.
	 *
	 * @param contentDisposition the contentDisposition to set
	 */
	public void setContentDisposition(String contentDisposition) {
		this.contentDisposition = contentDisposition;
	}

	/**
	 * Gets the content type.
	 *
	 * @return the contentType
	 */
	public String getContentType() {
		return contentType;
	}

	/**
	 * Sets the content type.
	 *
	 * @param contentType the contentType to set
	 */
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	
	
}
