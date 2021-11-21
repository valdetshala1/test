/**
 * 
 */
package com.geoland.kfis.web.action.mer.execution.financedonor;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Person;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.Constants;

// TODO: Auto-generated Javadoc
/**
 * The Class FinanceDonorSaveAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 9:33:27 AM, Mar 31, 2015
 */
public class FinanceDonorSaveAction extends FinanceDonorBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -4245575024729091215L;

	/** The person. */
	private Person person;

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		person=getUser().getPerson();
		if(person==null)
			addActionError("login.user.employee.role.empty");
		if(donor==null)
			addActionError("");
		if(donor!=null && (donor.getMerStrategy()==null || (donor.getMerStrategy()!=null && donor.getMerStrategy().getId()==null)))
			addFieldError("donor.merStrategy", getMessage("institution.merStrategy.empty"));
		
		if(donor!=null && (donor.getOrganisation()==null || (donor.getOrganisation()!=null && donor.getOrganisation().getId()==null)))
			addFieldError("donor.organisation", getMessage("mer.fin.donor.donor.empty"));
		
		if(donor!=null && donor.getDonationYear()==null)
			addFieldError("donor.donationYear", getMessage("mer.fin.donor.donationYear.empty"));
		
		if(donor!=null && donor.getAmount()==null)
			addFieldError("donor.amount", getMessage("mer.fin.donor.amount.empty"));
		
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
		if(donor.getId()==null){
			donor.setCreatedDate(new Date());
			donor.setPerson(person);
		}
		donor.setCurrentUser(getUser().getUser());
		DAOFactory.getFactory().getMerFinanceDonorDAO().save(donor);
		
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
