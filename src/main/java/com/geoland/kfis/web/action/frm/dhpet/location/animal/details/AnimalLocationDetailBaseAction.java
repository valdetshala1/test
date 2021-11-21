/**
 * 
 */
package com.geoland.kfis.web.action.frm.dhpet.location.animal.details;

import com.geoland.kfis.model.DhpetAnimalLocationDetail;
import com.geoland.kfis.persistence.hibernate.usertypes.Agetype;
import com.geoland.kfis.persistence.hibernate.usertypes.Gender;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class AnimalLocationDetailBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Dec 21, 2015, 2:13:10 PM
 */
public class AnimalLocationDetailBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 6390522225132114456L;
	
	/** The location detail id. */
	protected Long locationDetailId;
	
	/** The location detail. */
	protected DhpetAnimalLocationDetail locationDetail;
	
	/** The animal location id. */
	protected Long animalLocationId;
	
	/** The agetype list. */
	protected Agetype agetypeList[]=Agetype.values();
	
	/** The gender list. */
	protected Gender genderList[]=Gender.values();

	/**
	 * Gets the location detail id.
	 *
	 * @return the locationDetailId
	 */
	public Long getLocationDetailId() {
		return locationDetailId;
	}
	
	/**
	 * Sets the location detail id.
	 *
	 * @param locationDetailId the locationDetailId to set
	 */
	public void setLocationDetailId(Long locationDetailId) {
		this.locationDetailId = locationDetailId;
	}
	
	/**
	 * Gets the location detail.
	 *
	 * @return the locationDetail
	 */
	public DhpetAnimalLocationDetail getLocationDetail() {
		return locationDetail;
	}
	
	/**
	 * Sets the location detail.
	 *
	 * @param locationDetail the locationDetail to set
	 */
	public void setLocationDetail(DhpetAnimalLocationDetail locationDetail) {
		this.locationDetail = locationDetail;
	}
	
	/**
	 * Gets the animal location id.
	 *
	 * @return the animalLocationId
	 */
	public Long getAnimalLocationId() {
		return animalLocationId;
	}
	
	/**
	 * Sets the animal location id.
	 *
	 * @param animalLocationId the animalLocationId to set
	 */
	public void setAnimalLocationId(Long animalLocationId) {
		this.animalLocationId = animalLocationId;
	}
	
	/**
	 * Gets the agetype list.
	 *
	 * @return the agetypeList
	 */
	public Agetype[] getAgetypeList() {
		return agetypeList;
	}
	
	/**
	 * Sets the agetype list.
	 *
	 * @param agetypeList the agetypeList to set
	 */
	public void setAgetypeList(Agetype[] agetypeList) {
		this.agetypeList = agetypeList;
	}
	
	/**
	 * Gets the gender list.
	 *
	 * @return the genderList
	 */
	public Gender[] getGenderList() {
		return genderList;
	}
	
	/**
	 * Sets the gender list.
	 *
	 * @param genderList the genderList to set
	 */
	public void setGenderList(Gender[] genderList) {
		this.genderList = genderList;
	}
	
}
