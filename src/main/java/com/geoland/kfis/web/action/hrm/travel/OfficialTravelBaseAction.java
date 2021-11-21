/**
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created Apr 21, 2014 11:02:09 AM
 * @Version 1.0
 *
 */
package com.geoland.kfis.web.action.hrm.travel;

import com.geoland.kfis.logic.hr.travel.BoOfficialTravel;
import com.geoland.kfis.model.OfficalTravel;
import com.geoland.kfis.persistence.hibernate.usertypes.Month;
import com.geoland.kfis.persistence.hibernate.usertypes.Travelstatus;
import com.geoland.kfis.persistence.hibernate.usertypes.Traveltype;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class OfficialTravelBaseAction.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created Apr 21, 2014 11:02:09 AM
 * @Version 1.0
 */
public class OfficialTravelBaseAction extends BaseActionSupport {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The official travel id. */
	protected Long officialTravelId;
	
	/** The official travel. */
	protected OfficalTravel officialTravel;
	
	/** The bo official travel. */
	protected BoOfficialTravel boOfficialTravel;
	
	/** The travel status list. */
	protected Travelstatus[] travelStatusList=Travelstatus.values();
	
	/** The travel type list. */
	protected Traveltype[] travelTypeList=Traveltype.values();
	
	/** The user travel id. */
	protected String userTravelId;
	
	/** The change status. */
	protected boolean changeStatus;
	
	/** The month list. */
	protected Month monthList[];
	
	/**
	 * Gets the official travel id.
	 *
	 * @return the officialTravelId
	 */
	public Long getOfficialTravelId() {
		return officialTravelId;
	}
	
	/**
	 * Sets the official travel id.
	 *
	 * @param officialTravelId the officialTravelId to set
	 */
	public void setOfficialTravelId(Long officialTravelId) {
		this.officialTravelId = officialTravelId;
	}
	
	/**
	 * Gets the official travel.
	 *
	 * @return the officialTravel
	 */
	public OfficalTravel getOfficialTravel() {
		return officialTravel;
	}
	
	/**
	 * Sets the official travel.
	 *
	 * @param officialTravel the officialTravel to set
	 */
	public void setOfficialTravel(OfficalTravel officialTravel) {
		this.officialTravel = officialTravel;
	}
	
	/**
	 * Gets the bo official travel.
	 *
	 * @return the boOfficialTravel
	 */
	public BoOfficialTravel getBoOfficialTravel() {
		if (officialTravel!=null && boOfficialTravel==null){
			boOfficialTravel=new BoOfficialTravel(officialTravel,getLocale());
		}
		return boOfficialTravel;
	}
	
	/**
	 * Sets the bo official travel.
	 *
	 * @param boOfficialTravel the boOfficialTravel to set
	 */
	public void setBoOfficialTravel(BoOfficialTravel boOfficialTravel) {
		this.boOfficialTravel = boOfficialTravel;
	}
	
	/**
	 * Gets the travel status list.
	 *
	 * @return the travelStatusList
	 */
	public Travelstatus[] getTravelStatusList() {
		return travelStatusList;
	}
	
	/**
	 * Sets the travel status list.
	 *
	 * @param travelStatusList the travelStatusList to set
	 */
	public void setTravelStatusList(Travelstatus[] travelStatusList) {
		this.travelStatusList = travelStatusList;
	}
	
	/**
	 * Gets the travel type list.
	 *
	 * @return the travelTypeList
	 */
	public Traveltype[] getTravelTypeList() {
		return travelTypeList;
	}
	
	/**
	 * Sets the travel type list.
	 *
	 * @param travelTypeList the travelTypeList to set
	 */
	public void setTravelTypeList(Traveltype[] travelTypeList) {
		this.travelTypeList = travelTypeList;
	}
	
	/**
	 * Gets the user travel id.
	 *
	 * @return the user travel id
	 */
	public String getUserTravelId() {
		return userTravelId;
	}
	
	/**
	 * Sets the user travel id.
	 *
	 * @param userTraveId the new user travel id
	 */
	public void setUserTravelId(String userTraveId) {
		this.userTravelId = userTraveId;
	}
	
	/**
	 * Checks if is change status.
	 *
	 * @return true, if is change status
	 */
	public boolean isChangeStatus() {
		return changeStatus;
	}
	
	/**
	 * Sets the change status.
	 *
	 * @param changeStatus the new change status
	 */
	public void setChangeStatus(boolean changeStatus) {
		this.changeStatus = changeStatus;
	}
	
	/**
	 * Gets the month list.
	 *
	 * @return the monthList
	 */
	public Month[] getMonthList() {
		return monthList;
	}
	
	/**
	 * Sets the month list.
	 *
	 * @param monthList the monthList to set
	 */
	public void setMonthList(Month[] monthList) {
		this.monthList = monthList;
	}
	
	
}
