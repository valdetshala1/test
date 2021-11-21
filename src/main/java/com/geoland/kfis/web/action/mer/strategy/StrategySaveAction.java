/**
 * 
 */
package com.geoland.kfis.web.action.mer.strategy;

import java.io.File;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.Constants;

// TODO: Auto-generated Javadoc
/**
 * The Class StrategySaveAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 5:20:42 PM, Mar 25, 2015
 */
public class StrategySaveAction extends StrategyBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 6588283115135857243L;
	
	/** The person. */
	private Person person;
	
	/** The file. */
	private File file;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		person=getUser().getPerson();
		if(person==null)
			addActionError("");
		
		if(strategy!=null && (strategy.getMerPlanPeriod()==null ||(strategy.getMerPlanPeriod()!=null && strategy.getMerPlanPeriod().getId()==null)))
			addFieldError("strategy.merPlanPeriod", getMessage("strategy.merPlanPeriod.empty"));
		else strategy.setMerPlanPeriod(DAOFactory.getFactory().getMerPlanPeriodDAO().get(strategy.getMerPlanPeriod().getId()));
		
		if(strategy!=null && (strategy.getMerSubProject()==null ||(strategy.getMerSubProject()!=null && strategy.getMerSubProject().getId()==null)))
			addFieldError("strategy.merSubProject", getMessage("strategy.merSubProject.empty"));
		else strategy.setMerSubProject(DAOFactory.getFactory().getMerSubProjectDAO().get(strategy.getMerSubProject().getId()));
		
		if(strategy!=null && StringUtils.isEmpty(strategy.getResults()))
			addFieldError("strategy.results", getMessage("strategy.results.empty"));
		
		if(strategy!=null && strategy.getFullyFinanced()==false && strategy.getInNegotiationsFinance()==false)
			addFieldError("strategy.finance", getMessage("strategy.finance.empty"));
		
		if(strategy!=null && strategy.getCost()==null)
			addFieldError("strategy.cost", getMessage("contract.cost.empty"));
		
		if(strategy!=null && strategy.getStartYear()==null)
			addFieldError("strategy.startYear", getMessage("period.startYear.empty"));
		
		if(strategy!=null && strategy.getEndYear()!=null && strategy.getStartYear()!=null && strategy.getStartYear()>strategy.getEndYear())
			addFieldError("strategy.endYear", getMessage("strategy.endYear.small.value"));
		
		if(strategy!=null && strategy.getMerPlanPeriod()!=null && strategy.getMerPlanPeriod().getId()!=null){
			if(strategy.getStartYear()!=null && (strategy.getStartYear()<strategy.getMerPlanPeriod().getStartYear() || strategy.getStartYear()>strategy.getMerPlanPeriod().getEndYear()))
				addFieldError("strategy.startYear", getMessage("strategy.year.not.in.range"));
			
			if(strategy.getEndYear()!=null && (strategy.getMerPlanPeriod().getStartYear()>strategy.getEndYear() || (strategy.getMerPlanPeriod().getEndYear()<strategy.getEndYear())))
				addFieldError("strategy.endYear", getMessage("strategy.year.not.in.range"));
		}
		
		
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
		if(strategy.getId()==null){
			strategy.setCreatedDate(new Date());
			strategy.setPerson(person);
		}
		User user = getUser().getUser();
		strategy.setCurrentUser(user);
		DAOFactory.getFactory().getMerStrategyDAO().save(strategy);
		
		if(file!=null){
			doc.setDoc(getFileBytes(file));
			doc.setDocSize(file.getTotalSpace());
			doc.setMerStrategy(strategy);
			doc.setCreatedDate(new Date());
			doc.setPerson(person);
			doc.setCurrentUser(user);
			DAOFactory.getFactory().getMerStrategyDocDAO().save(doc);
		}
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

	/**
	 * Gets the file.
	 *
	 * @return the file
	 */
	public File getFile() {
		return file;
	}

	/**
	 * Sets the file.
	 *
	 * @param file the file to set
	 */
	public void setFile(File file) {
		this.file = file;
	}
}
