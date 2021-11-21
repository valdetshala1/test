/**
 * 
 */
package com.geoland.kfis.web.action.ads.procurement.complaint;

import java.io.InputStream;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.PrcmtTenderComplaint;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class ComplaintAttachAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 4:16:35 PM, Nov 18, 2014
 */
public class ComplaintAttachAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -3942531261334747541L;

	/** The complaint id. */
	private Long complaintId;
	
	/** The complaint. */
	private PrcmtTenderComplaint complaint;
	
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
		if(complaintId!=null){
			complaint=DAOFactory.getFactory().getPrcmtTenderComplaintDAO().get(complaintId);
			if(complaint==null || complaint.getDoc()==null)
				addFieldError("", "");
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
		 setName(complaint.getDocName());
		StringTokenizer st=new StringTokenizer(complaint.getDocType(),".");
		String s=st.nextToken();
		setDescription("application/"+s);
		setContentType("application/"+s);
		setContentDisposition("inline; filename=" + complaint.getDocName());
		setInputStream(generateAttachment(complaint.getDoc(),complaint.getDocName(), complaint.getDocType()));
		  
		return SUCCESS;
	}
	
	/**
	 * Gets the complaint id.
	 *
	 * @return the complaintId
	 */
	public Long getComplaintId() {
		return complaintId;
	}
	
	/**
	 * Sets the complaint id.
	 *
	 * @param complaintId the complaintId to set
	 */
	public void setComplaintId(Long complaintId) {
		this.complaintId = complaintId;
	}
	
	/**
	 * Gets the complaint.
	 *
	 * @return the complaint
	 */
	public PrcmtTenderComplaint getComplaint() {
		return complaint;
	}
	
	/**
	 * Sets the complaint.
	 *
	 * @param complaint the complaint to set
	 */
	public void setComplaint(PrcmtTenderComplaint complaint) {
		this.complaint = complaint;
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
