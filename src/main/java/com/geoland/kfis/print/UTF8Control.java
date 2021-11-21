package com.geoland.kfis.print;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLConnection;
import java.util.Locale;
import java.util.PropertyResourceBundle;
import java.util.ResourceBundle;
import java.util.ResourceBundle.Control;

// TODO: Auto-generated Javadoc
/**
 * The Class UTF8Control.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created May 20, 2014 10:44:03 AM
 * @Version 1.0
 */
public class UTF8Control extends Control {
	
	/* (non-Javadoc)
	 * @see java.util.ResourceBundle.Control#newBundle(java.lang.String, java.util.Locale, java.lang.String, java.lang.ClassLoader, boolean)
	 */
	public ResourceBundle newBundle(String baseName, Locale locale,
			String format, ClassLoader loader, boolean reload)
			throws IllegalAccessException, InstantiationException, IOException {
		// The below is a copy of the default implementation.
		String bundleName = toBundleName(baseName, locale);
		String resourceName = toResourceName(bundleName, "properties");
		ResourceBundle bundle = null;
		InputStream stream = null;
		if (reload) {
			URL url = loader.getResource(resourceName);
			if (url != null) {
				URLConnection connection = url.openConnection();
				if (connection != null) {
					connection.setUseCaches(false);
					stream = connection.getInputStream();
				}
			}
		} else {
			stream = loader.getResourceAsStream(resourceName);
		}
		if (stream != null) {
			try {
				// Only this line is changed to make it to read properties files
				// as UTF-8.
				bundle = new PropertyResourceBundle(new InputStreamReader(stream, "UTF-8"));
			} finally {
				stream.close();
			}
		}
		return bundle;
	}
	
	/**
	 * The main method.
	 *
	 * @param args the arguments
	 * @throws UnsupportedEncodingException the unsupported encoding exception
	 */
	public static void main(String[] args) throws UnsupportedEncodingException {
		ResourceBundle rb = ResourceBundle.getBundle("print", new UTF8Control());
		System.out.println(rb.getString("title_application"));
		
		byte[] bytesInDefaultEncoding = rb.getString("title_application").getBytes(); // May generate corrupt bytes.
		byte[] bytesInUTF8 = rb.getString("title_application").getBytes("UTF-8"); // Correct.
		String stringUsingDefaultEncoding = new String(bytesInUTF8); // Unknown bytes becomes "?".
		System.out.println(stringUsingDefaultEncoding);

		String stringUsingUTF8 = new String(bytesInUTF8, "UTF-8"); // Correct.
		System.out.println(stringUsingUTF8);
		
		rb = ResourceBundle.getBundle("print");
		System.out.println(rb.getString("title_application"));
	}

}
