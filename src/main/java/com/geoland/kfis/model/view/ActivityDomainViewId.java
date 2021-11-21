package com.geoland.kfis.model.view;

// Generated Nov 7, 2014 4:40:49 PM by Hibernate Tools 3.4.0.CR1

import javax.persistence.Column;
import javax.persistence.Embeddable;

// TODO: Auto-generated Javadoc
/**
 * ActivityDomainViewId generated by hbm2java.
 */
@Embeddable
public class ActivityDomainViewId implements java.io.Serializable {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The key. */
	private Long key;
	
	/** The code. */
	private String code;
	
	/** The json tree. */
	private String jsonTree;

	/**
	 * Instantiates a new activity domain view id.
	 */
	public ActivityDomainViewId() {
	}

	/**
	 * Instantiates a new activity domain view id.
	 *
	 * @param key the key
	 * @param code the code
	 * @param jsonTree the json tree
	 */
	public ActivityDomainViewId(Long key, String code, String jsonTree) {
		this.key = key;
		this.code = code;
		this.jsonTree = jsonTree;
	}

	/**
	 * Gets the key.
	 *
	 * @return the key
	 */
	@Column(name = "key")
	public Long getKey() {
		return this.key;
	}

	/**
	 * Sets the key.
	 *
	 * @param key the new key
	 */
	public void setKey(Long key) {
		this.key = key;
	}

	/**
	 * Gets the code.
	 *
	 * @return the code
	 */
	@Column(name = "code", length = 5)
	public String getCode() {
		return this.code;
	}

	/**
	 * Sets the code.
	 *
	 * @param code the new code
	 */
	public void setCode(String code) {
		this.code = code;
	}

	/**
	 * Gets the json tree.
	 *
	 * @return the json tree
	 */
	@Column(name = "json_tree")
	public String getJsonTree() {
		return this.jsonTree;
	}

	/**
	 * Sets the json tree.
	 *
	 * @param jsonTree the new json tree
	 */
	public void setJsonTree(String jsonTree) {
		this.jsonTree = jsonTree;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof ActivityDomainViewId))
			return false;
		ActivityDomainViewId castOther = (ActivityDomainViewId) other;

		return ((this.getKey() == castOther.getKey()) || (this.getKey() != null
				&& castOther.getKey() != null && this.getKey().equals(
				castOther.getKey())))
				&& ((this.getCode() == castOther.getCode()) || (this.getCode() != null
						&& castOther.getCode() != null && this.getCode()
						.equals(castOther.getCode())))
				&& ((this.getJsonTree() == castOther.getJsonTree()) || (this
						.getJsonTree() != null
						&& castOther.getJsonTree() != null && this
						.getJsonTree().equals(castOther.getJsonTree())));
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getKey() == null ? 0 : this.getKey().hashCode());
		result = 37 * result
				+ (getCode() == null ? 0 : this.getCode().hashCode());
		result = 37 * result
				+ (getJsonTree() == null ? 0 : this.getJsonTree().hashCode());
		return result;
	}

}
