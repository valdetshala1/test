package com.geoland.kfis.web.action.mer.project.subproject;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Person;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.Constants;

// TODO: Auto-generated Javadoc
/**
 * The Class SubProjectSaveAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Mar 25, 2015 , 2:25:47 PM
 */
public class SubProjectSaveAction extends SubProjectBaseAction {
  
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
		if(subproject!=null && (subproject.getMerProject()==null ||(subproject.getMerProject()!=null && subproject.getMerProject().getId()==null)))
			addActionError("subproject.merProject.id.empty");
		
		if(subproject!=null && StringUtils.isEmpty(subproject.getName()))
			addFieldError("subproject.name", getMessage("finance.type.name.empty"));
		if(subproject!=null && StringUtils.isEmpty(subproject.getNameEn()))
			addFieldError("subproject.nameEn", getMessage("finance.type.name.en.empty"));
		if(subproject!=null && StringUtils.isEmpty(subproject.getNameSr()))
			addFieldError("subproject.nameSr", getMessage("finance.type.name.sr.empty"));
		if(subproject!=null && StringUtils.isEmpty(subproject.getCode()))
			addFieldError("subproject.code", getMessage("organisation.code.empty"));
		
		if (hasFieldErrors() || hasActionErrors()) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader(Constants.ERRORS_EXITS, "true");
		}
	}

 /* (non-Javadoc)
  * @see com.opensymphony.xwork2.ActionSupport#execute()
  */
 @Override
	public String execute() throws Exception {
	   if(subproject.getId()==null){
		   subproject.setCreatedDate(new Date());
		   subproject.setPerson(person);
	   }
	    subproject.setCurrentUser(getUser().getUser());
	    DAOFactory.getFactory().getMerSubProjectDAO().save(subproject);
		return SUCCESS;
	}
 
	
 
}
