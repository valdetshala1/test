package com.geoland.kfis.web.action.frm.dhpet.touristzonegeoms.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.DoubleType;
import org.hibernate.type.StringType;

import com.geoland.framework.exception.BusinessException;
import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.model.DhpetTouristZoneGeoms;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.DhpetTouristZoneGeomsDAO;
import com.geoland.kfis.web.action.base.grid.GridBaseAction;
import com.vividsolutions.jts.geom.Geometry;
import com.vividsolutions.jts.geom.GeometryFactory;
import com.vividsolutions.jts.geom.PrecisionModel;
import com.vividsolutions.jts.io.WKTReader;
import com.vividsolutions.jts.operation.valid.IsValidOp;
// TODO: Auto-generated Javadoc

/**
 * The Class TouristZoneGeomsGridAction.
 *
 * @author Ardiana Demolli, Geo&Land
 * Jan 29, 2016, 11:03:38 AM
 * v2.0
 */
public class TouristZoneGeomsGridAction extends GridBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/**
	 * Tourist zone geoms.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void touristZoneGeoms() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String lang=getLocale().getLanguage();
			DhpetTouristZoneGeomsDAO dao = DAOFactory.getFactory().getDhpetTouristZoneGeomsDAO();
			
			String countQuery="select count(r.*) from tdhpet_tourist_zone_geoms r";
			String sqlQuery="select r.* from tdhpet_tourist_zone_geoms r";
			
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			sqlQuery+=" LIMIT " + limit + " offset " + start;
			
			List<DhpetTouristZoneGeoms> list = dao.executeSQLQuery(sqlQuery);
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for (DhpetTouristZoneGeoms o : list) {

				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				if(o.getEmployee()!=null)
					jsonObject.element("created_by", o.getEmployee().getFirstName()+" "+o.getEmployee().getLastName());
				jsonObject.element("created_date", DATE_FORMAT.format(o.getCreatedDate()));
				String zone_type="al".equals(lang)?o.getZoneType().getDOMTEXT():"en"
					.equals(lang)?o.getZoneType().getDOMTEXT_EN():o.getZoneType().getDOMTEXT_SR();
				jsonObject.element("zone_type", zone_type);
				jsonObject.element("location", o.getDhpetLocation().getHabitatLocation());
				jsonObject.element("note", o.getNote());
				jsonObject.element("area", o.getArea());
				rows.add(jsonObject);
			}
			data.element("rows", rows);

			out.append(data.toString());
			out.flush();
		}catch (Exception e){
			log.error("TouristZoneGeomsGridAction.touristZoneGeoms", e);
			throw new BusinessException("TouristZoneGeomsGridAction.touristZoneGeoms", e);
		} finally {
			out.close();
		}		
	}	
	
	
	/**
	 * Gets the overlap tourst zone geoms.
	 *
	 * @return the overlap tourst zone geoms
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public void getOverlapTourstZoneGeoms() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();

		try {
				Session session = HibSessionFactory.getSessionFactory().getCurrentSession();
				String polygon = request.getParameter("polygon");
				String tourist_zone_geoms_id = request.getParameter("tourist_zone_geoms_id");
				session = HibSessionFactory.getSessionFactory().getCurrentSession();
				
				WKTReader wktReader = new WKTReader(new GeometryFactory(new PrecisionModel(), 900916)); 
			    Geometry geo = wktReader.read(polygon);
			    JSONArray jsonArray = new JSONArray();
				if(StringUtils.isNotEmpty(polygon) && IsValidOp.isValid(geo)){
					String sql = "";
					if(StringUtils.isNotEmpty(tourist_zone_geoms_id)){
						 sql = "select * from get_overlap_tourist_zone_geoms('"+tourist_zone_geoms_id+"','"+polygon+"')";
					}else{
						sql = "select * from get_overlap_tourist_zone_geoms('"+polygon+"')";
					}
					SQLQuery sqlQuery = session.createSQLQuery(sql);
					sqlQuery.addScalar("touristZoneGeomsId", StringType.INSTANCE);
					sqlQuery.addScalar("area", DoubleType.INSTANCE);
					List list = sqlQuery.list();
					
					JSONObject jsonObject = new JSONObject();
					for (Iterator iterator = list.iterator(); iterator.hasNext();) {
					Object obj[] = (Object[]) iterator.next();
					String requestId = (String) obj[0];
					Double area = (Double) obj[1];

					
					jsonObject.element("touristZoneGeomsId", requestId);
					jsonObject.element("area", area);
					jsonArray.add(jsonObject);
					}
				
			}
				String str = jsonArray.toString();
				out.append(str);
			out.flush();
		} catch (Exception e) {
			log.error("TouristZoneGeomsGridAction.getOverlapTourstZoneGeoms", e);
			throw new BusinessException("TouristZoneGeomsGridAction.getOverlapTourstZoneGeoms", e);
		} finally {
			out.close();
		}
	}
}
