package com.geoland.kfis.web.action.frm.dhpet.animalcapacity;

import com.geoland.kfis.model.DhpetAnimalCapacity;
import com.geoland.kfis.persistence.hibernate.usertypes.Animallanduse;
import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class AnimalCapacityBaseAction.
 *
 * @author Fisnik Aliu, GEO&LAND
 * @created Oct 2, 2014 11:26:49 AM
 * @Version 1.0
 */
public class AnimalCapacityBaseAction extends BaseActionSupport{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -3890302796710857318L;
	
	/** The dhpet animal capacity id. */
	protected Long dhpetAnimalCapacityId;
	
	/** The dhpet animal capacity. */
	protected DhpetAnimalCapacity dhpetAnimalCapacity;
	
	/** The land use list. */
	protected Animallanduse landUseList[]=Animallanduse.values();
	
	/**
	 * Gets the dhpet animal capacity id.
	 *
	 * @return the dhpet animal capacity id
	 */
	public Long getDhpetAnimalCapacityId() {
		return dhpetAnimalCapacityId;
	}
	
	/**
	 * Sets the dhpet animal capacity id.
	 *
	 * @param dhpetAnimalCapaciptyId the new dhpet animal capacity id
	 */
	public void setDhpetAnimalCapacityId(Long dhpetAnimalCapaciptyId) {
		this.dhpetAnimalCapacityId = dhpetAnimalCapaciptyId;
	}
	
	/**
	 * Gets the dhpet animal capacity.
	 *
	 * @return the dhpet animal capacity
	 */
	public DhpetAnimalCapacity getDhpetAnimalCapacity() {
		return dhpetAnimalCapacity;
	}
	
	/**
	 * Sets the dhpet animal capacity.
	 *
	 * @param dhpetAnimalCapacity the new dhpet animal capacity
	 */
	public void setDhpetAnimalCapacity(DhpetAnimalCapacity dhpetAnimalCapacity) {
		this.dhpetAnimalCapacity = dhpetAnimalCapacity;
	}
	
	/**
	 * Gets the land use list.
	 *
	 * @return the landUseList
	 */
	public Animallanduse[] getLandUseList() {
		return landUseList;
	}
	
	/**
	 * Sets the land use list.
	 *
	 * @param landUseList the landUseList to set
	 */
	public void setLandUseList(Animallanduse[] landUseList) {
		this.landUseList = landUseList;
	}
	

}
