/**
 * 
 */
package com.geoland.kfis.web.action.mer.execution.evaluation.performance;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Person;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.Constants;
// TODO: Auto-generated Javadoc

/**
 * The Class PerfEvaluationSaveAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Mar 31, 2015 , 9:17:33 AM
 */
public class PerfEvaluationSaveAction extends PerfEvaluationBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 8823869009570058291L;
	
	/** The person. */
	private Person person;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		person=getUser().getPerson();
		if(person==null)
			addActionError("");
		if(perfEvaluation!=null && perfEvaluation.getEvalDate()==null)
			addFieldError("perfEvaluation.evalDate", getMessage("mer.perfEvaluation.evalDate.empty"));
//		if(perfEvaluation!=null && perfEvaluation.getTarget()==null)
//			addFieldError("perfEvaluation.target", getMessage("mer.perfEvaluation.target.empty"));
		if(perfEvaluation!=null && perfEvaluation.getActual()==null)
			addFieldError("perfEvaluation.actual", getMessage("mer.perfEvaluation.actual.empty"));
		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response=ServletActionContext.getResponse();
			response.addHeader(Constants.ERRORS_EXITS, "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		if(perfEvaluation.getId()==null){
			perfEvaluation.setCreatedDate(new Date());
			perfEvaluation.setPerson(person);
		}
		DAOFactory.getFactory().getMerPerfEvaluationDAO().save(perfEvaluation);	
		return SUCCESS;
	}

	/**
	 * Gets the person.
	 *
	 * @return the person
	 */
	public Person getPerson() {
		return person;
	}

	/**
	 * Sets the person.
	 *
	 * @param person the person to set
	 */
	public void setPerson(Person person) {
		this.person = person;
	}
}
