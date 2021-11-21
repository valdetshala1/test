package com.geoland.kfis.web.action.hrm.salary;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.FinancialType;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.persistence.dao.DAOFactory;

/**
 * 
 * Class SalarySaveAction
 * 
 * @author BEKIM BAJRAKTARI
 * @created 15.04.2020 09:30:53
 * @Version 1.0
 */
public class SalarySaveAction extends SalaryBaseAction {

	private static final long serialVersionUID = 1L;

	/**
	 * 1. finance type by deduction must be unique
	 * 2. if finance type is inserted, than other fields of deduction are required 
	 * 3. year salary is required. other field can be computed automatically
	 * 4. Additional or bonus can be inserted. 
	 * 4. Flag for automatic calculation should be add to salary DB table    
	 * 5. employee has unique salary. validation is active only when salary is new
	 */
	@Override
	public void validate() {
		
		/*validate salary for employee only by new salary*/
		if(salary.getId()==null) {
			if(salary.getEmployee().getId()==null) {
				addFieldError("salary.employee.firstName", getMessage("hrml.employee.salary.employee.empty"));
			}

			if(salary.getEmployee().getId()!=null) {
				boolean bEmplyoee = DAOFactory.getFactory().getEmployeeSalaryDAO().checkIfEmployeeSalaryExists(salary.getEmployee().getId());
				if(bEmplyoee) {
					addFieldError("salary.employee.firstName", getMessage("hrml.employee.salary.exists"));
				}
			}
		}
		
		if(adjustment.getAmountPercentage()!=null) {
			adjustment.setAmount(new BigDecimal(0.0));
		}else if(adjustment.getAmount()==null) {
			addFieldError("adjustment.amount", getMessage("hrml.employee.salary.adjustment.amount.empty"));
		}		

		Long financialTypeId = adjustment.getFinancialType().getId();
		if(financialTypeId!=null && salary.getEmployee().getId()!=null) {
			boolean bCheck = DAOFactory.getFactory().getEmployeeSalaryAdjustmentDAO().checkIfAdjustmentExists(salary.getEmployee().getId(), financialTypeId);
			if(bCheck) {
				addFieldError("deduction.financialType.name", getMessage("hrml.employee.salary.adjustment.financialType.name.exists"));
			}		
		}		
		
		if(salary.getBasicsalary()==null && salary.getGrosssalary()==null) {
			addFieldError("salary.basicsalary", getMessage("hrml.employee.salary.basicsalary.empty"));
			addFieldError("salary.grosssalary", getMessage("hrml.employee.salary.grosssalary.empty"));
		}
		
		
		if(salary.getEmployee().getId()!=null) {
			adjustments = DAOFactory.getFactory().getEmployeeSalaryAdjustmentDAO().getEmployeeSalaryAdjustments(salary.getEmployee().getId());
		}
		
		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exists", "true");
		}		
	}
	
	
	@Override
	public String execute() throws Exception {
		Person person = getUser().getPerson();
		Date createdDate = new Date();

		employee = DAOFactory.getFactory().getEmployeeDAO().get(salary.getEmployee().getId());
		
		BigDecimal basicsalary = salary.getBasicsalary();
		BigDecimal grosssalary = salary.getGrosssalary();
		
		if(basicsalary!=null && grosssalary==null) {
			BigDecimal divide = basicsalary.divide(new BigDecimal(12), RoundingMode.CEILING);
			salary.setGrosssalary(divide);
		}
		
		//if(grosssalary!=null && basicsalary==null) {
		if(grosssalary!=null) {
			BigDecimal multiply = grosssalary.multiply(new BigDecimal(12));
			salary.setBasicsalary(multiply);
		}
		
		
		salary.setCreatedBy(person);
		salary.setCreatedDate(createdDate);
		salary.setEmployee(employee);
		
		DAOFactory.getFactory().getEmployeeSalaryDAO().save(salary);
		
		
		Long financialTypeId = adjustment.getFinancialType().getId();
		if(financialTypeId!=null) {
			FinancialType financialType = DAOFactory.getFactory().getFinancialTypeDAO().get(financialTypeId);

			adjustment.setCreatedBy(person);
			adjustment.setCreatedDate(createdDate);
			adjustment.setEmployee(employee);
			adjustment.setEmployeeSalary(salary);
			
			BigDecimal amountPercentage = adjustment.getAmountPercentage();
			if(amountPercentage!=null) {
				amountPercentage = amountPercentage.divide(new BigDecimal(100.0));
				adjustment.setAmountPercentage(amountPercentage);
			}
			
			adjustment.setFinancialType(financialType);
			if(adjustment.getAdjustmentDate()==null) {
				adjustment.setAdjustmentDate(createdDate);
			}
			
			DAOFactory.getFactory().getEmployeeSalaryAdjustmentDAO().save(adjustment);
			
			adjustments = DAOFactory.getFactory().getEmployeeSalaryAdjustmentDAO().getEmployeeSalaryAdjustments(salary.getEmployee().getId());
		}
		
		return SUCCESS;
	}
}
