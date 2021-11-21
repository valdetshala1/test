package com.geoland.kfis.web.action.mer.execution.indicator;

import com.geoland.kfis.model.MerIndicator;
import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class IndicatorBaseAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Mar 25, 2015 , 2:23:21 PM
 */
public class IndicatorBaseAction extends BaseActionSupport {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The indicator. */
	protected MerIndicator indicator;
	
	/** The indicator id. */
	protected Long indicatorId;
	
	/**
	 * Gets the indicator.
	 *
	 * @return the indicator
	 */
	public MerIndicator getIndicator() {
		return indicator;
	}
	
	/**
	 * Sets the indicator.
	 *
	 * @param indicator the new indicator
	 */
	public void setIndicator(MerIndicator indicator) {
		this.indicator = indicator;
	}
	
	/**
	 * Gets the indicator id.
	 *
	 * @return the indicator id
	 */
	public Long getIndicatorId() {
		return indicatorId;
	}
	
	/**
	 * Sets the indicator id.
	 *
	 * @param indicatorId the new indicator id
	 */
	public void setIndicatorId(Long indicatorId) {
		this.indicatorId = indicatorId;
	}
	
	
	
	
	
	

}
