package com.geoland.kfis.web.action.ads.finance.budget;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class BudgetMainntenanceSaveAction.
 *
 * @author Fisnik Aliu, GEO&LAND
 * @version 1.0
 * @created 11:59:13 AM, Sep 9, 2014
 */
public class BudgetMainntenanceSaveAction extends BudgetMainntenanceBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 7576799999801777449L;
	
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

		if (budgetMainntenance.getFinancialType() != null && budgetMainntenance.getFinancialType().getId() == null) {
			addFieldError("budgetMainntenance.financialType", getMessage("budget.mainntenance.financial.type.validate"));
		}
		if (StringUtils.isEmpty(budgetMainntenance.getBudgetCode().trim())) {
			addFieldError("budgetMainntenance.budgetCode", getMessage("budget.mainntenance.budget.code.validate"));
		}

		if (budgetMainntenance.getBudgetYear()==null) {
			addFieldError("budgetMainntenance.budgetYear", getMessage("budget.mainntenance.budget.year.validate"));
		}		
		
		if(budgetMainntenance.getBugetUtilizationInPercent()!=null && budgetMainntenance.getBugetUtilizationInPercent()>100)
			addFieldError("budgetMainntenance.bugetUtilizationInPercent", getMessage("budget.mainntenance.budget.utilization.in.percent.large.value"));
		if (!getFieldErrors().isEmpty()) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exits", "true");
		}
	}

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		budgetMainntenance.setEmployee(employee);
		budgetMainntenance.setCreatedDate(new Date());
		budgetMainntenance.setCurrentUser(getUser().getUser());
		DAOFactory.getFactory().getBudgetMainntenanceDAO().save(budgetMainntenance);
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
