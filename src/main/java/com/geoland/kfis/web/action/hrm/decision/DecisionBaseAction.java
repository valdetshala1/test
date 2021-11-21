package com.geoland.kfis.web.action.hrm.decision;

import java.util.List;

import com.geoland.kfis.model.Decision;
import com.geoland.kfis.model.DecisionEmployee;
import com.geoland.kfis.model.DecisionStatus;
import com.geoland.kfis.model.DecisionType;
import com.geoland.kfis.persistence.hibernate.usertypes.Hrmdecisionstatus;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class DecisionBaseAction.
 */
public class DecisionBaseAction extends BaseActionSupport{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The decision id. */
	protected Long decisionId;
	
	/** The decision. */
	protected Decision decision;
	
	/** The decision types. */
	protected List<DecisionType> decisionTypes;
	
	/** The doc names. */
	protected String docNames;
	
	/** The doc exts. */
	protected String docExts;
	
	/** The employee id list. */
	protected List<Long> employeeIdList;
	
	/** The doc names stat. */
	protected String docNamesStat;
	
	/** The doc exts stat. */
	protected String docExtsStat;
	
	/** The exists employees. */
	protected List<DecisionEmployee> existsEmployees;
	
	/** The status. */
	protected DecisionStatus status;
	
	/** The approved. */
	protected Hrmdecisionstatus approved = Hrmdecisionstatus.APPROVED;
	
	/** The rejected. */
	protected Hrmdecisionstatus rejected = Hrmdecisionstatus.REJECTED;
	
	/** The relase. */
	protected Hrmdecisionstatus relase = Hrmdecisionstatus.RELEASE;
	
	/** The decision status. */
	protected Hrmdecisionstatus decisionStatus;
	
	/** The relased. */
	protected boolean relased;
	
	/**
	 * Gets the decision id.
	 *
	 * @return the decision id
	 */
	public Long getDecisionId() {
		return decisionId;
	}
	
	/**
	 * Sets the decision id.
	 *
	 * @param decisionId the new decision id
	 */
	public void setDecisionId(Long decisionId) {
		this.decisionId = decisionId;
	}
	
	/**
	 * Gets the decision.
	 *
	 * @return the decision
	 */
	public Decision getDecision() {
		return decision;
	}
	
	/**
	 * Sets the decision.
	 *
	 * @param decision the new decision
	 */
	public void setDecision(Decision decision) {
		this.decision = decision;
	}
	
	/**
	 * Gets the decision types.
	 *
	 * @return the decision types
	 */
	public List<DecisionType> getDecisionTypes() {
		return decisionTypes;
	}
	
	/**
	 * Sets the decision types.
	 *
	 * @param decisionTypes the new decision types
	 */
	public void setDecisionTypes(List<DecisionType> decisionTypes) {
		this.decisionTypes = decisionTypes;
	}
	
	/**
	 * Gets the doc names.
	 *
	 * @return the doc names
	 */
	public String getDocNames() {
		return docNames;
	}
	
	/**
	 * Sets the doc names.
	 *
	 * @param docNames the new doc names
	 */
	public void setDocNames(String docNames) {
		this.docNames = docNames;
	}
	
	/**
	 * Gets the doc exts.
	 *
	 * @return the doc exts
	 */
	public String getDocExts() {
		return docExts;
	}
	
	/**
	 * Sets the doc exts.
	 *
	 * @param docExts the new doc exts
	 */
	public void setDocExts(String docExts) {
		this.docExts = docExts;
	}
	
	/**
	 * Gets the status.
	 *
	 * @return the status
	 */
	public DecisionStatus getStatus() {
		return status;
	}
	
	/**
	 * Sets the status.
	 *
	 * @param status the new status
	 */
	public void setStatus(DecisionStatus status) {
		this.status = status;
	}
	
	/**
	 * Gets the approved.
	 *
	 * @return the approved
	 */
	public Hrmdecisionstatus getApproved() {
		return approved;
	}
	
	/**
	 * Sets the approved.
	 *
	 * @param approved the new approved
	 */
	public void setApproved(Hrmdecisionstatus approved) {
		this.approved = approved;
	}
	
	/**
	 * Gets the rejected.
	 *
	 * @return the rejected
	 */
	public Hrmdecisionstatus getRejected() {
		return rejected;
	}
	
	/**
	 * Sets the rejected.
	 *
	 * @param rejected the new rejected
	 */
	public void setRejected(Hrmdecisionstatus rejected) {
		this.rejected = rejected;
	}
	
	/**
	 * Gets the relase.
	 *
	 * @return the relase
	 */
	public Hrmdecisionstatus getRelase() {
		return relase;
	}
	
	/**
	 * Sets the relase.
	 *
	 * @param relase the new relase
	 */
	public void setRelase(Hrmdecisionstatus relase) {
		this.relase = relase;
	}
	
	/**
	 * Gets the decision status.
	 *
	 * @return the decision status
	 */
	public Hrmdecisionstatus getDecisionStatus() {
		return decisionStatus;
	}
	
	/**
	 * Sets the decision status.
	 *
	 * @param decisionStatus the new decision status
	 */
	public void setDecisionStatus(Hrmdecisionstatus decisionStatus) {
		this.decisionStatus = decisionStatus;
	}
	
	/**
	 * Checks if is relased.
	 *
	 * @return true, if is relased
	 */
	public boolean isRelased() {
		return relased;
	}
	
	/**
	 * Sets the relased.
	 *
	 * @param relased the new relased
	 */
	public void setRelased(boolean relased) {
		this.relased = relased;
	}
	
	/**
	 * Gets the doc names stat.
	 *
	 * @return the doc names stat
	 */
	public String getDocNamesStat() {
		return docNamesStat;
	}
	
	/**
	 * Sets the doc names stat.
	 *
	 * @param docNamesStat the new doc names stat
	 */
	public void setDocNamesStat(String docNamesStat) {
		this.docNamesStat = docNamesStat;
	}
	
	/**
	 * Gets the doc exts stat.
	 *
	 * @return the doc exts stat
	 */
	public String getDocExtsStat() {
		return docExtsStat;
	}
	
	/**
	 * Sets the doc exts stat.
	 *
	 * @param docExtsStat the new doc exts stat
	 */
	public void setDocExtsStat(String docExtsStat) {
		this.docExtsStat = docExtsStat;
	}
	
	/**
	 * Gets the employee id list.
	 *
	 * @return the employee id list
	 */
	public List<Long> getEmployeeIdList() {
		return employeeIdList;
	}
	
	/**
	 * Sets the employee id list.
	 *
	 * @param employeeIdList the new employee id list
	 */
	public void setEmployeeIdList(List<Long> employeeIdList) {
		this.employeeIdList = employeeIdList;
	}
	
	/**
	 * Gets the exists employees.
	 *
	 * @return the exists employees
	 */
	public List<DecisionEmployee> getExistsEmployees() {
		return existsEmployees;
	}
	
	/**
	 * Sets the exists employees.
	 *
	 * @param existsEmployees the new exists employees
	 */
	public void setExistsEmployees(List<DecisionEmployee> existsEmployees) {
		this.existsEmployees = existsEmployees;
	}
	
}
