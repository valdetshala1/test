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
 * LeaveEntitlement generated by hbm2java.
 */
@Entity
@Table(name = "thrm_leave_entitlement", schema = "public")
public class LeaveEntitlement extends AbstractPersistentObject implements
		java.io.Serializable {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The id. */
	private Long id;
	
	/** The created by. */
	private Party createdBy;
	
	/** The leave type. */
	private LeaveType leaveType;
	
	/** The employee. */
	private Employee employee;
	
	/** The no of days. */
	private Double noOfDays;
	
	/** The days used. */
	private Double daysUsed;
	
	/** The from date. */
	private Date fromDate;
	
	/** The to date. */
	private Date toDate;
	
	/** The note. */
	private String note;
	
	/** The created date. */
	private Date createdDate;

	/**
	 * Instantiates a new leave entitlement.
	 */
	public LeaveEntitlement() {
	}

	/**
	 * Instantiates a new leave entitlement.
	 *
	 * @param createdBy the created by
	 * @param leaveType the leave type
	 * @param employee the employee
	 * @param noOfDays the no of days
	 * @param daysUsed the days used
	 * @param fromDate the from date
	 * @param createdDate the created date
	 */
	public LeaveEntitlement(Party createdBy, LeaveType leaveType,
			Employee employee, Double noOfDays, Double daysUsed, Date fromDate,
			Date createdDate) {
		this.createdBy = createdBy;
		this.leaveType = leaveType;
		this.employee = employee;
		this.noOfDays = noOfDays;
		this.daysUsed = daysUsed;
		this.fromDate = fromDate;
		this.createdDate = createdDate;
	}

	/**
	 * Instantiates a new leave entitlement.
	 *
	 * @param createdBy the created by
	 * @param leaveType the leave type
	 * @param employee the employee
	 * @param noOfDays the no of days
	 * @param daysUsed the days used
	 * @param fromDate the from date
	 * @param toDate the to date
	 * @param note the note
	 * @param createdDate the created date
	 */
	public LeaveEntitlement(Party createdBy, LeaveType leaveType,
			Employee employee, Double noOfDays, Double daysUsed, Date fromDate,
			Date toDate, String note, Date createdDate) {
		this.createdBy = createdBy;
		this.leaveType = leaveType;
		this.employee = employee;
		this.noOfDays = noOfDays;
		this.daysUsed = daysUsed;
		this.fromDate = fromDate;
		this.toDate = toDate;
		this.note = note;
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
	 * Gets the created by.
	 *
	 * @return the created by
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "created_by", nullable = false)
	public Party getCreatedBy() {
		return this.createdBy;
	}

	/**
	 * Sets the created by.
	 *
	 * @param createdBy the new created by
	 */
	public void setCreatedBy(Party createdBy) {
		this.createdBy = createdBy;
	}

	/**
	 * Gets the leave type.
	 *
	 * @return the leave type
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "leave_type_id", nullable = false)
	public LeaveType getLeaveType() {
		return this.leaveType;
	}

	/**
	 * Sets the leave type.
	 *
	 * @param leaveType the new leave type
	 */
	public void setLeaveType(LeaveType leaveType) {
		this.leaveType = leaveType;
	}

	/**
	 * Gets the employee.
	 *
	 * @return the employee
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "employee_id", nullable = false)
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
	 * Gets the no of days.
	 *
	 * @return the no of days
	 */
	@Column(name = "no_of_days", nullable = false, precision = 17, scale = 17)
	public Double getNoOfDays() {
		return this.noOfDays;
	}

	/**
	 * Sets the no of days.
	 *
	 * @param noOfDays the new no of days
	 */
	public void setNoOfDays(Double noOfDays) {
		this.noOfDays = noOfDays;
	}

	/**
	 * Gets the days used.
	 *
	 * @return the days used
	 */
	@Column(name = "days_used", nullable = false, precision = 17, scale = 17)
	public Double getDaysUsed() {
		return this.daysUsed;
	}

	/**
	 * Sets the days used.
	 *
	 * @param daysUsed the new days used
	 */
	public void setDaysUsed(Double daysUsed) {
		this.daysUsed = daysUsed;
	}

	/**
	 * Gets the from date.
	 *
	 * @return the from date
	 */
	@Temporal(TemporalType.DATE)
	@Column(name = "from_date", nullable = false, length = 13)
	public Date getFromDate() {
		return this.fromDate;
	}

	/**
	 * Sets the from date.
	 *
	 * @param fromDate the new from date
	 */
	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}

	/**
	 * Gets the to date.
	 *
	 * @return the to date
	 */
	@Temporal(TemporalType.DATE)
	@Column(name = "to_date", length = 13)
	public Date getToDate() {
		return this.toDate;
	}

	/**
	 * Sets the to date.
	 *
	 * @param toDate the new to date
	 */
	public void setToDate(Date toDate) {
		this.toDate = toDate;
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

}
