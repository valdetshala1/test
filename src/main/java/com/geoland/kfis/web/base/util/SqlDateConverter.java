package com.geoland.kfis.web.base.util;

import java.util.Date;
import java.util.Map;

// TODO: Auto-generated Javadoc
/**
 * The Class SqlDateConverter.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created Apr 19, 2014 10:53:01 AM
 * @Version 1.0
 */
public class SqlDateConverter extends UtilDateConverter {

	/* (non-Javadoc)
	 * @see com.geoland.kfis.web.base.util.UtilDateConverter#convertFromString(java.util.Map, java.lang.String[], java.lang.Class)
	 */
	@SuppressWarnings("rawtypes")
	@Override
	 public Object convertFromString(Map context, String[] values, Class toClass) {
		 Date date = (Date) super.convertFromString(context, values, toClass);
          return new java.sql.Date(date.getTime()) ;

	}

}
