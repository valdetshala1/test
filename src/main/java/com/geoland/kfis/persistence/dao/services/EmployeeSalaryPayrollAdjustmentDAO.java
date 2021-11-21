package com.geoland.kfis.persistence.dao.services;

import java.util.List;

import com.geoland.framework.persistence.dao.impl.GenericDAO;
import com.geoland.kfis.model.EmployeeSalaryPayrollAdjustment;

/**
 * The Class EmployeeSalaryPayrollAdjustmentDAO.
 */
public class EmployeeSalaryPayrollAdjustmentDAO extends GenericDAO<EmployeeSalaryPayrollAdjustment, Long> {

	public List<EmployeeSalaryPayrollAdjustment> getEmployeeSalaryAdjustments(Long employeeId){
		String query = "select esd.* from thrm_employee_salary_payroll_adjustment as esd where employee_id = " + employeeId;
		return executeSQLQuery(query);
	}
	
	public List<EmployeeSalaryPayrollAdjustment> getEmployeeSalaryPayrollAdjustments(Long payrollId){
		String query = "select esd.* from thrm_employee_salary_payroll_adjustment as esd left join tfin_type as ftype on esd.fin_type_id = ftype.id where payroll_id = " + payrollId + " order by ftype.code asc";
		return executeSQLQuery(query);
	}
	
	public List<EmployeeSalaryPayrollAdjustment> getEmployeeSalaryDeductions(Long employeeId){
		String query = "select esd.* from thrm_employee_salary_payroll_adjustment as esd where deduction = true and employee_id = " + employeeId;
		return executeSQLQuery(query);
	}
	
	public List<EmployeeSalaryPayrollAdjustment> getEmployeeSalaryAdds(Long employeeId){
		String query = "select esd.* from thrm_employee_salary_payroll_adjustment as esd where deduction = false and employee_id = " + employeeId;
		return executeSQLQuery(query);
	}
	
	public boolean checkIfAdjustmentExists(Long employeeId, Long financeTypeId, Long fiscalYear, Short payMonth){
		String query = "select count(esd.*) from thrm_employee_salary_payroll_adjustment as esd left join thrm_employee_salary_payroll as pay on esd.payroll_id = pay.id where "
				+ " esd.employee_id = " + employeeId 
				+ " and esd.fin_type_id = " + financeTypeId
				+ " and pay.fiscal_year = " + fiscalYear
				+ " and pay.pay_month = " + payMonth;
		Integer countQuery = countQuery(query);
		if(countQuery > 0){
			return true;
		}else{
			return false;	
		}		
	}	
	
	public boolean checkIfEmployeeExists(Long employeeId){
		String query = "select count(es.*) from thrm_employee_salary_adjustment as es where employee_id = " + employeeId;
		Integer countQuery = countQuery(query);
		if(countQuery > 0){
			return true;
		}else{
			return false;	
		}		
	}		
}
