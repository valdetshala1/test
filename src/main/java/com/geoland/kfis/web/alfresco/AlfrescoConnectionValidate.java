package com.geoland.kfis.web.alfresco;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class AlfrescoConnectionValidate.
 *
 * @author Adelina Gashi
 */

public class AlfrescoConnectionValidate extends BaseActionSupport {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		boolean alfrescoError=false;
		getTicket();
		if(ticket==null){
			alfrescoError=true;
		}
		HttpServletResponse response = ServletActionContext.getResponse();
		if(alfrescoError){
			response.addHeader("alfrescoError", "true");
		}
	}

/* (non-Javadoc)
 * @see com.opensymphony.xwork2.ActionSupport#execute()
 */
@Override
	public String execute() throws Exception {
		return NONE;
	}
}
