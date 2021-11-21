package com.geoland.kfis.model;

// Generated Mar 25, 2015 2:09:17 PM by Hibernate Tools 4.0.0

import com.geoland.framework.persistence.base.*;
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

// TODO: Auto-generated Javadoc
/**
 * MerPlanPeriod generated by hbm2java.
 */
@Entity
@Table(name = "tmer_plan_period", schema = "public")
public class MerPlanPeriod extends AbstractPersistentObject implements
		java.io.Serializable {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The id. */
	private Long id;
	
	/** The person. */
	private Person person;
	
	/** The start year. */
	private Long startYear;
	
	/** The end year. */
	private Long endYear;
	
	/** The note. */
	private String note;
	
	/** The created date. */
	private Date createdDate;
	
	/** The mer strategies. */
	private Set<MerStrategy> merStrategies = new HashSet<MerStrategy>(0);

	/**
	 * Instantiates a new mer plan period.
	 */
	public MerPlanPeriod() {
	}

	/**
	 * Instantiates a new mer plan period.
	 *
	 * @param person the person
	 * @param startYear the start year
	 * @param endYear the end year
	 * @param createdDate the created date
	 */
	public MerPlanPeriod(Person person, Long startYear, Long endYear,
			Date createdDate) {
		this.person = person;
		this.startYear = startYear;
		this.endYear = endYear;
		this.createdDate = createdDate;
	}

	/**
	 * Instantiates a new mer plan period.
	 *
	 * @param person the person
	 * @param startYear the start year
	 * @param endYear the end year
	 * @param note the note
	 * @param createdDate the created date
	 * @param merStrategies the mer strategies
	 */
	public MerPlanPeriod(Person person, Long startYear, Long endYear,
			String note, Date createdDate, Set<MerStrategy> merStrategies) {
		this.person = person;
		this.startYear = startYear;
		this.endYear = endYear;
		this.note = note;
		this.createdDate = createdDate;
		this.merStrategies = merStrategies;
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
	 * Gets the person.
	 *
	 * @return the person
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "created_by", nullable = false)
	public Person getPerson() {
		return this.person;
	}

	/**
	 * Sets the person.
	 *
	 * @param person the new person
	 */
	public void setPerson(Person person) {
		this.person = person;
	}

	/**
	 * Gets the start year.
	 *
	 * @return the start year
	 */
	@Column(name = "start_year", nullable = false)
	public Long getStartYear() {
		return this.startYear;
	}

	/**
	 * Sets the start year.
	 *
	 * @param startYear the new start year
	 */
	public void setStartYear(Long startYear) {
		this.startYear = startYear;
	}

	/**
	 * Gets the end year.
	 *
	 * @return the end year
	 */
	@Column(name = "end_year", nullable = false)
	public Long getEndYear() {
		return this.endYear;
	}

	/**
	 * Sets the end year.
	 *
	 * @param endYear the new end year
	 */
	public void setEndYear(Long endYear) {
		this.endYear = endYear;
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
	 * Gets the mer strategies.
	 *
	 * @return the mer strategies
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "merPlanPeriod")
	public Set<MerStrategy> getMerStrategies() {
		return this.merStrategies;
	}

	/**
	 * Sets the mer strategies.
	 *
	 * @param merStrategies the new mer strategies
	 */
	public void setMerStrategies(Set<MerStrategy> merStrategies) {
		this.merStrategies = merStrategies;
	}

}