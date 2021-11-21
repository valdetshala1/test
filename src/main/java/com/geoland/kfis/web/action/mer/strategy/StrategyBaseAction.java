/**
 * 
 */
package com.geoland.kfis.web.action.mer.strategy;

import com.geoland.kfis.model.MerStrategy;
import com.geoland.kfis.model.MerStrategyDoc;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class StrategyBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 5:18:11 PM, Mar 25, 2015
 */
public class StrategyBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -3259829601560327039L;
	
	/** The strategy id. */
	protected Long strategyId;
	
	/** The strategy. */
	protected MerStrategy strategy;
	
	/** The doc. */
	protected MerStrategyDoc doc;
	
	/**
	 * Gets the strategy id.
	 *
	 * @return the strategyId
	 */
	public Long getStrategyId() {
		return strategyId;
	}
	
	/**
	 * Sets the strategy id.
	 *
	 * @param strategyId the strategyId to set
	 */
	public void setStrategyId(Long strategyId) {
		this.strategyId = strategyId;
	}
	
	/**
	 * Gets the strategy.
	 *
	 * @return the strategy
	 */
	public MerStrategy getStrategy() {
		return strategy;
	}
	
	/**
	 * Sets the strategy.
	 *
	 * @param strategy the strategy to set
	 */
	public void setStrategy(MerStrategy strategy) {
		this.strategy = strategy;
	}
	
	/**
	 * Gets the doc.
	 *
	 * @return the doc
	 */
	public MerStrategyDoc getDoc() {
		return doc;
	}
	
	/**
	 * Sets the doc.
	 *
	 * @param doc the doc to set
	 */
	public void setDoc(MerStrategyDoc doc) {
		this.doc = doc;
	}
	
	
}
