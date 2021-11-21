package com.geoland.kfis.model;
// Generated 23.06.2020 15:43:55 by Hibernate Tools 5.2.11.Final

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

/**
 * BudgetMainntenance generated by hbm2java
 */
@Entity
@Table(name = "tfin_budget_mainntenance", schema = "public")
public class BudgetMainntenance extends AbstractPersistentObject implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	private Long id;
	private FinancialType financialType;
	private Employee employee;
	private String budgetCode;
	private Double initialAnnualBudget;
	private Double annualAllocation;
	private Double currentExpenditure;
	private Double commitment;
	private Double availableBalance;
	private Double bugetUtilizationInPercent;
	private Date createdDate;
	private Long budgetYear;

	public BudgetMainntenance() {
	}

	public BudgetMainntenance(FinancialType financialType, String budgetCode) {
		this.financialType = financialType;
		this.budgetCode = budgetCode;
	}

	public BudgetMainntenance(FinancialType financialType, Employee employee, String budgetCode,
			Double initialAnnualBudget, Double annualAllocation, Double currentExpenditure, Double commitment,
			Double availableBalance, Double bugetUtilizationInPercent, Date createdDate, Long budgetYear) {
		this.financialType = financialType;
		this.employee = employee;
		this.budgetCode = budgetCode;
		this.initialAnnualBudget = initialAnnualBudget;
		this.annualAllocation = annualAllocation;
		this.currentExpenditure = currentExpenditure;
		this.commitment = commitment;
		this.availableBalance = availableBalance;
		this.bugetUtilizationInPercent = bugetUtilizationInPercent;
		this.createdDate = createdDate;
		this.budgetYear = budgetYear;
	}

	@GenericGenerator(name = "com.geoland.kfis.model.BudgetMainntenanceIdGenerator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "com.geoland.kfis.model.BudgetMainntenanceIdGenerator")

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
	@JoinColumn(name = "created_by")
	public Employee getEmployee() {
		return this.employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	@Column(name = "budget_code", nullable = false, length = 50)
	public String getBudgetCode() {
		return this.budgetCode;
	}

	public void setBudgetCode(String budgetCode) {
		this.budgetCode = budgetCode;
	}

	@Column(name = "initial_annual_budget", precision = 17, scale = 17)
	public Double getInitialAnnualBudget() {
		return this.initialAnnualBudget;
	}

	public void setInitialAnnualBudget(Double initialAnnualBudget) {
		this.initialAnnualBudget = initialAnnualBudget;
	}

	@Column(name = "annual_allocation", precision = 17, scale = 17)
	public Double getAnnualAllocation() {
		return this.annualAllocation;
	}

	public void setAnnualAllocation(Double annualAllocation) {
		this.annualAllocation = annualAllocation;
	}

	@Column(name = "current_expenditure", precision = 17, scale = 17)
	public Double getCurrentExpenditure() {
		return this.currentExpenditure;
	}

	public void setCurrentExpenditure(Double currentExpenditure) {
		this.currentExpenditure = currentExpenditure;
	}

	@Column(name = "commitment", precision = 17, scale = 17)
	public Double getCommitment() {
		return this.commitment;
	}

	public void setCommitment(Double commitment) {
		this.commitment = commitment;
	}

	@Column(name = "available_balance", precision = 17, scale = 17)
	public Double getAvailableBalance() {
		return this.availableBalance;
	}

	public void setAvailableBalance(Double availableBalance) {
		this.availableBalance = availableBalance;
	}

	@Column(name = "buget_utilization_in_percent", precision = 17, scale = 17)
	public Double getBugetUtilizationInPercent() {
		return this.bugetUtilizationInPercent;
	}

	public void setBugetUtilizationInPercent(Double bugetUtilizationInPercent) {
		this.bugetUtilizationInPercent = bugetUtilizationInPercent;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "created_date", length = 29)
	public Date getCreatedDate() {
		return this.createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	@Column(name = "budget_year")
	public Long getBudgetYear() {
		return this.budgetYear;
	}

	public void setBudgetYear(Long budgetYear) {
		this.budgetYear = budgetYear;
	}

}
