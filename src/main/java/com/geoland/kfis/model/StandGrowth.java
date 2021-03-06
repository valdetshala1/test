package com.geoland.kfis.model;

// Generated Feb 11, 2015 2:26:59 AM by Hibernate Tools 3.4.0.CR1

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
 * StandGrowth generated by hbm2java.
 */
@Entity
@Table(name = "tgis_stand_growth", schema = "public")
public class StandGrowth extends AbstractPersistentObject implements
		java.io.Serializable {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The id. */
	private Long id;
	
	/** The employee. */
	private Employee employee;
	
	/** The stand. */
	private Stand stand;
	
	/** The year. */
	private Long year;
	
	/** The old volume. */
	private Double oldVolume;
	
	/** The new volume. */
	private Double newVolume;
	
	/** The created date. */
	private Date createdDate;

	/**
	 * Instantiates a new stand growth.
	 */
	public StandGrowth() {
	}

	/**
	 * Instantiates a new stand growth.
	 *
	 * @param employee the employee
	 * @param stand the stand
	 * @param year the year
	 * @param createdDate the created date
	 */
	public StandGrowth(Employee employee, Stand stand, Long year,
			Date createdDate) {
		this.employee = employee;
		this.stand = stand;
		this.year = year;
		this.createdDate = createdDate;
	}

	/**
	 * Instantiates a new stand growth.
	 *
	 * @param employee the employee
	 * @param stand the stand
	 * @param year the year
	 * @param oldVolume the old volume
	 * @param newVolume the new volume
	 * @param createdDate the created date
	 */
	public StandGrowth(Employee employee, Stand stand, Long year,
			Double oldVolume, Double newVolume, Date createdDate) {
		this.employee = employee;
		this.stand = stand;
		this.year = year;
		this.oldVolume = oldVolume;
		this.newVolume = newVolume;
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
	 * Gets the stand.
	 *
	 * @return the stand
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "stand_id", nullable = false)
	public Stand getStand() {
		return this.stand;
	}

	/**
	 * Sets the stand.
	 *
	 * @param stand the new stand
	 */
	public void setStand(Stand stand) {
		this.stand = stand;
	}

	/**
	 * Gets the year.
	 *
	 * @return the year
	 */
	@Column(name = "year", nullable = false)
	public Long getYear() {
		return this.year;
	}

	/**
	 * Sets the year.
	 *
	 * @param year the new year
	 */
	public void setYear(Long year) {
		this.year = year;
	}

	/**
	 * Gets the old volume.
	 *
	 * @return the old volume
	 */
	@Column(name = "old_volume", precision = 17, scale = 17)
	public Double getOldVolume() {
		return this.oldVolume;
	}

	/**
	 * Sets the old volume.
	 *
	 * @param oldVolume the new old volume
	 */
	public void setOldVolume(Double oldVolume) {
		this.oldVolume = oldVolume;
	}

	/**
	 * Gets the new volume.
	 *
	 * @return the new volume
	 */
	@Column(name = "new_volume", precision = 17, scale = 17)
	public Double getNewVolume() {
		return this.newVolume;
	}

	/**
	 * Sets the new volume.
	 *
	 * @param newVolume the new new volume
	 */
	public void setNewVolume(Double newVolume) {
		this.newVolume = newVolume;
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

}
