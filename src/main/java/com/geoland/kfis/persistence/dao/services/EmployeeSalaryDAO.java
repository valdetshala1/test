package com.geoland.kfis.persistence.dao.services;

import java.util.List;

import com.geoland.framework.persistence.dao.impl.GenericDAO;
import com.geoland.kfis.model.EmployeeSalary;

/**
 * The Class EmployeeSalaryDAO.
 */
public class EmployeeSalaryDAO extends GenericDAO<EmployeeSalary, Long> {

	/**
	 * checkIfEmployeeExists
	 * @param employeeId
	 * @return boolean
	 */
	public boolean checkIfEmployeeSalaryExists(Long employeeId){
		String query = "select count(es.*) from thrm_employee_salary as es where employee_id = " + employeeId;
		Integer countQuery = countQuery(query);
		if(countQuery > 0){
			return true;
		}else{
			return false;	
		}		
	}	
	
	
	public boolean checkIfEmployeeWithPayslipExists(Long employeeId, Long fiscalYear, Short payMonth){
		StringBuilder query = new StringBuilder();
		query.append("select count(pr.*) from thrm_employee_salary as es left join thrm_employee_salary_payroll as pr on es.employee_id = pr.employee_id ");
		query.append("where pr.employee_id = " + employeeId );
		query.append(" and es.employee_id in (select pay.employee_id from thrm_employee_salary_payroll as pay where pay.fiscal_year = " + fiscalYear + " and pay.pay_month = " + payMonth + ")");

		Integer countQuery = countQuery(query.toString());
		if(countQuery > 0){
			return true;
		}else{
			return false;	
		}		
	}
	
	/**
	 * getEmployeeWithoutPayslip
	 * @param fiscalYear
	 * @param payMonth
	 * @return List<EmployeeSalary>
	 */
	public List<EmployeeSalary> getEmployeeWithoutPayslip(Long fiscalYear, Short payMonth){
		StringBuilder query = new StringBuilder();
		query.append("select distinct es.* from thrm_employee_salary as es left join thrm_employee_salary_payroll as pr on es.employee_id = pr.employee_id ");
		query.append("where es.employee_id not in (select pay.employee_id from thrm_employee_salary_payroll as pay where pay.fiscal_year = " + fiscalYear + " and pay.pay_month = " + payMonth + ")");
	
		return executeSQLQuery(query.toString());
	}	
	
}
