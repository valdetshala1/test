package com.geoland.kfis.web.base.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;

// TODO: Auto-generated Javadoc
/**
 * The Class UtilDateConverter.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created Apr 19, 2014 10:53:09 AM
 * @Version 1.0
 */
public class UtilDateConverter extends StrutsTypeConverter {

	/* (non-Javadoc)
	 * @see org.apache.struts2.util.StrutsTypeConverter#convertFromString(java.util.Map, java.lang.String[], java.lang.Class)
	 */
	@SuppressWarnings("rawtypes")
	@Override
	public Object convertFromString(Map context, String[] values, Class arg2) {
		DateFormat formatter = new SimpleDateFormat("dd.MM.yyyy");
		try {
			java.util.Date date = (java.util.Date) formatter.parse(values[0]);
			
			return new java.sql.Date(date.getTime());
		} catch (ParseException e) {
			return values[0];
		}
	}

	/* (non-Javadoc)
	 * @see org.apache.struts2.util.StrutsTypeConverter#convertToString(java.util.Map, java.lang.Object)
	 */
	@SuppressWarnings("rawtypes")
	@Override
	public String convertToString(Map arg0, Object o) {
		SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy");
		return sdf.format(o);
	}

	

}