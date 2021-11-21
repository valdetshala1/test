package com.geoland.kfis.persistence.dao.services;

import com.geoland.framework.persistence.dao.impl.GenericDAO;
import com.geoland.kfis.model.EmployeeSalaryPayroll;

/**
 * The Class EmployeePayrollDAO.
 */
public class EmployeeSalaryPayrollDAO extends GenericDAO<EmployeeSalaryPayroll, Long> {

	public boolean checkIfAdjustmentExists(Long employeeId, Long financeTypeId){
		String query = "select count(esd.*) from thrm_employee_salary_payroll_adjustment as esd where employee_id = " + employeeId + " and fin_type_id = " + financeTypeId;
		Integer countQuery = countQuery(query);
		if(countQuery > 0){
			return true;
		}else{
			return false;	
		}		
	}	
}
