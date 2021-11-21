/**
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created Apr 23, 2014 2:43:31 PM
 * @Version 1.0
 *
 */
package com.geoland.kfis.web.base.util;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

// TODO: Auto-generated Javadoc
/**
 * The Class DateJsonValueProcessor.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created April 23, 2014 2:43:31 PM
 * @Version 1.0
 */
public class DateJsonValueProcessor implements JsonValueProcessor {
	
	/** The Constant DEFAULT_DATE_PATTERN. */
	public static final String DEFAULT_DATE_PATTERN = "yyyy-MM-dd HH:mm:ss";
	
	/** The date format. */
	private DateFormat dateFormat = new SimpleDateFormat(DEFAULT_DATE_PATTERN);

	/**
	 * Instantiates a new date json value processor.
	 */
	public DateJsonValueProcessor() {
		this(DEFAULT_DATE_PATTERN);
	}

	/**
	 * Instantiates a new date json value processor.
	 *
	 * @param datePattern the date pattern
	 */
	public DateJsonValueProcessor(String datePattern) {
		try {
			dateFormat = new SimpleDateFormat(datePattern);
		} catch (Exception ex) {
			dateFormat = new SimpleDateFormat(DEFAULT_DATE_PATTERN);
		}
	}

	/* (non-Javadoc)
	 * @see net.sf.json.processors.JsonValueProcessor#processArrayValue(java.lang.Object, net.sf.json.JsonConfig)
	 */
	public Object processArrayValue(Object value, JsonConfig jsonConfig) {
		return process(value);
	}

	/* (non-Javadoc)
	 * @see net.sf.json.processors.JsonValueProcessor#processObjectValue(java.lang.String, java.lang.Object, net.sf.json.JsonConfig)
	 */
	public Object processObjectValue(String key, Object value,
			JsonConfig jsonConfig) {
		return process(value);
	}

	/**
	 * Process.
	 *
	 * @param value the value
	 * @return the object
	 */
	private Object process(Object value) {
		if(value==null) return null;
		
		if (value instanceof Timestamp)
			return dateFormat.format((Timestamp) value);
		else
			return dateFormat.format((Date) value);
	}
}
