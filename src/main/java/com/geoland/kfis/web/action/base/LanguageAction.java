package com.geoland.kfis.web.action.base;

import java.util.Locale;

// TODO: Auto-generated Javadoc
/**
 * The Class LanguageAction.
 *
 * @author GEO&LAND
 * @created April 19, 2014 12:19:27 PM
 * @Version 1.0
 */
public class LanguageAction extends BaseActionSupport{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 946672253393460118L;

	/** The language. */
	private String language;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		printHttpServletRequest();
		if(language != null){
			Locale locale = new Locale(language, language.toUpperCase()); 
			setLocale(locale);
		}


		return NONE;
	}

	/**
	 * Gets the language.
	 *
	 * @return the language
	 */
	public String getLanguage() {
		return language;
	}

	/**
	 * Sets the language.
	 *
	 * @param language the new language
	 */
	public void setLanguage(String language) {
		this.language = language;
	}	
}
