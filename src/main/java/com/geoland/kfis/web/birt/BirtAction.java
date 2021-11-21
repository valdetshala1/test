package com.geoland.kfis.web.birt;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class BirtAction.
 *
 * @author GEO&LAND
 * @created September 23, 2014 12:23:06 AM
 * @Version 1.0
 */
public class BirtAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The parameter map. */
	private Map<String, String[]> parameterMap;
	
	/** The page parameter map. */
	private Map<String, String> pageParameterMap = new HashMap<String, String>();
	
	/** The page parameters. */
	private String pageParameters;

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		parameterMap = request.getParameterMap();
		Enumeration<String> en = request.getParameterNames();
		while (en.hasMoreElements()) {
			String paramName = (String) en.nextElement();
			String paramValue = request.getParameter(paramName);
			System.out.println(paramName + " = " + paramValue + "<br/>");
			if(paramName.startsWith("p_")){
				pageParameterMap.put(paramName, paramValue);
				if(StringUtils.isNotEmpty(pageParameters)){
					pageParameters += "&" + paramName + "=" + paramValue;
				}else{
					pageParameters = paramName + "=" + paramValue;
				}
			}
		}		
		return SUCCESS;
	}
	
	/**
	 * Gets the parameter map.
	 *
	 * @return the parameter map
	 */
	public Map<String, String[]> getParameterMap() {
		return parameterMap;
	}
	
	/**
	 * Sets the parameter map.
	 *
	 * @param parameterMap the parameter map
	 */
	public void setParameterMap(Map<String, String[]> parameterMap) {
		this.parameterMap = parameterMap;
	}
	
	/**
	 * Gets the page parameters.
	 *
	 * @return the page parameters
	 */
	public String getPageParameters() {
		return pageParameters;
	}
	
	/**
	 * Sets the page parameters.
	 *
	 * @param pageParameters the new page parameters
	 */
	public void setPageParameters(String pageParameters) {
		this.pageParameters = pageParameters;
	}
	
	/**
	 * Gets the page parameter map.
	 *
	 * @return the page parameter map
	 */
	public Map<String, String> getPageParameterMap() {
		return pageParameterMap;
	}
	
	/**
	 * Sets the page parameter map.
	 *
	 * @param pageParameterMap the page parameter map
	 */
	public void setPageParameterMap(Map<String, String> pageParameterMap) {
		this.pageParameterMap = pageParameterMap;
	}
}
