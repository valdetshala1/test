package com.geoland.kfis.model;

// Generated Feb 11, 2015 2:26:59 AM by Hibernate Tools 3.4.0.CR1

import com.geoland.framework.persistence.base.*;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.GenericGenerator;

// TODO: Auto-generated Javadoc
/**
 * ManagementClass generated by hbm2java.
 */
@Entity
@Table(name = "tfrm_management_class", schema = "public")
public class ManagementClass extends AbstractPersistentObject implements
		java.io.Serializable {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The id. */
	private Long id;
	
	/** The mngmt class code. */
	private Long mngmtClassCode;
	
	/** The created date. */
	private Date createdDate;
	
	/** The remarks. */
	private String remarks;

	/**
	 * Instantiates a new management class.
	 */
	public ManagementClass() {
	}

	/**
	 * Instantiates a new management class.
	 *
	 * @param mngmtClassCode the mngmt class code
	 * @param createdDate the created date
	 */
	public ManagementClass(Long mngmtClassCode, Date createdDate) {
		this.mngmtClassCode = mngmtClassCode;
		this.createdDate = createdDate;
	}

	/**
	 * Instantiates a new management class.
	 *
	 * @param mngmtClassCode the mngmt class code
	 * @param createdDate the created date
	 * @param remarks the remarks
	 */
	public ManagementClass(Long mngmtClassCode, Date createdDate, String remarks) {
		this.mngmtClassCode = mngmtClassCode;
		this.createdDate = createdDate;
		this.remarks = remarks;
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
	 * Gets the mngmt class code.
	 *
	 * @return the mngmt class code
	 */
	@Column(name = "mngmt_class_code", nullable = false)
	public Long getMngmtClassCode() {
		return this.mngmtClassCode;
	}

	/**
	 * Sets the mngmt class code.
	 *
	 * @param mngmtClassCode the new mngmt class code
	 */
	public void setMngmtClassCode(Long mngmtClassCode) {
		this.mngmtClassCode = mngmtClassCode;
	}

	/**
	 * Gets the created date.
	 *
	 * @return the created date
	 */
	@Temporal(TemporalType.DATE)
	@Column(name = "created_date", nullable = false, length = 13)
	public Date getCreatedDate() {
		return this.createdDate;
	}

	/**
	 * Sets the created date.
	 *
	 * @param createdDate the new created date
	 */
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	/**
	 * Gets the remarks.
	 *
	 * @return the remarks
	 */
	@Column(name = "remarks")
	public String getRemarks() {
		return this.remarks;
	}

	/**
	 * Sets the remarks.
	 *
	 * @param remarks the new remarks
	 */
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

}
