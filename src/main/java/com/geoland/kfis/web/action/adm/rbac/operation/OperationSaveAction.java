/**
 * 
 */
package com.geoland.kfis.web.action.adm.rbac.operation;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
// TODO: Auto-generated Javadoc

/**
 * The Class OperationSaveAction.
 *
 * @author ADELINA GASHI, GEO&LAND
 * @created Jun 30, 2014 3:25:47 PM
 * @Version 1.0
 */
public class OperationSaveAction extends OperationBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {

		
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
		

		return SUCCESS;
	}
}
