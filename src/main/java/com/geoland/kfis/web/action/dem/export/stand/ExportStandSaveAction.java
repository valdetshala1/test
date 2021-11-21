/**
 * 
 */
package com.geoland.kfis.web.action.dem.export.stand;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

// TODO: Auto-generated Javadoc
/**
 * The Class ExportStandSaveAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Jan 11, 2016, 9:10:22 AM
 */
public class ExportStandSaveAction extends ExportStandBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 9128184391991085661L;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		if(regionId==null)
			addFieldError("regionId.empty", getMessage("dem.fiskos.pls.select.reg"));
		
		if(muId==null)
			addFieldError("muId.empty", getMessage("compartment.management.unit.id.empty"));
		
		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exist", "true");
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
