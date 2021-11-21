package com.geoland.kfis.web.action.ads.finance.output;

import com.geoland.kfis.model.FinancialOutput;
import com.geoland.kfis.persistence.hibernate.usertypes.Finoutputtype;
import com.geoland.kfis.persistence.hibernate.usertypes.Month;
import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class FinancialOutputBaseAction.
 *
 * @author ADELINA GASHI, GEO&LAND
 * @created Sep 4, 2014 1:59:31 PM
 * @Version 1.0
 */

public class FinancialOutputBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 3973438456242160611L;
	
	/** The financial output. */
	protected FinancialOutput financialOutput;
	
	/** The financial output id. */
	protected Long financialOutputId;
	
	/** The salary. */
	protected Finoutputtype salary=Finoutputtype.SALARY;
	
	/** The costs. */
	protected Finoutputtype costs=Finoutputtype.COSTS;
	
	/** The month list. */
	protected Month[] monthList=Month.values();
	
	protected String financialTypeName;
	
	/**
	 * Gets the financial output.
	 *
	 * @return the financial output
	 */
	public FinancialOutput getFinancialOutput() {
		return financialOutput;
	}
	
	/**
	 * Sets the financial output.
	 *
	 * @param financialOutput the new financial output
	 */
	public void setFinancialOutput(FinancialOutput financialOutput) {
		this.financialOutput = financialOutput;
	}
	
	/**
	 * Gets the financial output id.
	 *
	 * @return the financial output id
	 */
	public Long getFinancialOutputId() {
		return financialOutputId;
	}
	
	/**
	 * Gets the month list.
	 *
	 * @return the month list
	 */
	public Month[] getMonthList() {
		return monthList;
	}
	
	/**
	 * Sets the month list.
	 *
	 * @param monthList the new month list
	 */
	public void setMonthList(Month[] monthList) {
		this.monthList = monthList;
	}
	
	/**
	 * Sets the financial output id.
	 *
	 * @param financialOutputId the new financial output id
	 */
	public void setFinancialOutputId(Long financialOutputId) {
		this.financialOutputId = financialOutputId;
	}
	
	/**
	 * Gets the salary.
	 *
	 * @return the salary
	 */
	public Finoutputtype getSalary() {
		return salary;
	}
	
	/**
	 * Sets the salary.
	 *
	 * @param salary the new salary
	 */
	public void setSalary(Finoutputtype salary) {
		this.salary = salary;
	}
	
	/**
	 * Gets the costs.
	 *
	 * @return the costs
	 */
	public Finoutputtype getCosts() {
		return costs;
	}
	
	/**
	 * Sets the costs.
	 *
	 * @param costs the new costs
	 */
	public void setCosts(Finoutputtype costs) {
		this.costs = costs;
	}
	

	public String getFinancialTypeName() {
		return financialTypeName;
	}
	
	public void setFinancialTypeName(String financialTypeName) {
		this.financialTypeName = financialTypeName;
	}
}
