package com.geoland.kfis.web.action.dem.fiskos;

import java.io.File;

import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class FiskosBaseAction.
 *
 * @author GEO&LAND
 * @created October 2, 2014 10:10:09 AM
 * @Version 1.0
 */
public class FiskosBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The region id. */
	private Long regionId;
	
	/** The management unit id. */
	private Long managementUnitId;
	
	/** The region name. */
	private String regionName;
	
	/** The management unit name. */
	private String managementUnitName;
	
	/** The note. */
	private String note;
	
	/** The datefrom. */
	protected String datefrom;
	
	/** The dateto. */
	protected String dateto;
	
	/** The file upload. */
	private File fileUpload;
	
	/** The file upload content type. */
	private String fileUploadContentType;
	
	/** The file upload file name. */
	private String fileUploadFileName;
    
	/**
	 * Gets the region id.
	 *
	 * @return the region id
	 */
	public Long getRegionId() {
		return regionId;
	}
	
	/**
	 * Sets the region id.
	 *
	 * @param regionId the new region id
	 */
	public void setRegionId(Long regionId) {
		this.regionId = regionId;
	}
	
	/**
	 * Gets the management unit id.
	 *
	 * @return the management unit id
	 */
	public Long getManagementUnitId() {
		return managementUnitId;
	}
	
	/**
	 * Sets the management unit id.
	 *
	 * @param managementUnitId the new management unit id
	 */
	public void setManagementUnitId(Long managementUnitId) {
		this.managementUnitId = managementUnitId;
	}
	
	/**
	 * Gets the region name.
	 *
	 * @return the region name
	 */
	public String getRegionName() {
		return regionName;
	}
	
	/**
	 * Sets the region name.
	 *
	 * @param regionName the new region name
	 */
	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}
	
	/**
	 * Gets the management unit name.
	 *
	 * @return the management unit name
	 */
	public String getManagementUnitName() {
		return managementUnitName;
	}
	
	/**
	 * Sets the management unit name.
	 *
	 * @param managementUnitName the new management unit name
	 */
	public void setManagementUnitName(String managementUnitName) {
		this.managementUnitName = managementUnitName;
	}
	
	/**
	 * Gets the file upload.
	 *
	 * @return the file upload
	 */
	public File getFileUpload() {
		return fileUpload;
	}
	
	/**
	 * Sets the file upload.
	 *
	 * @param fileUpload the new file upload
	 */
	public void setFileUpload(File fileUpload) {
		this.fileUpload = fileUpload;
	}
	
	/**
	 * Gets the file upload content type.
	 *
	 * @return the file upload content type
	 */
	public String getFileUploadContentType() {
		return fileUploadContentType;
	}
	
	/**
	 * Sets the file upload content type.
	 *
	 * @param fileUploadContentType the new file upload content type
	 */
	public void setFileUploadContentType(String fileUploadContentType) {
		this.fileUploadContentType = fileUploadContentType;
	}
	
	/**
	 * Gets the file upload file name.
	 *
	 * @return the file upload file name
	 */
	public String getFileUploadFileName() {
		return fileUploadFileName;
	}
	
	/**
	 * Sets the file upload file name.
	 *
	 * @param fileUploadFileName the new file upload file name
	 */
	public void setFileUploadFileName(String fileUploadFileName) {
		this.fileUploadFileName = fileUploadFileName;
	}
	
	/**
	 * Gets the note.
	 *
	 * @return the note
	 */
	public String getNote() {
		return note;
	}
	
	/**
	 * Sets the note.
	 *
	 * @param note the new note
	 */
	public void setNote(String note) {
		this.note = note;
	}
	
	/**
	 * Gets the datefrom.
	 *
	 * @return the datefrom
	 */
	public String getDatefrom() {
		return datefrom;
	}
	
	/**
	 * Sets the datefrom.
	 *
	 * @param datefrom the new datefrom
	 */
	public void setDatefrom(String datefrom) {
		this.datefrom = datefrom;
	}
	
	/**
	 * Gets the dateto.
	 *
	 * @return the dateto
	 */
	public String getDateto() {
		return dateto;
	}
	
	/**
	 * Sets the dateto.
	 *
	 * @param dateto the new dateto
	 */
	public void setDateto(String dateto) {
		this.dateto = dateto;
	}
    
	
	
}
