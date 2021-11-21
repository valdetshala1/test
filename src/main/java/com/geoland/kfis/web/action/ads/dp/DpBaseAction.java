package com.geoland.kfis.web.action.ads.dp;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import com.geoland.kfis.model.DpMngmt;
import com.geoland.kfis.model.DpMngmtAttach;
import com.geoland.kfis.model.Organisation;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class DpBaseAction.
 */
public class DpBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 3890343548005476798L;
	
	/** The dp id. */
	protected Long dpId;
	
	/** The doc owner id. */
	protected Long docOwnerId;
	
	/** The doc owner. */
	protected Person docOwner;
	
	/** The from dpt id. */
	protected Long fromDptId;
	
	/** The to dpt id. */
	protected Long toDptId;
	
	/** The from dtp. */
	protected Organisation fromDtp;
	
	/** The to dtp. */
	protected Organisation toDtp;
	
	/** The dp. */
	protected DpMngmt dp;
	
	/** The dp attach. */
	protected DpMngmtAttach dpAttach;
	
	/** The file upload. */
	protected List<File> fileUpload = new ArrayList<File>();
	
	/** The file upload content type. */
	protected List<String> fileUploadContentType = new ArrayList<String>();
	
	/** The file upload file name. */
	protected List<String> fileUploadFileName = new ArrayList<String>();	
	
	/** The doc id. */
	protected Long docId;
	
	/** The doc. */
	protected DpMngmtAttach doc;
	
	/**
	 * Sets the dp id.
	 *
	 * @param dpId the new dp id
	 */
	public void setDpId(Long dpId) {
		this.dpId = dpId;
	}
	
	/**
	 * Gets the dp id.
	 *
	 * @return the dp id
	 */
	public Long getDpId() {
		return dpId;
	}
	
	/**
	 * Gets the dp.
	 *
	 * @return the dp
	 */
	public DpMngmt getDp() {
		return dp;
	}
	
	/**
	 * Sets the dp.
	 *
	 * @param dp the new dp
	 */
	public void setDp(DpMngmt dp) {
		this.dp = dp;
	}
	
	/**
	 * Gets the dp attach.
	 *
	 * @return the dp attach
	 */
	public DpMngmtAttach getDpAttach() {
		return dpAttach;
	}
	
	/**
	 * Sets the dp attach.
	 *
	 * @param dpAttach the new dp attach
	 */
	public void setDpAttach(DpMngmtAttach dpAttach) {
		this.dpAttach = dpAttach;
	}

	/**
	 * Gets the file upload.
	 *
	 * @return the file upload
	 */
	public List<File> getFileUpload() {
		return fileUpload;
	}

	/**
	 * Sets the file upload.
	 *
	 * @param fileUpload the new file upload
	 */
	public void setFileUpload(List<File> fileUpload) {
		this.fileUpload = fileUpload;
	}

	/**
	 * Gets the file upload content type.
	 *
	 * @return the file upload content type
	 */
	public List<String> getFileUploadContentType() {
		return fileUploadContentType;
	}

	/**
	 * Sets the file upload content type.
	 *
	 * @param fileUploadContentType the new file upload content type
	 */
	public void setFileUploadContentType(List<String> fileUploadContentType) {
		this.fileUploadContentType = fileUploadContentType;
	}

	/**
	 * Gets the file upload file name.
	 *
	 * @return the file upload file name
	 */
	public List<String> getFileUploadFileName() {
		return fileUploadFileName;
	}

	/**
	 * Sets the file upload file name.
	 *
	 * @param fileUploadFileName the new file upload file name
	 */
	public void setFileUploadFileName(List<String> fileUploadFileName) {
		this.fileUploadFileName = fileUploadFileName;
	}

	/**
	 * Gets the doc owner id.
	 *
	 * @return the doc owner id
	 */
	public Long getDocOwnerId() {
		return docOwnerId;
	}

	/**
	 * Sets the doc owner id.
	 *
	 * @param docOwnerId the new doc owner id
	 */
	public void setDocOwnerId(Long docOwnerId) {
		this.docOwnerId = docOwnerId;
	}

	/**
	 * Gets the from dpt id.
	 *
	 * @return the from dpt id
	 */
	public Long getFromDptId() {
		return fromDptId;
	}

	/**
	 * Sets the from dpt id.
	 *
	 * @param fromDptId the new from dpt id
	 */
	public void setFromDptId(Long fromDptId) {
		this.fromDptId = fromDptId;
	}

	/**
	 * Gets the to dpt id.
	 *
	 * @return the to dpt id
	 */
	public Long getToDptId() {
		return toDptId;
	}

	/**
	 * Sets the to dpt id.
	 *
	 * @param toDptId the new to dpt id
	 */
	public void setToDptId(Long toDptId) {
		this.toDptId = toDptId;
	}

	/**
	 * Gets the from dtp.
	 *
	 * @return the from dtp
	 */
	public Organisation getFromDtp() {
		return fromDtp;
	}

	/**
	 * Sets the from dtp.
	 *
	 * @param fromDtp the new from dtp
	 */
	public void setFromDtp(Organisation fromDtp) {
		this.fromDtp = fromDtp;
	}

	/**
	 * Gets the to dtp.
	 *
	 * @return the to dtp
	 */
	public Organisation getToDtp() {
		return toDtp;
	}

	/**
	 * Sets the to dtp.
	 *
	 * @param toDtp the new to dtp
	 */
	public void setToDtp(Organisation toDtp) {
		this.toDtp = toDtp;
	}

	/**
	 * Gets the doc owner.
	 *
	 * @return the doc owner
	 */
	public Person getDocOwner() {
		return docOwner;
	}

	/**
	 * Sets the doc owner.
	 *
	 * @param docOwner the new doc owner
	 */
	public void setDocOwner(Person docOwner) {
		this.docOwner = docOwner;
	}

	/**
	 * Gets the doc id.
	 *
	 * @return the docId
	 */
	public Long getDocId() {
		return docId;
	}

	/**
	 * Sets the doc id.
	 *
	 * @param docId the docId to set
	 */
	public void setDocId(Long docId) {
		this.docId = docId;
	}

	/**
	 * Gets the doc.
	 *
	 * @return the doc
	 */
	public DpMngmtAttach getDoc() {
		return doc;
	}

	/**
	 * Sets the doc.
	 *
	 * @param doc the doc to set
	 */
	public void setDoc(DpMngmtAttach doc) {
		this.doc = doc;
	}

	
}
