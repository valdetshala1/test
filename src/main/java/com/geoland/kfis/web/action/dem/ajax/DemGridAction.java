package com.geoland.kfis.web.action.dem.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.BigDecimalType;
import org.hibernate.type.DoubleType;
import org.hibernate.type.IntegerType;
import org.hibernate.type.StringType;

import com.geoland.framework.exception.BusinessException;
import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.model.FiskosData;
import com.geoland.kfis.model.FiskosImport;
import com.geoland.kfis.model.LineTemp;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.model.view.ShapeFieldsControlView;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.FiskosDataDAO;
import com.geoland.kfis.persistence.dao.services.FiskosImportDAO;
import com.geoland.kfis.persistence.dao.services.LineTempDAO;
import com.geoland.kfis.persistence.hibernate.usertypes.Mngmclass;
import com.geoland.kfis.web.action.base.grid.GridBaseAction;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

// TODO: Auto-generated Javadoc
/**
 * The Class DemGridAction.
 *
 * @author GEO&LAND
 * @created October 5, 2014 4:35:02 PM
 * @Version 1.0
 */
public class DemGridAction extends GridBaseAction{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/**
	 * Fiskos import.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void fiskosImport() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			FiskosImportDAO dao = DAOFactory.getFactory().getFiskosImportDAO();
			String countQuery = "select count(*) from tfrm_fiskos_import";
			Integer count = dao.countQuery(countQuery);
			calcPages(count);

			String sqlQuery = "select l.*,p.* from tfrm_fiskos_import as l left join tperson as p on l.CREATED_BY = p.id order by l.version_nr desc, l.created_date asc";
			sqlQuery+=" LIMIT " + limit + " offset " + start;
			List<FiskosImport> list = dao.executeSQLQuery(sqlQuery);

			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", count);
			
			JSONArray rows = new JSONArray();
			for (FiskosImport o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("trnx_id", o.getTrnxId());
				jsonObject.element("version_nr", o.getVersionNr());
				jsonObject.element("isactive", o.getIsactive());
				jsonObject.element("region", o.getRegion().getName());
				jsonObject.element("mu", o.getManagementUnit().getMuName());				
				jsonObject.element("start_date", TIMESTAMP_FORMAT.format(o.getStartDate()));
				jsonObject.element("end_date", TIMESTAMP_FORMAT.format(o.getEndDate()));
				jsonObject.element("created_by", getPersonData(o.getPersonByCreatedBy()));
				jsonObject.element("created_date", TIMESTAMP_FORMAT.format(o.getCreatedDate()));
				jsonObject.element("changed_by", getPersonData(o.getPersonByChangedBy()));
				jsonObject.element("changed_date", TIMESTAMP_FORMAT.format(o.getChangedDate()));
				jsonObject.element("note", o.getNote());
				jsonObject.element("region_id", o.getRegion().getId());
				jsonObject.element("mu_id", o.getManagementUnit().getId());
				
				rows.add(jsonObject);
			}
			
			
			data.element("rows", rows);
			out.append(data.toString());
			out.flush();

		} catch (Exception e) {
			log.error("DemGridAction.fiskosImport", e);
			throw new BusinessException("DemGridAction.fiskosImport", e);
		} finally {
			out.close();
		}
	}
	
	/* (non-Javadoc)
	 * @see com.geoland.kfis.web.action.base.grid.GridBaseAction#getPersonData(com.geoland.kfis.model.Person)
	 */
	protected String getPersonData(Person p){
		return p.getFirstName() + " " + p.getLastName();
	}
	
