package com.geoland.kfis.web.action.hrm.decision;

import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Hrmdecisionstatus;

// TODO: Auto-generated Javadoc
/**
 * The Class DecisionAction.
 */
public class DecisionAction extends DecisionBaseAction{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		decisionTypes = DAOFactory.getFactory().getDecisionTypeDAO().
				executeSQLQuery("Select * from THRM_DECISION_TYPE ");
		if(decisionId!=null)
			decision = DAOFactory.getFactory().getDecisionDAO().get(decisionId);
		return "form";
	}
	
	/**
	 * List.
	 *
	 * @return the string
	 */
	public String list(){
		return "list";
	}
	
	/**
	 * Page.
	 *
	 * @return the string
	 */
	public String page(){
		decisionTypes = DAOFactory.getFactory().getDecisionTypeDAO().
				executeSQLQuery("Select * from THRM_DECISION_TYPE ");
		return "page";
	}
	
	/**
	 * Decision status.
	 *
	 * @return the string
	 */
	public String decisionStatus(){
		if(decisionId!=null){
			decision = DAOFactory.getFactory().getDecisionDAO().get(decisionId);
			Hrmdecisionstatus st = decision.getDecisionStatus().getStatus();
			if(st.equals(Hrmdecisionstatus.APPROVED))
				relased = true;
		}
		return "decisionStatus";
	}
}
