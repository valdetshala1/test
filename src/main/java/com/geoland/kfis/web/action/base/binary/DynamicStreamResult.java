package com.geoland.kfis.web.action.base.binary;

import org.apache.struts2.dispatcher.StreamResult;

import com.opensymphony.xwork2.ActionInvocation;

// TODO: Auto-generated Javadoc
/**
 * The Class DynamicStreamResult.
 */
public class DynamicStreamResult extends StreamResult{ 

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -3463724848488277156L;

	/* (non-Javadoc)
	 * @see org.apache.struts2.dispatcher.StreamResult#doExecute(java.lang.String, com.opensymphony.xwork2.ActionInvocation)
	 */
	@Override
	protected void doExecute(String finalLocation, ActionInvocation invocation)
			throws Exception {
	
		//get name of downloaded file  
		String downloadedFileName = 
			(String) invocation.getStack().findValue(conditionalParse("name", invocation));

		//Response.AddHeader("Content-Disposition", "inline;   filename='aa.pdf'");
		contentDisposition = "inline; filename=\""    +downloadedFileName + "\"";

		//get file size 
		contentLength = ""+ invocation.getStack().findValue(conditionalParse("size", invocation));
		
		// get type of file
		//contentType = ""+ invocation.getStack().findValue(conditionalParse("description", invocation));
		contentType = ""+ invocation.getStack().findValue(conditionalParse("contentType", invocation));
		
		//contentType = "application/pdf";
		super.doExecute(finalLocation, invocation);
	}
}
