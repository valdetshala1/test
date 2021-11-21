package com.geoland.kfis.web.action.ads.logistic.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.BooleanType;
import org.hibernate.type.DateType;
import org.hibernate.type.DoubleType;
import org.hibernate.type.IntegerType;
import org.hibernate.type.StringType;
import org.osgi.framework.SynchronousBundleListener;

import com.geoland.framework.exception.BusinessException;
import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.model.Devices;
import com.geoland.kfis.model.FuelConsum;
import com.geoland.kfis.model.Vehicle;
import com.geoland.kfis.model.VehicleRegister;
import com.geoland.kfis.model.VehicleServiceMaintenance;
import com.geoland.kfis.model.VehicleStaffAssign;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.DevicesDAO;
import com.geoland.kfis.persistence.dao.services.FuelConsumDAO;
import com.geoland.kfis.persistence.dao.services.VehicleDAO;
import com.geoland.kfis.persistence.dao.services.VehicleRegisterDAO;
import com.geoland.kfis.persistence.dao.services.VehicleServiceMaintenanceDAO;
import com.geoland.kfis.persistence.dao.services.VehicleStaffAssignDAO;
import com.geoland.kfis.persistence.hibernate.usertypes.Fueltype;
import com.geoland.kfis.web.action.base.grid.GridBaseAction;
import com.vividsolutions.jts.geom.Geometry;
import com.vividsolutions.jts.geom.GeometryFactory;
import com.vividsolutions.jts.geom.PrecisionModel;
import com.vividsolutions.jts.io.WKTReader;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
// TODO: Auto-generated Javadoc

/**
 * The Class LogisticGridAction.
 *
 * @author Festim Krasniqi,GEO&LAND
 * @created May 21, 2014 4:11:58 PM
 * @Version 1.0
 */
