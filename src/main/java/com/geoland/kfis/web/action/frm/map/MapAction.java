package com.geoland.kfis.web.action.frm.map;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.exception.BusinessException;
import com.geoland.kfis.model.Activity;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Activityfield;
import com.geoland.kfis.web.action.frm.ajax.FrmGridAction;
import com.geoland.kfis.web.base.converter.TransformUtil;

// TODO: Auto-generated Javadoc
/**
 * The Class MapAction.
 *
 * @author Ardiana Demolli, Geo&Land
 * Oct 16, 2015, 9:12:35 AM
 * v2.0
 */
public class MapAction extends MapBaseAction{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The log. */
	private static Log log = LogFactory.getLog(MapAction.class);
	
	/**
	 * get feature -  polygon.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public void mUnitFeature() throws IOException{
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();		
		
		try {
			if(mup_id!=null){
				String jsonFeature = DAOFactory.getFactory().getManagementUnitPeriodDAO().getJsonFeature(mup_id);
				out.append(jsonFeature);
			}
			
			out.flush();
			
		} catch (Exception e) {
			log.error("MapAction.feature", e);
			throw new BusinessException("MapAction.feature", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * Comp feature.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public void compFeature() throws IOException{
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();		
		
		try {
			if(comp_id!=null){
				String jsonFeature = DAOFactory.getFactory().getCompartmentDAO().getJsonFeature(comp_id);
				out.append(jsonFeature);
			}
			
			out.flush();
			
		} catch (Exception e) {
			log.error("MapAction.feature", e);
			throw new BusinessException("MapAction.feature", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * Line feature.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public void lineFeature() throws IOException{
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();		
		
		try {
			if(line_temp_id!=null){
				String jsonFeature = DAOFactory.getFactory().getLineTempDAO().getJsonFeature(line_temp_id);
				out.append(jsonFeature);
			}
			
			out.flush();
			
		} catch (Exception e) {
			log.error("MapAction.lineFeature", e);
			throw new BusinessException("MapAction.lineFeature", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * Road feature.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public void roadFeature() throws IOException{
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();		
		try {
			if(roadId!=null){
				String jsonFeature = DAOFactory.getFactory().getRoadDAO().getJsonFeature(roadId);
				out.append(jsonFeature);
			}
			
			out.flush();
			
		} catch (Exception e) {
			log.error("MapAction.roadFeature", e);
			throw new BusinessException("MapAction.roadFeature", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * Stand feature.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public void standFeature() throws IOException{
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();		
		
		try {
			if(stand_id!=null){
				String jsonFeature = DAOFactory.getFactory().getStandDAO().getJsonFeature(stand_id);
				out.append(jsonFeature);
			}
			
			out.flush();
			
		} catch (Exception e) {
			log.error("MapAction.feature", e);
			throw new BusinessException("MapAction.feature", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * Infrastructure feature.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public void infrastructureFeature() throws IOException{
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();		
		
		try {
			if(infrastructure_id!=null){
				String jsonFeature = DAOFactory.getFactory().getRoadActivityDAO().getJsonFeature(infrastructure_id);
				out.append(jsonFeature);
			}
			
			out.flush();
			
		} catch (Exception e) {
			log.error("MapAction.infrastructureFeature", e);
			throw new BusinessException("MapAction.infrastructureFeature", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * Biodiv feature.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public void biodivFeature() throws IOException{
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		
		PrintWriter out = response.getWriter();	
		try {
			if(biodiv_id!=null){
				String jsonFeature=DAOFactory.getFactory().getBiodiversityDAO().getJsonFeature(biodiv_id);
				out.append(jsonFeature);
			}
			out.flush();
			
		}catch (Exception e) {
			log.error("MapAction.feature", e);
			throw new BusinessException("MapAction.feature", e);
		} finally {
			out.close();
		}	
	}

	
	/**
	 * Plant plan feature.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public void plantPlanFeature() throws IOException{
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		
		PrintWriter out = response.getWriter();	
		try {
			if(plant_id!=null){
				String jsonFeature=DAOFactory.getFactory().getStandPlantingActivityDAO().getPlanJsonFeature(plant_id);
				out.append(jsonFeature);
			}
			out.flush();
			
		}catch (Exception e) {
			log.error("MapAction.plantPlanFeature", e);
			throw new BusinessException("MapAction.plantPlanFeature", e);
		} finally {
			out.close();
		}	
	}
	
	/**
	 * Plant implement feature.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public void plantImplementFeature() throws IOException{
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		
		PrintWriter out = response.getWriter();	
		try {
			if(imId!=null){
				String jsonFeature=DAOFactory.getFactory().getStandPlantingActivityDAO().getImplementJsonFeature(imId);
				out.append(jsonFeature);
			}
			out.flush();
			
		}catch (Exception e) {
			log.error("MapAction.plantImplementFeature", e);
			throw new BusinessException("MapAction.plantImplementFeature", e);
		} finally {
			out.close();
		}	
	}
	
	/**
	 * Pl harv feature.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public void plHarvFeature() throws IOException{
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();	
		try {
			if(harv_id!=null){
				String jsonFeature=DAOFactory.getFactory().getStandHarvestActivityDAO().getJsonFeature(harv_id);
				out.append(jsonFeature);
			}
			out.flush();
			
		}catch (Exception e) {
			log.error("MapAction.plHarvFeature", e);
			throw new BusinessException("MapAction.plHarvFeature", e);
		} finally {
			out.close();
		}	
	}
	
	/**
	 * Im harv feature.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public void imHarvFeature() throws IOException{
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		
		PrintWriter out = response.getWriter();	
		try {
			if(harv_id!=null){
				String jsonFeature=DAOFactory.getFactory().getStandHarvestActivityDAO().getImJsonFeature(harv_id);
				out.append(jsonFeature);
			}
			out.flush();
			
		}catch (Exception e) {
			log.error("MapAction.plantImHarvFeature", e);
			throw new BusinessException("MapAction.plantImHarvFeature", e);
		} finally {
			out.close();
		}	
	}
	
	/**
	 * Pl slv feature.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public void plSlvFeature() throws IOException{
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();	
		try {
			if(slv_id!=null){
				String jsonFeature=DAOFactory.getFactory().getStandSilvicultureActivityDAO().getJsonFeature(slv_id);
				out.append(jsonFeature);
			}
			out.flush();
			
		}catch (Exception e) {
			log.error("MapAction.plSlvFeature", e);
			throw new BusinessException("MapAction.plSlvFeature", e);
		} finally {
			out.close();
		}	
	}
	
	/**
	 * Im slv feature.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public void imSlvFeature() throws IOException{
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();	
		try {
			if(slv_id!=null){
				String jsonFeature=DAOFactory.getFactory().getStandSilvicultureActivityDAO().getImJsonFeature(slv_id);
				out.append(jsonFeature);
			}
			out.flush();
			
		}catch (Exception e) {
			log.error("MapAction.imSlvFeature", e);
			throw new BusinessException("MapAction.imSlvFeature", e);
		} finally {
			out.close();
		}	
	}
	
	/**
	 * MU period feature.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public void MUPeriodFeature() throws IOException{
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();	
		try {
			if(mng_period_id!=null){
				String jsonFeature=DAOFactory.getFactory().getManagementUnitPeriodDAO().getJsonFeature(mng_period_id);
				out.append(jsonFeature);
			}
			out.flush();
			
		}catch (Exception e) {
			log.error("MapAction.MUPeriodFeature", e);
			throw new BusinessException("MapAction.MUPeriodFeature", e);
		} finally {
			out.close();
		}	
	}
	
	/**
	 * Seed plan feature.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public void seedPlanFeature() throws IOException{
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		
		PrintWriter out = response.getWriter();	
		try {
			if(seed_id!=null){
				String jsonFeature=DAOFactory.getFactory().getSeedActivityDAO().getJsonFeature(seed_id);
				out.append(jsonFeature);
			}
			out.flush();
			
		}catch (Exception e) {
			log.error("MapAction.seedPlanFeature", e);
			throw new BusinessException("MapAction.seedPlanFeature", e);
		} finally {
			out.close();
		}	
	}
	
	/**
	 * Seed impl feature.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public void seedImplFeature() throws IOException{
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		
		PrintWriter out = response.getWriter();	
		try {
			if(seed_id!=null){
				String jsonFeature=DAOFactory.getFactory().getSeedActivityDAO().getImplJsonFeature(seed_id);
				out.append(jsonFeature);
			}
			out.flush();
			
		}catch (Exception e) {
			log.error("MapAction.seedImplFeature", e);
			throw new BusinessException("MapAction.seedImplFeature", e);
		} finally {
			out.close();
		}	
	}
	
	/**
	 * Impl slv feature.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public void implSlvFeature() throws IOException{
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();	
		try {
			if(implSlv_id!=null){
				String jsonFeature=DAOFactory.getFactory().getStandSilvicultureImplDeclareDAO().getImSlvJsonFeature(implSlv_id);
				out.append(jsonFeature);
			}
			out.flush();
		}catch (Exception e) {
			log.error("MapAction.implSlvFeature", e);
			throw new BusinessException("MapAction.implSlvFeature", e);
		} finally {
			out.close();
		}	
	}
	
	/**
	 * Request feature.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public void requestFeature() throws IOException{
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();	
		try {
			if(request_id!=null){
				String jsonFeature=DAOFactory.getFactory().getRequestDAO().getJsonFeature(request_id);
				out.append(jsonFeature);
			}
			out.flush();
		}catch (Exception e) {
			log.error("MapAction.requestFeature", e);
			throw new BusinessException("MapAction.requestFeature", e);
		} finally {
			out.close();
		}	
	}
	
	/**
	 * Dhpet location.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public void dhpetLocation() throws IOException{
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();	
		try {
			if(locationId!=null){
				String jsonFeature=DAOFactory.getFactory().getDhpetLocationDAO().getJsonFeature(locationId);
				out.append(jsonFeature);
			}
			out.flush();
		}catch (Exception e) {
			log.error("MapAction.dhpetLocation", e);
			throw new BusinessException("MapAction.dhpetLocation", e);
		} finally {
			out.close();
		}	
	}
	
	/**
	 * Infopoint.
	 *
	 * @return the string
	 */
	public String infopoint(){
		
		String ll[] = getLonlat().split(",");
		String lon = ll[0].substring(ll[0].indexOf("=") + 1);
		String lat = ll[1].substring(ll[1].indexOf("=") + 1);
		
		int srid = 900916;
		String query = "";
		
		if(isGoogleactive()){
			String src_srid = "900913";
			query="select id from tgis_stand where the_geom && st_transform(ST_SetSRID(ST_MakePoint(" + lon + "," + lat+ "), " + src_srid + "), " + srid + ")" +
					"AND ST_Contains(the_geom, st_transform(ST_SetSRID(ST_MakePoint(" + lon + "," + lat+ "), " + src_srid + "), " + srid + "))"; //Uses exact matching
		}else{
			query="select id from tgis_stand where the_geom && ST_SetSRID(ST_MakePoint("+lon+","+lat+"),"+srid+") " +
					"AND ST_Contains(the_geom, ST_SetSRID(ST_MakePoint("+lon+","+lat+"),"+srid+")) ";
		}		
		
		List<Long> foundId = DAOFactory.getFactory().getStandDAO().infopoint(query);
		if(foundId != null && foundId.size()>0){
			Long standId = foundId.get(0);
			stand = DAOFactory.getFactory().getStandDAO().get(standId);
			if(isGoogleactive()){
				TransformUtil.transformto4326(stand.getTheGeom());
			}
		}
		
		return "infopoint";
	}
	
