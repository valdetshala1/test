/**
 * 
 */
package com.geoland.kfis.web.action.mer.execution.evaluation.performance;

import com.geoland.kfis.model.MerPerfEvaluation;
import com.geoland.kfis.web.action.base.BaseActionSupport;


// TODO: Auto-generated Javadoc
/**
 * The Class PerfEvaluationBaseAction.
 */
public class PerfEvaluationBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -8415160646511090662L;
	
	/** The perf evaluation. */
	protected MerPerfEvaluation   perfEvaluation;
	
	/** The perf evaluation id. */
	protected Long perfEvaluationId;
	
	/** The sub indic id. */
	protected Long subIndicId;
	
	/**
	 * Gets the perf evaluation.
	 *
	 * @return the perf evaluation
	 */
	public MerPerfEvaluation getPerfEvaluation() {
		return perfEvaluation;
	}
	
	/**
	 * Sets the perf evaluation.
	 *
	 * @param perfEvaluation the new perf evaluation
	 */
	public void setPerfEvaluation(MerPerfEvaluation perfEvaluation) {
		this.perfEvaluation = perfEvaluation;
	}
	
	/**
	 * Gets the perf evaluation id.
	 *
	 * @return the perf evaluation id
	 */
	public Long getPerfEvaluationId() {
		return perfEvaluationId;
	}
	
	/**
	 * Sets the perf evaluation id.
	 *
	 * @param perfEvaluationId the new perf evaluation id
	 */
	public void setPerfEvaluationId(Long perfEvaluationId) {
		this.perfEvaluationId = perfEvaluationId;
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

}
