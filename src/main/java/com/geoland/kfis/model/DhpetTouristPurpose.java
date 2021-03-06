package com.geoland.kfis.model;

// Generated Jan 19, 2016 8:52:58 AM by Hibernate Tools 3.4.0.CR1

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

import com.geoland.framework.persistence.base.AbstractPersistentObject;

// TODO: Auto-generated Javadoc
/**
 * DhpetTouristPurpose generated by hbm2java.
 */
@Entity
@Table(name = "tdhpet_tourist_purpose", schema = "public")
public class DhpetTouristPurpose extends AbstractPersistentObject implements
		java.io.Serializable {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -2121916486023885028L;
	
	/** The id. */
	private Long id;
	
	/** The employee. */
	private Employee employee;
	
	/** The name. */
	private String name;
	
	/** The name en. */
	private String nameEn;
	
	/** The name sr. */
	private String nameSr;
	
	/** The note. */
	private String note;
	
	/** The created date. */
	private Date createdDate;
	
	/** The dhpet tourist registers. */
	private Set<DhpetTouristRegister> dhpetTouristRegisters = new HashSet<DhpetTouristRegister>(
			0);

	/**
	 * Instantiates a new dhpet tourist purpose.
	 */
	public DhpetTouristPurpose() {
	}

	/**
	 * Instantiates a new dhpet tourist purpose.
	 *
	 * @param employee the employee
	 * @param createdDate the created date
	 */
	public DhpetTouristPurpose(Employee employee, Date createdDate) {
		this.employee = employee;
		this.createdDate = createdDate;
	}

	/**
	 * Instantiates a new dhpet tourist purpose.
	 *
	 * @param employee the employee
	 * @param name the name
	 * @param nameEn the name en
	 * @param nameSr the name sr
	 * @param note the note
	 * @param createdDate the created date
	 * @param dhpetTouristRegisters the dhpet tourist registers
	 */
	public DhpetTouristPurpose(Employee employee, String name, String nameEn,
			String nameSr, String note, Date createdDate,
			Set<DhpetTouristRegister> dhpetTouristRegisters) {
		this.employee = employee;
		this.name = name;
		this.nameEn = nameEn;
		this.nameSr = nameSr;
		this.note = note;
		this.createdDate = createdDate;
		this.dhpetTouristRegisters = dhpetTouristRegisters;
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
	 * Gets the name.
	 *
	 * @return the name
	 */
	@Column(name = "name", length = 50, nullable = false)
	public String getName() {
		return this.name;
	}

	/**
	 * Sets the name.
	 *
	 * @param name the new name
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * Gets the name en.
	 *
	 * @return the name en
	 */
	@Column(name = "name_en", length = 50)
	public String getNameEn() {
		return this.nameEn;
	}

	/**
	 * Sets the name en.
	 *
	 * @param nameEn the new name en
	 */
	public void setNameEn(String nameEn) {
		this.nameEn = nameEn;
	}

	/**
	 * Gets the name sr.
	 *
	 * @return the name sr
	 */
	@Column(name = "name_sr", length = 50)
	public String getNameSr() {
		return this.nameSr;
	}

	/**
	 * Sets the name sr.
	 *
	 * @param nameSr the new name sr
	 */
	public void setNameSr(String nameSr) {
		this.nameSr = nameSr;
	}

	/**
	 * Gets the note.
	 *
	 * @return the note
	 */
	@Column(name = "note")
	public String getNote() {
		return this.note;
	}

	/**
	 * Sets the note.
	 *
	 * @param note the new note
	 */
	public void setNote(String note) {
		this.note = note;
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

	/**
	 * Gets the dhpet tourist registers.
	 *
	 * @return the dhpet tourist registers
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "dhpetTouristPurpose")
	public Set<DhpetTouristRegister> getDhpetTouristRegisters() {
		return this.dhpetTouristRegisters;
	}

	/**
	 * Sets the dhpet tourist registers.
	 *
	 * @param dhpetTouristRegisters the new dhpet tourist registers
	 */
	public void setDhpetTouristRegisters(
			Set<DhpetTouristRegister> dhpetTouristRegisters) {
		this.dhpetTouristRegisters = dhpetTouristRegisters;
	}

}
