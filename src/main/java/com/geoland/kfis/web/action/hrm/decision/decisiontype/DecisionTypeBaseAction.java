package com.geoland.kfis.web.action.hrm.decision.decisiontype;

import com.geoland.kfis.model.DecisionType;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class DecisionTypeBaseAction.
 */
public class DecisionTypeBaseAction extends BaseActionSupport{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The decision type id. */
	protected Long decisionTypeId;
	
	/** The decision type. */
	protected DecisionType decisionType;
	
	
	/**
	 * Gets the decision type id.
	 *
	 * @return the decision type id
	 */
	public Long getDecisionTypeId() {
		return decisionTypeId;
	}
	
	/**
	 * Sets the decision type id.
	 *
	 * @param decisionTypeId the new decision type id
	 */
	public void setDecisionTypeId(Long decisionTypeId) {
		this.decisionTypeId = decisionTypeId;
	}
	
	/**
	 * Gets the decision type.
	 *
	 * @return the decision type
	 */
	public DecisionType getDecisionType() {
		return decisionType;
	}
	
	/**
	 * Sets the decision type.
	 *
	 * @param decisionType the new decision type
	 */
	public void setDecisionType(DecisionType decisionType) {
		this.decisionType = decisionType;
	}
}
