/**
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created Apr 23, 2014 2:47:42 PM
 * @Version 1.0
 *
 */
package com.geoland.kfis.web.base.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

// TODO: Auto-generated Javadoc
/**
 * The Class JsonDateValueProcessor.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created April 23, 2014 2:47:42 PM
 * @Version 1.0
 */
public class JsonDateValueProcessor implements JsonValueProcessor {
	
	/** The Constant formatter_date. */
	private static final SimpleDateFormat formatter_date = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");

	/**
	 * Instantiates a new json date value processor.
	 */
	public JsonDateValueProcessor() {

	}

	/* (non-Javadoc)
	 * @see net.sf.json.processors.JsonValueProcessor#processArrayValue(java.lang.Object, net.sf.json.JsonConfig)
	 */
	public Object processArrayValue(Object value, JsonConfig jsonConfig) {
		return process(value, jsonConfig);
	}

	/* (non-Javadoc)
	 * @see net.sf.json.processors.JsonValueProcessor#processObjectValue(java.lang.String, java.lang.Object, net.sf.json.JsonConfig)
	 */
	public Object processObjectValue(String key, Object value,
			JsonConfig jsonConfig) {
		return process(value, jsonConfig);
	}

	/**
	 * Process.
	 *
	 * @param value the value
	 * @param jsonConfig the json config
	 * @return the object
	 */
	private Object process(Object value, JsonConfig jsonConfig) {
		if (value instanceof Date) {
			return formatter_date.format((Date) value);
		} else {
			return value == null ? null : value.toString();
		}
	}
}
