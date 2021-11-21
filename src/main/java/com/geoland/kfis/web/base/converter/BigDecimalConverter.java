package com.geoland.kfis.web.base.converter;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.util.StrutsTypeConverter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.conversion.TypeConversionException;

// TODO: Auto-generated Javadoc
/**
 * The Class BigDecimalConverter.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created Apr 19, 2014 10:35:18 AM
 * @Version 1.0
 */
public abstract class BigDecimalConverter extends StrutsTypeConverter {

	/** The Constant logger. */
	public static final Logger logger = LoggerFactory.getLogger(BigDecimalConverter.class);
	
	/* (non-Javadoc)
	 * @see org.apache.struts2.util.StrutsTypeConverter#convertFromString(java.util.Map, java.lang.String[], java.lang.Class)
	 */
	@SuppressWarnings("rawtypes")
	@Override
	public Object convertFromString(Map map, String[] as, Class class1) {
		logger.debug("convertFromString(Map=[{}], String[]=[{}], Class=[{}]) - start",
				new Object[] {map, as, class1});
		
		if (as == null || as.length != 1)
			return performFallbackConversion(map, as, class1);

		BigDecimal res = null;
		String mask = null;
		if (StringUtils.isNotEmpty(as[0])) {
			try {
				//ActionSupport action = (ActionSupport) ActionContext.getContext().getActionInvocation().getAction();
				/*
				String regEx = this.getRegEx(action);
				if (StringUtils.isNotEmpty(regEx)) {
					if (!Pattern.matches(regEx, as[0])) {
						logger.warn("convertFromString() - [{}] doesn't match RegEx [{}]", as[0], regEx);
						throw new TypeConversionException(as[0] + " doesn't match RegEx " + regEx);
					}
				}*/
				
				//mask = this.getMask(action);
				mask = "#,##0.00";
				DecimalFormat nf = new DecimalFormat(mask);
				Number number = nf.parse(as[0]);
				res = BigDecimal.valueOf(number.doubleValue());

				logger.debug("convertFromString() - [{}] -> [{}]", as[0], res);
				
			} catch (ParseException ex) {
				logger.warn("convertFromString() - [{}], mask [{}]", as[0], mask);
				throw new TypeConversionException("This one can not be converted!", ex);
			}
		}

		logger.debug("convertFromString() - end - return value=[{}]", res);
		return res;
	}

	/* (non-Javadoc)
	 * @see org.apache.struts2.util.StrutsTypeConverter#convertToString(java.util.Map, java.lang.Object)
	 */
	@SuppressWarnings("rawtypes")
	@Override
	public String convertToString(Map map, Object obj) {
		logger.debug("convertToString(Map=[{}], Object=[{}]) - start", map, obj);
		
		String res = obj != null ? obj.toString() : StringUtils.EMPTY;
		if (obj != null && obj instanceof BigDecimal) {
			
			//ActionSupport action = (ActionSupport) ActionContext.getContext().getActionInvocation().getAction();

			//String mask = this.getMask(action);
			String mask = "#,##0.00";
			DecimalFormat nf = new DecimalFormat(mask);
			res = nf.format((BigDecimal) obj);
		}
		
		logger.debug("convertToString(Map, Object) - end - return value=[{}]", res);
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
		
	/**
	 * The main method.
	 *
	 * @param args the arguments
	 * @throws Exception the exception
	 */
	public static void main(String[] args) throws Exception {

		// {0,number,,##0.00}
		String str = "123456";
		DecimalFormat nf = new DecimalFormat("#");
		
		Number number = nf.parse(str);
		BigDecimal res = BigDecimal.valueOf(number.doubleValue());
		
		System.out.println(res);
		
		System.out.println(nf.format(new BigDecimal(123456d)));
	}
}