public class LogisticGridAction extends GridBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -6359911559113949406L;
	
	/** The fuel type list. */
	protected Fueltype[] fuelTypeList=Fueltype.values();
	
	/**
	 * GIRD JSON - logVehicles method.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void vehicle() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String language = getLocale().getLanguage();
			String type=request.getParameter("type");
			VehicleDAO dao = DAOFactory.getFactory().getVehicleDAO();
			String countQuery = "select count(*) from tlog_vehicles as l";
			Integer count = dao.countQuery(countQuery);
			calcPages(count);

			String sqlQuery = "select distinct l.*,o.* from tlog_vehicles as l left join torganisation o on l.department_id=o.id ";
			if(StringUtils.isNotEmpty(type)){
				sqlQuery+=" where l.type ilike '"+type+"%' ";
				countQuery+=" where l.type ilike '%"+type+"%' ";
			}
			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
				String ob_field = getSidx();
				if(ob_field.equals("party"))
					ob_field=("en".equals(language)?"o.orga_name_en":"sr".equals(language)?"o.orga_name_sr":"o.orga_name");
				sqlQuery += " order by " + ob_field + " " + getSord();
			}
			
			sqlQuery+=" LIMIT " + limit + " offset " + start;
			List<Vehicle> list = dao.executeSQLQuery(sqlQuery);

			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());

			JSONArray rows = new JSONArray();
			for (Vehicle lv : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", lv.getId());
				jsonObject.element("party", getOganisationData(lv.getOrganisation(), language));
				jsonObject.element("destination", lv.getDestination());
				jsonObject.element("brand", lv.getBrand());
				jsonObject.element("type", lv.getType());
				jsonObject.element("year_product", lv.getYearProduct());
				jsonObject.element("plate_number", lv.getPlateNumber());
				jsonObject.element("first_registration", fdate(lv.getFirstRegistration()));
				jsonObject.element("number_of_seats", lv.getNumberOfSeats());
				jsonObject.element("color", lv.getColor());
				jsonObject.element("engine_code", lv.getEngineCode());
				jsonObject.element("weight", lv.getWeight());
				jsonObject.element("type_engine", lv.getTypeEngine());
				jsonObject.element("volume_capacity", lv.getVolumeCapacity());
				jsonObject.element("created_by", getPersonData(lv.getEmployee()));
				jsonObject.element("created_date", fdate(lv.getCreatedDate()));
				rows.add(jsonObject);
			}

			data.element("rows", rows);
			out.append(data.toString());
			out.flush();

		} catch (Exception e) {
			log.error("LogisticGridAction.vehicle", e);
			throw new BusinessException("LogisticGridAction.vehicle", e);
		} finally {
			out.close();
		}

	}

	/**
	 * GIRD JSON - logVehiclesRegister method.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void vehicleRegister() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String vehicleId = request.getParameter("vehicleId");
			if (StringUtils.isNotEmpty(vehicleId)) {
				VehicleRegisterDAO dao = DAOFactory.getFactory()
						.getVehicleRegisterDAO();
				String countQuery = "select count(*) from tlog_vehicles_register as l where l.vehicles_id="
						+ vehicleId;
				Integer count = dao.countQuery(countQuery);
				calcPages(count);

				String sqlQuery = "select l.* from tlog_vehicles_register as l where l.vehicles_id="
						+ vehicleId;
				if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
					sqlQuery += " order by " + getSidx() + " " + getSord();
				}
				sqlQuery+=" LIMIT " + limit + " offset " + start;
				List<VehicleRegister> list = dao.executeSQLQuery(sqlQuery);

				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());

				JSONArray rows = new JSONArray();
				for (VehicleRegister lvr : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", lvr.getId());
					jsonObject.element("vehicles", lvr.getVehicle().getPlateNumber());
					jsonObject.element("registered_date", fdate(lvr.getRegisteredDate()));
					jsonObject.element("valide_to_date", fdate(lvr.getValideToDate()));
					jsonObject.element("mileage_at_register", lvr.getMileageAtRegister());
					jsonObject.element("created_by", getPersonData(lvr.getEmployee()));
					jsonObject.element("created_time", fdate(lvr.getCreatedTime()));

					rows.add(jsonObject);
				}

				data.element("rows", rows);
				out.append(data.toString());
				out.flush();

			} else {
				JSONArray jsonArray = new JSONArray();
				JSONObject header = new JSONObject();
				header.element("TotalRows", 0);
				String str = jsonArray.toString();
				out.append(str);
				out.flush();
			}
		} catch (Exception e) {
			log.error("LogisticGridAction.vehicleRegister", e);
			throw new BusinessException("LogisticGridAction.vehicleRegister",
					e);
		} finally {
			out.close();
		}

	}

	/**
	 * GIRD JSON - logVehiclesServiceMaintenance method.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void vehicleServiceMaintenance() throws IOException,
			BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String vehicleId = request.getParameter("vehicleId");
			if (StringUtils.isNotEmpty(vehicleId)) {
				VehicleServiceMaintenanceDAO dao = DAOFactory.getFactory()
						.getVehicleServiceMaintenanceDAO();
				String countQuery = "select count(*) from tlog_vehicles_service_maintenance as l where l.vehicles_id="
						+ vehicleId;
				Integer count = dao.countQuery(countQuery);
				calcPages(count);

				String sqlQuery = "select l.* from tlog_vehicles_service_maintenance as l where l.vehicles_id="
						+ vehicleId;
				if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
					sqlQuery += " order by " + getSidx() + " " + getSord();
				}
				sqlQuery+=" LIMIT " + limit + " offset " + start;
				List<VehicleServiceMaintenance> list = dao
						.executeSQLQuery(sqlQuery);

				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());

				JSONArray rows = new JSONArray();
				for (VehicleServiceMaintenance lvsm : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", lvsm.getId());
					jsonObject.element("vehicles", lvsm.getVehicle().getPlateNumber());
					jsonObject.element("expenditure_type", lvsm.getExpenditureType());
					jsonObject.element("value", lvsm.getValue());
					jsonObject.element("date_service", DATE_FORMAT.format(lvsm.getDateService()));
					if(lvsm.getDateValid()!=null)
					  jsonObject.element("date_valid", DATE_FORMAT.format(lvsm.getDateValid()));
					else 
					  jsonObject.element("date_valid", "");
					jsonObject.element("created_by", getPersonData(lvsm.getEmployee()));
					jsonObject.element("created_time", fdate(lvsm.getCreatedTime()));

					rows.add(jsonObject);
				}

				data.element("rows", rows);
				out.append(data.toString());
				out.flush();

			} else {
				JSONArray jsonArray = new JSONArray();
				JSONObject header = new JSONObject();
				header.element("TotalRows", 0);
				String str = jsonArray.toString();
				out.append(str);
				out.flush();
			}
		} catch (Exception e) {
			log.error("LogisticGridAction.vehicleServiceMaintenance", e);
			throw new BusinessException(
					"LogisticGridAction.vehicleServiceMaintenance", e);
		} finally {
			out.close();
		}

	}
	
	/**
	 * GIRD JSON - logVehiclesRegister method.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void vehicleStaffAssign() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String vehicleId = request.getParameter("vehicleId");
			if (StringUtils.isNotEmpty(vehicleId)) {
				VehicleStaffAssignDAO dao = DAOFactory.getFactory()
						.getVehicleStaffAssignDAO();
				String countQuery = "select count(*) from tvehicles_staff_assign as vsa where vsa.vehicles_id="
						+ vehicleId;
				Integer count = dao.countQuery(countQuery);
				calcPages(count);

				String sqlQuery = "select vsa.* from tvehicles_staff_assign as vsa where vsa.vehicles_id="
						+ vehicleId;
				sqlQuery+=" LIMIT " + limit + " offset " + start;
				List<VehicleStaffAssign> list = dao.executeSQLQuery(sqlQuery);

				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());

				JSONArray rows = new JSONArray();
				for (VehicleStaffAssign vsa : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", vsa.getId());
					jsonObject.element("logVehicles", vsa.getVehicle().getPlateNumber());
					jsonObject.element("employeeByEmployeeId", vsa.getEmployeeByEmployeeId().getFirstName()+" "+vsa.getEmployeeByEmployeeId().getLastName());
					jsonObject.element("autorization",vsa.isAutorization());
					jsonObject.element("dateOfAutorization",DATE_FORMAT.format(vsa.getDateOfAutorization()));
					jsonObject.element("employeeByCreatedBy",vsa.getEmployeeByCreatedBy().getFirstName()+" "+vsa.getEmployeeByCreatedBy().getLastName());
					jsonObject.element("createdTime",DATE_FORMAT.format(vsa.getCreatedTime()));

					rows.add(jsonObject);
				}

				data.element("rows", rows);
				out.append(data.toString());
				out.flush();

			} else {
				JSONArray jsonArray = new JSONArray();
				JSONObject header = new JSONObject();
				header.element("TotalRows", 0);
				String str = jsonArray.toString();
				out.append(str);
				out.flush();
			}
		} catch (Exception e) {
			log.error("LogisticGridAction.vehicleStaffAssign", e);
			throw new BusinessException("LogisticGridAction.vehicleStaffAssign",
					e);
		} finally {
			out.close();
		}

	}
	
	/**
	 * GIRD JSON - logVehiclesRegister method.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void fuelConsum() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String vehicleId = request.getParameter("vehicleId");
			if (StringUtils.isNotEmpty(vehicleId)) {
				FuelConsumDAO dao = DAOFactory.getFactory()
						.getFuelConsumDAO();
				String countQuery = "select count(*) from tfuell_consum as fc where fc.vehicles_id="
						+ vehicleId;
				Integer count = dao.countQuery(countQuery);
				calcPages(count);

				String sqlQuery = "select fc.* from tfuell_consum as fc where fc.vehicles_id="
						+ vehicleId;
				sqlQuery+=" LIMIT " + limit + " offset " + start;
				List<FuelConsum> list = dao.executeSQLQuery(sqlQuery);

				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());

				JSONArray rows = new JSONArray();
				for (FuelConsum fc : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", fc.getId());
					jsonObject.element("vehicle", fc.getVehicle().getPlateNumber());
					jsonObject.element("driver", fc.getEmployeeByDriverId().getFirstName()+" "+fc.getEmployeeByDriverId().getLastName());
					jsonObject.element("vendor", fc.getVendor());
					jsonObject.element("invoiceNumber", fc.getInvoiceNo());
					if(fc.getDate()!=null)
						jsonObject.element("date", DATE_FORMAT.format(fc.getDate()));
					jsonObject.element("fuelType", fc.getTypeFeul());
					jsonObject.element("liter", fc.getLiter());
					jsonObject.element("mileageWhenFilled", fc.getMileageWhenFilled());
					jsonObject.element("mileageTotal", fc.getTotalMileage());
					jsonObject.element("createdBy", fc.getEmployeeByCreatedBy().getFirstName()+" "+fc.getEmployeeByCreatedBy().getLastName());
					jsonObject.element("createdTime", DATE_FORMAT.format(fc.getCreatedTime()));
					
					rows.add(jsonObject);
				}

				data.element("rows", rows);
				out.append(data.toString());
				out.flush();

			} else {
				JSONArray jsonArray = new JSONArray();
				JSONObject header = new JSONObject();
				header.element("TotalRows", 0);
				String str = jsonArray.toString();
				out.append(str);
				out.flush();
			}
		} catch (Exception e) {
			log.error("LogisticGridAction.fuelConsum", e);
			throw new BusinessException("LogisticGridAction.fuelConsum", e);
		} finally {
			out.close();
		}

	}
	
	/**
	 * GIRD JSON - logVehiclesServiceMaintenance method.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void devices() throws IOException,
			BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String vehicleId = request.getParameter("vehicleId");
			if (StringUtils.isNotEmpty(vehicleId)) {
				DevicesDAO dao = DAOFactory.getFactory().getDevicesDAO();
				String countQuery = "select count(*) from tlog_devices as d where d.vehicle_id="
						+ vehicleId;
				Integer count = dao.countQuery(countQuery);
				calcPages(count);

				String sqlQuery = "select d.* from tlog_devices as d where d.vehicle_id="
						+ vehicleId;
				if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
					sqlQuery += " order by " + getSidx() + " " + getSord();
				}
				sqlQuery+=" LIMIT " + limit + " offset " + start;
				List<Devices> list = dao.executeSQLQuery(sqlQuery);

				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());

				JSONArray rows = new JSONArray();
				for (Devices d : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", d.getId());
					jsonObject.element("vehicles", d.getVehicle().getPlateNumber());
					//jsonObject.element("protocol_type", d.getProtocolPorts().getId());
					jsonObject.element("active_device", d.isActiveDevice());
					jsonObject.element("name", d.getName());
					jsonObject.element("phone", d.getPhone());
					jsonObject.element("uniqueid", d.getUniqueid());
					jsonObject.element("lastupdate", fdate(d.getLastupdate()));
					jsonObject.element("positionid", d.getPositionid());
					jsonObject.element("created_by", getPersonData(d.getEmployee()));
					jsonObject.element("created_date", fdate(d.getCreatedDate()));
					jsonObject.element("active_start_date", fdate(d.getActiveStartDate()));
					jsonObject.element("active_end_date", fdate(d.getActiveEndDate()));
					
					rows.add(jsonObject);
				}

				data.element("rows", rows);
				out.append(data.toString());
				out.flush();

			} else {
				JSONArray jsonArray = new JSONArray();
				JSONObject header = new JSONObject();
				header.element("TotalRows", 0);
				String str = jsonArray.toString();
				out.append(str);
				out.flush();
			}
		} catch (Exception e) {
			log.error("LogisticGridAction.devices", e);
			throw new BusinessException(
					"LogisticGridAction.devices", e);
		} finally {
			out.close();
		}

	}
	
	/**
	 * Devices ids.
	 *
	 * @param s the s
	 * @return the string
	 */
	private String devicesIds(String[] s){
		String ids="";
		for(int i=0;i<s.length;i++){
			if(StringUtils.isNotEmpty(s[i])){
				ids+=s[i]+",";
			}
		}
		if(ids.length()>0)
		ids=ids.substring(0, ids.length()-1);
		
		return ids;
	}
	
