package com.geoland.kfis.web.action.printmap;

import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class PrintMapBaseAction.
 *
 * @author Ardiana Demolli, Geo&Land
 * Jan 27, 2016, 11:25:16 AM
 * v2.0
 */
public class PrintMapBaseAction extends BaseActionSupport{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The scales print. */
	protected String scalesPrint;
	
	/** The layouts. */
	protected String layouts;
	
	/** The rotation. */
	protected Integer rotation;
	
	/** The map name. */
	protected String mapName;
	
	
	/**
	 * Gets the scales print.
	 *
	 * @return the scales print
	 */
	public String getScalesPrint() {
		return scalesPrint;
	}
	
	/**
	 * Sets the scales print.
	 *
	 * @param scalesPrint the new scales print
	 */
	public void setScalesPrint(String scalesPrint) {
		this.scalesPrint = scalesPrint;
	}
	
	/**
	 * Gets the layouts.
	 *
	 * @return the layouts
	 */
	public String getLayouts() {
		return layouts;
	}
	
	/**
	 * Sets the layouts.
	 *
	 * @param layouts the new layouts
	 */
	public void setLayouts(String layouts) {
		this.layouts = layouts;
	}
	
	/**
	 * Gets the rotation.
	 *
	 * @return the rotation
	 */
	public Integer getRotation() {
		return rotation;
	}
	
	/**
	 * Sets the rotation.
	 *
	 * @param rotation the new rotation
	 */
	public void setRotation(Integer rotation) {
		this.rotation = rotation;
	}
	
	/**
	 * Gets the map name.
	 *
	 * @return the map name
	 */
	public String getMapName() {
		return mapName;
	}
	
	/**
	 * Sets the map name.
	 *
	 * @param mapName the new map name
	 */
	public void setMapName(String mapName) {
		this.mapName = mapName;
	}
	
}
