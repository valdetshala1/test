package com.geoland.kfis.model;

// Generated Dec 14, 2015 2:37:03 PM by Hibernate Tools 4.0.0

import com.geoland.framework.persistence.base.*;
import org.hibernate.annotations.Type;
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
 * DhpetPeriodPlanStatus generated by hbm2java.
 */
@Entity
@Table(name = "tdhpet_period_plan_status", schema = "public")
public class DhpetPeriodPlanStatus extends AbstractPersistentObject implements
		java.io.Serializable {

	/** The id. */
	private Long id;
	
	/** The employee. */
	private Employee employee;
	
	/** The dhpet period plan. */
	private DhpetPeriodPlan dhpetPeriodPlan;
	
	/** The status. */
	private String status;
	
	/** The comment. */
	private String comment;
	
	/** The created date. */
	private Date createdDate;
	
	/** The dhpet period plans. */
	private Set<DhpetPeriodPlan> dhpetPeriodPlans = new HashSet<DhpetPeriodPlan>(
			0);

	/**
	 * Instantiates a new dhpet period plan status.
	 */
	public DhpetPeriodPlanStatus() {
	}

	/**
	 * Instantiates a new dhpet period plan status.
	 *
	 * @param employee the employee
	 * @param dhpetPeriodPlan the dhpet period plan
	 * @param createdDate the created date
	 */
	public DhpetPeriodPlanStatus(Employee employee,
			DhpetPeriodPlan dhpetPeriodPlan, Date createdDate) {
		this.employee = employee;
		this.dhpetPeriodPlan = dhpetPeriodPlan;
		this.createdDate = createdDate;
	}

	/**
	 * Instantiates a new dhpet period plan status.
	 *
	 * @param employee the employee
	 * @param dhpetPeriodPlan the dhpet period plan
	 * @param status the status
	 * @param comment the comment
	 * @param createdDate the created date
	 * @param dhpetPeriodPlans the dhpet period plans
	 */
	public DhpetPeriodPlanStatus(Employee employee,
			DhpetPeriodPlan dhpetPeriodPlan, String status, String comment,
			Date createdDate, Set<DhpetPeriodPlan> dhpetPeriodPlans) {
		this.employee = employee;
		this.dhpetPeriodPlan = dhpetPeriodPlan;
		this.status = status;
		this.comment = comment;
		this.createdDate = createdDate;
		this.dhpetPeriodPlans = dhpetPeriodPlans;
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
	 * Gets the dhpet period plan.
	 *
	 * @return the dhpet period plan
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "period_plan_id", nullable = false)
	public DhpetPeriodPlan getDhpetPeriodPlan() {
		return this.dhpetPeriodPlan;
	}

	/**
	 * Sets the dhpet period plan.
	 *
	 * @param dhpetPeriodPlan the new dhpet period plan
	 */
	public void setDhpetPeriodPlan(DhpetPeriodPlan dhpetPeriodPlan) {
		this.dhpetPeriodPlan = dhpetPeriodPlan;
	}

	/**
	 * Gets the status.
	 *
	 * @return the status
	 */
	@Column(name = "status", length = 3)
	public String getStatus() {
		return this.status;
	}

	/**
	 * Sets the status.
	 *
	 * @param status the new status
	 */
	public void setStatus(String status) {
		this.status = status;
	}

	/**
	 * Gets the comment.
	 *
	 * @return the comment
	 */
	@Column(name = "comment")
	public String getComment() {
		return this.comment;
	}

	/**
	 * Sets the comment.
	 *
	 * @param comment the new comment
	 */
	public void setComment(String comment) {
		this.comment = comment;
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
	 * Gets the dhpet period plans.
	 *
	 * @return the dhpet period plans
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "dhpetPeriodPlanStatus")
	public Set<DhpetPeriodPlan> getDhpetPeriodPlans() {
		return this.dhpetPeriodPlans;
	}

	/**
	 * Sets the dhpet period plans.
	 *
	 * @param dhpetPeriodPlans the new dhpet period plans
	 */
	public void setDhpetPeriodPlans(Set<DhpetPeriodPlan> dhpetPeriodPlans) {
		this.dhpetPeriodPlans = dhpetPeriodPlans;
	}

}