/**
 * Trip filter.
 *
 * @throws IOException Signals that an I/O exception has occurred.
 * @throws BusinessException the business exception
 */
public void tripFilter() throws IOException,BusinessException {
	HttpServletResponse response = ServletActionContext.getResponse();
	HttpServletRequest request = ServletActionContext.getRequest();
	response.setContentType("text/plain;charset=UTF-8");
	PrintWriter out = response.getWriter();
	try {
		String start_date=request.getParameter("start_date");
		String end_date=request.getParameter("end_date");
		String[] devicesIds=request.getParameterValues("devicesIds[]");
		String vehicleId = request.getParameter("vehicleId");
		String calcBesaOn=request.getParameter("calcBesaOn");
		String bbox_rez="";
		String dvIds="";
		if(devicesIds!=null && devicesIds.length>0){
			dvIds=devicesIds(devicesIds);
		}
		String logIds="";
		if (StringUtils.isNotEmpty(vehicleId) && StringUtils.isNotEmpty(calcBesaOn)) {
			Session session=HibSessionFactory.getSessionFactory().getCurrentSession(); 
			String countQuery = "select count(*) from tlog_trips t left join tlog_devices d on t.uniqueid=d.uniqueid where "
					+ " vehicle_id="+vehicleId;
			
			if(StringUtils.isNotEmpty(start_date) && StringUtils.isNotEmpty(end_date)){
				countQuery+=" and  "+calcBesaOn+" >= '"+start_date+"'  and  "+calcBesaOn+" <='"+end_date+"'";
			}
			
			if(StringUtils.isNotEmpty(dvIds)){
				countQuery+=" and  d.id in ("+dvIds+")";
			}
			SQLQuery countsqlQuery=session.createSQLQuery(countQuery);
			countsqlQuery.addScalar("count",IntegerType.INSTANCE);
			Integer count = (Integer) countsqlQuery.uniqueResult();
			calcPages(count);
	
			String query = "select t.id,device_name,t.uniqueid,t.phone,min_id"
					+ ",max_id,protocol,deviceid,start_time,end_time,"
					+ " duration_time,start_device_time,end_device_time,average_speed,max_speed,"
					+ " replace(replace(replace( cast((select st_extent(geom) from tlog_trips) as text),'BOX(',''),')',''),' ',', ') bbox_result, "
					+ " replace(replace(replace( cast(( Box2d(ST_ENVELOPE(geom)))as text),'BOX(',''),')',''),' ',', ') bbox_geom "
					+ " from tlog_trips t left join tlog_devices d on t.uniqueid=d.uniqueid where "
					+ " vehicle_id="+vehicleId;
			
			String queryTrip="select  replace(replace(cast(array_agg(t.id) as text),'{',''),'}','') as trips_ids"
					+ " ,replace(replace(replace( cast((select st_extent(geom) ) as text),'BOX(',''),')',''),' ',', ') bbox_result "
					+ "from tlog_trips t left join tlog_devices d on t.uniqueid=d.uniqueid  where "
					+ " vehicle_id="+vehicleId;
			
			if(StringUtils.isNotEmpty(start_date) && StringUtils.isNotEmpty(end_date)){
				query+=" and  "+calcBesaOn+" >= '"+start_date+"'  and  "+calcBesaOn+" <='"+end_date+"'";
				queryTrip+=" and  "+calcBesaOn+" >= '"+start_date+"'  and  "+calcBesaOn+" <='"+end_date+"'";

			}
			
			if(StringUtils.isNotEmpty(dvIds)){
				query+=" and  d.id in ("+dvIds+")";
				queryTrip+=" and  d.id in ("+dvIds+")";

			}
			
			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
				query += " order by " + getSidx() + " " + getSord();

			}
			
			
			query+=" LIMIT " + limit + " offset " + start;
			
			SQLQuery sqlQueryTrip=session.createSQLQuery(queryTrip);
			sqlQueryTrip.addScalar("trips_ids",StringType.INSTANCE);
			sqlQueryTrip.addScalar("bbox_result",StringType.INSTANCE);
			List listTrip = sqlQueryTrip.list();
			
			for (Iterator iterator=listTrip.iterator();iterator.hasNext();) {
				Object obj[]=(Object[])iterator.next();
				logIds=(String)obj[0]; 
				bbox_rez=(String)obj[1]; 
			}
			
			
			SQLQuery sqlQuery=session.createSQLQuery(query);
			sqlQuery.addScalar("id",IntegerType.INSTANCE);
			sqlQuery.addScalar("device_name",StringType.INSTANCE);
			sqlQuery.addScalar("uniqueid",StringType.INSTANCE);
			sqlQuery.addScalar("phone",StringType.INSTANCE);
			sqlQuery.addScalar("min_id",IntegerType.INSTANCE);
			sqlQuery.addScalar("max_id",IntegerType.INSTANCE);
			sqlQuery.addScalar("protocol",StringType.INSTANCE);
			sqlQuery.addScalar("deviceid",StringType.INSTANCE);
			sqlQuery.addScalar("start_time",DateType.INSTANCE);
			sqlQuery.addScalar("end_time",DateType.INSTANCE);
			sqlQuery.addScalar("duration_time",StringType.INSTANCE);
			sqlQuery.addScalar("start_device_time",DateType.INSTANCE);
			sqlQuery.addScalar("end_device_time",DateType.INSTANCE);
			sqlQuery.addScalar("average_speed",DoubleType.INSTANCE);
			sqlQuery.addScalar("max_speed",DoubleType.INSTANCE);
			sqlQuery.addScalar("bbox_result",StringType.INSTANCE);
			sqlQuery.addScalar("bbox_geom",StringType.INSTANCE);
			
			List list = sqlQuery.list();
	
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total",list.size());
			data.element("records", getRows());
			
	
		
			JSONArray rows = new JSONArray();
			for (Iterator iterator=list.iterator();iterator.hasNext();) {
				Object obj[]=(Object[])iterator.next();
				
				Integer id=(Integer)obj[0]; 
			//	logIds+=id+",";
				String device_name=(String)obj[1]; 
				String uniqueid=(String)obj[2]; 
				String phone=(String)obj[3]; 
				Integer min_id=(Integer)obj[4]; 
				Integer max_id=(Integer)obj[5]; 
				String protocol=(String)obj[6]; 
				String deviceid=(String)obj[7]; 
				Date start_time=(Date)obj[8]; 
				Date end_time=(Date)obj[9]; 
				String duration_time=(String)obj[10]; 
				Date start_device_time=(Date)obj[11]; 
				Date end_device_time=(Date)obj[12]; 
				Double average_speed=(Double)obj[13]; 
				Double max_speed=(Double)obj[14]; 
				String bbox_result=(String)obj[15];
				String bbox_geom=(String)obj[16];
			//	bbox_rez=bbox_result;
				
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", id);
				jsonObject.element("device_name", device_name);
				jsonObject.element("uniqueid", uniqueid);
				jsonObject.element("phone", phone);
				jsonObject.element("min_id", min_id);
				jsonObject.element("max_id", max_id);
				jsonObject.element("protocol", protocol);
				jsonObject.element("deviceid", deviceid);
				jsonObject.element("start_time",start_time);
				jsonObject.element("end_time", end_time);
				jsonObject.element("duration_time",duration_time);
				jsonObject.element("start_device_time",start_device_time);
				jsonObject.element("end_device_time",end_device_time);
				jsonObject.element("average_speed",average_speed);
				jsonObject.element("max_speed",max_speed);
				jsonObject.element("bbox_result",bbox_result);
				jsonObject.element("bbox_geom",bbox_geom);
				
				rows.add(jsonObject);
			}
		// if(logIds.length()>0)
			//logIds=logIds.substring(0, logIds.length()-1);
			data.element("logIds", logIds);
			data.element("bbox_rez", bbox_rez);
				
			data.element("rows", rows);
			out.append(data.toString());
			out.flush();
	
		} else {
			JSONArray jsonArray = new JSONArray();
			JSONObject header = new JSONObject();
			header.element("TotalRows", 0);
			jsonArray.add(header);
			String str = jsonArray.toString();
			out.append(str);
			out.flush();
		}
	} catch (Exception e) {
		log.error("LogisticGridAction.tripFilter", e);
		throw new BusinessException(
				"LogisticGridAction.tripFilter", e);
	} finally {
		out.close();
	}
	
	}


