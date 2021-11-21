package com.geoland.kfis.web.action.hrm.decision.decisiontype;

import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class DecisionTypeAction.
 */
public class DecisionTypeAction extends DecisionTypeBaseAction{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(decisionTypeId!=null)
			decisionType = DAOFactory.getFactory().getDecisionTypeDAO().get(decisionTypeId);
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
		return "page";
	}
}
