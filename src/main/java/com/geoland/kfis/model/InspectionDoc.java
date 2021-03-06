package com.geoland.kfis.model;

// Generated Feb 26, 2015 11:21:28 AM by Hibernate Tools 4.0.0

import com.geoland.framework.persistence.base.*;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.GenericGenerator;

// TODO: Auto-generated Javadoc
/**
 * InspectionDoc generated by hbm2java.
 */
@Entity
@Table(name = "tfrm_inspection_doc", schema = "public")
public class InspectionDoc extends AbstractPersistentObject implements
		java.io.Serializable {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The id. */
	private Long id;
	
	/** The employee. */
	private Employee employee;
	
	/** The inspection. */
	private Inspection inspection;
	
	/** The doc type. */
	private String docType;
	
	/** The doc name. */
	private String docName;
	
	/** The doc. */
	private byte[] doc;
	
	/** The created date. */
	private Date createdDate;

	/**
	 * Instantiates a new inspection doc.
	 */
	public InspectionDoc() {
	}

	/**
	 * Instantiates a new inspection doc.
	 *
	 * @param employee the employee
	 * @param inspection the inspection
	 * @param docType the doc type
	 * @param docName the doc name
	 * @param doc the doc
	 * @param createdDate the created date
	 */
	public InspectionDoc(Employee employee, Inspection inspection,
			String docType, String docName, byte[] doc, Date createdDate) {
		this.employee = employee;
		this.inspection = inspection;
		this.docType = docType;
		this.docName = docName;
		this.doc = doc;
		this.createdDate = createdDate;
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
	 * Gets the employee.
	 *
	 * @return the employee
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "created_by", nullable = false)
	public Employee getEmployee() {
		return this.employee;
	}

	/**
	 * Sets the employee.
	 *
	 * @param employee the new employee
	 */
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	/**
	 * Gets the inspection.
	 *
	 * @return the inspection
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "inspection_id", nullable = false)
	public Inspection getInspection() {
		return this.inspection;
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
	 * Gets the doc type.
	 *
	 * @return the doc type
	 */
	@Column(name = "doc_type", nullable = false, length = 100)
	public String getDocType() {
		return this.docType;
	}

	/**
	 * Sets the doc type.
	 *
	 * @param docType the new doc type
	 */
	public void setDocType(String docType) {
		this.docType = docType;
	}

	/**
	 * Gets the doc name.
	 *
	 * @return the doc name
	 */
	@Column(name = "doc_name", nullable = false, length = 100)
	public String getDocName() {
		return this.docName;
	}

	/**
	 * Sets the doc name.
	 *
	 * @param docName the new doc name
	 */
	public void setDocName(String docName) {
		this.docName = docName;
	}

	/**
	 * Gets the doc.
	 *
	 * @return the doc
	 */
	@Column(name = "doc", nullable = false)
	public byte[] getDoc() {
		return this.doc;
	}

	/**
	 * Sets the doc.
	 *
	 * @param doc the new doc
	 */
	public void setDoc(byte[] doc) {
		this.doc = doc;
	}

	/**
	 * Gets the created date.
	 *
	 * @return the created date
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "created_date", nullable = false, length = 29)
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

}
