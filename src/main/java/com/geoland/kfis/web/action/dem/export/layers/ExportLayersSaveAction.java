package com.geoland.kfis.web.action.dem.export.layers;

import java.io.InputStream;

// TODO: Auto-generated Javadoc
/**
 * The Class ExportLayersSaveAction.
 */
public class ExportLayersSaveAction  extends ExportLayersBaseAction{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
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
	
	/** The doc content. */
	protected byte[] docContent;
	
	/** The doc type. */
	private String docType;
	
	/** The cql flt name. */
	private String cqlFltName;
	
	/** The cql flt value. */
	private String cqlFltValue;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {

		setDescription("application/"+layerFormat);
		setContentType("application/"+layerFormat);
		setContentDisposition("attachment; filename="+layerName+"."+layerFormat);
		docContent=downloadLayers(cqlFltName,cqlFltValue);
		setInputStream( generateAttachment(docContent,layerName, "."+layerFormat));
		return SUCCESS;
	}
	
	



	/**
	 * Gets the cql flt name.
	 *
	 * @return the cql flt name
	 */
	public String getCqlFltName() {
		return cqlFltName;
	}





	/**
	 * Sets the cql flt name.
	 *
	 * @param cqlFltName the new cql flt name
	 */
	public void setCqlFltName(String cqlFltName) {
		this.cqlFltName = cqlFltName;
	}





	/**
	 * Gets the cql flt value.
	 *
	 * @return the cql flt value
	 */
	public String getCqlFltValue() {
		return cqlFltValue;
	}





	/**
	 * Sets the cql flt value.
	 *
	 * @param cqlFltValue the new cql flt value
	 */
	public void setCqlFltValue(String cqlFltValue) {
		this.cqlFltValue = cqlFltValue;
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
	 * Gets the doc content.
	 *
	 * @return the doc content
	 */
	public byte[] getDocContent() {
		return docContent;
	}
	
	/**
	 * Sets the doc content.
	 *
	 * @param docContent the new doc content
	 */
	public void setDocContent(byte[] docContent) {
		this.docContent = docContent;
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