/**
 * Gets the actual trac position.
 *
 * @return the actual trac position
 * @throws IOException Signals that an I/O exception has occurred.
 */
public void getActualTracPosition() throws IOException {
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	response.setContentType("text/plain;charset=UTF-8");
	PrintWriter out = response.getWriter();

	try {
			Session session = HibSessionFactory.getSessionFactory().getCurrentSession();
			String deviceId = request.getParameter("deviceId");
			
			
//			WKTReader wktReader = new WKTReader(new GeometryFactory(new PrecisionModel(), 900916)); 
//		    Geometry geo = wktReader.read(polygon);
		    JSONArray jsonArray = new JSONArray();
			if(StringUtils.isNotEmpty(deviceId)){
				String sql = "SELECT sel_subquery.protocol, sel_subquery.deviceid, "
						+ " min(sel_subquery.servertime) AS start_time, "
						+ " max(sel_subquery.servertime) AS end_time, "
						+ " cast(( max(sel_subquery.servertime) - min(sel_subquery.servertime)) as text) AS duration_time,"
						+ "	min(sel_subquery.devicetime) AS start_device_time,  max(sel_subquery.devicetime) AS end_device_time,  avg(sel_subquery.speed) AS average_speed, "
						+ " max(sel_subquery.speed) AS max_speed,  st_astext(cast(st_makeline(sel_subquery.geom) as geometry(LineString,900916))) AS geom"
						+ " FROM ( SELECT p.id, p.protocol, p.deviceid, p.geom, p.servertime, "
						+ " p.devicetime, p.speed    FROM (  SELECT positions.id, positions.protocol, positions.deviceid, positions.servertime, "
						+ " positions.devicetime, positions.valid,      positions.speed*1.852 speed,"
						+ " st_transform(st_setsrid(st_makepoint(positions.longitude, positions.latitude), 4326), 900916) AS geom"
						+ "  FROM trac_positions positions  ORDER BY positions.protocol, positions.deviceid, positions.devicetime) p"
						+ "  WHERE p.valid IS TRUE AND p.geom IS NOT NULL and p.deviceid="+deviceId+"   ORDER BY p.protocol, p.deviceid, p.devicetime) sel_subquery GROUP BY sel_subquery.protocol, sel_subquery.deviceid";
				
				
				
				SQLQuery sqlQuery = session.createSQLQuery(sql);
				sqlQuery.addScalar("protocol", StringType.INSTANCE);
				sqlQuery.addScalar("deviceid", IntegerType.INSTANCE);
				sqlQuery.addScalar("start_time", DateType.INSTANCE);
				sqlQuery.addScalar("end_time", DateType.INSTANCE);
				sqlQuery.addScalar("duration_time", StringType.INSTANCE);
				sqlQuery.addScalar("start_device_time", DateType.INSTANCE);
				sqlQuery.addScalar("end_device_time", DateType.INSTANCE);
				sqlQuery.addScalar("average_speed", DoubleType.INSTANCE);
				sqlQuery.addScalar("max_speed", DoubleType.INSTANCE);
				sqlQuery.addScalar("geom", StringType.INSTANCE);
				
				
				List list = sqlQuery.list();
				
				for (Iterator iterator=list.iterator();iterator.hasNext();) {
					Object obj[]=(Object[])iterator.next();
					
					String protocol=(String)obj[0]; 
					Integer deviceid=(Integer)obj[1]; 
					Date start_time=(Date)obj[2]; 
					Date end_time=(Date)obj[3]; 
					String duration_time=(String)obj[4]; 
					Date start_device_time=(Date)obj[5]; 
					Date end_device_time=(Date)obj[6]; 
					Double average_speed=(Double)obj[7]; 
					Double max_speed=(Double)obj[8]; 
					String geom=(String)obj[9];
//					WKTReader wktReader = new WKTReader(new GeometryFactory(new PrecisionModel(), 900916)); 
//				    Geometry geometry = wktReader.read(geom);
					
					
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("protocol", protocol);
					jsonObject.element("deviceid", deviceid);
					jsonObject.element("start_time", fdate(start_time));
					jsonObject.element("end_time", fdate(end_time));
					jsonObject.element("duration_time", duration_time);
					jsonObject.element("start_device_time", fdate(start_device_time));
					jsonObject.element("end_device_time", fdate(end_device_time));
					jsonObject.element("average_speed", average_speed);
					jsonObject.element("max_speed",max_speed);
					jsonObject.element("geom", geom);
					
					jsonArray.add(jsonObject);
				}

			}
			String str = jsonArray.toString();
			out.append(str);
		out.flush();
	} catch (Exception e) {
		log.error("InputAction.getActualTracPosition", e);
		throw new BusinessException("InputAction.getActualTracPosition", e);
	} finally {
		out.close();
	}
}