	/**
	 * Fiskos data.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void fiskosData() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String importId = request.getParameter("import_id");
			FiskosDataDAO dao = DAOFactory.getFactory().getFiskosDataDAO();

			JSONObject data = new JSONObject();
			JSONArray drows = new JSONArray();
			
			if(StringUtils.isNotEmpty(importId)){
				String countQuery = "select count(*) from tfrm_fiskos_data as l where l.import_id = " + importId;
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				
				String sqlQuery = "select l.* from tfrm_fiskos_data as l where l.import_id = " + importId + " order by l.imported_date asc";
				sqlQuery+=" LIMIT " + limit + " offset " + start;
				
				List<FiskosData> list = dao.executeSQLQuery(sqlQuery);

				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", count);				
				
				for (FiskosData o : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", o.getId());
					if(o.getManagementUnit()!=null)
						jsonObject.element("mu_id", o.getManagementUnit().getMuName());
					else
						jsonObject.element("mu_id", "");
					
					if(o.getCadastralMunicipality()!=null)
						jsonObject.element("mun_id", o.getCadastralMunicipality().getName());
					else
						jsonObject.element("mun_id", "");
						
					jsonObject.element("mngm_class_id", o.getMngmClassId());
					jsonObject.element("active", o.isActive());
					
					if(o.getModyfiedDate()!=null)
						jsonObject.element("modyfied_date", DATE_FORMAT.format(o.getModyfiedDate()));
					else
						jsonObject.element("modyfied_date", "");
					
					jsonObject.element("imported_by", o.getPerson().getFirstName() + " " + o.getPerson().getLastName());
					
					if(o.getImportedDate()!=null)
						jsonObject.element("imported_date", DATE_FORMAT.format(o.getImportedDate()));
					else
						jsonObject.element("imported_date", "");
						
					jsonObject.element("notes", o.getNotes());
					
					/*original data*/
					jsonObject.element("region", o.getRegion());
					jsonObject.element("managment_unit", o.getManagmentUnit());
					jsonObject.element("municipality", o.getMunicipality());
					jsonObject.element("comp", o.getComp());
					jsonObject.element("stand", o.getStand());
					jsonObject.element("standarea", o.getStandarea());
					jsonObject.element("mngmntclas_id", o.getMngmClassId());
					jsonObject.element("plots_nr", o.getPlotsNr());
					jsonObject.element("accessible", o.getAccessible());
					jsonObject.element("minehazard", o.getMinehazard());
					jsonObject.element("layers", o.getLayers());
					jsonObject.element("stand_type", o.getStandType());
					jsonObject.element("crowncover", o.getCrowncover());
					jsonObject.element("slope", o.getSlope());				
					jsonObject.element("age", o.getAge());
					jsonObject.element("origin", o.getOrigin());
					jsonObject.element("conifer", o.getConifer());
					jsonObject.element("conifer_bon", o.getConiferBon());
					jsonObject.element("decidouse", o.getDecidouse());
					jsonObject.element("decidouse_bon", o.getDecidouseBon());
					jsonObject.element("trees", o.getTrees());
					jsonObject.element("volume_m3ha", o.getVolumeM3ha());
					jsonObject.element("conifer_perc", o.getConiferPerc());
					jsonObject.element("decidouse_perc", o.getDecidousePerc());
					jsonObject.element("perc_0_30", o.getPerc030());
					jsonObject.element("version_nr", o.getVersionNr());
					
