package com.geoland.kfis.web.action.ads.finance.output;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Financialtype;
import com.geoland.kfis.persistence.hibernate.usertypes.Finoutputtype;
import com.geoland.kfis.persistence.hibernate.usertypes.Month;
// TODO: Auto-generated Javadoc

/**
 * The Class FinancialOutputSaveAction.
 *
 * @author ADELINA GASHI, GEO&LAND
 * @created Sep 4, 2014 2:01:34 PM
 * @Version 1.0
 */
public class FinancialOutputSaveAction extends FinancialOutputBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 3973438456242160611L;
	
	/** The employee. */
	private Employee employee;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		employee=getUser().getEmployee();
		if(employee==null)
			addActionError("");
		
		if(financialOutput!=null && StringUtils.isEmpty(financialOutput.getUopNumber()))
			addFieldError("financialOutput.uopNumber", getMessage("fin.output.uopNumber.empty"));
		
		if(financialOutput!=null && StringUtils.isEmpty(financialOutput.getEconomicCode()))
			addFieldError("financialOutput.economicCode", getMessage("fin.output.economicCode.empty"));
		
		if(financialOutput!=null && financialOutput.getFreeBalance()==null)
			addFieldError("financialOutput.freeBalance", getMessage("fin.output.freeBalance.empty"));
		
		if(financialOutput!=null && financialOutput.getValueInEuro()==null)
			addFieldError("financialOutput.valueInEuro", getMessage("fin.output.valueInEuro.empty"));
		
		if(financialOutput.getOrganisation()!=null && financialOutput.getOrganisation().getId()==null) {
			addFieldError("financialOutput.organisation.id", getMessage("fin.output.department.empty"));
		}
		if(financialOutput!=null && financialOutput.getDateOfCommitment()==null) {
			addFieldError("financialOutput.dateOfCommitment", getMessage("fin.output.date.of.commitment.empty"));
		}
		/*
		if(financialOutput!=null && financialOutput.getPaymentDate()==null) {
			addFieldError("financialOutput.paymentDate", getMessage("fin.output.payment.date.empty"));
		}
		*/
		
		if(financialOutput!=null  && financialOutput.getOutputType()==Finoutputtype.COSTS){
			if(financialOutput.getFinancialType().getId()==null){
				addFieldError("financialOutput.financialType", getMessage("fin.output.financialType.empty"));
			}
		}else {
			if(financialOutput!=null && (financialOutput.getFinancialType()==null || financialOutput.getFinancialType().getId()==null))
				financialOutput.setFinancialType(null);
			
		}
		if(financialOutput.getOrganisation()==null || financialOutput.getOrganisation().getId()==null)
			financialOutput.setOrganisation(null);
		 
		if(!getFieldErrors().isEmpty()) {
			HttpServletResponse response=ServletActionContext.getResponse();
			response.addHeader("errors_exist", "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		financialOutput.setEmployee(employee);
		financialOutput.setCreatedTime(new Date());
		financialOutput.setCurrentUser(getUser().getUser());
		
		LocalDate localDate = financialOutput.getDateOfCommitment().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		int month = localDate.getMonthValue();
		Month[] values = Month.values();
		for (int i = 0; i < values.length; i++) {
			Month mo = values[i];
			if(mo.getSORT()==month) {
				financialOutput.setMonth(mo);		
			}
		}
		
		DAOFactory.getFactory().getFinancialOutputDAO().save(financialOutput);
		
		return SUCCESS;
	}

	/**
	 * Gets the employee.
	 *
	 * @return the employee
	 */
	public Employee getEmployee() {
		return employee;
	}

	/**
	 * Sets the employee.
	 *
	 * @param employee the employee to set
	 */
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
}
