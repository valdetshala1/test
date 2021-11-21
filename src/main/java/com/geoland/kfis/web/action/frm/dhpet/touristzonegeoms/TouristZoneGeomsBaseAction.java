package com.geoland.kfis.web.action.frm.dhpet.touristzonegeoms;

import com.geoland.kfis.model.DhpetTouristZoneGeoms;
import com.geoland.kfis.persistence.hibernate.usertypes.Zonetype;
import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class TouristZoneGeomsBaseAction.
 *
 * @author Ardiana Demolli, Geo&Land
 * Jan 28, 2016, 3:22:26 PM
 * v2.0
 */
public class TouristZoneGeomsBaseAction extends BaseActionSupport{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The tourist zone geoms id. */
	protected Long touristZoneGeomsId;
	
	/** The tourist zone geoms. */
	protected DhpetTouristZoneGeoms touristZoneGeoms;
	
	/** The geometry. */
	protected String geometry;
	
	/** The zone types. */
	protected Zonetype zoneTypes[]= Zonetype.values();
	
	/**
	 * Gets the tourist zone geoms id.
	 *
	 * @return the tourist zone geoms id
	 */
	public Long getTouristZoneGeomsId() {
		return touristZoneGeomsId;
	}
	
	/**
	 * Sets the tourist zone geoms id.
	 *
	 * @param touristZoneGeomsId the new tourist zone geoms id
	 */
	public void setTouristZoneGeomsId(Long touristZoneGeomsId) {
		this.touristZoneGeomsId = touristZoneGeomsId;
	}
	
	/**
	 * Gets the tourist zone geoms.
	 *
	 * @return the tourist zone geoms
	 */
	public DhpetTouristZoneGeoms getTouristZoneGeoms() {
		return touristZoneGeoms;
	}
	
	/**
	 * Sets the tourist zone geoms.
	 *
	 * @param touristZoneGeoms the new tourist zone geoms
	 */
	public void setTouristZoneGeoms(DhpetTouristZoneGeoms touristZoneGeoms) {
		this.touristZoneGeoms = touristZoneGeoms;
	}
	
	/**
	 * Gets the geometry.
	 *
	 * @return the geometry
	 */
	public String getGeometry() {
		return geometry;
	}
	
	/**
	 * Sets the geometry.
	 *
	 * @param geometry the new geometry
	 */
	public void setGeometry(String geometry) {
		this.geometry = geometry;
	}
	
	/**
	 * Gets the zone types.
	 *
	 * @return the zone types
	 */
	public Zonetype[] getZoneTypes() {
		return zoneTypes;
	}
	
	/**
	 * Sets the zone types.
	 *
	 * @param zoneTypes the new zone types
	 */
	public void setZoneTypes(Zonetype[] zoneTypes) {
		this.zoneTypes = zoneTypes;
	}
}
