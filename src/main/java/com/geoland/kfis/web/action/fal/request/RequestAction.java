package com.geoland.kfis.web.action.fal.request;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class RequestAction.
 *
 * @author Ardiana Demolli, Geo&Land
 * Nov 18, 2015, 3:21:19 PM
 * v2.0
 */
public class RequestAction extends RequestBaseAction{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(requestId!=null){
			String lang=getLocale().getLanguage();
			leaseRequest = DAOFactory.getFactory().getRequestDAO().get(requestId);
			periodPrice=leaseRequest.getRequestType().getPrice().toString();
			if("en".equals(lang)){
				periodType=leaseRequest.getRequestType().getPeriodType().getDOMTEXT_EN();
			}else if("sr".equals(lang)){
				periodType=leaseRequest.getRequestType().getPeriodType().getDOMTEXT_SR();
			}else{
				periodType=leaseRequest.getRequestType().getPeriodType().getDOMTEXT();
			}
		}
			return "form";
	}
	
	/**
	 * List.
	 *
	 * @return the string
	 */
	public String list(){
		return "list";
	}
	
	/**
	 * Page.
	 *
	 * @return the string
	 */
	public String page(){
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
		return "page";
	}
	
	/**
	 * App rej popup.
	 *
	 * @return the string
	 */
	public String appRejPopup(){
		return "appRejPopup";
	}
	
	/**
	 * Status report.
	 *
	 * @return the string
	 */
	public String statusReport(){
		return "statusReport";
	}
}
