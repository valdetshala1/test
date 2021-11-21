package com.geoland.kfis.web.action.ads.logistic.vehicle.device;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.DatatypeConverter;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.PutMethod;
import org.apache.commons.io.IOUtils;
import org.apache.struts2.ServletActionContext;
import org.eclipse.birt.report.model.api.util.StringUtil;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.IntegerType;
import org.json.JSONException;
import org.json.JSONObject;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;


// TODO: Auto-generated Javadoc
/**
 * The Class DeviceSaveAction.
 */
public class DeviceSaveAction extends DeviceBaseAction{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -2191366685348963509L;
	
	/** The employee. */
	private Employee employee;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		employee=getUser().getEmployee();
		if(employee==null)
			addActionError("");
		if(getDevices()!=null && StringUtil.isEmpty(getDevices().getName())){
			addFieldError("devices.name", getMessage("devices.name.is.empty"));
		}
		if(getDevices()!=null && StringUtil.isEmpty(getDevices().getUniqueid())){
			addFieldError("devices.uniqueId", getMessage("devices.uniqueId.is.empty"));
		}
		if(getDevices()!=null && getDevices().getActiveStartDate()==null){
			addFieldError("devices.activeStartDate", getMessage("devices.activeStartDate.is.empty"));
		}
		if(getDevices()!=null && getDevices().getActiveEndDate()==null){
			addFieldError("devices.activeEndDate", getMessage("devices.activeEndDate.is.empty"));
		}
		if(getDevices()!=null && getDevices().getVehicle().getId()!=null){
			String query="select count(*) as active_device_count from tlog_devices d where d.vehicle_id="+vehicleIdDev+" and d.active_device is true";
			
			if(getDevices().getId()!=null){
				query+=" and d.id!="+getDevices().getId();
			}
			
			Session session = HibSessionFactory.getSessionFactory().getCurrentSession();
			SQLQuery sqlQuery = session.createSQLQuery(query);
			sqlQuery.addScalar("active_device_count", IntegerType.INSTANCE);
			Integer active_device_count=(Integer) sqlQuery.uniqueResult();
			
			if(active_device_count>0){
				addFieldError("devices.active", getMessage("devices.vehicle.is.active"));
			}
		}else if(getDevices().getVehicle().getId()==null){
			addFieldError("vehicleId", getMessage("devices.vehicleId.is.empty"));
		}
		
		if (!getFieldErrors().isEmpty() || !getActionErrors().isEmpty()) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exits", "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	public String execute() throws Exception {
		if(getDevices().getId()==null){
			getDevices().setCreatedDate(new Date());
			getDevices().setEmployee(employee);
		}
		getDevices().setCurrentUser(getUser().getUser());
		if(getDevices().getId()==null){
			String deviceApiId=addDeviceInTraccar(getDevices().getName(),getDevices().getUniqueid(),getDevices().getPhone(),getDevices().getVehicle().getId());
			getDevices().setDeviceApiId(new Integer(deviceApiId).longValue());
		}else{
			editDeviceInTraccar(getDevices().getName(),getDevices().getUniqueid(), getDevices().getPhone(),getDevices().getDeviceApiId(),getDevices().getVehicle().getId());
		}
		DAOFactory.getFactory().getDevicesDAO().save(getDevices());
		
		return SUCCESS;
	}
	
	/**
	 * Adds the device in traccar.
	 *
	 * @param deviceName the device name
	 * @param deviceId the device id
	 * @param phone the phone
	 * @param vehicleId the vehicle id
	 * @return the string
	 * @throws HttpException the http exception
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws JSONException the JSON exception
	 */
	public String  addDeviceInTraccar(String deviceName,String deviceId,String phone,Long vehicleId) throws HttpException, IOException, JSONException{
        String URL= "http://localhost:8083/api/devices/";
        HttpClient client = new HttpClient();
        PostMethod post = new PostMethod(URL);
//        String encoding =Base64.getEncoder().encodeToString("admin:admin".getBytes());
        String encoding =DatatypeConverter.printBase64Binary("admin:admin".getBytes());
        String jsonStr="{\"id\": -1,\"name\": \""+deviceName+"\",	\"uniqueId\": \""+deviceId+"\",	\"phone\": \""+phone+"\","
        		+ "	\"model\": \""+vehicleId+"\",\"contact\": \"\",	\"category\": \"arrow\",	\"status\": null,"
        		+ "\"lastUpdate\": null,\"groupId\": 0}";
        post.setRequestBody(jsonStr);
        post.setRequestHeader("Content-Type", "application/json");
        post.setRequestHeader("X-Requested-With", "XMLHttpRequest");
        Header header=new Header("Authorization", "Basic " + encoding);
        post.setRequestHeader( header);
        int status= client.executeMethod(post);
	    String response=IOUtils.toString(post.getResponseBodyAsStream(),"UTF-8");
	    JSONObject json=new JSONObject(response);
	    post.releaseConnection();
	    
	    return json.getString("id");
	}
	
	/**
	 * Edits the device in traccar.
	 *
	 * @param deviceName the device name
	 * @param deviceId the device id
	 * @param phone the phone
	 * @param entityId the entity id
	 * @param vehicleId the vehicle id
	 * @throws HttpException the http exception
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public void editDeviceInTraccar(String deviceName,String deviceId,String phone,long entityId,Long vehicleId) throws HttpException, IOException{
        String URL= "http://localhost:8083/api/devices/"+entityId;
        HttpClient client = new HttpClient();
        PutMethod put=new PutMethod(URL);
//        String encoding =Base64.getEncoder().encodeToString("admin:admin".getBytes());
        String encoding =DatatypeConverter.printBase64Binary("admin:admin".getBytes());
        String jsonStr="{\"id\": "+entityId+",	\"name\": \""+deviceName+"\",	\"uniqueId\": \""+deviceId+"\",	\"phone\": \""+phone+"\","
        		+ "	\"model\": \""+vehicleId+"\",	\"contact\": \"\",	\"category\": \"arrow\",	\"status\": null,"
        		+ "\"lastUpdate\": null,\"groupId\": 0}";
        put.setRequestBody(jsonStr);
        put.setRequestHeader("Content-Type", "application/json");
        put.setRequestHeader("X-Requested-With", "XMLHttpRequest");
        Header header=new Header("Authorization", "Basic " + encoding);
        put.setRequestHeader( header);
        int status= client.executeMethod(put);
        put.releaseConnection();
	}
	
	
	/**
	 * Gets the employee.
	 *
	 * @return the employee
	 */
	public Employee getEmployee() {
		return employee;
	}
	
	/**
	 * Sets the employee.
	 *
	 * @param employee the new employee
	 */
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

}
