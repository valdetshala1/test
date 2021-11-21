package com.geoland.kfis.web.alfresco;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.KfisGenDocuments;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class UDocDownload.
 *
 * @author Adelina Gashi
 */
public class UDocDownload extends BaseActionSupport{
	
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
	
	/** The uid. */
	protected String  uid;
	
	/** The doc content. */
	protected byte[] docContent;
	
	/** The doc type. */
	protected String docType;
	
	/** The a uid. */
	private String a_uid;
	
	/** The kfis gen docs. */
	private KfisGenDocuments kfisGenDocs;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		boolean alfrescoError=false;
		String query="select * from tkfis_gen_documents where uid ilike '"+uid+"'";
		List<KfisGenDocuments> KfisGenDocumentsList=DAOFactory.getFactory().getKfisGenDocumentsDAO().executeSQLQuery(query);
		if(KfisGenDocumentsList.size()>0){
			 kfisGenDocs=KfisGenDocumentsList.get(0);
			 if(!StringUtils.isEmpty(kfisGenDocs.getUrl())){
				 String barcodeUrl=kfisGenDocs.getUrl();
				 name=barcodeUrl.substring(barcodeUrl.lastIndexOf("=") + 1);
				 String[] nameandtype=name.split("\\.");
				 name=nameandtype[0];
				 docType=nameandtype[1];
			 }
			if(StringUtils.isEmpty(uid)){
				addActionError("");
			}else{
				getTicket();
				if(ticket!=null){
					docContent=getContentFromAlfresco(kfisGenDocs.getAUid(),ticket);
					
//					try {
//						String fpath = "C:/Daten/Development/Projects/kfis/docs/Findings/2020-06-12/xxx.pdf" ;
//						FileUtils.writeByteArrayToFile(new File(fpath), docContent);
//					} catch (IOException e) {
//						e.printStackTrace();
//					}
					
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
		}else{
			addActionError("");
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
	 * Gets the uid.
	 *
	 * @return the uid
	 */
	public String getUid() {
		return uid;
	}

	/**
	 * Sets the uid.
	 *
	 * @param uid the new uid
	 */
	public void setUid(String uid) {
		this.uid = uid;
	}

	/**
	 * Gets the a uid.
	 *
	 * @return the a uid
	 */
	public String getA_uid() {
		return a_uid;
	}

	/**
	 * Sets the a uid.
	 *
	 * @param a_uid the new a uid
	 */
	public void setA_uid(String a_uid) {
		this.a_uid = a_uid;
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
