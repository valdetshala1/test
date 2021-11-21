package com.geoland.kfis.web.action.affref;

import com.geoland.kfis.model.AffRefProjects;
import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class AffRefProjectsBaseAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 2.0
 * @created Nov 29, 2017 , 11:50:29 AM
 */
public class AffRefProjectsBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The affrefproject id. */
	protected Long affrefprojectId;
	
	/** The doc names. */
	protected String docNames;
	
	/** The doc exts. */
	protected String docExts;
	
	/** The parent id. */
	protected Long parentId;
	
	/** The ref. */
	protected AffRefProjects ref;
	
	/**
	 * Gets the ref.
	 *
	 * @return the ref
	 */
	public AffRefProjects getRef() {
		return ref;
	}
	
	/**
	 * Sets the ref.
	 *
	 * @param ref the new ref
	 */
	public void setRef(AffRefProjects ref) {
		this.ref = ref;
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
	
	/** The aff ref projects. */
	protected AffRefProjects affRefProjects;
	
	/**
	 * Gets the affrefproject id.
	 *
	 * @return the affrefproject id
	 */
	public Long getAffrefprojectId() {
		return affrefprojectId;
	}
	
	/**
	 * Sets the affrefproject id.
	 *
	 * @param affrefprojectId the new affrefproject id
	 */
	public void setAffrefprojectId(Long affrefprojectId) {
		this.affrefprojectId = affrefprojectId;
	}
	
	/**
	 * Gets the aff ref projects.
	 *
	 * @return the aff ref projects
	 */
	public AffRefProjects getAffRefProjects() {
		return affRefProjects;
	}
	
	/**
	 * Sets the aff ref projects.
	 *
	 * @param affRefProjects the new aff ref projects
	 */
	public void setAffRefProjects(AffRefProjects affRefProjects) {
		this.affRefProjects = affRefProjects;
	}
	
	
}
