package com.geoland.kfis.web.action.ads.logistic.protocolports;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class ProtocolPortsSaveAction.
 *
 * @author Arta Hoxha , GEO&LAND
 * @version 1.0
 * @created Apr 4, 2016 , 11:39:38 AM
 */
public class ProtocolPortsSaveAction extends ProtocolPortsBaseAction {
	
	/** The employee. */
	private Employee employee;
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 *
	 */
	@Override
	public void validate() {
		employee=getUser().getEmployee();
		if(employee==null){
			addActionError("");
		}
		
		if (getProtocolPorts()!=null && getProtocolPorts().getProtocolType() == null)
			addFieldError("protocolPorts.protocolType",getMessage("protocolPorts.protocolType.empty"));
		if (getProtocolPorts()!=null && getProtocolPorts().getProtocolName() == null)
			addFieldError("protocolPorts.protocolName",getMessage("protocolPorts.protocolName.empty"));
		
		if (!getFieldErrors().isEmpty() || !getActionErrors().isEmpty()) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exits", "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		if(getProtocolPorts().getId()==null){
			getProtocolPorts().setCreatedDate(new Date());
			getProtocolPorts().setEmployee(employee);
			
		}
		getProtocolPorts().setCurrentUser(getUser().getUser());
		DAOFactory.getFactory().getProtocolPortsDAO().save(getProtocolPorts());
		return SUCCESS;
	}
	
	

}
