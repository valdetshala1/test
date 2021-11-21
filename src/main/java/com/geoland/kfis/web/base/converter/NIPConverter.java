package com.geoland.kfis.web.base.converter;

import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.util.StrutsTypeConverter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class NIPConverter.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created Apr 19, 2014 10:37:16 AM
 * @Version 1.0
 */
public class NIPConverter extends StrutsTypeConverter {
	
	/** Logger for this class. */
	private static final Logger logger = LoggerFactory.getLogger(NIPConverter.class);

	/* (non-Javadoc)
	 * @see org.apache.struts2.util.StrutsTypeConverter#convertFromString(java.util.Map, java.lang.String[], java.lang.Class)
	 */
	@SuppressWarnings("rawtypes")
	@Override
	public Object convertFromString(Map map, String[] as, Class class1) {
		if (logger.isDebugEnabled()) {
			logger.debug("convertFromString(Map map=" + map + ", String[] as="
					+ as + ", Class class1=" + class1 + ") - start");
		}
		
		if (as == null || as.length != 1)
			return performFallbackConversion(map, as, class1);
		
		String res = null;
		String s = StringUtils.trimToNull(as[0]);
		if (StringUtils.isNotEmpty(s)) {
			if (logger.isDebugEnabled()) {
				logger.debug("convertFromString(Map, String[], Class) - NIP to conversion - s=" + s);
			}

			res = s.replaceAll("\\s\\-", "");
			// throw new TypeConversionException(s + " nie pasuje do RegEx-a:: " + regEx);
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
		
		Class objClass = obj != null ? obj.getClass() : null;
		
		if (logger.isDebugEnabled()) {
			logger.debug("convertToString(Map, Object) - objClass=" + objClass);
		}
		
		String res = StringUtils.EMPTY;
		if (obj != null && obj instanceof String[]) {
			String[] arr = (String[]) obj;

			if (logger.isDebugEnabled()) {
				logger.debug("convertToString(Map, Object) - NIP to conversion - arr=" + arr);
			}
			
			if (arr != null && arr.length > 0) {
				String s  = arr[0];
				if (logger.isDebugEnabled()) {
					logger.debug("convertToString(Map, Object) - NIP to conversion - s=" + s);
				}

				if (StringUtils.isNotEmpty(s) && s.length() == 10) {
					res = StringUtils.substring(s, 0, 3)
							+ "-" + StringUtils.substring(s, 3, 6)
							+ "-" + StringUtils.substring(s, 6, 8)
							+ "-" + StringUtils.substring(s, 8, 10);
				}
			}
		}
		
		if (logger.isDebugEnabled()) {
			logger.debug("convertToString(Map, Object) - end - return value=" + res);
		}
		return res;
	}

	/**
	 * The main method.
	 *
	 * @param args the arguments
	 */
	public static void main(String[] args) {
		NIPConverter c = new NIPConverter();
		String s = c.convertToString(null, new String[] {"1234512345"});
		System.out.println(s);
	}
}
