/**
 * 
 */
package com.geoland.kfis.web.action.ads.procurement.complaint;

import java.io.File;

import com.geoland.kfis.model.PrcmtTenderComplaint;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class TenderComplaintBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 10:29:20 AM, Nov 18, 2014
 */
public class TenderComplaintBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -4916263557724386030L;

	/** The complaint id. */
	protected Long complaintId;
	
	/** The complaint. */
	protected PrcmtTenderComplaint complaint;
	
	/** The file. */
	protected File file;
	
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
	 * Gets the file.
	 *
	 * @return the file
	 */
	public File getFile() {
		return file;
	}
	
	/**
	 * Sets the file.
	 *
	 * @param file the file to set
	 */
	public void setFile(File file) {
		this.file = file;
	}
	
	
}
