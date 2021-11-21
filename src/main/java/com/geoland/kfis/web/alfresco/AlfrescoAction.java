package com.geoland.kfis.web.alfresco;

import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class AlfrescoAction.
 *
 * @author Adelina Gashi
 */
public class AlfrescoAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The tabel name. */
	private String tabelName;
	
	/** The entity id. */
	private String entityId;
	
	/**
	 * Docs page.
	 *
	 * @return the string
	 */
	public String docs_page(){
		return "docs_page";
	}

	/**
	 * Gets the tabel name.
	 *
	 * @return the tabel name
	 */
	public String getTabelName() {
		return tabelName;
	}

	/**
	 * Sets the tabel name.
	 *
	 * @param tabelName the new tabel name
	 */
	public void setTabelName(String tabelName) {
		this.tabelName = tabelName;
	}

	/**
	 * Gets the entity id.
	 *
	 * @return the entity id
	 */
	public String getEntityId() {
		return entityId;
	}

	/**
	 * Sets the entity id.
	 *
	 * @param entityId the new entity id
	 */
	public void setEntityId(String entityId) {
		this.entityId = entityId;
	}

	
}
