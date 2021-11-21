package com.geoland.kfis.web.action.audit;

import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class AuditAction.
 *
 * @author Ardiana Demolli, Geo&Land
 * Jan 13, 2016, 9:41:29 AM
 * v2.0
 */
public class AuditAction extends BaseActionSupport{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The entity name. */
	private String entity_name;
	
	/** The entity id. */
	private Long entity_id;
	
	/**
	 * Gets the entity name.
	 *
	 * @return the entity name
	 */
	public String getEntity_name() {
		return entity_name;
	}
	
	/**
	 * Sets the entity name.
	 *
	 * @param entity_name the new entity name
	 */
	public void setEntity_name(String entity_name) {
		this.entity_name = entity_name;
	}
	
	/**
	 * Gets the entity id.
	 *
	 * @return the entity id
	 */
	public Long getEntity_id() {
		return entity_id;
	}
	
	/**
	 * Sets the entity id.
	 *
	 * @param entity_id the new entity id
	 */
	public void setEntity_id(Long entity_id) {
		this.entity_id = entity_id;
	}
	
	/**
	 * Audit data.
	 *
	 * @return the string
	 */
	public String auditData(){
		return "auditData";
	}
	
	/**
	 * Audit data geom.
	 *
	 * @return the string
	 */
	public String auditDataGeom() {
		return "auditDataGeom";
	}
}
