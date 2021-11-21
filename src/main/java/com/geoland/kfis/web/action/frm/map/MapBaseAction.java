package com.geoland.kfis.web.action.frm.map;

import java.util.List;

import com.geoland.kfis.model.Activity;
import com.geoland.kfis.model.ManagementUnitPeriod;
import com.geoland.kfis.model.Stand;
import com.geoland.kfis.model.StandHarvestActivity;
import com.geoland.kfis.model.StandPlantingActivity;
import com.geoland.kfis.model.StandSilvicultureActivity;
import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class MapBaseAction.
 *
 * @author Ardiana Demolli, Geo&Land
 * Oct 16, 2015, 9:08:24 AM
 * v2.0
 */
public class MapBaseAction extends BaseActionSupport{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The management unit period. */
	protected ManagementUnitPeriod managementUnitPeriod;
	
	/** The stand. */
	protected Stand stand;
	
	/** The activity. */
	protected Activity activity;
	
	/** The mup id. */
	protected Long mup_id;
	
	/** The comp id. */
	protected Long comp_id;
	
	/** The line temp id. */
	protected Long line_temp_id;
	
	/** The road id. */
	protected Long roadId;
	
	/** The stand id. */
	protected Long stand_id;
	
	/** The infrastructure id. */
	protected Long infrastructure_id;
	
	/** The biodiv id. */
	protected Long biodiv_id;
	
	/** The plant id. */
	protected Long plant_id;
	
	/** The harv id. */
	protected Long harv_id;
	
	/** The slv id. */
	protected Long slv_id;
	
	/** The mng period id. */
	protected Long mng_period_id;
	
	/** The seed id. */
	protected Long seed_id;
	
	/** The im id. */
	protected Long imId;
	
	/** The impl slv id. */
	protected Long implSlv_id;
	
	/** The request id. */
	protected Long request_id;
	
	/** The location id. */
	protected Long locationId;
	
	/** The parcel detail id. */
	protected Long parcelDetailId;
	
	/** The cad parc id. */
	protected String cadParcId;
	
	/** The tourist zone geoms id. */
	protected String touristZoneGeomsId;
	
	/** The lonlat. */
	protected String lonlat;
	
	/** The fire point id. */
	protected Long firePointId;
	
	/** The fire polygon id. */
	protected Long firePolygonId;
	
	/** The googleactive. */
	protected boolean googleactive;
	
	/** The activity type. */
	protected String activityType;
	
	/** The activies ids. */
	protected String activiesIds;
	
	/** The annual plan id. */
	protected Long annualPlanId;
	
	/** The harvest act. */
	protected List<StandHarvestActivity> harvestAct;
	
	/** The slv act. */
	protected List<StandSilvicultureActivity> slvAct;
	
	/** The pla act. */
	protected List<StandPlantingActivity> plaAct;
	
	/**
	 * Gets the management unit period.
	 *
	 * @return the management unit period
	 */
	public ManagementUnitPeriod getManagementUnitPeriod() {
		return managementUnitPeriod;
	}
	
	/**
	 * Sets the management unit period.
	 *
	 * @param managementUnitPeriod the new management unit period
	 */
	public void setManagementUnitPeriod(ManagementUnitPeriod managementUnitPeriod) {
		this.managementUnitPeriod = managementUnitPeriod;
	}
	
	/**
	 * Gets the mup id.
	 *
	 * @return the mup id
	 */
	public Long getMup_id() {
		return mup_id;
	}
	
	/**
	 * Sets the mup id.
	 *
	 * @param mup_id the new mup id
	 */
	public void setMup_id(Long mup_id) {
		this.mup_id = mup_id;
	}
	
	/**
	 * Gets the comp id.
	 *
	 * @return the comp id
	 */
	public Long getComp_id() {
		return comp_id;
	}
	
	/**
	 * Sets the comp id.
	 *
	 * @param comp_id the new comp id
	 */
	public void setComp_id(Long comp_id) {
		this.comp_id = comp_id;
	}
	
	/**
	 * Gets the stand id.
	 *
	 * @return the stand id
	 */
	public Long getStand_id() {
		return stand_id;
	}
	
	/**
	 * Sets the stand id.
	 *
	 * @param stand_id the new stand id
	 */
	public void setStand_id(Long stand_id) {
		this.stand_id = stand_id;
	}
	
	/**
	 * Gets the biodiv id.
	 *
	 * @return the biodiv id
	 */
	public Long getBiodiv_id() {
		return biodiv_id;
	}
	
	/**
	 * Sets the biodiv id.
	 *
	 * @param biodiv_id the new biodiv id
	 */
	public void setBiodiv_id(Long biodiv_id) {
		this.biodiv_id = biodiv_id;
	}
	
	/**
	 * Gets the plant id.
	 *
	 * @return the plant_id
	 */
	public Long getPlant_id() {
		return plant_id;
	}
	
