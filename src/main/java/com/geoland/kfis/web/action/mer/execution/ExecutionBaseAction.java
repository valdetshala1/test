package com.geoland.kfis.web.action.mer.execution;

import com.geoland.kfis.model.MerStrategyExecution;
import com.geoland.kfis.persistence.hibernate.usertypes.Merstrategystatus;
import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class ExecutionBaseAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Mar 25, 2015 , 2:23:21 PM
 */
public class ExecutionBaseAction extends BaseActionSupport {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The execution. */
	protected MerStrategyExecution execution;
	
	/** The execution id. */
	protected Long executionId;
	
	/** The strat id. */
	protected Long stratId;
	
	/** The merstrategystatus list. */
	protected Merstrategystatus[] merstrategystatusList=Merstrategystatus.values();
	
	/** The org id. */
	protected Long org_id;
	
	/** The start plan period. */
	protected Long startPlanPeriod;
	
	/** The end plan period. */
	protected Long endPlanPeriod;
	
	/**
	 * Gets the execution.
	 *
	 * @return the execution
	 */
	public MerStrategyExecution getExecution() {
		return execution;
	}
	
	/**
	 * Sets the execution.
	 *
	 * @param execution the new execution
	 */
	public void setExecution(MerStrategyExecution execution) {
		this.execution = execution;
	}
	
	/**
	 * Gets the execution id.
	 *
	 * @return the execution id
	 */
	public Long getExecutionId() {
		return executionId;
	}
	
	/**
	 * Sets the execution id.
	 *
	 * @param executionId the new execution id
	 */
	public void setExecutionId(Long executionId) {
		this.executionId = executionId;
	}
	
	/**
	 * Gets the strat id.
	 *
	 * @return the strat id
	 */
	public Long getStratId() {
		return stratId;
	}
	
	/**
	 * Sets the strat id.
	 *
	 * @param stratId the new strat id
	 */
	public void setStratId(Long stratId) {
		this.stratId = stratId;
	}
	
	/**
	 * Gets the merstrategystatus list.
	 *
	 * @return the merstrategystatus list
	 */
	public Merstrategystatus[] getMerstrategystatusList() {
		return merstrategystatusList;
	}
	
	/**
	 * Sets the merstrategystatus list.
	 *
	 * @param merstrategystatusList the new merstrategystatus list
	 */
	public void setMerstrategystatusList(Merstrategystatus[] merstrategystatusList) {
		this.merstrategystatusList = merstrategystatusList;
	}
	
	/**
	 * Gets the org id.
	 *
	 * @return the org_id
	 */
	public Long getOrg_id() {
		return org_id;
	}
	
	/**
	 * Sets the org id.
	 *
	 * @param org_id the org_id to set
	 */
	public void setOrg_id(Long org_id) {
		this.org_id = org_id;
	}
	
	/**
	 * Gets the start plan period.
	 *
	 * @return the start plan period
	 */
	public Long getStartPlanPeriod() {
		return startPlanPeriod;
	}
	
	/**
	 * Sets the start plan period.
	 *
	 * @param startPlanPeriod the new start plan period
	 */
	public void setStartPlanPeriod(Long startPlanPeriod) {
		this.startPlanPeriod = startPlanPeriod;
	}
	
	/**
	 * Gets the end plan period.
	 *
	 * @return the end plan period
	 */
	public Long getEndPlanPeriod() {
		return endPlanPeriod;
	}
	
	/**
	 * Sets the end plan period.
	 *
	 * @param endPlanPeriod the new end plan period
	 */
	public void setEndPlanPeriod(Long endPlanPeriod) {
		this.endPlanPeriod = endPlanPeriod;
	}
	


	
	

}
