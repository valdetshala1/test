/**
 * 
 */
package com.geoland.kfis.web.action.frm.dhpet.periodplan;

import com.geoland.kfis.model.DhpetPeriodPlan;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class PeriodPlanBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Dec 17, 2015, 10:19:37 AM
 */
public class PeriodPlanBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -5958294613493959335L;

	/** The period id. */
	protected Long periodId;
	
	/** The period. */
	protected DhpetPeriodPlan period;
	
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
	public DhpetPeriodPlan getPeriod() {
		return period;
	}
	
	/**
	 * Sets the period.
	 *
	 * @param period the period to set
	 */
	public void setPeriod(DhpetPeriodPlan period) {
		this.period = period;
	}
	
}
