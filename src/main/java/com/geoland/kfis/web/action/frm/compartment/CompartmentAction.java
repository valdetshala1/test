package com.geoland.kfis.web.action.frm.compartment;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Compartment;
import com.geoland.kfis.model.LayersGis;
import com.geoland.kfis.model.Stand;
import com.geoland.kfis.persistence.dao.DAOFactory;
// TODO: Auto-generated Javadoc

/**
 * The Class CompartmentAction.
 *
 * @author Ardiana Demolli, Geo&Land
 * Nov 11, 2015, 10:37:39 AM
 * v2.0
 */
public class CompartmentAction extends CompartmentBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -4204366631412991801L;
	
	/**
	 * Page.
	 *
	 * @return the string
	 */
	public String page(){
		HttpServletRequest request = ServletActionContext.getRequest();
		if(request.getSession().getAttribute("geoserver_url")==null){
			String key = getSettings().getString("geoserver_url");
			request.getSession().setAttribute("geoserver_url", key);
		}
		if(request.getSession().getAttribute("gisserver_url")==null){
			String key = getSettings().getString("gisserver_url");
			request.getSession().setAttribute("gisserver_url", key);
		}
		if(request.getSession().getAttribute("geoserver_url_wfs")==null){
			String key = getSettings().getString("geoserver_url_wfs");
			request.getSession().setAttribute("geoserver_url_wfs", key);
		}
		
		if(compartmentId!=null){
			Compartment c = DAOFactory.getFactory().getCompartmentDAO().get(compartmentId);
			if(getStand()!=null)
				getStand().setCompartment(c);
			else{
				setStand(new Stand());
				getStand().setCompartment(c);
			}
				
		}
		mapLayers=DAOFactory.getFactory().getLayersGisDAO().getAll();

		return "page";
	}
	
//	public void drawMapLayers(){
//		mapLayers=new ArrayList<String>();
//		List<LayersGis> layers=DAOFactory.getFactory().getLayersGisDAO().getAll();
//		for(LayersGis l:layers){
//			String jsonStructure="";
//			if(l.getServiceType().equalsIgnoreCase("wms")){
//				jsonStructure=
//			}
//			
//		}
//	}

	/**
 * Form.
 *
 * @return the string
 */
public String form(){
		if(compartmentId!=null)
			setCompartment(DAOFactory.getFactory().getCompartmentDAO().get(compartmentId));
		return "form";
	}	
	
	/**
	 * Grid.
	 *
	 * @return the string
	 */
	public String grid(){
		return "grid";
	}	
	
	/**
	 * Layersgrid.
	 *
	 * @return the string
	 */
	public String layersgrid(){
		return "layersgrid";
	}
	
	/**
	 * Layersform.
	 *
	 * @return the string
	 */
	public String layersform(){
		if(parentId!=null) {
			 layer_name= DAOFactory.getFactory().getLayersGisDAO().get(parentId).getStore();
		}
		return "layersform";
	}
	
	/**
	 * Altitude profile.
	 *
	 * @return the string
	 */
	public String altitudeProfile(){
		return "profile";
	}	
}
