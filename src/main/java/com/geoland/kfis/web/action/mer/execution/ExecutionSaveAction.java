package com.geoland.kfis.web.action.mer.execution;



import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Person;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.Constants;

// TODO: Auto-generated Javadoc
/**
 * The Class ExecutionSaveAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Mar 25, 2015 , 2:25:47 PM
 */
public class ExecutionSaveAction extends ExecutionBaseAction {
  
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
			if(execution!=null && execution.getExecutionDate()==null)
				addFieldError("execution.executionDate", getMessage("mer.execution.date.empty"));
			if(execution!=null && execution.getStatus()==null)
				addFieldError("execution.status", getMessage("mer.execution.status.empty"));

			if (hasActionErrors() || hasFieldErrors()) {
				HttpServletResponse response = ServletActionContext.getResponse();
				response.addHeader(Constants.ERRORS_EXITS, "true");
			}
		}
	
	   /* (non-Javadoc)
   	 * @see com.opensymphony.xwork2.ActionSupport#execute()
   	 */
   	@Override
		public String execute() throws Exception {
		   if(execution.getId()==null){
			   execution.setCreatedDate(new Date());
			   execution.setPerson(person);
		   }
		   DAOFactory.getFactory().getMerStrategyExecutionDAO().save(execution);
		   return SUCCESS;
		}
	   
	
 
}
