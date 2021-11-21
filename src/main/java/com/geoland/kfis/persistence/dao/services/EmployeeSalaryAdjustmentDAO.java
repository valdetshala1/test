package com.geoland.kfis.persistence.dao.services;

import java.util.List;

import com.geoland.framework.persistence.dao.impl.GenericDAO;
import com.geoland.kfis.model.EmployeeSalaryAdjustment;

/**
 * The Class EmployeeSalaryAdjustmentDAO.
 */
public class EmployeeSalaryAdjustmentDAO extends GenericDAO<EmployeeSalaryAdjustment, Long> {

	public List<EmployeeSalaryAdjustment> getEmployeeSalaryAdjustments(Long employeeId){
		String query = "select esd.* from thrm_employee_salary_adjustment as esd where employee_id = " + employeeId;
		return executeSQLQuery(query);
	}
	
	public List<EmployeeSalaryAdjustment> getEmployeeSalaryDeductions(Long employeeId){
		String query = "select esd.* from thrm_employee_salary_adjustment as esd where deduction = true and employee_id = " + employeeId;
		return executeSQLQuery(query);
	}
	
	public List<EmployeeSalaryAdjustment> getEmployeeSalaryAdds(Long employeeId){
		String query = "select esd.* from thrm_employee_salary_adjustment as esd where deduction = false and employee_id = " + employeeId;
		return executeSQLQuery(query);
	}
		
	public boolean checkIfAdjustmentExists(Long employeeId, Long financeTypeId){
		String query = "select count(esd.*) from thrm_employee_salary_adjustment as esd where employee_id = " + employeeId + " and fin_type_id = " + financeTypeId;
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
