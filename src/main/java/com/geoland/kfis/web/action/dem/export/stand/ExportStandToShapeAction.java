/**
 * 
 */
package com.geoland.kfis.web.action.dem.export.stand;

import java.io.File;
import java.io.InputStream;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class ExportStandToShapeAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Jan 18, 2016, 9:42:35 AM
 */
public class ExportStandToShapeAction extends ExportStandBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 8492165647223401738L;
	
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
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		File file = exportDataToShapefile(HibSessionFactory.getSessionFactory().getCurrentSession(),regionId,muId);
		String path = path(file);
		String fName = path+"//"+fileName(file.getName());
		String files[][] = {{fName+".shp","export.shp"},{fName+".shx","export.shx"},{fName+".dbf","export.dbf"},{fName+".shx","export.fix"},{fName+".dbf","export.prj"}};
		byte bytes[]=createZipByteArray(files);
		
		setName(fName);
		setDescription("application/zip");
		setContentType("application/zip");
		setContentDisposition("inline; filename=export_to_shape.zip");
		setInputStream(generateAttachment(bytes, fileName(file.getName()), "zip"));
		return SUCCESS;
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
