package com.geoland.kfis.web.action.frm.managementUnit;

import com.geoland.kfis.model.ManagementUnit;
import com.geoland.kfis.model.ManagementUnitPeriod;
import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class ManagementUnitBaseAction.
 *
 * @author Ardiana Demolli, Geo&Land
 * Oct 14, 2015, 4:01:26 PM
 * v2.0
 */
public class ManagementUnitBaseAction extends BaseActionSupport{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 4537752329134142862L;
	
	/** The management unit id. */
	protected Long managementUnitId;
	
	/** The management unit. */
	protected ManagementUnit managementUnit;
	
	/** The management unit period id. */
	protected Long managementUnitPeriodId;
	
	/** The management unit period. */
	protected ManagementUnitPeriod managementUnitPeriod;
	
	/** The region id. */
	protected Long regionId;
	
	
	/**
	 * Gets the management unit id.
	 *
	 * @return the management unit id
	 */
	public Long getManagementUnitId() {
		return managementUnitId;
	}
	
	/**
	 * Sets the management unit id.
	 *
	 * @param managementUnitId the new management unit id
	 */
	public void setManagementUnitId(Long managementUnitId) {
		this.managementUnitId = managementUnitId;
	}
	
	/**
	 * Gets the management unit.
	 *
	 * @return the management unit
	 */
	public ManagementUnit getManagementUnit() {
		return managementUnit;
	}
	
	/**
	 * Sets the management unit.
	 *
	 * @param managementUnit the new management unit
	 */
	public void setManagementUnit(ManagementUnit managementUnit) {
		this.managementUnit = managementUnit;
	}
	
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
	 * Gets the management unit period id.
	 *
	 * @return the management unit period id
	 */
	public Long getManagementUnitPeriodId() {
		return managementUnitPeriodId;
	}
	
	/**
	 * Sets the management unit period id.
	 *
	 * @param managementUnitPeriodId the new management unit period id
	 */
	public void setManagementUnitPeriodId(Long managementUnitPeriodId) {
		this.managementUnitPeriodId = managementUnitPeriodId;
	}
	
	/**
	 * Gets the region id.
	 *
	 * @return the region id
	 */
	public Long getRegionId() {
		return regionId;
	}
	
	/**
	 * Sets the region id.
	 *
	 * @param regionId the new region id
	 */
	public void setRegionId(Long regionId) {
		this.regionId = regionId;
	}
	
}
