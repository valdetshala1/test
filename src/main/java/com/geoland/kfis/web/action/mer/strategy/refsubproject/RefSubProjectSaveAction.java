/**
 * 
 */
package com.geoland.kfis.web.action.mer.strategy.refsubproject;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Person;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.Constants;

// TODO: Auto-generated Javadoc
/**
 * The Class RefSubProjectSaveAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 4:09:41 PM, Mar 27, 2015
 */
public class RefSubProjectSaveAction extends RefSubProjectBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

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

		if(refSubProject!=null && (refSubProject.getMerStrategyByRefStrategyId()==null || (refSubProject.getMerStrategyByRefStrategyId()!=null && refSubProject.getMerStrategyByRefStrategyId().getId()==null)))
			addFieldError("refSubProject.merSubProject", getMessage("strategy.refMerSubProject.empty"));
		else refSubProject.setMerStrategyByRefStrategyId(DAOFactory.getFactory().getMerStrategyDAO().get(refSubProject.getMerStrategyByRefStrategyId().getId()));
		
		if(refSubProject!=null && (refSubProject.getMerStrategyByStrategyId()==null || (refSubProject.getMerStrategyByStrategyId()!=null && refSubProject.getMerStrategyByStrategyId().getId()==null)))
			addFieldError("refSubProject.merSubProject", getMessage("strategy.merSubProject.empty"));
		
		
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
		if(refSubProject.getId()==null){
			refSubProject.setCreatedDate(new Date());
			refSubProject.setPerson(person);
		}
		
		DAOFactory.getFactory().getMerRefSubProjectDAO().save(refSubProject);
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
