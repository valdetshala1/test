package com.geoland.kfis.model;

// Generated Feb 11, 2015 2:26:59 AM by Hibernate Tools 3.4.0.CR1

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.hibernate.annotations.GenericGenerator;

import com.geoland.framework.persistence.base.AbstractPersistentObject;

// TODO: Auto-generated Javadoc
/**
 * TextDomain generated by hbm2java.
 */
@Entity
@Table(name = "ttextdomain", schema = "public", uniqueConstraints = @UniqueConstraint(columnNames = {
		"domname", "domvalue" }))
public class TextDomain extends AbstractPersistentObject implements
		java.io.Serializable {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The id. */
	private Long id;
	
	/** The domname. */
	private String domname;
	
	/** The domvalue. */
	private String domvalue;
	
	/** The domkey. */
	private String domkey;
	
	/** The sort. */
	private Long sort;
	
	/** The domtext. */
	private String domtext;
	
	/** The domtext en. */
	private String domtextEn;
	
	/** The domtext sr. */
	private String domtextSr;

	/**
	 * Instantiates a new text domain.
	 */
	public TextDomain() {
	}

	/**
	 * Instantiates a new text domain.
	 *
	 * @param domname the domname
	 * @param domvalue the domvalue
	 * @param domkey the domkey
	 * @param sort the sort
	 * @param domtext the domtext
	 */
	public TextDomain(String domname, String domvalue, String domkey,
			Long sort, String domtext) {
		this.domname = domname;
		this.domvalue = domvalue;
		this.domkey = domkey;
		this.sort = sort;
		this.domtext = domtext;
	}

	/**
	 * Instantiates a new text domain.
	 *
	 * @param domname the domname
	 * @param domvalue the domvalue
	 * @param domkey the domkey
	 * @param sort the sort
	 * @param domtext the domtext
	 * @param domtextEn the domtext en
	 * @param domtextSr the domtext sr
	 */
	public TextDomain(String domname, String domvalue, String domkey,
			Long sort, String domtext, String domtextEn, String domtextSr) {
		this.domname = domname;
		this.domvalue = domvalue;
		this.domkey = domkey;
		this.sort = sort;
		this.domtext = domtext;
		this.domtextEn = domtextEn;
		this.domtextSr = domtextSr;
	}

	/* (non-Javadoc)
	 * @see com.geoland.framework.persistence.base.AbstractPersistentObject#getId()
	 */
	@GenericGenerator(name = "generator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "id", unique = true, nullable = false)
	public Long getId() {
		return this.id;
	}

	/* (non-Javadoc)
	 * @see com.geoland.framework.persistence.base.AbstractPersistentObject#setId(java.lang.Long)
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * Gets the domname.
	 *
	 * @return the domname
	 */
	@Column(name = "domname", nullable = false, length = 30)
	public String getDomname() {
		return this.domname;
	}

	/**
	 * Sets the domname.
	 *
	 * @param domname the new domname
	 */
	public void setDomname(String domname) {
		this.domname = domname;
	}

	/**
	 * Gets the domvalue.
	 *
	 * @return the domvalue
	 */
	@Column(name = "domvalue", nullable = false, length = 30)
	public String getDomvalue() {
		return this.domvalue;
	}

	/**
	 * Sets the domvalue.
	 *
	 * @param domvalue the new domvalue
	 */
	public void setDomvalue(String domvalue) {
		this.domvalue = domvalue;
	}

	/**
	 * Gets the domkey.
	 *
	 * @return the domkey
	 */
	@Column(name = "domkey", nullable = false, length = 6)
	public String getDomkey() {
		return this.domkey;
	}

	/**
	 * Sets the domkey.
	 *
	 * @param domkey the new domkey
	 */
	public void setDomkey(String domkey) {
		this.domkey = domkey;
	}

	/**
	 * Gets the sort.
	 *
	 * @return the sort
	 */
	@Column(name = "sort", nullable = false)
	public Long getSort() {
		return this.sort;
	}

	/**
	 * Sets the sort.
	 *
	 * @param sort the new sort
	 */
	public void setSort(Long sort) {
		this.sort = sort;
	}

	/**
	 * Gets the domtext.
	 *
	 * @return the domtext
	 */
	@Column(name = "domtext", nullable = false, length = 150)
	public String getDomtext() {
		return this.domtext;
	}

	/**
	 * Sets the domtext.
	 *
	 * @param domtext the new domtext
	 */
	public void setDomtext(String domtext) {
		this.domtext = domtext;
	}

	/**
	 * Gets the domtext en.
	 *
	 * @return the domtext en
	 */
	@Column(name = "domtext_en", length = 150)
	public String getDomtextEn() {
		return this.domtextEn;
	}

	/**
	 * Sets the domtext en.
	 *
	 * @param domtextEn the new domtext en
	 */
	public void setDomtextEn(String domtextEn) {
		this.domtextEn = domtextEn;
	}

	/**
	 * Gets the domtext sr.
	 *
	 * @return the domtext sr
	 */
	@Column(name = "domtext_sr", length = 150)
	public String getDomtextSr() {
		return this.domtextSr;
	}

	/**
	 * Sets the domtext sr.
	 *
	 * @param domtextSr the new domtext sr
	 */
	public void setDomtextSr(String domtextSr) {
		this.domtextSr = domtextSr;
	}

}
