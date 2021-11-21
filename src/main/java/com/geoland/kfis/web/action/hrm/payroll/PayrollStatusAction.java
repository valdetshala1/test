package com.geoland.kfis.web.action.hrm.payroll;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.EmployeeSalaryPayroll;
import com.geoland.kfis.persistence.dao.DAOFactory;

/**
 * 
 * Class PayrollStatusAction
 * 
 * @author BEKIM BAJRAKTARI
 * @created 15.04.2020 09:30:53
 * @Version 1.0
 */
public class PayrollStatusAction extends PayrollBaseAction {

	private static final long serialVersionUID = 1L;
	protected String cmd; 

	@Override
	public void validate() {
		
		if(payrollId==null) {
			addFieldError("payroll.employee.firstName", getMessage("hrml.employee.salary.exists"));
		}
		
		boolean taxRatesExists = DAOFactory.getFactory().getEmployeeSalaryTaxRatesDAO().checkIfTaxRatesExists();
		if(!taxRatesExists) {
			addFieldError("payroll.employee.firstName", getMessage("hrml.employee.salary.taxrates.empty"));
			addFieldError("hrml.employee.salary.taxrates.empty", getMessage("hrml.employee.salary.taxrates.empty"));
			addActionError(getMessage("hrml.employee.salary.taxrates.empty"));
		}
		
		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exists", "true");
		}		
	}
	
	
	@Override
	public String execute() throws Exception {
		if(PayrollStatus.CAL.name() .equals(cmd)){
			cal(payrollId);
		}else if(PayrollStatus.FIN.name() .equals(cmd)){
			cal(payrollId);
			fin(payrollId);
		}
		
		loadPayroll(payrollId);

		return SUCCESS;	
	}
	
	protected void fin(Long payrollId) {
		EmployeeSalaryPayroll esp = DAOFactory.getFactory().getEmployeeSalaryPayrollDAO().get(payrollId);
		esp.setStatus(PayrollStatus.FIN.name() );
		esp.setFinDate(new Date());
		DAOFactory.getFactory().getEmployeeSalaryPayrollDAO().save(esp);	
	}
	

	public String getCmd() {
		return cmd;
	}


	public void setCmd(String cmd) {
		this.cmd = cmd;
	}
	

	

}