	/**
	 * Infopoint harv pl.
	 *
	 * @return the string
	 */
	public String infopointHarvPl(){
		activiesIds="";
		String ll[] = getLonlat().split(",");
		String lon = ll[0].substring(ll[0].indexOf("=") + 1);
		String lat = ll[1].substring(ll[1].indexOf("=") + 1);
		
		int srid = 900916;
		String query = "";
		String actQuery="";
		if(StringUtils.isNotEmpty(activityType) && annualPlanId!=null){
			if(isGoogleactive()){
				String src_srid = "900913";
				query="select id from tfrm_activity where planed_geom && st_transform(ST_SetSRID(ST_MakePoint(" + lon + "," + lat+ "), " + src_srid + "), " + srid + ")" +
						"AND ST_Contains(planed_geom, st_transform(ST_SetSRID(ST_MakePoint(" + lon + "," + lat+ "), " + src_srid + "), " + srid + ")) and activity_field= '"+activityType+"' and annual_planning_id="+annualPlanId; //Uses exact matching
			}else{
				query="select id from tfrm_activity where planed_geom && ST_SetSRID(ST_MakePoint("+lon+","+lat+"),"+srid+") " +
						"AND ST_Contains(planed_geom, ST_SetSRID(ST_MakePoint("+lon+","+lat+"),"+srid+")) and activity_field= '"+activityType+"' and annual_planning_id="+annualPlanId;
			}
		}
			
		List<Long> foundId = DAOFactory.getFactory().getActivityDAO().infopoint(query);
		
		if(foundId != null && foundId.size()>0){
			Long activityId = foundId.get(0);
			activity=DAOFactory.getFactory().getActivityDAO().get(activityId);
			if(isGoogleactive()){
				TransformUtil.transformto4326(activity.getPlanedGeom());
				TransformUtil.transformto4326(activity.getImplementedGeom());
			}
			
		}
		
		for(Long f:foundId){
			activiesIds+=""+f+",";
		}
		
		if(foundId.size()>0)
		activiesIds=activiesIds.substring(0, activiesIds.length()-1);
		
		if(activiesIds.length()>0){
				switch(activityType){
					case "HAR" :
						actQuery=" select ha.* from  tfrm_stand_harvest_activity ha ";	
						break;
					case "SLV" :
						actQuery=" select ha.* from  tfrm_stand_silviculture_activity ha ";	
						break;
					case "PLA" :
						actQuery=" select ha.* from  tfrm_stand_planting_activity ha ";	
						break;
			
				}
				actQuery+=" left join tfrm_activity  a on ha.activity_id=a.id" +
					" where activity_id in ("+activiesIds+") ";
		
				switch(activityType){
					case "HAR" :
						harvestAct=DAOFactory.getFactory().getStandHarvestActivityDAO().executeSQLQuery(actQuery);
						return "infopointHarvPl";
					case "SLV" :
						slvAct=DAOFactory.getFactory().getStandSilvicultureActivityDAO().executeSQLQuery(actQuery);
						return "infopointSlvPl";
					case "PLA" :
						plaAct=DAOFactory.getFactory().getStandPlantingActivityDAO().executeSQLQuery(actQuery);
						return "infopointPlaAct";
				}
				
		}
		
		return "infopointHarvPl";
		
		
	}
	
