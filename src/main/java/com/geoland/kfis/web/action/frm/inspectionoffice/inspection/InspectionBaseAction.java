package com.geoland.kfis.web.action.frm.inspectionoffice.inspection;

import java.util.List;

import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.Inspection;
import com.geoland.kfis.model.Inspector;
import com.geoland.kfis.persistence.hibernate.usertypes.Inspectioncharge;
import com.geoland.kfis.persistence.hibernate.usertypes.Inspectiontype;
import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class InspectionBaseAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Feb 26, 2015 , 11:31:22 AM
 */
public class InspectionBaseAction extends BaseActionSupport{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The inspection id. */
	protected Long inspectionId;
	
	/** The inspection. */
	protected Inspection inspection;
	
	/** The inspector list. */
	protected List<Employee> inspectorList;
	
	/** The inspector id list. */
	protected List<Long> inspectorIdList;
	
	/** The exists inspektors. */
	protected List<Inspector> existsInspektors;
	
	/** The doc names. */
	protected String docNames;
	
	/** The doc exts. */
	protected String docExts;
	
	/** The parent id. */
	protected Long parentId;
	
	/** The ref no. */
	protected String refNo;
	
	/** The insp type list. */
	protected Inspectiontype[] inspTypeList=Inspectiontype.values();
	
	/** The insp control. */
	protected Inspectiontype inspControl=Inspectiontype.CONTROL;
	
	/** The insp charge list. */
	protected Inspectioncharge[] inspChargeList=Inspectioncharge.values();
	
	
	/**
	 * Gets the inspection id.
	 *
	 * @return the inspection id
	 */
	public Long getInspectionId() {
		return inspectionId;
	}
	
	/**
	 * Sets the inspection id.
	 *
	 * @param inspectionId the new inspection id
	 */
	public void setInspectionId(Long inspectionId) {
		this.inspectionId = inspectionId;
	}
	
	/**
	 * Gets the inspection.
	 *
	 * @return the inspection
	 */
	public Inspection getInspection() {
		return inspection;
	}
	
	/**
	 * Sets the inspection.
	 *
	 * @param inspection the new inspection
	 */
	public void setInspection(Inspection inspection) {
		this.inspection = inspection;
	}
	
	/**
	 * Gets the inspector list.
	 *
	 * @return the inspector list
	 */
	public List<Employee> getInspectorList() {
		return inspectorList;
	}
	
	/**
	 * Sets the inspector list.
	 *
	 * @param inspectorList the new inspector list
	 */
	public void setInspectorList(List<Employee> inspectorList) {
		this.inspectorList = inspectorList;
	}
	
	/**
	 * Gets the inspector id list.
	 *
	 * @return the inspector id list
	 */
	public List<Long> getInspectorIdList() {
		return inspectorIdList;
	}
	
	/**
	 * Sets the inspector id list.
	 *
	 * @param inspectorIdList the new inspector id list
	 */
	public void setInspectorIdList(List<Long> inspectorIdList) {
		this.inspectorIdList = inspectorIdList;
	}
	
	/**
	 * Gets the exists inspektors.
	 *
	 * @return the exists inspektors
	 */
	public List<Inspector> getExistsInspektors() {
		return existsInspektors;
	}
	
	/**
	 * Sets the exists inspektors.
	 *
	 * @param existsInspektors the new exists inspektors
	 */
	public void setExistsInspektors(List<Inspector> existsInspektors) {
		this.existsInspektors = existsInspektors;
	}
	
	/**
	 * Gets the doc names.
	 *
	 * @return the doc names
	 */
	public String getDocNames() {
		return docNames;
	}
	
	/**
	 * Sets the doc names.
	 *
	 * @param docNames the new doc names
	 */
	public void setDocNames(String docNames) {
		this.docNames = docNames;
	}
	
	/**
	 * Gets the doc exts.
	 *
	 * @return the doc exts
	 */
	public String getDocExts() {
		return docExts;
	}
	
	/**
	 * Sets the doc exts.
	 *
	 * @param docExts the new doc exts
	 */
	public void setDocExts(String docExts) {
		this.docExts = docExts;
	}
	
	/**
	 * Gets the insp type list.
	 *
	 * @return the insp type list
	 */
	public Inspectiontype[] getInspTypeList() {
		return inspTypeList;
	}
	
	/**
	 * Sets the insp type list.
	 *
	 * @param inspTypeList the new insp type list
	 */
	public void setInspTypeList(Inspectiontype[] inspTypeList) {
		this.inspTypeList = inspTypeList;
	}
	
	/**
	 * Gets the parent id.
	 *
	 * @return the parent id
	 */
	public Long getParentId() {
		return parentId;
	}
	
	/**
	 * Sets the parent id.
	 *
	 * @param parentId the new parent id
	 */
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}
	
	/**
	 * Gets the ref no.
	 *
	 * @return the ref no
	 */
	public String getRefNo() {
		return refNo;
	}
	
	/**
	 * Sets the ref no.
	 *
	 * @param refNo the new ref no
	 */
	public void setRefNo(String refNo) {
		this.refNo = refNo;
	}
	
	/**
	 * Gets the insp control.
	 *
	 * @return the insp control
	 */
	public Inspectiontype getInspControl() {
		return inspControl;
	}
	
	/**
	 * Sets the insp control.
	 *
	 * @param inspControl the new insp control
	 */
	public void setInspControl(Inspectiontype inspControl) {
		this.inspControl = inspControl;
	}
	
	/**
	 * Gets the insp charge list.
	 *
	 * @return the insp charge list
	 */
	public Inspectioncharge[] getInspChargeList() {
		return inspChargeList;
	}
	
	/**
	 * Sets the insp charge list.
	 *
	 * @param inspChargeList the new insp charge list
	 */
	public void setInspChargeList(Inspectioncharge[] inspChargeList) {
		this.inspChargeList = inspChargeList;
	}

	


}
