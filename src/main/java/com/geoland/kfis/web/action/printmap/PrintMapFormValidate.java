package com.geoland.kfis.web.action.printmap;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.web.action.base.Constants;

// TODO: Auto-generated Javadoc
/**
 * The Class PrintMapFormValidate.
 *
 * @author Ardiana Demolli, Geo&Land
 * Jan 27, 2016, 11:26:57 AM
 * v2.0
 */
public class PrintMapFormValidate extends PrintMapBaseAction{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		
		if(layouts == null || StringUtils.isEmpty(layouts))
			addFieldError("layouts", getMessage("print.map.form.layouts.empty"));
		
		if(scalesPrint == null || StringUtils.isEmpty(scalesPrint))
			addFieldError("scalesPrint", getMessage("print.map.form.scalesPrint.empty"));
		
		if(rotation == null )
			addFieldError("rotation", getMessage("print.map.form.rotation.empty"));
		
		if(!getFieldErrors().isEmpty()){
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader(Constants.ERRORS_EXITS, "true");
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
