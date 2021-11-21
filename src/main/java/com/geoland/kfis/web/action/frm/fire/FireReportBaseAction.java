/**
 * 
 */
package com.geoland.kfis.web.action.frm.fire;

import java.util.List;

import com.geoland.kfis.model.FireDetails;
import com.geoland.kfis.model.FirePoint;
import com.geoland.kfis.model.FirePolygon;
import com.geoland.kfis.model.FireReport;
import com.geoland.kfis.web.action.base.BaseActionSupport;
import com.vividsolutions.jts.geom.Geometry;

// TODO: Auto-generated Javadoc
/**
 * The Class FireReportBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 1:13:31 PM, May 18, 2015
 */
public class FireReportBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 9050390097502515587L;
	
	/** The fire id. */
	protected Long fireId;
	
	/** The fire. */
	protected FireReport fire;
	
	/** The fire details list. */
	protected List<FireDetails> fireDetailsList;
	
	/** The json details. */
	protected String jsonDetails;
	
	/** The mun read only. */
	protected boolean munReadOnly;
	
	/** The reg read only. */
	protected boolean regReadOnly;
	
	/** The in pvt forest. */
	protected boolean inPvtForest;
	
	/** The in pub forest. */
	protected boolean inPubForest;
	
	/** The point fire. */
	protected String pointFire;
	
	/** The polygon fire. */
	protected String polygonFire;
	
	/** The fire polygon geometry. */
	protected Geometry firePolygonGeometry;
	
	/** The fire point geometry. */
	protected Geometry firePointGeometry;
	
	/** The fire point. */
	protected FirePoint firePoint;
	
	/** The fire polygon. */
	protected FirePolygon firePolygon;
	
	/**
	 * Gets the fire id.
	 *
	 * @return the fireId
	 */
	public Long getFireId() {
		return fireId;
	}
	
	/**
	 * Sets the fire id.
	 *
	 * @param fireId the fireId to set
	 */
	public void setFireId(Long fireId) {
		this.fireId = fireId;
	}
	
	/**
	 * Gets the fire.
	 *
	 * @return the fire
	 */
	public FireReport getFire() {
		return fire;
	}
	
	/**
	 * Sets the fire.
	 *
	 * @param fire the fire to set
	 */
	public void setFire(FireReport fire) {
		this.fire = fire;
	}
	
	/**
	 * Gets the fire details list.
	 *
	 * @return the fireDetailsList
	 */
	public List<FireDetails> getFireDetailsList() {
		return fireDetailsList;
	}
	
	/**
	 * Sets the fire details list.
	 *
	 * @param fireDetailsList the fireDetailsList to set
	 */
	public void setFireDetailsList(List<FireDetails> fireDetailsList) {
		this.fireDetailsList = fireDetailsList;
	}
	
	/**
	 * Gets the json details.
	 *
	 * @return the jsonDetails
	 */
	public String getJsonDetails() {
		return jsonDetails;
	}
	
	/**
	 * Sets the json details.
	 *
	 * @param jsonDetails the jsonDetails to set
	 */
	public void setJsonDetails(String jsonDetails) {
		this.jsonDetails = jsonDetails;
	}
	
	/**
	 * Checks if is mun read only.
	 *
	 * @return the munReadOnly
	 */
	public boolean isMunReadOnly() {
		return munReadOnly;
	}
	
	/**
	 * Sets the mun read only.
	 *
	 * @param munReadOnly the munReadOnly to set
	 */
	public void setMunReadOnly(boolean munReadOnly) {
		this.munReadOnly = munReadOnly;
	}
	
	/**
	 * Checks if is reg read only.
	 *
	 * @return the regReadOnly
	 */
	public boolean isRegReadOnly() {
		return regReadOnly;
	}
	
	/**
	 * Sets the reg read only.
	 *
	 * @param regReadOnly the regReadOnly to set
	 */
	public void setRegReadOnly(boolean regReadOnly) {
		this.regReadOnly = regReadOnly;
	}
	
	/**
	 * Checks if is in pvt forest.
	 *
	 * @return the inPvtForest
	 */
	public boolean isInPvtForest() {
		return inPvtForest;
	}
	
	/**
	 * Sets the in pvt forest.
	 *
	 * @param inPvtForest the inPvtForest to set
	 */
	public void setInPvtForest(boolean inPvtForest) {
		this.inPvtForest = inPvtForest;
	}
	
	/**
	 * Checks if is in pub forest.
	 *
	 * @return the inPubForest
	 */
	public boolean isInPubForest() {
		return inPubForest;
	}
	
	/**
	 * Gets the fire polygon geometry.
	 *
	 * @return the fire polygon geometry
	 */

	public Geometry getFirePolygonGeometry() {
		return firePolygonGeometry;
	}
	
	/**
	 * Gets the point fire.
	 *
	 * @return the point fire
	 */
	public String getPointFire() {
		return pointFire;
	}
	
	/**
	 * Sets the point fire.
	 *
	 * @param pointFire the new point fire
	 */
	public void setPointFire(String pointFire) {
		this.pointFire = pointFire;
	}
	
	/**
	 * Gets the polygon fire.
	 *
	 * @return the polygon fire
	 */
	public String getPolygonFire() {
		return polygonFire;
	}
	
	/**
	 * Sets the polygon fire.
	 *
	 * @param polygonFire the new polygon fire
	 */
	public void setPolygonFire(String polygonFire) {
		this.polygonFire = polygonFire;
	}
	
	/**
	 * Sets the fire polygon geometry.
	 *
	 * @param firePolygonGeometry the new fire polygon geometry
	 */
	public void setFirePolygonGeometry(Geometry firePolygonGeometry) {
		this.firePolygonGeometry = firePolygonGeometry;
	}
	
	/**
	 * Gets the fire point geometry.
	 *
	 * @return the fire point geometry
	 */
	public Geometry getFirePointGeometry() {
		return firePointGeometry;
	}
	
	/**
	 * Sets the fire point geometry.
	 *
	 * @param firePointGeometry the new fire point geometry
	 */
	public void setFirePointGeometry(Geometry firePointGeometry) {
		this.firePointGeometry = firePointGeometry;
	}
	
	/**
	 * Sets the in pub forest.
	 *
	 * @param inPubForest the new in pub forest
	 */
	public void setInPubForest(boolean inPubForest) {
		this.inPubForest = inPubForest;
	}
	
	/**
	 * Gets the fire point.
	 *
	 * @return the fire point
	 */
	public FirePoint getFirePoint() {
		return firePoint;
	}
	
	/**
	 * Sets the fire point.
	 *
	 * @param firePoint the new fire point
	 */
	public void setFirePoint(FirePoint firePoint) {
		this.firePoint = firePoint;
	}
	
	/**
	 * Gets the fire polygon.
	 *
	 * @return the fire polygon
	 */
	public FirePolygon getFirePolygon() {
		return firePolygon;
	}
	
	/**
	 * Sets the fire polygon.
	 *
	 * @param firePolygon the new fire polygon
	 */
	public void setFirePolygon(FirePolygon firePolygon) {
		this.firePolygon = firePolygon;
	}
	
	
}
