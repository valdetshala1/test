package com.geoland.kfis.web.base.converter;

import com.opensymphony.xwork2.ActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class BigDecimal2DConverter.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created Apr 19, 2014 10:35:23 AM
 * @Version 1.0
 */
public class BigDecimal2DConverter extends BigDecimalConverter {

	/* (non-Javadoc)
	 * @see com.geoland.kfis.web.base.converter.BigDecimalConverter#getMask(com.opensymphony.xwork2.ActionSupport)
	 */
	@Override
	protected String getMask(ActionSupport action) {
		return action.getText("format.bigdecimal_mask");
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.web.base.converter.BigDecimalConverter#getRegEx(com.opensymphony.xwork2.ActionSupport)
	 */
	@Override
	protected String getRegEx(ActionSupport action) {
		return action.getText("format.bigdecimal_regex");
	}
}
