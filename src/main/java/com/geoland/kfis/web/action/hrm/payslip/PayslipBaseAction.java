package com.geoland.kfis.web.action.hrm.payslip;

import java.util.List;

import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.EmployeeSalary;
import com.geoland.kfis.model.EmployeeSalaryAdjustment;
import com.geoland.kfis.model.EmployeeSalaryPayroll;
import com.geoland.kfis.model.EmployeeSalaryPayrollAdjustment;
import com.geoland.kfis.web.action.base.BaseActionSupport;
import com.geoland.kfis.web.action.hrm.salary.SalaryCalculationType;

/**
 * 
 * Class PayslipBaseAction
 * 
 * @author BEKIM BAJRAKTARI
 * @created 14.04.2020
 * @Version 1.0
 */
public class PayslipBaseAction extends BaseActionSupport {

	private static final long serialVersionUID = 1L;

	protected boolean createPayslipAll;
	protected Long payrollId;
	protected Long salaryId;
	protected Long employeeId;
	protected Employee employee;
	protected EmployeeSalaryPayroll payroll;
	protected EmployeeSalary salary;
	protected EmployeeSalaryAdjustment adjustment;
	protected List<EmployeeSalaryAdjustment> adjustments; 

	protected EmployeeSalaryPayrollAdjustment payrollAdjustment;
	protected List<EmployeeSalaryPayrollAdjustment> payrolladjustments; 
	protected SalaryCalculationType[] calculationTypes = SalaryCalculationType.values();
	
	public Long getPayrollId() {
		return payrollId;
	}
	public void setPayrollId(Long payrollId) {
		this.payrollId = payrollId;
	}
	public Long getSalaryId() {
		return salaryId;
	}
	public void setSalaryId(Long salaryId) {
		this.salaryId = salaryId;
	}
	public Long getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(Long employeeId) {
		this.employeeId = employeeId;
	}
	public EmployeeSalaryPayroll getPayroll() {
		return payroll;
	}
	public void setPayroll(EmployeeSalaryPayroll payroll) {
		this.payroll = payroll;
	}
	public EmployeeSalary getSalary() {
		return salary;
	}
	public void setSalary(EmployeeSalary salary) {
		this.salary = salary;
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
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public EmployeeSalaryPayrollAdjustment getPayrollAdjustment() {
		return payrollAdjustment;
	}
	public void setPayrollAdjustment(EmployeeSalaryPayrollAdjustment payrollAdjustment) {
		this.payrollAdjustment = payrollAdjustment;
	}
	public List<EmployeeSalaryPayrollAdjustment> getPayrolladjustments() {
		return payrolladjustments;
	}
	public void setPayrolladjustments(List<EmployeeSalaryPayrollAdjustment> payrolladjustments) {
		this.payrolladjustments = payrolladjustments;
	}
	public boolean isCreatePayslipAll() {
		return createPayslipAll;
	}
	public void setCreatePayslipAll(boolean createPayslipAll) {
		this.createPayslipAll = createPayslipAll;
	}
	public SalaryCalculationType[] getCalculationTypes() {
		return calculationTypes;
	}
	public void setCalculationTypes(SalaryCalculationType[] calculationTypes) {
		this.calculationTypes = calculationTypes;
	}
	
}
