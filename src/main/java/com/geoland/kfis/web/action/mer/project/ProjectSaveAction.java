package com.geoland.kfis.web.action.mer.project;



import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Person;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.Constants;

// TODO: Auto-generated Javadoc
/**
 * The Class ProjectSaveAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Mar 25, 2015 , 2:25:47 PM
 */
public class ProjectSaveAction extends ProjectBaseAction {
  
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
		if(project!=null && StringUtils.isEmpty(project.getName()))
			addFieldError("project.name", getMessage("finance.type.name.empty"));
		if(project!=null && StringUtils.isEmpty(project.getNameEn()))
			addFieldError("project.nameEn", getMessage("finance.type.name.en.empty"));
		if(project!=null && StringUtils.isEmpty(project.getNameSr()))
			addFieldError("project.nameSr", getMessage("finance.type.name.sr.empty"));
		if(project!=null && project.getPillar()==null)
			addFieldError("project.pillar", getMessage("project.pillar.empty"));
		if(project!=null && project.getCode()==null)
			addFieldError("project.code", getMessage("organisation.code.empty"));
		
			if (!getFieldErrors().isEmpty()) {
				HttpServletResponse response = ServletActionContext.getResponse();
				response.addHeader(Constants.ERRORS_EXITS, "true");
			}
		}
	
	   /* (non-Javadoc)
   	 * @see com.opensymphony.xwork2.ActionSupport#execute()
   	 */
   	@Override
		public String execute() throws Exception {
		   if(project.getId()==null){
			   project.setCreatedDate(new Date());
			   project.setPerson(person);
		   }
		   project.setCurrentUser(getUser().getUser());
			DAOFactory.getFactory().getMerProjectDAO().save(project);
			return SUCCESS;
		}
	   
	
 
}