	/**
	 * Sets the plant id.
	 *
	 * @param plant_id the plant_id to set
	 */
	public void setPlant_id(Long plant_id) {
		this.plant_id = plant_id;
	}
	
	/**
	 * Gets the harv id.
	 *
	 * @return the harv id
	 */
	public Long getHarv_id() {
		return harv_id;
	}
	
	/**
	 * Sets the harv id.
	 *
	 * @param harv_id the new harv id
	 */
	public void setHarv_id(Long harv_id) {
		this.harv_id = harv_id;
	}
	
	/**
	 * Gets the slv id.
	 *
	 * @return the slv id
	 */
	public Long getSlv_id() {
		return slv_id;
	}
	
	/**
	 * Sets the slv id.
	 *
	 * @param slv_id the new slv id
	 */
	public void setSlv_id(Long slv_id) {
		this.slv_id = slv_id;
	}
	
	/**
	 * Gets the seed id.
	 *
	 * @return the seed_id
	 */
	public Long getSeed_id() {
		return seed_id;
	}
	
	/**
	 * Sets the seed id.
	 *
	 * @param seed_id the seed_id to set
	 */
	public void setSeed_id(Long seed_id) {
		this.seed_id = seed_id;
	}
	
	/**
	 * Gets the im id.
	 *
	 * @return the imId
	 */
	public Long getImId() {
		return imId;
	}
	
	/**
	 * Sets the im id.
	 *
	 * @param imId the imId to set
	 */
	public void setImId(Long imId) {
		this.imId = imId;
	}
	
	/**
	 * Gets the impl slv id.
	 *
	 * @return the impl slv id
	 */
	public Long getImplSlv_id() {
		return implSlv_id;
	}
	
	/**
	 * Sets the impl slv id.
	 *
	 * @param implSlv_id the new impl slv id
	 */
	public void setImplSlv_id(Long implSlv_id) {
		this.implSlv_id = implSlv_id;
	}
	
	/**
	 * Gets the lonlat.
	 *
	 * @return the lonlat
	 */
	public String getLonlat() {
		return lonlat;
	}
	
	/**
	 * Sets the lonlat.
	 *
	 * @param lonlat the new lonlat
	 */
	public void setLonlat(String lonlat) {
		this.lonlat = lonlat;
	}
	
	/**
	 * Checks if is googleactive.
	 *
	 * @return true, if is googleactive
	 */
	public boolean isGoogleactive() {
		return googleactive;
	}
	
	/**
	 * Sets the googleactive.
	 *
	 * @param googleactive the new googleactive
	 */
	public void setGoogleactive(boolean googleactive) {
		this.googleactive = googleactive;
	}
	
	/**
	 * Gets the stand.
	 *
	 * @return the stand
	 */
	public Stand getStand() {
		return stand;
	}
	
	/**
	 * Sets the stand.
	 *
	 * @param stand the new stand
	 */
	public void setStand(Stand stand) {
		this.stand = stand;
	}
	
	/**
	 * Gets the request id.
	 *
	 * @return the request id
	 */
	public Long getRequest_id() {
		return request_id;
	}
	
	/**
	 * Sets the request id.
	 *
	 * @param request_id the new request id
	 */
	public void setRequest_id(Long request_id) {
		this.request_id = request_id;
	}
	
	/**
	 * Gets the location id.
	 *
	 * @return the location id
	 */
	public Long getLocationId() {
		return locationId;
	}
	
	/**
	 * Sets the location id.
	 *
	 * @param locationId the new location id
	 */
	public void setLocationId(Long locationId) {
		this.locationId = locationId;
	}
	
	/**
	 * Gets the parcel detail id.
	 *
	 * @return the parcel detail id
	 */
	public Long getParcelDetailId() {
		return parcelDetailId;
	}
	
	/**
	 * Sets the parcel detail id.
	 *
	 * @param parcelDetailId the new parcel detail id
	 */
	public void setParcelDetailId(Long parcelDetailId) {
		this.parcelDetailId = parcelDetailId;
	}
	
	/**
	 * Gets the cad parc id.
	 *
	 * @return the cad parc id
	 */
	public String getCadParcId() {
		return cadParcId;
	}
	
	/**
	 * Sets the cad parc id.
	 *
	 * @param cadParcId the new cad parc id
	 */
	public void setCadParcId(String cadParcId) {
		this.cadParcId = cadParcId;
	}
	
	/**
	 * Gets the tourist zone geoms id.
	 *
	 * @return the tourist zone geoms id
	 */
	public String getTouristZoneGeomsId() {
		return touristZoneGeomsId;
	}
	
	/**
	 * Sets the tourist zone geoms id.
	 *
	 * @param touristZoneGeomsId the new tourist zone geoms id
	 */
	public void setTouristZoneGeomsId(String touristZoneGeomsId) {
		this.touristZoneGeomsId = touristZoneGeomsId;
	}
	
