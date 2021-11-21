/**
 * 
 */
package com.geoland.kfis.web.action.mer.strategy.planperiod;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Person;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.Constants;

// TODO: Auto-generated Javadoc
/**
 * The Class PlanPeriodSaveAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 4:22:32 PM, Mar 25, 2015
 */
public class PlanPeriodSaveAction extends PlanPeriodBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 8663746509431551957L;
	
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
		
		if(period!=null && period.getStartYear()==null)
			addFieldError("period.startYear", getMessage("period.startYear.empty"));
		
		if(period!=null && period.getEndYear()==null)
			addFieldError("period.endYear", getMessage("period.endYear.empty"));
		if(period.getStartYear()!=null && period.getEndYear()!=null && period.getStartYear()>period.getEndYear())
			addFieldError("period.endYear", getMessage("strategy.endYear.small.value"));
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
		if(period.getId()==null){
			period.setCreatedDate(new Date());
			period.setPerson(person);
		}
		period.setCurrentUser(getUser().getUser());
		DAOFactory.getFactory().getMerPlanPeriodDAO().save(period);
		return SUCCESS;
	}
}
