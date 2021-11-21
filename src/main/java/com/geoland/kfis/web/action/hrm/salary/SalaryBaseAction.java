package com.geoland.kfis.web.action.hrm.salary;

import java.util.List;

import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.EmployeeSalary;
import com.geoland.kfis.model.EmployeeSalaryAdjustment;
import com.geoland.kfis.model.EmployeeSalaryBonus;
import com.geoland.kfis.model.EmployeeSalaryPayroll;
import com.geoland.kfis.model.EmployeeSalaryTaxRates;
import com.geoland.kfis.web.action.base.BaseActionSupport;

/**
 * 
 * Class SalaryBaseAction
 * @author BEKIM BAJRAKTARI
 * @created 14.04.2020
 * @Version 1.0
 */
public class SalaryBaseAction extends BaseActionSupport {

	private static final long serialVersionUID = 1L;
	
	protected Integer employeeCount;
	protected Integer salaryCount;
	protected Integer payrollCount;

	protected Long adjustmentId;
	protected Long salaryId;
	protected Employee employee;
	protected EmployeeSalary salary;
	protected EmployeeSalaryBonus bonus;
	protected EmployeeSalaryAdjustment adjustment;
	protected EmployeeSalaryPayroll payroll;
	protected EmployeeSalaryTaxRates taxRates;
	protected List<EmployeeSalaryAdjustment> adjustments; 
	protected SalaryCalculationType[] calculationTypes = SalaryCalculationType.values();
	protected SalaryCalculationStep[] calculationSteps = SalaryCalculationStep.values();
	
	
	public Long getSalaryId() {
		return salaryId;
	}
	public void setSalaryId(Long salaryId) {
		this.salaryId = salaryId;
	}
	public EmployeeSalary getSalary() {
		return salary;
	}
	public void setSalary(EmployeeSalary salary) {
		this.salary = salary;
	}
	public EmployeeSalaryBonus getBonus() {
		return bonus;
	}
	public void setBonus(EmployeeSalaryBonus bonus) {
		this.bonus = bonus;
	}
	public EmployeeSalaryPayroll getPayroll() {
		return payroll;
	}
	public void setPayroll(EmployeeSalaryPayroll payroll) {
		this.payroll = payroll;
	}
	public EmployeeSalaryTaxRates getTaxRates() {
		return taxRates;
	}
	public void setTaxRates(EmployeeSalaryTaxRates taxRates) {
		this.taxRates = taxRates;
	}
	
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
	public Employee getEmployee() {
		return employee;
	}
	public Integer getEmployeeCount() {
		return employeeCount;
	}
	public void setEmployeeCount(Integer employeeCount) {
		this.employeeCount = employeeCount;
	}
	public Integer getSalaryCount() {
		return salaryCount;
	}
	public void setSalaryCount(Integer salaryCount) {
		this.salaryCount = salaryCount;
	}
	public Integer getPayrollCount() {
		return payrollCount;
	}
	public void setPayrollCount(Integer payrollCount) {
		this.payrollCount = payrollCount;
	}
	public EmployeeSalaryAdjustment getAdjustment() {
		return adjustment;
	}
	public void setAdjustment(EmployeeSalaryAdjustment adjustment) {
		this.adjustment = adjustment;
	}
	public List<EmployeeSalaryAdjustment> getAdjustments() {
		return adjustments;
	}
	public void setAdjustments(List<EmployeeSalaryAdjustment> adjustments) {
		this.adjustments = adjustments;
	}
	public Long getAdjustmentId() {
		return adjustmentId;
	}
	public void setAdjustmentId(Long adjustmentId) {
		this.adjustmentId = adjustmentId;
	}

	public SalaryCalculationType[] getCalculationTypes() {
		return calculationTypes;
	}
	
	public void setCalculationTypes(SalaryCalculationType[] calculationTypes) {
		this.calculationTypes = calculationTypes;
	}
	
	public void setCalculationSteps(SalaryCalculationStep[] calculationSteps) {
		this.calculationSteps = calculationSteps;
	}
	
	public SalaryCalculationStep[] getCalculationSteps() {
		return calculationSteps;
	}
	
}