/**
 * Gets the actual trac point.
 *
 * @return the actual trac point
 * @throws IOException Signals that an I/O exception has occurred.
 */
public void getActualTracPoint() throws IOException {
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	response.setContentType("text/plain;charset=UTF-8");
	PrintWriter out = response.getWriter();

	try {
			Session session = HibSessionFactory.getSessionFactory().getCurrentSession();
			String deviceId = request.getParameter("deviceId");
			
		    JSONArray jsonArray = new JSONArray();
			if(StringUtils.isNotEmpty(deviceId)){
				
				String sql ="select speed*1.852 as speed , plate_number,color,brand,uniqueid,course "
						+ "	,ST_AsText(st_transform(st_setsrid(st_makepoint(longitude, latitude), 4326), 900916)) as actual_point"
						+ "	from trac_positions where deviceid="+deviceId+" order by id DESC limit 1";
				
				SQLQuery sqlQuery = session.createSQLQuery(sql);
				sqlQuery.addScalar("speed", DoubleType.INSTANCE);
				sqlQuery.addScalar("plate_number", StringType.INSTANCE);
				sqlQuery.addScalar("color", StringType.INSTANCE);
				sqlQuery.addScalar("brand", StringType.INSTANCE);
				sqlQuery.addScalar("uniqueid", StringType.INSTANCE);
				sqlQuery.addScalar("actual_point", StringType.INSTANCE);
				
				List list = sqlQuery.list();
				
				for (Iterator iterator=list.iterator();iterator.hasNext();) {
					Object obj[]=(Object[])iterator.next();
					
					Double speed=(Double)obj[0];
					String plate_number=(String)obj[1]; 
					String color=(String)obj[2];
					String brand=(String)obj[3];
					String uniqueid=(String)obj[4];
					Double course=(Double)obj[0];
					String actual_point=(String)obj[5];
					
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("speed", speed);
					jsonObject.element("plate_number", plate_number);
					jsonObject.element("color", color);
					jsonObject.element("brand", brand);
					jsonObject.element("uniqueid", uniqueid);
					jsonObject.element("course", course);
					jsonObject.element("actual_point", actual_point);
					
					jsonArray.add(jsonObject);
				}

			}
			String str = jsonArray.toString();
			out.append(str);
		out.flush();
	} catch (Exception e) {
		log.error("InputAction.getActualTracPoint", e);
		throw new BusinessException("InputAction.getActualTracPoint", e);
	} finally {
		out.close();
	}
}

