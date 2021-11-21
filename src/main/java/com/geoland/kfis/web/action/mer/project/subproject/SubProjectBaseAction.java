package com.geoland.kfis.web.action.mer.project.subproject;

import com.geoland.kfis.model.MerSubProject;
import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class SubProjectBaseAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Mar 25, 2015 , 2:23:21 PM
 */
public class SubProjectBaseAction extends BaseActionSupport {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The subproject. */
	protected MerSubProject subproject;
	
	/** The subproject id. */
	protected Long subprojectId;
	
	/** The proj id. */
	protected Long projId;
	
	/**
	 * Gets the subproject.
	 *
	 * @return the subproject
	 */
	public MerSubProject getSubproject() {
		return subproject;
	}
	
	/**
	 * Sets the subproject.
	 *
	 * @param subproject the new subproject
	 */
	public void setSubproject(MerSubProject subproject) {
		this.subproject = subproject;
	}
	
	/**
	 * Gets the subproject id.
	 *
	 * @return the subproject id
	 */
	public Long getSubprojectId() {
		return subprojectId;
	}
	
	/**
	 * Sets the subproject id.
	 *
	 * @param subprojectId the new subproject id
	 */
	public void setSubprojectId(Long subprojectId) {
		this.subprojectId = subprojectId;
	}
	
	/**
	 * Gets the proj id.
	 *
	 * @return the proj id
	 */
	public Long getProjId() {
		return projId;
	}
	
	/**
	 * Sets the proj id.
	 *
	 * @param projId the new proj id
	 */
	public void setProjId(Long projId) {
		this.projId = projId;
	}
	

	
	

}
