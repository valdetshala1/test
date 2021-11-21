package com.geoland.kfis.model;
// Generated 11.06.2020 23:02:56 by Hibernate Tools 5.2.11.Final

import com.geoland.framework.persistence.base.*;
import java.math.BigDecimal;
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

/**
 * EmployeeSalaryDeductions generated by hbm2java
 */
@Entity
@Table(name = "thrm_employee_salary_deductions", schema = "public")
public class EmployeeSalaryDeductions extends AbstractPersistentObject implements java.io.Serializable {

	private Long id;
	private Employee employee;
	private Person createdBy;
	private Date deductionDate;
	private Long finTypeId;
	private BigDecimal amount;
	private String note;
	private Date createdDate;

	public EmployeeSalaryDeductions() {
	}

	public EmployeeSalaryDeductions(Employee employee, Person createdBy, Date deductionDate, Long finTypeId,
			BigDecimal amount, Date createdDate) {
		this.employee = employee;
		this.createdBy = createdBy;
		this.deductionDate = deductionDate;
		this.finTypeId = finTypeId;
		this.amount = amount;
		this.createdDate = createdDate;
	}

	public EmployeeSalaryDeductions(Employee employee, Person createdBy, Date deductionDate, Long finTypeId,
			BigDecimal amount, String note, Date createdDate) {
		this.employee = employee;
		this.createdBy = createdBy;
		this.deductionDate = deductionDate;
		this.finTypeId = finTypeId;
		this.amount = amount;
		this.note = note;
		this.createdDate = createdDate;
	}

	@GenericGenerator(name = "com.geoland.kfis.model.EmployeeSalaryDeductionsIdGenerator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "com.geoland.kfis.model.EmployeeSalaryDeductionsIdGenerator")

	@Column(name = "id", unique = true, nullable = false)
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "employee_id", nullable = false)
	public Employee getEmployee() {
		return this.employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "created_by", nullable = false)
	public Person getCreatedBy() {
		return this.createdBy;
	}

	public void setCreatedBy(Person createdBy) {
		this.createdBy = createdBy;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "deduction_date", nullable = false, length = 13)
	public Date getDeductionDate() {
		return this.deductionDate;
	}

	public void setDeductionDate(Date deductionDate) {
		this.deductionDate = deductionDate;
	}

	@Column(name = "fin_type_id", nullable = false)
	public Long getFinTypeId() {
		return this.finTypeId;
	}

	public void setFinTypeId(Long finTypeId) {
		this.finTypeId = finTypeId;
	}

	@Column(name = "amount", nullable = false, precision = 8)
	public BigDecimal getAmount() {
		return this.amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	@Column(name = "note")
	public String getNote() {
		return this.note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "created_date", nullable = false, length = 29)
	public Date getCreatedDate() {
		return this.createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

}