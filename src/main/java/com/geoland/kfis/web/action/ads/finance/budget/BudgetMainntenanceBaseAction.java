package com.geoland.kfis.web.action.ads.finance.budget;

import com.geoland.kfis.model.BudgetMainntenance;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class BudgetMainntenanceBaseAction.
 *
 * @author Fisnik Aliu, GEO&LAND
 * @version 1.0
 * @created 11:38:20 AM, Sep 9, 2014
 */
public class BudgetMainntenanceBaseAction extends BaseActionSupport {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -229730245867604284L;
	
	/** The budget mainntenance id. */
	protected Long budgetMainntenanceId;
	
	/** The budget mainntenance. */
	protected BudgetMainntenance budgetMainntenance;
	
	/**
	 * Gets the budget mainntenance id.
	 *
	 * @return the budget mainntenance id
	 */
	public Long getBudgetMainntenanceId() {
		return budgetMainntenanceId;
	}
	
	/**
	 * Sets the budget mainntenance id.
	 *
	 * @param budgetMainntenanceId the new budget mainntenance id
	 */
	public void setBudgetMainntenanceId(Long budgetMainntenanceId) {
		this.budgetMainntenanceId = budgetMainntenanceId;
	}
	
	/**
	 * Gets the budget mainntenance.
	 *
	 * @return the budget mainntenance
	 */
	public BudgetMainntenance getBudgetMainntenance() {
		return budgetMainntenance;
	}
	
	/**
	 * Sets the budget mainntenance.
	 *
	 * @param budgetMainntenance the new budget mainntenance
	 */
	public void setBudgetMainntenance(BudgetMainntenance budgetMainntenance) {
		this.budgetMainntenance = budgetMainntenance;
	}
}
