package com.geoland.kfis.web.action.mer.execution.indicator.subindicator;



import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Person;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.Constants;

// TODO: Auto-generated Javadoc
/**
 * The Class SubIndicatorSaveAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Mar 25, 2015 , 2:25:47 PM
 */
public class SubIndicatorSaveAction extends SubIndicatorBaseAction {
  
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
			if(subindicator!=null && StringUtils.isEmpty(subindicator.getName())){
				addFieldError("subindicator.name", getMessage("subindicator.name.empty"));
			}
			if(subindicator!=null && StringUtils.isEmpty(subindicator.getNameEn())){
				addFieldError("subindicator.nameEn", getMessage("subindicator.nameEn.empty"));
			}
			if(subindicator!=null && subindicator.getUom().getId()==null){
				addFieldError("subindicator.uom", getMessage("subindicator.uom.empty"));
			}
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
		   if(subindicator.getId()==null){
			   subindicator.setCreatedDate(new Date());
			   subindicator.setPerson(person);
		   }
		   DAOFactory.getFactory().getMerSubIndicatorDAO().save(subindicator);
		   return SUCCESS;
		}
	   
	
 
}
