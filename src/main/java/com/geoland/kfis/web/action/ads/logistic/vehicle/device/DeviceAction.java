package com.geoland.kfis.web.action.ads.logistic.vehicle.device;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.IntegerType;
import org.hibernate.type.LongType;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.model.Devices;
import com.geoland.kfis.model.FuelConsum;
import com.geoland.kfis.model.Vehicle;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class DeviceAction.
 */
public class DeviceAction extends DeviceBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 650325346918635383L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(vehicleDeviceId!=null){
			Devices d=DAOFactory.getFactory().getDevicesDAO().get(vehicleDeviceId);
			setDevices(d);
		}
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
	 * Page.
	 *
	 * @return the string
	 */
	public String page(){
		return "page";
	}
	
	/**
	 * Vehicles trackin map.
	 *
	 * @return the string
	 */
	public String vehicles_trackin_map(){
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
		
		return "vehicles_trackin_map";
	}
	
	
	/**
	 * Tracking.
	 *
	 * @return the string
	 */
	public String tracking(){
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
		
		deviceIdList=DAOFactory.getFactory().getDevicesDAO().executeSQLQuery("select * from tlog_devices d where d.vehicle_id="+vehicleIdDev);
		
		getActiveDevice(vehicleIdDev);
		
		Vehicle vehicle=DAOFactory.getFactory().getVehicleDAO().get(vehicleIdDev);
		plateNumber=vehicle.getPlateNumber();
		return "tracking";
	}
	
	
	/**
	 * Gets the active device.
	 *
	 * @param vehicleId the vehicle id
	 * @return the active device
	 */
	public void getActiveDevice(Long vehicleId){
		String query="select d.id as active_device from tlog_devices d where d.vehicle_id="+vehicleId+" and active_device is true";
		
		Session session = HibSessionFactory.getSessionFactory().getCurrentSession();
		SQLQuery sqlQuery = session.createSQLQuery(query);
		sqlQuery.addScalar("active_device", LongType.INSTANCE);
		vehicleActiveDevice=(Long) sqlQuery.uniqueResult();
	}
}
