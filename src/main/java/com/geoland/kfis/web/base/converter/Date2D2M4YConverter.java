package com.geoland.kfis.web.base.converter;

import com.opensymphony.xwork2.ActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class Date2D2M4YConverter.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created Apr 19, 2014 10:35:09 AM
 * @Version 1.0
 */
public class Date2D2M4YConverter extends DateConverter {

	/* (non-Javadoc)
	 * @see com.geoland.kfis.web.base.converter.DateConverter#getMask(com.opensymphony.xwork2.ActionSupport)
	 */
	@Override
	protected String getMask(ActionSupport action) {
		return action.getText("format.date_mask");
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.web.base.converter.DateConverter#getRegEx(com.opensymphony.xwork2.ActionSupport)
	 */
	@Override
	protected String getRegEx(ActionSupport action) {
		return action.getText("format.date_regex");
	}
}
