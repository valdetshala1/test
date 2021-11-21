/**
 * 
 */
package com.geoland.kfis.web.action.ads.procurement.bid;

import java.io.InputStream;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.PrcmtTenderBid;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class TenderBidAttachmentAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 9:49:06 AM, Oct 16, 2014
 */
public class TenderBidAttachmentAction extends BaseActionSupport{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -4663960988226501781L;
	
	/** The bid attachment id. */
	private Long bidAttachmentId;
	
	/** The bid attachment. */
	private PrcmtTenderBid bidAttachment;
	
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
		if(bidAttachmentId!=null){
			bidAttachment=DAOFactory.getFactory().getPrcmtTenderBidDAO().get(bidAttachmentId);
			if(bidAttachment!=null && bidAttachment.getDoc()==null){
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
	public String execute() {
        setName(bidAttachment.getDocName());
		StringTokenizer st=new StringTokenizer(bidAttachment.getDocType(),".");
		String s=st.nextToken();
		setDescription("application/"+s);
		setContentType("application/"+s);
		setContentDisposition("inline; filename=" + bidAttachment.getDocName());
		setInputStream(generateAttachment(bidAttachment.getDoc(),bidAttachment.getDocName(), bidAttachment.getDocType()));
		  
		return SUCCESS;
	}

	/**
	 * Gets the bid attachment id.
	 *
	 * @return the bidAttachmentId
	 */
	public Long getBidAttachmentId() {
		return bidAttachmentId;
	}

	/**
	 * Sets the bid attachment id.
	 *
	 * @param bidAttachmentId the bidAttachmentId to set
	 */
	public void setBidAttachmentId(Long bidAttachmentId) {
		this.bidAttachmentId = bidAttachmentId;
	}

	/**
	 * Gets the bid attachment.
	 *
	 * @return the bidAttachment
	 */
	public PrcmtTenderBid getBidAttachment() {
		return bidAttachment;
	}

	/**
	 * Sets the bid attachment.
	 *
	 * @param bidAttachment the bidAttachment to set
	 */
	public void setBidAttachment(PrcmtTenderBid bidAttachment) {
		this.bidAttachment = bidAttachment;
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
	 * @param name the new name
	 */
	public void setName(String name) {
		this.name = name;
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

}
