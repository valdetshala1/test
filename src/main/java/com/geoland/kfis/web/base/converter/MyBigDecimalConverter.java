package com.geoland.kfis.web.base.converter;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.Locale;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.util.StrutsTypeConverter;

import com.opensymphony.xwork2.conversion.TypeConversionException;

// TODO: Auto-generated Javadoc
/**
 * The Class MyBigDecimalConverter.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created Apr 19, 2014 10:36:52 AM
 * @Version 1.0
 */
public class MyBigDecimalConverter extends StrutsTypeConverter {
	
	/** The Constant logger. */
	public static final Logger logger = Logger.getLogger(MyBigDecimalConverter.class);
	
	/** The Constant EURO. */
	public static final String EURO = "\u20AC";
	
	/** The Constant mask. */
	public static final String mask = "? #,##0.###";
	
	/** The Constant mask_no. */
	public static final String mask_no = "#,##0.###";
	
	/* (non-Javadoc)
	 * @see org.apache.struts2.util.StrutsTypeConverter#convertFromString(java.util.Map, java.lang.String[], java.lang.Class)
	 */
	@Override
	@SuppressWarnings("rawtypes")
	public Object convertFromString(Map map, String[] as, Class clazz) {
		logger.debug(as);
		if (as == null || as.length != 1)
			return performFallbackConversion(map, as, clazz);

		BigDecimal res = null;
		if (StringUtils.isNotEmpty(as[0])) {
			try {
				NumberFormat fmask = NumberFormat.getInstance(Locale.US);
				if (fmask instanceof DecimalFormat){
			    ((DecimalFormat) fmask).setDecimalSeparatorAlwaysShown(true);
			    ((DecimalFormat) fmask).applyPattern(mask_no);
				}
			     
				String aha = new String(as[0].getBytes(), "UTF-8");
				logger.debug(aha);
				//Number number = fmask.parse();
				String rep = as[0].replaceAll("\u20AC ", "");
//				rep = as[0].replaceAll("? ", "");
//				rep = as[0].replace("? ", "");
//				rep = as[0].replace('?', ' ');
//				rep = StringUtils.remove(as[0], "? ");
				Number number = fmask.parse(rep);
				res = BigDecimal.valueOf(number.doubleValue());
			} catch (ParseException ex) {
				logger.warn("convertFromString() - [{}], mask [{}], " + as[0] + ", " + mask);
				logger.error("convertFromString() - [{}], mask [{}], " + as[0] + ", " + mask, ex);
				logger.fatal("convertFromString() - [{}], mask [{}], " + as[0] + ", " + mask, ex);
				throw new TypeConversionException("This one can not be converted!", ex);
			} catch (UnsupportedEncodingException e) {
				logger.error("UnsupportedEncodingException", e);
				e.printStackTrace();
			}
		}

		return res;
	}

	/* (non-Javadoc)
	 * @see org.apache.struts2.util.StrutsTypeConverter#convertToString(java.util.Map, java.lang.Object)
	 */
	@Override
	@SuppressWarnings("rawtypes")
	public String convertToString(Map map, Object obj) {
		String res = obj != null ? obj.toString() : StringUtils.EMPTY;
		if (obj != null && obj instanceof BigDecimal) {
			NumberFormat fmask = NumberFormat.getInstance(Locale.US);
		    ((DecimalFormat) fmask).setDecimalSeparatorAlwaysShown(true);
		    ((DecimalFormat) fmask).applyPattern(mask_no);
			res = fmask.format((BigDecimal) obj);
		}
		return res;
	}
	
