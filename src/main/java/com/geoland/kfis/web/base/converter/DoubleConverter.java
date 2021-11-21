package com.geoland.kfis.web.base.converter;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.util.Map;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.util.StrutsTypeConverter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.conversion.TypeConversionException;

// TODO: Auto-generated Javadoc
/**
 * The Class DoubleConverter.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created Apr 19, 2014 10:34:54 AM
 * @Version 1.0
 */
public abstract class DoubleConverter extends StrutsTypeConverter {

	/** The Constant logger. */
	public static final Logger logger = LoggerFactory.getLogger(DoubleConverter.class);
	
	/* (non-Javadoc)
	 * @see org.apache.struts2.util.StrutsTypeConverter#convertFromString(java.util.Map, java.lang.String[], java.lang.Class)
	 */
	@SuppressWarnings("rawtypes")
	@Override
	public Object convertFromString(Map map, String[] as, Class class1) {
		if (logger.isDebugEnabled()) {
			logger.debug("convertFromString(Map map=" + map + ", String[] as=" + as + ", Class class1=" + class1 + ") - start");
		}
		
		if (as == null || as.length != 1)
			return performFallbackConversion(map, as, class1);

		Double res = null;
		String mask = null;
		if (StringUtils.isNotEmpty(as[0])) {
			try {
				ActionSupport action =
					(ActionSupport) ActionContext.getContext().getActionInvocation().getAction();

				// najpierw RegEx
				String regEx = this.getRegEx(action);
				if (StringUtils.isNotEmpty(regEx)) {
					if (!Pattern.matches(regEx, as[0])) {
						logger.warn("convertFromString(Map, String[], Class) - " + as[0] + " nie pasuje do RegEx-a:: " + regEx);
						throw new TypeConversionException(as[0] + " nie pasuje do RegEx-a:: " + regEx);
					}
				}
				
				mask = this.getMask(action);
				DecimalFormat nf = new DecimalFormat(mask);
				Number number = nf.parse(as[0]);
				res = Double.valueOf(number.doubleValue());

				if (logger.isDebugEnabled())
					logger.debug("convertFromString(Map, String[], Class) - " + as[0] + " -> " + res);
				
			} catch (ParseException ex) {
				logger.warn("convertFromString(Map, String[], Class) - " + as[0] + ", mask: " + mask);
				throw new TypeConversionException("No nie da sie tego przekonwertowac ciolku!", ex);
			}
		}

		if (logger.isDebugEnabled()) {
			logger.debug("convertFromString(Map, String[], Class) - end - return value=" + res);
		}
		return res;
	}

	/* (non-Javadoc)
	 * @see org.apache.struts2.util.StrutsTypeConverter#convertToString(java.util.Map, java.lang.Object)
	 */
	@SuppressWarnings("rawtypes")
	@Override
	public String convertToString(Map map, Object obj) {
		if (logger.isDebugEnabled()) {
			logger.debug("convertToString(Map map=" + map + ", Object obj=" + obj + ") - start");
		}
		
		String res = obj != null ? obj.toString() : StringUtils.EMPTY;
		if (obj != null && obj instanceof Double) {
			
			ActionSupport action =
				(ActionSupport) ActionContext.getContext().getActionInvocation().getAction();

			String mask = this.getMask(action);
			DecimalFormat nf = new DecimalFormat(mask);
			res = nf.format((Double) obj);
		}
		
		if (logger.isDebugEnabled()) {
			logger.debug("convertToString(Map, Object) - end - return value=" + res);
		}
		return res;
	}
	
	/**
	 * Gets the mask.
	 *
	 * @param action the action
	 * @return the mask
	 */
	protected abstract String getMask(ActionSupport action);
	
	/**
	 * Gets the reg ex.
	 *
	 * @param action the action
	 * @return the reg ex
	 */
	protected String getRegEx(ActionSupport action) {
		return null;
	}		
}
