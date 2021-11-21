/**
 * 
 */
package com.geoland.kfis.web.action.adm.bpartner;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.Party;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.Constants;

// TODO: Auto-generated Javadoc
/**
 * The Class BPartnerSaveAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 4:26:43 PM, Feb 11, 2015
 */
public class BPartnerSaveAction extends BPartnerBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 5938813814916107923L;

	/** The person. */
	private Person person;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		person=getUser().getPerson();
		if(person==null)
			addFieldError("person", "person.login.invalid");
		
		if(bpartner!=null && StringUtils.isEmpty(bpartner.getIsactive()))
			bpartner.setIsactive("N");
		if(bpartner!=null && StringUtils.isEmpty(bpartner.getIssummary()))
			bpartner.setIssummary("N");
		if(bpartner!=null && StringUtils.isEmpty(bpartner.getIsonetime()))
			bpartner.setIsonetime("N");
		if(bpartner!=null && StringUtils.isEmpty(bpartner.getIsprospect()))
			bpartner.setIsprospect("N");
		if(bpartner!=null && StringUtils.isEmpty(bpartner.getIsvendor()))
			bpartner.setIsvendor("N");
		if(bpartner!=null && StringUtils.isEmpty(bpartner.getIscustomer()))
			bpartner.setIscustomer("N");
		if(bpartner!=null && StringUtils.isEmpty(bpartner.getIsemployee()))
			bpartner.setIsemployee("N");
		if(bpartner!=null && StringUtils.isEmpty(bpartner.getIssalesrep()))
			bpartner.setIssalesrep("N");
		
		if(bpartner!=null && StringUtils.isEmpty(bpartner.getName()))
			addFieldError("bpartner.name", getMessage("bpartner.name.empty"));
		
//		if(bpartner!=null && StringUtils.isEmpty(bpartner.getName2()))
//			addFieldError("bpartner.name2", getMessage("bpartner.name2.empty"));
		if(bpartner!=null && StringUtils.isEmpty(bpartner.getEmployerIdNumber()))
			addFieldError("bpartner.employerIdNumber", getMessage("bpartner.employerIdNumber.empty"));
		if(bpartner!=null && StringUtils.isEmpty(bpartner.getSocialSecurityNumber()))
			addFieldError("bpartner.socialSecurityNumber", getMessage("bpartner.socialSecurityNumber.empty"));
		if(bpartner!=null && bpartner.getContactEtbilishedDate()==null)
			addFieldError("bpartner.contactEtbilishedDate", getMessage("bpartner.contactEtbilishedDate.empty"));
//		if(bpartner!=null && bpartner.getVendorDiscountPercent()==null)
//			addFieldError("bpartner.vendorDiscountPercent", getMessage("bpartner.vendorDiscountPercent.empty"));
		
		
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
		Date cdate = new Date();
		Party party = null;		
		User currentUser = getUser().getUser();
		User user=getUser().getUser();
		bpartner.setVendorDiscountPercent(0.0);
		bpartner.setName2(bpartner.getName());
		if(bpartner.getId() == null){
			party = new Party();
			party.setPartyType("B");
			party.setCurrentUser(currentUser);

			bpartner.setCreated(cdate);
			bpartner.setPersonByCreatedby(person);
			bpartner.setParty(party);
			bpartner.setCurrentUser(currentUser);
			party.setCurrentUser(user);
			DAOFactory.getFactory().getPartyDAO().save(party);
		}
		
		bpartner.setUpdated(cdate);
		bpartner.setPersonByUpdatedby(person);
		bpartner.setCurrentUser(user);
		DAOFactory.getFactory().getBPartnerDAO().save(bpartner);
		
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
