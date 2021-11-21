package com.geoland.kfis.web.action.base.binary;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.Result;

// TODO: Auto-generated Javadoc
/**
 * The Class MyBytesResult.
 */
public class MyBytesResult implements Result {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.Result#execute(com.opensymphony.xwork2.ActionInvocation)
	 */
	public void execute(ActionInvocation invocation) throws Exception {

		MyAction action = (MyAction) invocation.getAction();
		HttpServletResponse response = ServletActionContext.getResponse();

        response.setContentType(action.getMyContentType());
		response.setContentLength(action.getMyContentLength());
		response.getOutputStream().write(action.getMyPhoto());
		response.getOutputStream().flush();

	}

}

