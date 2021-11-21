package com.geoland.kfis.web.action.mer.project;

import com.geoland.kfis.model.MerProject;
import com.geoland.kfis.persistence.hibernate.usertypes.Merpillar;
import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class ProjectBaseAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Mar 25, 2015 , 2:23:21 PM
 */
public class ProjectBaseAction extends BaseActionSupport {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The project. */
	protected MerProject project;
	
	/** The project id. */
	protected Long projectId;
	
	/** The proj id. */
	protected Long projId;
	
	/** The merpillars list. */
	protected Merpillar[] merpillarsList=Merpillar.values();
	
	/**
	 * Gets the project.
	 *
	 * @return the project
	 */
	public MerProject getProject() {
		return project;
	}
	
	/**
	 * Sets the project.
	 *
	 * @param project the new project
	 */
	public void setProject(MerProject project) {
		this.project = project;
	}
	
	/**
	 * Gets the project id.
	 *
	 * @return the project id
	 */
	public Long getProjectId() {
		return projectId;
	}
	
	/**
	 * Sets the project id.
	 *
	 * @param projectId the new project id
	 */
	public void setProjectId(Long projectId) {
		this.projectId = projectId;
	}
	
	/**
	 * Gets the merpillars list.
	 *
	 * @return the merpillars list
	 */
	public Merpillar[] getMerpillarsList() {
		return merpillarsList;
	}
	
	/**
	 * Sets the merpillars list.
	 *
	 * @param merpillarsList the new merpillars list
	 */
	public void setMerpillarsList(Merpillar[] merpillarsList) {
		this.merpillarsList = merpillarsList;
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
