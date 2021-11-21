package com.geoland.kfis.persistence.dao.services;

import com.geoland.framework.persistence.dao.impl.GenericDAO;
import com.geoland.kfis.model.EmployeeSalaryAdds;

/**
 * The Class EmployeeSalaryAdjustmentDAO.
 */
public class EmployeeSalaryAddsDAO extends GenericDAO<EmployeeSalaryAdds, Long> {

	public boolean checkIfEmployeeExists(Long employeeId){
		String query = "select count(es.*) from thrm_employee_salary_adds as es where employee_id = " + employeeId;
		Integer countQuery = countQuery(query);
		if(countQuery > 0){
			return true;
		}else{
			return false;	
		}		
	}	
}
