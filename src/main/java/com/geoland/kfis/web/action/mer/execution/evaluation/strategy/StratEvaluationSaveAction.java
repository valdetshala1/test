/**
 * 
 */
package com.geoland.kfis.web.action.mer.execution.evaluation.strategy;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Person;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.Constants;

// TODO: Auto-generated Javadoc
/**
 * The Class StratEvaluationSaveAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 1:42:08 PM, Mar 30, 2015
 */
public class StratEvaluationSaveAction extends StratEvaluationBaseAction {

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
		
		if(stratEval!=null && (stratEval.getMerIndicator()==null || (stratEval.getMerIndicator()!=null && stratEval.getMerIndicator().getId()==null)))
			addFieldError("stratEval.merIndicator", getMessage("stratEval.merIndicator.empty"));
		
		if(stratEval!=null && stratEval.getEvalDate()==null)
			addFieldError("stratEval.evalDate", getMessage("stratEval.evalDate.empty"));
		
		if(stratEval!=null && StringUtils.isEmpty(stratEval.getProgramResults()))
			addFieldError("stratEval.programResults", getMessage("stratEval.programResults.empty"));
		
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
		if(stratEval.getId()==null){
			stratEval.setCreatedDate(new Date());
			stratEval.setPerson(person);
		}
			
		DAOFactory.getFactory().getMerStratEvaluationDAO().save(stratEval);
		
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
