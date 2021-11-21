package com.geoland.kfis.web.action.mer.execution.indicator.subindicator;

import com.geoland.kfis.model.MerSubIndicator;
import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class SubIndicatorBaseAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Mar 25, 2015 , 2:23:21 PM
 */
public class SubIndicatorBaseAction extends BaseActionSupport {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The subindicator. */
	protected MerSubIndicator subindicator;
	
	/** The subindicator id. */
	protected Long subindicatorId;
	
	/** The indic id. */
	protected Long indicId;
	
	
	/**
	 * Gets the subindicator.
	 *
	 * @return the subindicator
	 */
	public MerSubIndicator getSubindicator() {
		return subindicator;
	}
	
	/**
	 * Sets the subindicator.
	 *
	 * @param subindicator the new subindicator
	 */
	public void setSubindicator(MerSubIndicator subindicator) {
		this.subindicator = subindicator;
	}
	
	/**
	 * Gets the subindicator id.
	 *
	 * @return the subindicator id
	 */
	public Long getSubindicatorId() {
		return subindicatorId;
	}
	
	/**
	 * Sets the subindicator id.
	 *
	 * @param subindicatorId the new subindicator id
	 */
	public void setSubindicatorId(Long subindicatorId) {
		this.subindicatorId = subindicatorId;
	}
	
	/**
	 * Gets the indic id.
	 *
	 * @return the indic id
	 */
	public Long getIndicId() {
		return indicId;
	}
	
	/**
	 * Sets the indic id.
	 *
	 * @param indicId the new indic id
	 */
	public void setIndicId(Long indicId) {
		this.indicId = indicId;
	}
	

}
