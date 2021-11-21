package com.geoland.kfis.persistence.dao.services;

import java.util.List;

import com.geoland.framework.persistence.dao.impl.GenericDAO;
import com.geoland.kfis.model.EmployeeSalaryDeductions;

/**
 * The Class EmployeeSalaryDeductionsDAO.
 */
public class EmployeeSalaryDeductionsDAO extends GenericDAO<EmployeeSalaryDeductions, Long> {
	
	public List<EmployeeSalaryDeductions> getEmployeeSalaryDeductions(Long employeeId){
		String query = "select esd.* from thrm_employee_salary_deductions as esd where employee_id = " + employeeId;
		return executeSQLQuery(query);
	}
	
	
	public boolean checkIfDeductionExists(Long employeeId, Long financeTypeId){
		String query = "select count(esd.*) from thrm_employee_salary_deductions as esd where employee_id = " + employeeId + " and fin_type_id = " + financeTypeId;
		Integer countQuery = countQuery(query);
		if(countQuery > 0){
			return true;
		}else{
			return false;	
		}		
	}
}
