package com.geoland.kfis.web.action.mer.execution.indicator;



import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Person;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.Constants;

// TODO: Auto-generated Javadoc
/**
 * The Class IndicatorSaveAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Mar 25, 2015 , 2:25:47 PM
 */
public class IndicatorSaveAction extends IndicatorBaseAction {
  
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
		if(indicator!=null && StringUtils.isEmpty(indicator.getName()))
			addFieldError("indicator.name", getMessage("indicator.name.empty"));
		if(indicator!=null && StringUtils.isEmpty(indicator.getNameEn()))
			addFieldError("indicator.nameEn", getMessage("indicator.nameEn.empty"));
		if(indicator!=null && StringUtils.isEmpty(indicator.getNameSr()))
			addFieldError("indicator.nameSr", getMessage("indicator.nameSr.empty"));
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
		   if(indicator.getId()==null){
			   indicator.setCreatedDate(new Date());
			   indicator.setPerson(person);
		   }
		   indicator.setCurrentUser(getUser().getUser());
		   DAOFactory.getFactory().getMerIndicatorDAO().save(indicator);
			return SUCCESS;
		}
	   
	
 
}
