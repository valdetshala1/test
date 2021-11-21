/**
 * 
 */
package com.geoland.kfis.web.action.ads.dp.doccategory;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Person;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.Constants;

// TODO: Auto-generated Javadoc
/**
 * The Class DocCategorySaveAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 9:00:24 AM, Feb 4, 2015
 */
public class DocCategorySaveAction extends DocCategoryBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 860617510271959334L;
	
	/** The person. */
	private Person person;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		person=getUser().getPerson();
		if(person==null)
			addFieldError("user.person.not.valid", "user.person.not.valid");
		
		if(docCategory!=null && StringUtils.isEmpty(docCategory.getIsactive()))
			docCategory.setIsactive("N");
		if(docCategory!=null && StringUtils.isEmpty(docCategory.getName()))
			addFieldError("docCategory.name", getMessage("docCategory.name.empty"));
		if(docCategory!=null && StringUtils.isEmpty(docCategory.getNameEn()))
			addFieldError("docCategory.nameEn", "docCategory.nameEn.empty");
		if(docCategory!=null && StringUtils.isEmpty(docCategory.getCategorytype()))
			addFieldError("docCategory.categorytype", getMessage("docCategory.categorytype.empty"));
		if(docCategory!=null && StringUtils.isEmpty(docCategory.getIsdefault()))
			docCategory.setIsdefault("N");
		
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
		if(docCategory.getId()==null){
			docCategory.setPersonByCreatedby(person);
			docCategory.setCreated(new Date());
		}
		docCategory.setUpdated(new Date());
		docCategory.setPersonByUpdatedby(person);
		docCategory.setCurrentUser(getUser().getUser());
		DAOFactory.getFactory().getDocCategoryDAO().save(docCategory);
		
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
	 * @param person the new person
	 */
	public void setPerson(Person person) {
		this.person = person;
	}
	
}
