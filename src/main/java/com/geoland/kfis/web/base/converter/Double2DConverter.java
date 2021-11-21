package com.geoland.kfis.web.base.converter;

import com.opensymphony.xwork2.ActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class Double2DConverter.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created Apr 19, 2014 10:34:45 AM
 * @Version 1.0
 */
public class Double2DConverter extends DoubleConverter {

	/* (non-Javadoc)
	 * @see com.geoland.kfis.web.base.converter.DoubleConverter#getMask(com.opensymphony.xwork2.ActionSupport)
	 */
	@Override
	protected String getMask(ActionSupport action) {
		return action.getText("format.double_mask");
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.web.base.converter.DoubleConverter#getRegEx(com.opensymphony.xwork2.ActionSupport)
	 */
	@Override
	protected String getRegEx(ActionSupport action) {
		return action.getText("format.double_regex");
	}
}
