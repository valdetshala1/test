package com.geoland.kfis.persistence.dao.services;

import com.geoland.framework.persistence.dao.impl.GenericDAO;
import com.geoland.kfis.model.EmployeeSalaryTaxRates;

/**
 * The Class EmployeeSalaryTaxRatesDAO.
 */
public class EmployeeSalaryTaxRatesDAO extends GenericDAO<EmployeeSalaryTaxRates, Long> {

	
	public boolean checkIfTaxRatesExists(){
		String query = "select count(r.*) from thrm_employee_salary_tax_rates as r ";
		Integer countQuery = countQuery(query);
		if(countQuery > 0){
			return true;
		}else{
			return false;	
		}		
	}
	
}
