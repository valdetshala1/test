/**
 * 
 */
package com.geoland.kfis.web.action.mer.strategy.refsubproject;

import com.geoland.kfis.model.MerRefSubProject;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class RefSubProjectBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 4:01:24 PM, Mar 27, 2015
 */
public class RefSubProjectBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 7442969961928500133L;

	/** The ref sub project id. */
	protected Long refSubProjectId;
	
	/** The ref sub project. */
	protected MerRefSubProject refSubProject;
	
	/**
	 * Gets the ref sub project id.
	 *
	 * @return the refSubProjectId
	 */
	public Long getRefSubProjectId() {
		return refSubProjectId;
	}
	
	/**
	 * Sets the ref sub project id.
	 *
	 * @param refSubProjectId the refSubProjectId to set
	 */
	public void setRefSubProjectId(Long refSubProjectId) {
		this.refSubProjectId = refSubProjectId;
	}
	
	/**
	 * Gets the ref sub project.
	 *
	 * @return the refSubProject
	 */
	public MerRefSubProject getRefSubProject() {
		return refSubProject;
	}
	
	/**
	 * Sets the ref sub project.
	 *
	 * @param refSubProject the refSubProject to set
	 */
	public void setRefSubProject(MerRefSubProject refSubProject) {
		this.refSubProject = refSubProject;
	}
}
