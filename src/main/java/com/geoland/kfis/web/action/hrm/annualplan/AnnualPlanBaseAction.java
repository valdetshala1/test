package com.geoland.kfis.web.action.hrm.annualplan;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import com.geoland.kfis.model.HrmAnnPlanEmployee;
import com.geoland.kfis.model.HrmAnnualPlan;
import com.geoland.kfis.model.HrmAnnualPlanDoc;
import com.geoland.kfis.model.HrmAnnualPlanStatus;
import com.geoland.kfis.persistence.hibernate.usertypes.Hrmannplanstatus;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class AnnualPlanBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 9:57:17 AM, Jun 2, 2015
 */
public class AnnualPlanBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -6531603963035121130L;

	/** The plan id. */
	protected Long planId;
	
	/** The plan. */
	protected HrmAnnualPlan plan;
	
	/** The status. */
	protected HrmAnnualPlanStatus status;
	
	/** The status list. */
	protected Hrmannplanstatus statusList[]=Hrmannplanstatus.values();
	
	/** The doc. */
	protected HrmAnnualPlanDoc doc;
	
	/** The file upload. */
	protected List<File> fileUpload = new ArrayList<File>();
	
	/** The file upload content type. */
	protected List<String> fileUploadContentType = new ArrayList<String>();
	
	/** The file upload file name. */
	protected List<String> fileUploadFileName = new ArrayList<String>();	
	
	/** The employee id list. */
	protected List<Long> employeeIdList;
	
	/** The old employee list. */
	protected List<HrmAnnPlanEmployee> oldEmployeeList;
	
	/**
	 * Check old.
	 *
	 * @param old the old
	 * @param newList the new list
	 * @return true, if successful
	 */
	protected boolean checkOld(HrmAnnPlanEmployee old,List<Long> newList){
		for(Long n:newList){
			if(n.equals(old.getEmployee().getId()))
				return true;
		}
		return false;
	}
	
	/**
	 * Check new.
	 *
	 * @param newemp the newemp
	 * @param oldList the old list
	 * @return true, if successful
	 */
	protected boolean checkNew(Long newemp,List<HrmAnnPlanEmployee> oldList){
		for(HrmAnnPlanEmployee old:oldList){
			if(newemp.equals(old.getEmployee().getId()))
				return true;
		}
		return false;
	}
	
	
	/**
	 * Gets the plan id.
	 *
	 * @return the planId
	 */
	public Long getPlanId() {
		return planId;
	}
	
	/**
	 * Sets the plan id.
	 *
	 * @param planId the planId to set
	 */
	public void setPlanId(Long planId) {
		this.planId = planId;
	}
	
	/**
	 * Gets the plan.
	 *
	 * @return the plan
	 */
	public HrmAnnualPlan getPlan() {
		return plan;
	}
	
	/**
	 * Sets the plan.
	 *
	 * @param plan the plan to set
	 */
	public void setPlan(HrmAnnualPlan plan) {
		this.plan = plan;
	}
	
	/**
	 * Gets the status list.
	 *
	 * @return the statusList
	 */
	public Hrmannplanstatus[] getStatusList() {
		return statusList;
	}
	
	/**
	 * Sets the status list.
	 *
	 * @param statusList the statusList to set
	 */
	public void setStatusList(Hrmannplanstatus[] statusList) {
		this.statusList = statusList;
	}
	
	/**
	 * Gets the status.
	 *
	 * @return the status
	 */
	public HrmAnnualPlanStatus getStatus() {
		return status;
	}
	
	/**
	 * Sets the status.
	 *
	 * @param status the status to set
	 */
	public void setStatus(HrmAnnualPlanStatus status) {
		this.status = status;
	}
	
	/**
	 * Gets the doc.
	 *
	 * @return the doc
	 */
	public HrmAnnualPlanDoc getDoc() {
		return doc;
	}
	
	/**
	 * Sets the doc.
	 *
	 * @param doc the doc to set
	 */
	public void setDoc(HrmAnnualPlanDoc doc) {
		this.doc = doc;
	}
	
	/**
	 * Gets the file upload.
	 *
	 * @return the fileUpload
	 */
	public List<File> getFileUpload() {
		return fileUpload;
	}
	
	/**
	 * Sets the file upload.
	 *
	 * @param fileUpload the fileUpload to set
	 */
	public void setFileUpload(List<File> fileUpload) {
		this.fileUpload = fileUpload;
	}
	
	/**
	 * Gets the file upload content type.
	 *
	 * @return the fileUploadContentType
	 */
	public List<String> getFileUploadContentType() {
		return fileUploadContentType;
	}
	
	/**
	 * Sets the file upload content type.
	 *
	 * @param fileUploadContentType the fileUploadContentType to set
	 */
	public void setFileUploadContentType(List<String> fileUploadContentType) {
		this.fileUploadContentType = fileUploadContentType;
	}
	
	/**
	 * Gets the file upload file name.
	 *
	 * @return the fileUploadFileName
	 */
	public List<String> getFileUploadFileName() {
		return fileUploadFileName;
	}
	
	/**
	 * Sets the file upload file name.
	 *
	 * @param fileUploadFileName the fileUploadFileName to set
	 */
	public void setFileUploadFileName(List<String> fileUploadFileName) {
		this.fileUploadFileName = fileUploadFileName;
	}
	
	/**
	 * Gets the employee id list.
	 *
	 * @return the employeeIdList
	 */
	public List<Long> getEmployeeIdList() {
		return employeeIdList;
	}
	
	/**
	 * Sets the employee id list.
	 *
	 * @param employeeIdList the employeeIdList to set
	 */
	public void setEmployeeIdList(List<Long> employeeIdList) {
		this.employeeIdList = employeeIdList;
	}
	
	/**
	 * Gets the old employee list.
	 *
	 * @return the oldEmployeeList
	 */
	public List<HrmAnnPlanEmployee> getOldEmployeeList() {
		return oldEmployeeList;
	}
	
	/**
	 * Sets the old employee list.
	 *
	 * @param oldEmployeeList the oldEmployeeList to set
	 */
	public void setOldEmployeeList(List<HrmAnnPlanEmployee> oldEmployeeList) {
		this.oldEmployeeList = oldEmployeeList;
	}
	
}
