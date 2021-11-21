package com.geoland.kfis.web.action.mer.execution.indicator.subindicator.indicatortarget;

import com.geoland.kfis.model.MerIndicatorTarget;
import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class IndicatorTargetBaseAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Mar 25, 2015 , 2:23:21 PM
 */
public class IndicatorTargetBaseAction extends BaseActionSupport {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The indicator target. */
	protected MerIndicatorTarget indicatorTarget;
	
	/** The indicator target id. */
	protected Long indicatorTargetId;
	
	/** The sub indic id. */
	protected Long subIndicId;
	
	/** The s plan per. */
	protected String sPlanPer;
	
	/** The e plan per. */
	protected String ePlanPer;
	
	/**
	 * Gets the indicator target.
	 *
	 * @return the indicator target
	 */
	public MerIndicatorTarget getIndicatorTarget() {
		return indicatorTarget;
	}
	
	/**
	 * Sets the indicator target.
	 *
	 * @param indicatorTarget the new indicator target
	 */
	public void setIndicatorTarget(MerIndicatorTarget indicatorTarget) {
		this.indicatorTarget = indicatorTarget;
	}
	
	/**
	 * Gets the indicator target id.
	 *
	 * @return the indicator target id
	 */
	public Long getIndicatorTargetId() {
		return indicatorTargetId;
	}
	
	/**
	 * Sets the indicator target id.
	 *
	 * @param indicatorTargetId the new indicator target id
	 */
	public void setIndicatorTargetId(Long indicatorTargetId) {
		this.indicatorTargetId = indicatorTargetId;
	}
	
	/**
	 * Gets the sub indic id.
	 *
	 * @return the sub indic id
	 */
	public Long getSubIndicId() {
		return subIndicId;
	}
	
	/**
	 * Sets the sub indic id.
	 *
	 * @param subIndicId the new sub indic id
	 */
	public void setSubIndicId(Long subIndicId) {
		this.subIndicId = subIndicId;
	}
	
	/**
	 * Gets the s plan per.
	 *
	 * @return the s plan per
	 */
	public String getsPlanPer() {
		return sPlanPer;
	}
	
	/**
	 * Sets the s plan per.
	 *
	 * @param sPlanPer the new s plan per
	 */
	public void setsPlanPer(String sPlanPer) {
		this.sPlanPer = sPlanPer;
	}
	
	/**
	 * Gets the e plan per.
	 *
	 * @return the e plan per
	 */
	public String getePlanPer() {
		return ePlanPer;
	}
	
	/**
	 * Sets the e plan per.
	 *
	 * @param ePlanPer the new e plan per
	 */
	public void setePlanPer(String ePlanPer) {
		this.ePlanPer = ePlanPer;
	}


	

}
