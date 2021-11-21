package com.geoland.kfis.web.action.hrm.payslip;

import java.io.IOException;

import com.geoland.kfis.persistence.dao.DAOFactory;

/**
 * Class PayslipAction
 * 
 * @author BEKIM BAJRAKTARI
 * @created 14.04.2020 22:16:54
 * @Version 1.0
 */
public class PayslipAction extends PayslipBaseAction {
	
	private static final long serialVersionUID = 1L;
	
	/**
	 * Form.
	 *
	 * @return the string
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public String form() throws IOException{
		if(payrollId != null){
			payroll = DAOFactory.getFactory().getEmployeeSalaryPayrollDAO().get(payrollId);
		}
		
		if(salaryId != null){
			salary = DAOFactory.getFactory().getEmployeeSalaryDAO().get(salaryId);
			adjustments = DAOFactory.getFactory().getEmployeeSalaryAdjustmentDAO().getEmployeeSalaryAdjustments(salary.getEmployee().getId());
		}		
		
		
		return "form";
	}
	
	/**
	 * List.
	 *
	 * @return the string
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public String list() throws IOException{
		return "list";
	}

	/**
	 * Grid.
	 *
	 * @return the string
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public String grid() throws IOException{
		return "grid";
	}

	/**
	 * Page.
	 *
	 * @return the string
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public String page() throws IOException{
		return "page";
	}
	

}
