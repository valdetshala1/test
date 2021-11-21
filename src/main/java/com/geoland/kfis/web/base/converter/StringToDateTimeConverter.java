package com.geoland.kfis.web.base.converter;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;

import com.opensymphony.xwork2.conversion.TypeConversionException;

// TODO: Auto-generated Javadoc
/**
 * The Class StringToDateTimeConverter.
 *
 * @author GEO&LAND
 * @created April 19, 2014 10:37:39 AM
 * @Version 1.0
 */
public class StringToDateTimeConverter extends StrutsTypeConverter {

	/** The Constant DATETIME_FORMAT. */
	private static final DateFormat DATETIME_FORMAT = new SimpleDateFormat("dd.MM.yyyy HH:mm:ss");
	
	/** The Constant DATE_FORMAT. */
	private static final DateFormat DATE_FORMAT = new SimpleDateFormat("dd.MM.yyyy");


	
	/* (non-Javadoc)
	 * @see org.apache.struts2.util.StrutsTypeConverter#convertFromString(java.util.Map, java.lang.String[], java.lang.Class)
	 */
	@SuppressWarnings("rawtypes")
	@Override
	public Object convertFromString(Map context, String[] strings, Class toClass) {
		if (strings == null || strings.length == 0 || strings[0].trim().length() == 0) {
            return null;
        }

        try {
        	if(strings[0].trim().length()>10){
                return DATETIME_FORMAT.parse(strings[0]);
        	}else{
                return DATE_FORMAT.parse(strings[0]);
        	}
        	
        } catch (ParseException e) {
            throw new TypeConversionException("Unable to convert given object to date: " + strings[0]);
        }

	}

	/* (non-Javadoc)
	 * @see org.apache.struts2.util.StrutsTypeConverter#convertToString(java.util.Map, java.lang.Object)
	 */
	@SuppressWarnings("rawtypes")
	@Override
	public String convertToString(Map context, Object date) {
        if (date != null && date instanceof Date) {
        	Calendar c=Calendar.getInstance();
        	c.setTime((Date) date);
        	String toString=date.toString();
        	if(toString.length()>10){
        		if(c.get(Calendar.HOUR_OF_DAY)==0 && c.get(Calendar.MINUTE)==0 && c.get(Calendar.SECOND)==0)
            		return DATE_FORMAT.format(date);
        		else return DATETIME_FORMAT.format(date);
        	}
        	else return DATE_FORMAT.format(date);
        } else {
            return null;
        }

	}

}
