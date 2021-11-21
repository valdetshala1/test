/**
 * 
 */
package com.geoland.kfis.web.action.mer.execution.evaluation.strategy;

import com.geoland.kfis.model.MerStratEvaluation;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class StratEvaluationBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 1:39:54 PM, Mar 30, 2015
 */
public class StratEvaluationBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -8415160646511090662L;

	/** The strat eval id. */
	protected Long stratEvalId;
	
	/** The strat eval. */
	protected MerStratEvaluation stratEval;
	
	/**
	 * Gets the strat eval id.
	 *
	 * @return the stratEvalId
	 */
	public Long getStratEvalId() {
		return stratEvalId;
	}
	
	/**
	 * Sets the strat eval id.
	 *
	 * @param stratEvalId the stratEvalId to set
	 */
	public void setStratEvalId(Long stratEvalId) {
		this.stratEvalId = stratEvalId;
	}
	
	/**
	 * Gets the strat eval.
	 *
	 * @return the stratEval
	 */
	public MerStratEvaluation getStratEval() {
		return stratEval;
	}
	
	/**
	 * Sets the strat eval.
	 *
	 * @param stratEval the stratEval to set
	 */
	public void setStratEval(MerStratEvaluation stratEval) {
		this.stratEval = stratEval;
	}
	
}