/**
 * Gets the vehicle actual trac points.
 *
 * @return the vehicle actual trac points
 * @throws IOException Signals that an I/O exception has occurred.
 */
public void getVehicleActualTracPoints() throws IOException {
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	response.setContentType("text/plain;charset=UTF-8");
	PrintWriter out = response.getWriter();

	try {
			Session session = HibSessionFactory.getSessionFactory().getCurrentSession();
			
		    JSONArray jsonArray = new JSONArray();
				
				String sql ="select * from (select speed*1.852 as speed , plate_number,color,brand,uniqueid,course "
						+ ",ST_AsText(st_transform(st_setsrid(st_makepoint(longitude, latitude), 4326), 900916)) as actual_point"
						+ ",deviceid, RANK () OVER ( PARTITION BY deviceid ORDER BY id desc ) as rank "
						+ " from trac_positions where   active_device is true  ) k where rank = 1";
				
				SQLQuery sqlQuery = session.createSQLQuery(sql);
				sqlQuery.addScalar("speed", DoubleType.INSTANCE);
				sqlQuery.addScalar("plate_number", StringType.INSTANCE);
				sqlQuery.addScalar("color", StringType.INSTANCE);
				sqlQuery.addScalar("brand", StringType.INSTANCE);
				sqlQuery.addScalar("uniqueid", StringType.INSTANCE);
				sqlQuery.addScalar("actual_point", StringType.INSTANCE);
				
				List list = sqlQuery.list();
				
				for (Iterator iterator=list.iterator();iterator.hasNext();) {
					Object obj[]=(Object[])iterator.next();
					
					Double speed=(Double)obj[0];
					String plate_number=(String)obj[1]; 
					String color=(String)obj[2];
					String brand=(String)obj[3];
					String uniqueid=(String)obj[4];
					Double course=(Double)obj[0];
					String actual_point=(String)obj[5];
					
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("speed", speed);
					jsonObject.element("plate_number", plate_number);
					jsonObject.element("color", color);
					jsonObject.element("brand", brand);
					jsonObject.element("uniqueid", uniqueid);
					jsonObject.element("course", course);
					jsonObject.element("actual_point", actual_point);
					
					jsonArray.add(jsonObject);
					}
			String str = jsonArray.toString();
			out.append(str);
		out.flush();
	} catch (Exception e) {
		log.error("InputAction.getVehicleActualTracPoints", e);
		throw new BusinessException("InputAction.getVehicleActualTracPoints", e);
	} finally {
		out.close();
	}
}

}
