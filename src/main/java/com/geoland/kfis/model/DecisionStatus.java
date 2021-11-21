package com.geoland.kfis.model;

// Generated Jun 2, 2015 11:31:52 AM by Hibernate Tools 4.0.0

import com.geoland.framework.persistence.base.*;
import org.hibernate.annotations.Type;
import com.geoland.kfis.persistence.hibernate.usertypes.Hrmdecisionstatus;
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
 * DecisionStatus generated by hbm2java.
 */
@Entity
@Table(name = "thrm_decision_status", schema = "public")
public class DecisionStatus extends AbstractPersistentObject implements
		java.io.Serializable {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The id. */
	private Long id;
	
	/** The employee. */
	private Employee employee;
	
	/** The decision. */
	private Decision decision;
	
	/** The status. */
	private Hrmdecisionstatus status;
	
	/** The note. */
	private String note;
	
	/** The create date. */
	private Date createDate;
	
	/** The decisions. */
	private Set<Decision> decisions = new HashSet<Decision>(0);

	/**
	 * Instantiates a new decision status.
	 */
	public DecisionStatus() {
	}

	/**
	 * Instantiates a new decision status.
	 *
	 * @param employee the employee
	 * @param decision the decision
	 * @param status the status
	 * @param createDate the create date
	 */
	public DecisionStatus(Employee employee, Decision decision,
			Hrmdecisionstatus status, Date createDate) {
		this.employee = employee;
		this.decision = decision;
		this.status = status;
		this.createDate = createDate;
	}

	/**
	 * Instantiates a new decision status.
	 *
	 * @param employee the employee
	 * @param decision the decision
	 * @param status the status
	 * @param note the note
	 * @param createDate the create date
	 * @param decisions the decisions
	 */
	public DecisionStatus(Employee employee, Decision decision,
			Hrmdecisionstatus status, String note, Date createDate,
			Set<Decision> decisions) {
		this.employee = employee;
		this.decision = decision;
		this.status = status;
		this.note = note;
		this.createDate = createDate;
		this.decisions = decisions;
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
	@JoinColumn(name = "create_by", nullable = false)
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
	 * Gets the decision.
	 *
	 * @return the decision
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "decision_id", nullable = false)
	public Decision getDecision() {
		return this.decision;
	}

	/**
	 * Sets the decision.
	 *
	 * @param decision the new decision
	 */
	public void setDecision(Decision decision) {
		this.decision = decision;
	}

	/**
	 * Gets the status.
	 *
	 * @return the status
	 */
	@Column(name = "status", nullable = false, length = 3)
	@Type(type = "com.geoland.kfis.persistence.hibernate.usertypes.HrmdecisionstatusUserType")
	public Hrmdecisionstatus getStatus() {
		return this.status;
	}

	/**
	 * Sets the status.
	 *
	 * @param status the new status
	 */
	public void setStatus(Hrmdecisionstatus status) {
		this.status = status;
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
	 * Gets the creates the date.
	 *
	 * @return the creates the date
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_date", nullable = false, length = 29)
	public Date getCreateDate() {
		return this.createDate;
	}

	/**
	 * Sets the creates the date.
	 *
	 * @param createDate the new creates the date
	 */
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	/**
	 * Gets the decisions.
	 *
	 * @return the decisions
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "decisionStatus")
	public Set<Decision> getDecisions() {
		return this.decisions;
	}

	/**
	 * Sets the decisions.
	 *
	 * @param decisions the new decisions
	 */
	public void setDecisions(Set<Decision> decisions) {
		this.decisions = decisions;
	}

}
