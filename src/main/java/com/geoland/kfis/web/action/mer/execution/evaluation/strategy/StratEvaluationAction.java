/**
 * 
 */
package com.geoland.kfis.web.action.mer.execution.evaluation.strategy;

import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class StratEvaluationAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 1:41:01 PM, Mar 30, 2015
 */
public class StratEvaluationAction extends StratEvaluationBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(stratEvalId!=null)
			setStratEval(DAOFactory.getFactory().getMerStratEvaluationDAO().get(stratEvalId));
		
		return "form";
	}
	
	/**
	 * Grid.
	 *
	 * @return the string
	 */
	public String grid(){
		return "grid";
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
