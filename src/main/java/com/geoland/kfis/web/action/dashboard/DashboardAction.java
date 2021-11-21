package com.geoland.kfis.web.action.dashboard;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class DashboardAction.
 */
public class DashboardAction extends BaseActionSupport{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/**
	 * Dashboard.
	 *
	 * @return the string
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public String dashboard() throws IOException{
		HttpServletRequest httpRequest = ServletActionContext.getRequest();
		if(httpRequest.getSession().getAttribute("geoserver_url")==null){
			String key = getSettings().getString("geoserver_url");
			httpRequest.getSession().setAttribute("geoserver_url", key);
		}
		if(httpRequest.getSession().getAttribute("gisserver_url")==null){
			String key = getSettings().getString("gisserver_url");
			httpRequest.getSession().setAttribute("gisserver_url", key);
		}
		if(httpRequest.getSession().getAttribute("geoserver_url_wfs")==null){
			String key = getSettings().getString("geoserver_url_wfs");
			httpRequest.getSession().setAttribute("geoserver_url_wfs", key);
		}
		return "dashboard";
	}
	
	/**
	 * Printviewer.
	 *
	 * @return the string
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public String printviewer() throws IOException{
		return "printviewer";
	}
}
