/**
 * 
 */
package com.geoland.kfis.web.action.mer.execution.evaluation.performance;

import com.geoland.kfis.persistence.dao.DAOFactory;


// TODO: Auto-generated Javadoc
/**
 * The Class PerfEvaluationAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Mar 31, 2015 , 9:12:24 AM
 */
public class PerfEvaluationAction extends PerfEvaluationBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(perfEvaluationId!=null){
			perfEvaluation=DAOFactory.getFactory().getMerPerfEvaluationDAO().get(perfEvaluationId);
		}
		
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
