/**
 * 
 */
package com.geoland.kfis.web.action.frm.stand.growth;

import java.util.List;

import com.geoland.kfis.model.StandGrowth;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class StandGrowthBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 2:40:16 PM, Jan 28, 2015
 */
public class StandGrowthBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The stand growth id. */
	protected Long standGrowthId;
	
	/** The stand ids list. */
	protected String standIdsList;
	
	/** The comp ids list. */
	protected String compIdsList;
	
	/** The stand growth. */
	protected List<StandGrowth> standGrowth;
	
	/**
	 * Gets the stand growth id.
	 *
	 * @return the standGrowthId
	 */
	public Long getStandGrowthId() {
		return standGrowthId;
	}
	
	/**
	 * Sets the stand growth id.
	 *
	 * @param standGrowthId the standGrowthId to set
	 */
	public void setStandGrowthId(Long standGrowthId) {
		this.standGrowthId = standGrowthId;
	}
	
	/**
	 * Gets the stand ids list.
	 *
	 * @return the standGrowth
	 */
	/**
	 * @return the standIdsList
	 */
	public String getStandIdsList() {
		return standIdsList;
	}
	
	/**
	 * Sets the stand ids list.
	 *
	 * @param standIdsList the standIdsList to set
	 */
	public void setStandIdsList(String standIdsList) {
		this.standIdsList = standIdsList;
	}
	
	/**
	 * Gets the stand growth.
	 *
	 * @return the standGrowth
	 */
	public List<StandGrowth> getStandGrowth() {
		return standGrowth;
	}
	
	/**
	 * Sets the stand growth.
	 *
	 * @param standGrowth the standGrowth to set
	 */
	public void setStandGrowth(List<StandGrowth> standGrowth) {
		this.standGrowth = standGrowth;
	}
	
	/**
	 * Gets the comp ids list.
	 *
	 * @return the compIdsList
	 */
	public String getCompIdsList() {
		return compIdsList;
	}
	
	/**
	 * Sets the comp ids list.
	 *
	 * @param compIdsList the compIdsList to set
	 */
	public void setCompIdsList(String compIdsList) {
		this.compIdsList = compIdsList;
	}
}
