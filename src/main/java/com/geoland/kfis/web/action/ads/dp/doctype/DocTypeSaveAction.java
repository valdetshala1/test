/**
 * 
 */
package com.geoland.kfis.web.action.ads.dp.doctype;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Person;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.Constants;

// TODO: Auto-generated Javadoc
/**
 * The Class DocTypeSaveAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 2:03:55 PM, Feb 4, 2015
 */
public class DocTypeSaveAction extends DocTypeBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -5483295254583277361L;

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
		
		if(docType!=null && StringUtils.isEmpty(docType.getIsactive()))
			docType.setIsactive("N");
		if(docType!=null && StringUtils.isEmpty(docType.getIsdocnocontrolled()))
			docType.setIsdocnocontrolled("N");
		if(docType!=null && StringUtils.isEmpty(docType.getIssotrx()))
			docType.setIssotrx("N");
		if(docType!=null && docType.getDocCategory()!=null && docType.getDocCategory().getId()==null)
			addFieldError("docType.docCategory.id", getMessage("docType.docCategory.empty"));
		if(docType!=null && StringUtils.isEmpty(docType.getName()))
			addFieldError("docType.name", getMessage("docType.name.empty"));
		if(docType!=null && StringUtils.isEmpty(docType.getNameEn()))
			addFieldError("docType.nameEn", "docType.nameEn.empty");
//		if(docType!=null && StringUtils.isEmpty(docType.getPrintname()))
//			addFieldError("docType.printname", getMessage("docType.printname.empty"));
//		if(docType!=null && StringUtils.isEmpty(docType.getPrintnameEn()))
//			addFieldError("docType.printnameEn", getMessage("docType.printname.emptyEn"));
		if(docType!=null && StringUtils.isEmpty(docType.getDocbasetype()))
			addFieldError("docType.docbasetype", getMessage("docType.docbasetype.empty"));
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
		docType.setPrintname(docType.getName());
		docType.setPrintnameEn(docType.getNameEn());
		docType.setPrintnameSr(docType.getNameSr());
		
		if(docType.getId()==null){
			docType.setCreated(new Date());
			docType.setPersonByCreatedby(person);
		}
		
		docType.setUpdated(new Date());
		docType.setPersonByUpdatedby(person);
		docType.setCurrentUser(getUser().getUser());
		DAOFactory.getFactory().getDocTypeDAO().save(docType);
		
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
