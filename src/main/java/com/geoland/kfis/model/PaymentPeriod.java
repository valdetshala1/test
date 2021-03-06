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
 * PaymentPeriod generated by hbm2java.
 */
@Entity
@Table(name = "tfin_payment_period", schema = "public")
public class PaymentPeriod extends AbstractPersistentObject implements
		java.io.Serializable {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The id. */
	private Long id;
	
	/** The employee. */
	private Employee employee;
	
	/** The contract. */
	private Contract contract;
	
	/** The start date. */
	private Date startDate;
	
	/** The completion date. */
	private Date completionDate;
	
	/** The payment period. */
	private Double paymentPeriod;
	
	/** The payment realized. */
	private Boolean paymentRealized;
	
	/** The payment balance. */
	private Double paymentBalance;
	
	/** The created time. */
	private Date createdTime;

	/**
	 * Instantiates a new payment period.
	 */
	public PaymentPeriod() {
	}

	/**
	 * Instantiates a new payment period.
	 *
	 * @param contract the contract
	 */
	public PaymentPeriod(Contract contract) {
		this.contract = contract;
	}

	/**
	 * Instantiates a new payment period.
	 *
	 * @param employee the employee
	 * @param contract the contract
	 * @param startDate the start date
	 * @param completionDate the completion date
	 * @param paymentPeriod the payment period
	 * @param paymentRealized the payment realized
	 * @param paymentBalance the payment balance
	 * @param createdTime the created time
	 */
	public PaymentPeriod(Employee employee, Contract contract, Date startDate,
			Date completionDate, Double paymentPeriod, Boolean paymentRealized,
			Double paymentBalance, Date createdTime) {
		this.employee = employee;
		this.contract = contract;
		this.startDate = startDate;
		this.completionDate = completionDate;
		this.paymentPeriod = paymentPeriod;
		this.paymentRealized = paymentRealized;
		this.paymentBalance = paymentBalance;
		this.createdTime = createdTime;
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
	@JoinColumn(name = "created_by")
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
	 * Gets the contract.
	 *
	 * @return the contract
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "contract_id", nullable = false)
	public Contract getContract() {
		return this.contract;
	}

	/**
	 * Sets the contract.
	 *
	 * @param contract the new contract
	 */
	public void setContract(Contract contract) {
		this.contract = contract;
	}

	/**
	 * Gets the start date.
	 *
	 * @return the start date
	 */
	@Temporal(TemporalType.DATE)
	@Column(name = "start_date", length = 13)
	public Date getStartDate() {
		return this.startDate;
	}

	/**
	 * Sets the start date.
	 *
	 * @param startDate the new start date
	 */
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	/**
	 * Gets the completion date.
	 *
	 * @return the completion date
	 */
	@Temporal(TemporalType.DATE)
	@Column(name = "completion_date", length = 13)
	public Date getCompletionDate() {
		return this.completionDate;
	}

	/**
	 * Sets the completion date.
	 *
	 * @param completionDate the new completion date
	 */
	public void setCompletionDate(Date completionDate) {
		this.completionDate = completionDate;
	}

	/**
	 * Gets the payment period.
	 *
	 * @return the payment period
	 */
	@Column(name = "payment_period", precision = 17, scale = 17)
	public Double getPaymentPeriod() {
		return this.paymentPeriod;
	}

	/**
	 * Sets the payment period.
	 *
	 * @param paymentPeriod the new payment period
	 */
	public void setPaymentPeriod(Double paymentPeriod) {
		this.paymentPeriod = paymentPeriod;
	}

	/**
	 * Gets the payment realized.
	 *
	 * @return the payment realized
	 */
	@Column(name = "payment_realized")
	public Boolean getPaymentRealized() {
		return this.paymentRealized;
	}

	/**
	 * Sets the payment realized.
	 *
	 * @param paymentRealized the new payment realized
	 */
	public void setPaymentRealized(Boolean paymentRealized) {
		this.paymentRealized = paymentRealized;
	}

	/**
	 * Gets the payment balance.
	 *
	 * @return the payment balance
	 */
	@Column(name = "payment_balance", precision = 17, scale = 17)
	public Double getPaymentBalance() {
		return this.paymentBalance;
	}

	/**
	 * Sets the payment balance.
	 *
	 * @param paymentBalance the new payment balance
	 */
	public void setPaymentBalance(Double paymentBalance) {
		this.paymentBalance = paymentBalance;
	}

	/**
	 * Gets the created time.
	 *
	 * @return the created time
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "created_time", length = 29)
	public Date getCreatedTime() {
		return this.createdTime;
	}

	/**
	 * Sets the created time.
	 *
	 * @param createdTime the new created time
	 */
	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

}
