/**
 * 
 */
package com.geoland.kfis.web.action.mer.strategy.planperiod;

import com.geoland.kfis.model.MerPlanPeriod;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class PlanPeriodBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 4:19:44 PM, Mar 25, 2015
 */
public class PlanPeriodBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 2782690743189592620L;

	/** The period id. */
	protected Long periodId;
	
	/** The period. */
	protected MerPlanPeriod period;
	
	/**
	 * Gets the period id.
	 *
	 * @return the periodId
	 */
	public Long getPeriodId() {
		return periodId;
	}
	
	/**
	 * Sets the period id.
	 *
	 * @param periodId the periodId to set
	 */
	public void setPeriodId(Long periodId) {
		this.periodId = periodId;
	}
	
	/**
	 * Gets the period.
	 *
	 * @return the period
	 */
	public MerPlanPeriod getPeriod() {
		return period;
	}
	
	/**
	 * Sets the period.
	 *
	 * @param period the period to set
	 */
	public void setPeriod(MerPlanPeriod period) {
		this.period = period;
	}
}
