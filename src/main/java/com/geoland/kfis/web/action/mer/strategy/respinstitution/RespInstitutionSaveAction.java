/**
 * 
 */
package com.geoland.kfis.web.action.mer.strategy.respinstitution;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Person;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.Constants;

// TODO: Auto-generated Javadoc
/**
 * The Class RespInstitutionSaveAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 1:44:19 PM, Mar 26, 2015
 */
public class RespInstitutionSaveAction extends RespInstitutionBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 4764643621578827663L;

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

		if(institution!=null && (institution.getMerStrategy()==null || (institution.getMerStrategy()!=null && institution.getMerStrategy().getId()==null)))
			addFieldError("institution.merStrategy", getMessage("institution.merStrategy.empty"));
		
		if(institution!=null && (institution.getOrganisation()==null || (institution.getOrganisation()!=null && institution.getOrganisation().getId()==null)))
			addFieldError("institution.organisation", getMessage("vehicle.organisation.empty"));
		
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
		if(institution.getId()==null){
			institution.setCreatedDate(new Date());
			institution.setPerson(person);
		}
		
		DAOFactory.getFactory().getMerRespInstitutionDAO().save(institution);
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