	/**
	 * The main method.
	 *
	 * @param args the arguments
	 * @throws ParseException the parse exception
	 */
	public static void main(String[] args) throws ParseException {
		
			
		
			String as[] = {"? 6,555.55", "? 24,666.67", "? 150"};
			
			String rep = as[0].replaceAll("? ", "");
			System.out.println(as[0] + "\t" + rep);
			
			NumberFormat f = NumberFormat.getInstance(Locale.US);
			 if (f instanceof DecimalFormat) {
			     ((DecimalFormat) f).setDecimalSeparatorAlwaysShown(true);
			 }
			 
			 
			System.out.println("6,555.55" + "\t" + ((DecimalFormat) f).toPattern() + "\t" + f.parse("6,555.55"));
			System.out.println("24,555.55" + "\t" + ((DecimalFormat) f).toPattern() + "\t" + f.parse("24,555.55"));
			System.out.println("224,555.55" + "\t" + ((DecimalFormat) f).toPattern() + "\t" + f.parse("224,555.55"));
			System.out.println("3,224,555.55" + "\t" + ((DecimalFormat) f).toPattern() + "\t" + f.parse("3,224,555.55"));
			System.out.println("\n");
			
			NumberFormat fmask = NumberFormat.getInstance(Locale.US);
			 if (fmask instanceof DecimalFormat) {
			     ((DecimalFormat) fmask).setDecimalSeparatorAlwaysShown(true);
			     ((DecimalFormat) fmask).applyPattern(mask);
			 }
			Number n1 = fmask.parse("? 6,555.55"); 
			System.out.println("? 6,555.55" + "\t" + ((DecimalFormat) fmask).toPattern() + "\t" + n1 + "\t\t" + fmask.format(n1.doubleValue()));
			Number n2 = fmask.parse("? 24,555.55");
			System.out.println("? 24,555.55" + "\t" + ((DecimalFormat) fmask).toPattern() + "\t" + n1 + "\t\t" + fmask.format(n2.doubleValue()));
			Number n3 = fmask.parse("? 224,555.55");
			System.out.println("? 224,555.55" + "\t" + ((DecimalFormat) fmask).toPattern() + "\t" + n3 + "\t\t" + fmask.format(n3.doubleValue()));
			Number n4 = fmask.parse("? 3,224,555.55");
			System.out.println("? 3,224,555.55" + "\t" + ((DecimalFormat) fmask).toPattern() + "\t" + n4 + "\t\t" + fmask.format(n4.doubleValue()));
			Number n5 = fmask.parse("? 45,454.00");
			System.out.println("? 45,454.00" + "\t" + ((DecimalFormat) fmask).toPattern() + "\t" + n5 + "\t\t" + fmask.format(n5.doubleValue()));
			System.out.println("\n");
			
			 
			/*
			DecimalFormat nf = new DecimalFormat(mask);
			 if (nf instanceof DecimalFormat) {
			     ((DecimalFormat) nf).setDecimalSeparatorAlwaysShown(true);
			 }			
			for(int i = 0;i<as.length;i++){
				ParsePosition parsePosition = new ParsePosition(0);
				Number number = nf.parse(as[i], parsePosition);
				double d = number.doubleValue();
				System.out.println(as[i] + "\t\t" + d + "\t\t" + nf.format(d) + "\t\t" + nf.format(doublePayment[i]));
			}
			*/
		
//		DecimalFormat.setMinimumFractionDigits(2);
//		DecimalFormat.setMaximumFractionDigits(2);
//		 NumberFormat n = NumberFormat.getCurrencyInstance(Locale.GERMANY); 
//	     System.out.println(n.format(doublePayment[0]));
	     //System.out.println(n.parse(as[1]));    
		 

//		//formatting numbers upto 2 decimal places in Java
//        DecimalFormat df = new DecimalFormat("#,###,##0.00");
//        System.out.println(df.format(364565.14));
//        System.out.println(df.format(364565.1454));
//      
//        //formatting numbers upto 3 decimal places in Java
//        df = new DecimalFormat("#,###,##0.000");
//        System.out.println(df.format(364565.14));
//        System.out.println(df.format(364565.1454));

        
	
		
			// Print out a number using the localized number, integer, currency,
			 // and percent format for each locale
			/*
			 Locale[] locales = NumberFormat.getAvailableLocales();
			 double myNumber = -1234.56;
			 NumberFormat form;
			 for (int j=0; j<4; ++j) {
			     System.out.println("FORMAT");
			     for (int i = 0; i < locales.length; ++i) {
			         if (locales[i].getCountry().length() == 0) {
			            continue; // Skip language-only locales
			         }
			         System.out.print(locales[i].getDisplayName());
			         switch (j) {
			         case 0:
			             form = NumberFormat.getInstance(locales[i]); break;
			         case 1:
			             form = NumberFormat.getIntegerInstance(locales[i]); break;
			         case 2:
			             form = NumberFormat.getCurrencyInstance(locales[i]); break;
			         default:
			             form = NumberFormat.getPercentInstance(locales[i]); break;
			         }
			         if (form instanceof DecimalFormat) {
			             System.out.print(": " + ((DecimalFormat) form).toPattern());
			         }
			         System.out.print(" -> " + form.format(myNumber));
			         try {
			             System.out.println(" -> " + form.parse(form.format(myNumber)));
			         } catch (ParseException e) {}
			     }
			 }
			 */
			 		
		
	}

}