					drows.add(jsonObject);
				}
			}

			data.element("rows", drows);
			out.append(data.toString());
			out.flush();

		} catch (Exception e) {
			log.error("DemGridAction.fiskosData", e);
			throw new BusinessException("DemGridAction.fiskosData", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Shape out state.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void shapeOutState() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String countQuery = "select count(*) from get_shape_out_state()";
			
			Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
			SQLQuery sqlQuery=session.createSQLQuery(countQuery);
			
			BigInteger count1 = (BigInteger) sqlQuery.uniqueResult();
			calcPages(count1.intValue());
			
			String query = "select stand_id,area_out from get_shape_out_state()";
			query+=" LIMIT " + limit + " offset " + start;
			sqlQuery=session.createSQLQuery(query);
			sqlQuery.addScalar("stand_id",StringType.INSTANCE);
			sqlQuery.addScalar("area_out",DoubleType.INSTANCE);
			
			List list = sqlQuery.list();
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", count);
			
			JSONArray rows = new JSONArray();
			if(list!=null && list.size()>0){
				for(int i=0; i<list.size();i++){
					Object obj[] =(Object[])list.get(i);
					String stand_id = obj[0].toString();
					String area_out = obj[1].toString();
					JSONObject jo = new JSONObject();
					jo.element("stand_id", stand_id);
					jo.element("area_out", area_out);
					rows.add(jo);
				}
			}
			
			data.element("rows", rows);
			out.append(data.toString());
			out.flush();

		} catch (Exception e) {
			log.error("DemGridAction.shapeOutState", e);
			throw new BusinessException("DemGridAction.shapeOutState", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Shape overlap stand.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void shapeOverlapStand() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String countQuery = "select count(*) from get_overlap_shape_stand()";
			
			Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
			SQLQuery sqlQuery=session.createSQLQuery(countQuery);
			
			BigInteger count1 = (BigInteger) sqlQuery.uniqueResult();
			calcPages(count1.intValue());
			
			String query = "select fmr,mu,comp,stand,stand_id,comp_b,stand_b,stand_id_b,count_part,area from get_overlap_shape_stand()";
			query+=" LIMIT " + limit + " offset " + start;
			sqlQuery=session.createSQLQuery(query);
			sqlQuery.addScalar("fmr",StringType.INSTANCE);
			sqlQuery.addScalar("mu",StringType.INSTANCE);
			sqlQuery.addScalar("comp",StringType.INSTANCE);
			sqlQuery.addScalar("stand",StringType.INSTANCE);
			sqlQuery.addScalar("stand_id",StringType.INSTANCE);
			sqlQuery.addScalar("comp_b",StringType.INSTANCE);
			sqlQuery.addScalar("stand_b",StringType.INSTANCE);
			sqlQuery.addScalar("stand_id_b",StringType.INSTANCE);
			sqlQuery.addScalar("count_part",IntegerType.INSTANCE);
			sqlQuery.addScalar("area",DoubleType.INSTANCE);
			
			List list = sqlQuery.list();
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", count);
			
			JSONArray rows = new JSONArray();
			if(list!=null && list.size()>0){
				for(int i=0; i<list.size();i++){
					Object obj[] =(Object[])list.get(i);
					JSONObject jo = new JSONObject();
					jo.element("fmr", obj[0].toString());
					jo.element("mu", obj[1].toString());
					jo.element("comp", obj[2].toString());
					jo.element("stand", obj[3].toString());
					jo.element("stand_id", obj[4].toString());
					jo.element("comp_b", obj[5].toString());
					jo.element("stand_b", obj[6].toString());
					jo.element("stand_id_b", obj[7].toString());
					jo.element("count_part", obj[8].toString());
					jo.element("area", obj[9].toString());
					
					rows.add(jo);
				}
			}
			
			data.element("rows", rows);
			out.append(data.toString());
			out.flush();

		} catch (Exception e) {
			log.error("DemGridAction.shapeOverlapStand", e);
			throw new BusinessException("DemGridAction.shapeOverlapStand", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Shape overlap stand GIS.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void shapeOverlapStandGIS() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String countQuery = "select count(*) from get_overlap_shape_gis()";
			
			Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
			SQLQuery sqlQuery=session.createSQLQuery(countQuery);
			
			BigInteger count1 = (BigInteger) sqlQuery.uniqueResult();
			calcPages(count1.intValue());
			
			String query = "select fmr,mu,comp,stand,stand_id,fmr_b,mu_b,comp_b,stand_b,stand_id_b,count_part,area,perimeter from get_overlap_shape_gis()";
			query+=" LIMIT " + limit + " offset " + start;
			sqlQuery=session.createSQLQuery(query);
			sqlQuery.addScalar("fmr",StringType.INSTANCE);
			sqlQuery.addScalar("mu",StringType.INSTANCE);
			sqlQuery.addScalar("comp",StringType.INSTANCE);
			sqlQuery.addScalar("stand",StringType.INSTANCE);
			sqlQuery.addScalar("stand_id",StringType.INSTANCE);
			sqlQuery.addScalar("fmr_b",StringType.INSTANCE);
			sqlQuery.addScalar("mu_b",StringType.INSTANCE);
			sqlQuery.addScalar("comp_b",StringType.INSTANCE);
			sqlQuery.addScalar("stand_b",StringType.INSTANCE);
			sqlQuery.addScalar("stand_id_b",StringType.INSTANCE);
			sqlQuery.addScalar("count_part",IntegerType.INSTANCE);
			sqlQuery.addScalar("area",DoubleType.INSTANCE);
			sqlQuery.addScalar("perimeter",DoubleType.INSTANCE);
			
			List list = sqlQuery.list();
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", count);
			
			JSONArray rows = new JSONArray();
			if(list!=null && list.size()>0){
				for(int i=0; i<list.size();i++){
					Object obj[] =(Object[])list.get(i);
					JSONObject jo = new JSONObject();
					jo.element("fmr", obj[0].toString());
					jo.element("mu", obj[1].toString());
					jo.element("comp", obj[2].toString());
					jo.element("stand", obj[3].toString());
					jo.element("stand_id", obj[4].toString());
					jo.element("fmr_b", obj[5].toString());
					jo.element("mu_b", obj[6].toString());
					jo.element("comp_b", obj[7].toString());
					jo.element("stand_b", obj[8].toString());
					jo.element("stand_id_b", obj[9].toString());
					jo.element("count_part", obj[10].toString());
					jo.element("area", obj[11].toString());
					jo.element("perimeter", obj[12].toString());
					
					rows.add(jo);
				}
			}
			
			data.element("rows", rows);
			out.append(data.toString());
			out.flush();

		} catch (Exception e) {
			log.error("DemGridAction.shapeOverlapStandGIS", e);
			throw new BusinessException("DemGridAction.shapeOverlapStandGIS", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Shape fields control.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void shapeFieldsControl() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String countQuery = "select count(*) from shape_fields_control";
			
			Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
			SQLQuery sqlQuery=session.createSQLQuery(countQuery);
			
			BigInteger count1 = (BigInteger) sqlQuery.uniqueResult();
			calcPages(count1.intValue());
			
			String query = "select * from shape_fields_control";
			query+=" LIMIT " + limit + " offset " + start;
			
			sqlQuery=session.createSQLQuery(query);
			sqlQuery.addEntity(ShapeFieldsControlView.class);

			List<ShapeFieldsControlView> list = sqlQuery.list();
			
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", count);
			
			JSONArray rows = new JSONArray();
			for (ShapeFieldsControlView o : list) {
				JSONObject jo = new JSONObject();

				jo.element("stand_id", o.getId().getStandId());
				jo.element("field", o.getId().getField());
				jo.element("value", o.getId().getValue());
				
				rows.add(jo);
			}
			
			
			data.element("rows", rows);
			out.append(data.toString());
			out.flush();

		} catch (Exception e) {
			log.error("DemGridAction.shapeFieldsControl", e);
			throw new BusinessException("DemGridAction.shapeFieldsControl", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Shape plots out stand.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void shapePlotsOutStand() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpServletRequest request = ServletActionContext.getRequest();
		try {
			
			String region_code = request.getParameter("region_code");
			String mu_code = request.getParameter("mu_code");
			if(StringUtils.isNotEmpty(region_code) && StringUtils.isNotEmpty(mu_code)){
				
				String countQuery = "select count(plot_nr) from get_plot_out_stand('"+region_code+"','"+mu_code+"')";
				
				Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
				SQLQuery sqlQuery=session.createSQLQuery(countQuery);
				
				BigInteger count1 = (BigInteger) sqlQuery.uniqueResult();
				calcPages(count1.intValue());
				
				String query = "select plot_nr,comp_nr,stand_nr,area_out from get_plot_out_stand('"+region_code+"','"+mu_code+"')";
				query+=" LIMIT " + limit + " offset " + start;
				sqlQuery=session.createSQLQuery(query);
				sqlQuery.addScalar("plot_nr",StringType.INSTANCE);
				sqlQuery.addScalar("comp_nr",StringType.INSTANCE);
				sqlQuery.addScalar("stand_nr",StringType.INSTANCE);
				sqlQuery.addScalar("area_out",BigDecimalType.INSTANCE);
				
				List list = sqlQuery.list();
				
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", count);
				
				JSONArray rows = new JSONArray();
				if(list!=null && list.size()>0){
					for(int i=0; i<list.size();i++){
						Object obj[] =(Object[])list.get(i);
						JSONObject jo = new JSONObject();
						jo.element("plot_nr", obj[0].toString());
						jo.element("comp_nr", obj[1].toString());
						jo.element("stand_nr", obj[2].toString());
						jo.element("area_out", obj[3].toString());
						
						rows.add(jo);
					}
				}
				
				data.element("rows", rows);
				out.append(data.toString());
				out.flush();
			}
		} catch (Exception e) {
			log.error("DemGridAction.shapePlotsOutStand", e);
			throw new BusinessException("DemGridAction.shapePlotsOutStand", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Shape plots without stand.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void shapePlotsWithoutStand() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpServletRequest request = ServletActionContext.getRequest();
		try {
			
			String region_code = request.getParameter("region_code");
			String mu_code = request.getParameter("mu_code");
			if(StringUtils.isNotEmpty(region_code) && StringUtils.isNotEmpty(mu_code)){
				
				String countQuery = "select count(plot_nr) from get_plot_with_no_stand('"+region_code+"','"+mu_code+"')";
				
				Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
				SQLQuery sqlQuery=session.createSQLQuery(countQuery);
				
				BigInteger count1 = (BigInteger) sqlQuery.uniqueResult();
				calcPages(count1.intValue());
				
				String query = "select plot_nr,comp_nr,stand_nr from get_plot_with_no_stand('"+region_code+"','"+mu_code+"')";
				query+=" LIMIT " + limit + " offset " + start;
				sqlQuery=session.createSQLQuery(query);
				sqlQuery.addScalar("plot_nr",StringType.INSTANCE);
				sqlQuery.addScalar("comp_nr",StringType.INSTANCE);
				sqlQuery.addScalar("stand_nr",StringType.INSTANCE);
				
				List list = sqlQuery.list();
				
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", count);
				
				JSONArray rows = new JSONArray();
				if(list!=null && list.size()>0){
					for(int i=0; i<list.size();i++){
						Object obj[] =(Object[])list.get(i);
						JSONObject jo = new JSONObject();
						jo.element("plot_nr", obj[0].toString());
						jo.element("comp_nr", obj[1].toString());
						jo.element("stand_nr", obj[2].toString());
						
						rows.add(jo);
					}
				}
				
				data.element("rows", rows);
				out.append(data.toString());
				out.flush();
			}
		} catch (Exception e) {
			log.error("DemGridAction.shapePlotsWithoutStand", e);
			throw new BusinessException("DemGridAction.shapePlotsWithoutStand", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Plot trees without plot.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void plotTreesWithoutPlot() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			
			String countQuery = "select count(plotid) from get_plot_trees_without_plot()";
			
			Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
			SQLQuery sqlQuery=session.createSQLQuery(countQuery);
			
			BigInteger count1 = (BigInteger) sqlQuery.uniqueResult();
			calcPages(count1.intValue());
			
			String query = "select plotid,treeid,name from get_plot_trees_without_plot()";
			query+=" LIMIT " + limit + " offset " + start;
			sqlQuery=session.createSQLQuery(query);
			sqlQuery.addScalar("plotid",StringType.INSTANCE);
			sqlQuery.addScalar("treeid",StringType.INSTANCE);
			sqlQuery.addScalar("name",StringType.INSTANCE);
			
			List list = sqlQuery.list();
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", count);
			
			JSONArray rows = new JSONArray();
			if(list!=null && list.size()>0){
				for(int i=0; i<list.size();i++){
					Object obj[] =(Object[])list.get(i);
					JSONObject jo = new JSONObject();
					jo.element("plotid", obj[0].toString());
					jo.element("treeid", obj[1].toString());
					jo.element("name", obj[2].toString());
					
					rows.add(jo);
				}
			}
			
			data.element("rows", rows);
			out.append(data.toString());
			out.flush();
		} catch (Exception e) {
			log.error("DemGridAction.plotTreesWithoutPlot", e);
			throw new BusinessException("DemGridAction.plotTreesWithoutPlot", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Shape biodiv out stand.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void shapeBiodivOutStand() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpServletRequest request = ServletActionContext.getRequest();
		try {
			
			String region_code = request.getParameter("region_code");
			String mu_code = request.getParameter("mu_code");
			if(StringUtils.isNotEmpty(region_code) && StringUtils.isNotEmpty(mu_code)){
				
				String countQuery = "select count(*) from get_biodiv_out_stand('"+region_code+"','"+mu_code+"')";
				
				Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
				SQLQuery sqlQuery=session.createSQLQuery(countQuery);
				
				BigInteger count1 = (BigInteger) sqlQuery.uniqueResult();
				calcPages(count1.intValue());
				
				String query = "select biodiversi,comp_nr,stand_nr,area_out from get_biodiv_out_stand('"+region_code+"','"+mu_code+"')";
				query+=" LIMIT " + limit + " offset " + start;
				sqlQuery=session.createSQLQuery(query);
				sqlQuery.addScalar("biodiversi",StringType.INSTANCE);
				sqlQuery.addScalar("comp_nr",StringType.INSTANCE);
				sqlQuery.addScalar("stand_nr",StringType.INSTANCE);
				sqlQuery.addScalar("area_out",BigDecimalType.INSTANCE);
				
				List list = sqlQuery.list();
				
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", count);
				
				JSONArray rows = new JSONArray();
				if(list!=null && list.size()>0){
					for(int i=0; i<list.size();i++){
						Object obj[] =(Object[])list.get(i);
						JSONObject jo = new JSONObject();
						jo.element("biodiversi", obj[0].toString());
						jo.element("comp_nr", obj[1].toString());
						jo.element("stand_nr", obj[2].toString());
						jo.element("area_out", obj[3].toString());
						
						rows.add(jo);
					}
				}
				
				data.element("rows", rows);
				out.append(data.toString());
			}
		} catch (Exception e) {
			log.error("DemGridAction.shapeBiodivOutStand", e);
			throw new BusinessException("DemGridAction.shapeBiodivOutStand", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Shape biodiv without stand.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void shapeBiodivWithoutStand() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpServletRequest request = ServletActionContext.getRequest();
		try {
			
			String region_code = request.getParameter("region_code");
			String mu_code = request.getParameter("mu_code");
			if(StringUtils.isNotEmpty(region_code) && StringUtils.isNotEmpty(mu_code)){
				
				String countQuery = "select count(biodiversi) from get_biodiv_with_no_stand('"+region_code+"','"+mu_code+"')";
				
				Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
				SQLQuery sqlQuery=session.createSQLQuery(countQuery);
				
				BigInteger count1 = (BigInteger) sqlQuery.uniqueResult();
				calcPages(count1.intValue());
				
				String query = "select biodiversi,comp_nr,stand_nr from get_biodiv_with_no_stand('"+region_code+"','"+mu_code+"')";
				query+=" LIMIT " + limit + " offset " + start;
				sqlQuery=session.createSQLQuery(query);
				sqlQuery.addScalar("biodiversi",StringType.INSTANCE);
				sqlQuery.addScalar("comp_nr",StringType.INSTANCE);
				sqlQuery.addScalar("stand_nr",StringType.INSTANCE);
				
				List list = sqlQuery.list();
				
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", count);
				
				JSONArray rows = new JSONArray();
				if(list!=null && list.size()>0){
					for(int i=0; i<list.size();i++){
						Object obj[] =(Object[])list.get(i);
						JSONObject jo = new JSONObject();
						jo.element("biodiversi", obj[0].toString());
						jo.element("comp_nr", obj[1].toString());
						jo.element("stand_nr", obj[2].toString());
						
						rows.add(jo);
					}
				}
				
				data.element("rows", rows);
				out.append(data.toString());
				out.flush();
			}
		} catch (Exception e) {
			log.error("DemGridAction.shapeBiodivWithoutStand", e);
			throw new BusinessException("DemGridAction.shapeBiodivWithoutStand", e);
		} finally {
			out.close();
		}
	}

	/**
	 * Biodiv code not exist.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void biodivCodeNotExist() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			
				String countQuery = "select count(*) from shape_biodiversity b left join tbiodiv_name bn on b.biocode=bn.code where bn.id is NULL";
				
				Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
				SQLQuery sqlQuery=session.createSQLQuery(countQuery);
				
				BigInteger count1 = (BigInteger) sqlQuery.uniqueResult();
				calcPages(count1.intValue());
				
				String query = "select b.biocode, b.remarks, b.comp_nr, b.stand_nr ,b.biodiversi,b.taksator from shape_biodiversity b left join tbiodiv_name bn on b.biocode=bn.code where bn.id is NULL";
				
				query+=" LIMIT " + limit + " offset " + start;
				
				sqlQuery=session.createSQLQuery(query);
				sqlQuery.addScalar("biocode",StringType.INSTANCE);
				sqlQuery.addScalar("remarks",StringType.INSTANCE);
				sqlQuery.addScalar("comp_nr",StringType.INSTANCE);
				sqlQuery.addScalar("stand_nr",StringType.INSTANCE);
				sqlQuery.addScalar("biodiversi",StringType.INSTANCE);
				sqlQuery.addScalar("taksator",StringType.INSTANCE);
				
				List list = sqlQuery.list();
				
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", count);
				
				JSONArray rows = new JSONArray();
				if(list!=null && list.size()>0){
					for(int i=0; i<list.size();i++){
						Object obj[] =(Object[])list.get(i);
						JSONObject jo = new JSONObject();
						jo.element("biocode", obj[0].toString());
						jo.element("remarks", obj[1].toString());
						jo.element("comp_nr", obj[2].toString());
						jo.element("stand_nr", obj[3].toString());
						jo.element("biodiversi", obj[4].toString());
						jo.element("taksator", obj[5].toString());
						rows.add(jo);
					}
				}
				
				data.element("rows", rows);
				out.append(data.toString());
				out.flush();
		} catch (Exception e) {
			log.error("DemGridAction.biodivNameNotExist", e);
			throw new BusinessException("DemGridAction.biodivNameNotExist", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Linetemp.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void linetemp() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		String language = getLocale().getLanguage().toLowerCase();
		PrintWriter out = response.getWriter();
		try {
				LineTempDAO dao=DAOFactory.getFactory().getLineTempDAO();
				String status=request.getParameter("status");
				String countQuery = "select count(*) from tlinetemp";
				String sqlQuery ="select * from tlinetemp";
				if(!StringUtils.isEmpty(status)){
					countQuery+=" where status='"+status+"'";
					sqlQuery+=" where status='"+status+"'";
				}
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
					String ob_field = getSidx();
					sqlQuery += " order by " + ob_field + " " + getSord();
				}
				sqlQuery += " LIMIT " + limit + " offset " + start;
				List<LineTemp> list = dao.executeSQLQuery(sqlQuery);
	
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
		    		          
				JSONArray rows = new JSONArray();
				for (LineTemp a : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", a.getId());
					jsonObject.element("ltheme12", a.getLtheme12());
					if(a.getLtheme12()!=null && Mngmclass.getDomain(a.getLtheme12())!=null){
						if("en".equals(language))
							jsonObject.element("ltheme12_name",Mngmclass.getDomain(a.getLtheme12()).getDOMTEXT_EN());
						else if("sr".equals(language))
							jsonObject.element("ltheme12_name", Mngmclass.getDomain(a.getLtheme12()).getDOMTEXT_SR());
						else jsonObject.element("ltheme12_name", Mngmclass.getDomain(a.getLtheme12()).getDOMTEXT());
					}else{
						jsonObject.element("ltheme12_name", "");	
					}
					jsonObject.element("quality_cl", a.getQualityCl());
					jsonObject.element("maintenanc", a.getMaintenanc());
					jsonObject.element("comment", a.getComment());
					jsonObject.element("file_format", a.getFileFormat());
					if(a.getDate()!=null)
						jsonObject.element("date", DATE_FORMAT.format(a.getCreatedDate()));
					else jsonObject.element("date", "");
					jsonObject.element("created_by", getPersonData(a.getPersonByCreatedBy()));
					jsonObject.element("created_date", DATE_FORMAT.format(a.getCreatedDate()));
					
					rows.add(jsonObject);
				}
				data.element("rows", rows);
				out.append(data.toString());
				out.flush();

		} catch (Exception e) {
			log.error("DemGridAction.linetemp", e);
			throw new BusinessException("DemGridAction.linetemp", e);
		} finally {
			out.close();
		}
	}
//	
	
}
