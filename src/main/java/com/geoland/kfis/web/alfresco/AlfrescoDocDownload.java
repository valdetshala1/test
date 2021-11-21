package com.geoland.kfis.web.alfresco;

import java.io.InputStream;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class AlfrescoDocDownload.
 *
 * @author Adelina Gashi
 */
public class AlfrescoDocDownload extends BaseActionSupport{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 2261757390434201526L;
	
	/** The input stream. */
	protected InputStream inputStream;
	
	/** The name. */
	private String name; //holds name of downloaded file
    
    /** The description. */
    private String description; //holds the content type of the downloaded file
    
    /** The content disposition. */
    private String contentDisposition;
	
	/** The content type. */
	private String contentType;
	
	/** The doc uid. */
	protected String  docUid;
	
	/** The doc content. */
	protected byte[] docContent;
	
	/** The doc type. */
	protected String docType;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		boolean alfrescoError=false;
		
		if(!StringUtils.isEmpty(name)){
			String[] nameandtype=name.split("\\.");
			name=nameandtype[0];
			docType=nameandtype[1];
		}else{
			addActionError("");
		}
		if(StringUtils.isEmpty(docUid)){
			addActionError("");
		}else{
			getTicket();
			if(ticket!=null){
				docContent=getContentFromAlfresco(docUid,ticket);
			}else{
				alfrescoError=true;
				addActionError("");
			}
		}
		if(docContent==null){
			addActionError("");
		}
		if(StringUtils.isEmpty(docType)){
			docType="pdf";
		}
		
		HttpServletResponse response= ServletActionContext.getResponse();
		if(alfrescoError){
			response.addHeader("alfrescoError", "true");
		}
		if(hasFieldErrors() || hasActionErrors()){
			response.addHeader("errors_exist", "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		setDescription("application/"+docType);
		setContentType("application/"+docType);
		setContentDisposition("attachment; filename="+name+"."+docType);
		setInputStream( generateAttachment(docContent, name, "."+docType));
	 return SUCCESS;
	}

	/**
	 * Gets the input stream.
	 *
	 * @return the input stream
	 */
	public InputStream getInputStream() {
		return inputStream;
	}

	/**
	 * Sets the input stream.
	 *
	 * @param inputStream the new input stream
	 */
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
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
	 * @param name the new name
	 */
	public void setName(String name) {
		this.name = name;
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
	 * @param description the new description
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * Gets the content disposition.
	 *
	 * @return the content disposition
	 */
	public String getContentDisposition() {
		return contentDisposition;
	}

	/**
	 * Sets the content disposition.
	 *
	 * @param contentDisposition the new content disposition
	 */
	public void setContentDisposition(String contentDisposition) {
		this.contentDisposition = contentDisposition;
	}

	/**
	 * Gets the content type.
	 *
	 * @return the content type
	 */
	public String getContentType() {
		return contentType;
	}

	/**
	 * Sets the content type.
	 *
	 * @param contentType the new content type
	 */
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	/**
	 * Gets the doc uid.
	 *
	 * @return the doc uid
	 */
	public String getDocUid() {
		return docUid;
	}

	/**
	 * Sets the doc uid.
	 *
	 * @param docUid the new doc uid
	 */
	public void setDocUid(String docUid) {
		this.docUid = docUid;
	}

	/**
	 * Gets the doc type.
	 *
	 * @return the doc type
	 */
	public String getDocType() {
		return docType;
	}

	/**
	 * Sets the doc type.
	 *
	 * @param docType the new doc type
	 */
	public void setDocType(String docType) {
		this.docType = docType;
	}
	
	
	

}