	/**
	 * Parcel detail geom.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public void parcelDetailGeom() throws IOException{
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();	
		try {
			if(!StringUtils.isEmpty(cadParcId)){
				String jsonFeature=DAOFactory.getFactory().getParcelDetailDAO().getJsonFeatureParcel(cadParcId);
				out.append(jsonFeature);
			}
			out.flush();
		}catch (Exception e) {
			log.error("MapAction.parcelDetailGeom", e);
			throw new BusinessException("MapAction.parcelDetailGeom", e);
		} finally {
			out.close();
		}	
	}
	
	/**
	 * Fire point geom.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public void firePointGeom() throws IOException{
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();	
		try {
			if(firePointId!=null){
				String jsonFeature=DAOFactory.getFactory().getFirePointDAO().getJsonFeatureFirePoint(firePointId);
				out.append(jsonFeature);
			}
			out.flush();
		}catch (Exception e) {
			log.error("MapAction.firePointGeom", e);
			throw new BusinessException("MapAction.firePointGeom", e);
		} finally {
			out.close();
		}	
	}
	
	/**
	 * Fire polygon geom.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public void firePolygonGeom() throws IOException{
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();	
		try {
			if(firePolygonId!=null){
				String jsonFeature=DAOFactory.getFactory().getFirePolygonDAO().getJsonFeatureFirePolygon(firePolygonId);
				out.append(jsonFeature);
			}
			out.flush();
		}catch (Exception e) {
			log.error("MapAction.firePolygonGeom", e);
			throw new BusinessException("MapAction.firePolygonGeom", e);
		} finally {
			out.close(); 
		}	
	}
	
	
	/**
	 * Tourist zone geoms.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public void touristZoneGeoms() throws IOException{
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();	
		try {
			if(!StringUtils.isEmpty(touristZoneGeomsId)){
				String jsonFeature=DAOFactory.getFactory().getDhpetTouristZoneGeomsDAO().getJsonFeatureTouristZoneGeoms(touristZoneGeomsId);
				out.append(jsonFeature);
			}
			out.flush();
		}catch (Exception e) {
			log.error("MapAction.touristZoneGeoms", e);
			throw new BusinessException("MapAction.touristZoneGeoms", e);
		} finally {
			out.close();
		}	
	}
	
	
	
	
}
