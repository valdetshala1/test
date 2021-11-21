package com.geoland.kfis.web.action.ads.order.requisition;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Person;
import com.geoland.kfis.model.RequisitionItem;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class RequisitionItemStatus.
 */
public class RequisitionItemStatus extends RequisitionBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -378237714824668072L;
	
	/** The item id list. */
	private String itemIdList;
	
	/** The status code. */
	private String statusCode;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		if(StringUtils.isEmpty(itemIdList)){
			addFieldError("requisition.item.ids", "requisition.item.ids.empty");	
		}
	
		if(StringUtils.isEmpty(statusCode)){
			addFieldError("requisition.item.statusCode", "requisition.item.statusCode.empty");	
		}		
	
		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response= ServletActionContext.getResponse();
			response.addHeader("errors_exist", "true");
		}			
	}

	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		Date cdate = new Date();
		Person person = getUser().getPerson();
		
		String arrayId[] = itemIdList.split(",");
		for (String id : arrayId) {
			RequisitionItem entity = DAOFactory.getFactory().getRequisitionItemDAO().get(Long.valueOf(id));
			entity.setStatusCode(statusCode);
			entity.setUpdated(cdate);
			entity.setPersonByUpdatedby(person);
			entity.setTextmsg(entity.getTextmsg() + ", " + statusCode);
			
			DAOFactory.getFactory().getRequisitionItemDAO().save(entity);
			
		}
		return SUCCESS;
	}
}