	/**
	 * Gets the activity.
	 *
	 * @return the activity
	 */
	public Activity getActivity() {
		return activity;
	}
	
	/**
	 * Sets the activity.
	 *
	 * @param activity the new activity
	 */
	public void setActivity(Activity activity) {
		this.activity = activity;
	}
	
	/**
	 * Gets the activity type.
	 *
	 * @return the activity type
	 */
	public String getActivityType() {
		return activityType;
	}
	
	/**
	 * Sets the activity type.
	 *
	 * @param activityType the new activity type
	 */
	public void setActivityType(String activityType) {
		this.activityType = activityType;
	}
	
	/**
	 * Gets the activies ids.
	 *
	 * @return the activies ids
	 */
	public String getActiviesIds() {
		return activiesIds;
	}
	
	/**
	 * Sets the activies ids.
	 *
	 * @param activiesIds the new activies ids
	 */
	public void setActiviesIds(String activiesIds) {
		this.activiesIds = activiesIds;
	}
	
	/**
	 * Gets the annual plan id.
	 *
	 * @return the annual plan id
	 */
	public Long getAnnualPlanId() {
		return annualPlanId;
	}
	
	/**
	 * Sets the annual plan id.
	 *
	 * @param annualPlanId the new annual plan id
	 */
	public void setAnnualPlanId(Long annualPlanId) {
		this.annualPlanId = annualPlanId;
	}
	
	/**
	 * Gets the harvest act.
	 *
	 * @return the harvest act
	 */
	public List<StandHarvestActivity> getHarvestAct() {
		return harvestAct;
	}
	
	/**
	 * Sets the harvest act.
	 *
	 * @param harvestAct the new harvest act
	 */
	public void setHarvestAct(List<StandHarvestActivity> harvestAct) {
		this.harvestAct = harvestAct;
	}
	
	/**
	 * Gets the slv act.
	 *
	 * @return the slv act
	 */
	public List<StandSilvicultureActivity> getSlvAct() {
		return slvAct;
	}
	
	/**
	 * Sets the slv act.
	 *
	 * @param slvAct the new slv act
	 */
	public void setSlvAct(List<StandSilvicultureActivity> slvAct) {
		this.slvAct = slvAct;
	}
	
	/**
	 * Gets the pla act.
	 *
	 * @return the pla act
	 */
	public List<StandPlantingActivity> getPlaAct() {
		return plaAct;
	}
	
	/**
	 * Sets the pla act.
	 *
	 * @param plaAct the new pla act
	 */
	public void setPlaAct(List<StandPlantingActivity> plaAct) {
		this.plaAct = plaAct;
	}
	
	/**
	 * Gets the line temp id.
	 *
	 * @return the line temp id
	 */
	public Long getLine_temp_id() {
		return line_temp_id;
	}
	
	/**
	 * Sets the line temp id.
	 *
	 * @param line_temp_id the new line temp id
	 */
	public void setLine_temp_id(Long line_temp_id) {
		this.line_temp_id = line_temp_id;
	}
	
	/**
	 * Gets the road id.
	 *
	 * @return the road id
	 */
	public Long getRoadId() {
		return roadId;
	}
	
	/**
	 * Sets the road id.
	 *
	 * @param roadId the new road id
	 */
	public void setRoadId(Long roadId) {
		this.roadId = roadId;
	}
	
	/**
	 * Gets the fire point id.
	 *
	 * @return the fire point id
	 */
	public Long getFirePointId() {
		return firePointId;
	}
	
	/**
	 * Sets the fire point id.
	 *
	 * @param firePointId the new fire point id
	 */
	public void setFirePointId(Long firePointId) {
		this.firePointId = firePointId;
	}
	
	/**
	 * Gets the fire polygon id.
	 *
	 * @return the fire polygon id
	 */
	public Long getFirePolygonId() {
		return firePolygonId;
	}
	
	/**
	 * Sets the fire polygon id.
	 *
	 * @param firePolygonId the new fire polygon id
	 */
	public void setFirePolygonId(Long firePolygonId) {
		this.firePolygonId = firePolygonId;
	}
	
	/**
	 * Gets the mng period id.
	 *
	 * @return the mng period id
	 */
	public Long getMng_period_id() {
		return mng_period_id;
	}
	
	/**
	 * Sets the mng period id.
	 *
	 * @param mng_period_id the new mng period id
	 */
	public void setMng_period_id(Long mng_period_id) {
		this.mng_period_id = mng_period_id;
	}
	
	/**
	 * Gets the infrastructure id.
	 *
	 * @return the infrastructure id
	 */
	public Long getInfrastructure_id() {
		return infrastructure_id;
	}
	
	/**
	 * Sets the infrastructure id.
	 *
	 * @param infrastructure_id the new infrastructure id
	 */
	public void setInfrastructure_id(Long infrastructure_id) {
		this.infrastructure_id = infrastructure_id;
	}
	
}
