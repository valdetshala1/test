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
import javax.persistence.UniqueConstraint;
import org.hibernate.annotations.GenericGenerator;

/**
 * EmployeeSalaryPayrollAdjustment generated by hbm2java
 */
@Entity
@Table(name = "thrm_employee_salary_payroll_adjustment", schema = "public", uniqueConstraints = @UniqueConstraint(columnNames = {
		"fin_type_id", "payroll_id" }))
public class EmployeeSalaryPayrollAdjustment extends AbstractPersistentObject implements java.io.Serializable {

	private Long id;
	private FinancialType financialType;
	private Employee employee;
	private EmployeeSalaryPayroll employeeSalaryPayroll;
	private Person createdBy;
	private Date adjustmentDate;
	private String calculationType;
	private String amountType;
	private BigDecimal amount;
	private BigDecimal amountPercentage;
	private BigDecimal amountPercentageCalc;
	private BigDecimal hoursworked;
	private BigDecimal hourlyrate;
	private String note;
	private Date createdDate;

	public EmployeeSalaryPayrollAdjustment() {
	}

	public EmployeeSalaryPayrollAdjustment(FinancialType financialType, Employee employee,
			EmployeeSalaryPayroll employeeSalaryPayroll, Person createdBy, Date adjustmentDate, String calculationType,
			String amountType, Date createdDate) {
		this.financialType = financialType;
		this.employee = employee;
		this.employeeSalaryPayroll = employeeSalaryPayroll;
		this.createdBy = createdBy;
		this.adjustmentDate = adjustmentDate;
		this.calculationType = calculationType;
		this.amountType = amountType;
		this.createdDate = createdDate;
	}

	public EmployeeSalaryPayrollAdjustment(FinancialType financialType, Employee employee,
			EmployeeSalaryPayroll employeeSalaryPayroll, Person createdBy, Date adjustmentDate, String calculationType,
			String amountType, BigDecimal amount, BigDecimal amountPercentage, BigDecimal amountPercentageCalc,
			BigDecimal hoursworked, BigDecimal hourlyrate, String note, Date createdDate) {
		this.financialType = financialType;
		this.employee = employee;
		this.employeeSalaryPayroll = employeeSalaryPayroll;
		this.createdBy = createdBy;
		this.adjustmentDate = adjustmentDate;
		this.calculationType = calculationType;
		this.amountType = amountType;
		this.amount = amount;
		this.amountPercentage = amountPercentage;
		this.amountPercentageCalc = amountPercentageCalc;
		this.hoursworked = hoursworked;
		this.hourlyrate = hourlyrate;
		this.note = note;
		this.createdDate = createdDate;
	}

	@GenericGenerator(name = "com.geoland.kfis.model.EmployeeSalaryPayrollAdjustmentIdGenerator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "com.geoland.kfis.model.EmployeeSalaryPayrollAdjustmentIdGenerator")

	@Column(name = "id", unique = true, nullable = false)
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "fin_type_id", nullable = false)
	public FinancialType getFinancialType() {
		return this.financialType;
	}

	public void setFinancialType(FinancialType financialType) {
		this.financialType = financialType;
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
	@JoinColumn(name = "payroll_id", nullable = false)
	public EmployeeSalaryPayroll getEmployeeSalaryPayroll() {
		return this.employeeSalaryPayroll;
	}

	public void setEmployeeSalaryPayroll(EmployeeSalaryPayroll employeeSalaryPayroll) {
		this.employeeSalaryPayroll = employeeSalaryPayroll;
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
	@Column(name = "adjustment_date", nullable = false, length = 13)
	public Date getAdjustmentDate() {
		return this.adjustmentDate;
	}

	public void setAdjustmentDate(Date adjustmentDate) {
		this.adjustmentDate = adjustmentDate;
	}

	@Column(name = "calculation_type", nullable = false, length = 3)
	public String getCalculationType() {
		return this.calculationType;
	}

	public void setCalculationType(String calculationType) {
		this.calculationType = calculationType;
	}

	@Column(name = "amount_type", nullable = false, length = 5)
	public String getAmountType() {
		return this.amountType;
	}

	public void setAmountType(String amountType) {
		this.amountType = amountType;
	}

	@Column(name = "amount", precision = 8)
	public BigDecimal getAmount() {
		return this.amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	@Column(name = "amount_percentage", precision = 5)
	public BigDecimal getAmountPercentage() {
		return this.amountPercentage;
	}

	public void setAmountPercentage(BigDecimal amountPercentage) {
		this.amountPercentage = amountPercentage;
	}

	@Column(name = "amount_percentage_calc", precision = 8)
	public BigDecimal getAmountPercentageCalc() {
		return this.amountPercentageCalc;
	}

	public void setAmountPercentageCalc(BigDecimal amountPercentageCalc) {
		this.amountPercentageCalc = amountPercentageCalc;
	}

	@Column(name = "hoursworked", precision = 8)
	public BigDecimal getHoursworked() {
		return this.hoursworked;
	}

	public void setHoursworked(BigDecimal hoursworked) {
		this.hoursworked = hoursworked;
	}

	@Column(name = "hourlyrate", precision = 8)
	public BigDecimal getHourlyrate() {
		return this.hourlyrate;
	}

	public void setHourlyrate(BigDecimal hourlyrate) {
		this.hourlyrate = hourlyrate;
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
