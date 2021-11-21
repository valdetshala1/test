/**
 * 
 */
package com.geoland.kfis.web.action.frm.dhpet.huntedanimals.details;

import com.geoland.kfis.model.DhpetHuntedAnimalDetail;
import com.geoland.kfis.persistence.hibernate.usertypes.Animaldeathcause;
import com.geoland.kfis.persistence.hibernate.usertypes.Gender;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class HuntedAnimalDetailBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Dec 22, 2015, 10:12:08 AM
 */
public class HuntedAnimalDetailBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 4161420459051805982L;
	
	/** The hunt detail id. */
	protected Long huntDetailId;
	
	/** The hunt detail. */
	protected DhpetHuntedAnimalDetail huntDetail;
	
	/** The hunt animal id. */
	protected Long huntAnimalId;
	
	/** The gender list. */
	protected Gender genderList[]=Gender.values();
	
	/** The death cause list. */
	protected Animaldeathcause deathCauseList[]=Animaldeathcause.values();
	
	/**
	 * Gets the hunt detail id.
	 *
	 * @return the huntDetailId
	 */
	public Long getHuntDetailId() {
		return huntDetailId;
	}
	
	/**
	 * Sets the hunt detail id.
	 *
	 * @param huntDetailId the huntDetailId to set
	 */
	public void setHuntDetailId(Long huntDetailId) {
		this.huntDetailId = huntDetailId;
	}
	
	/**
	 * Gets the hunt detail.
	 *
	 * @return the huntDetail
	 */
	public DhpetHuntedAnimalDetail getHuntDetail() {
		return huntDetail;
	}
	
	/**
	 * Sets the hunt detail.
	 *
	 * @param huntDetail the huntDetail to set
	 */
	public void setHuntDetail(DhpetHuntedAnimalDetail huntDetail) {
		this.huntDetail = huntDetail;
	}
	
	/**
	 * Gets the hunt animal id.
	 *
	 * @return the huntAnimalId
	 */
	public Long getHuntAnimalId() {
		return huntAnimalId;
	}
	
	/**
	 * Sets the hunt animal id.
	 *
	 * @param huntAnimalId the huntAnimalId to set
	 */
	public void setHuntAnimalId(Long huntAnimalId) {
		this.huntAnimalId = huntAnimalId;
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
	
	/**
	 * Gets the death cause list.
	 *
	 * @return the deathCauseList
	 */
	public Animaldeathcause[] getDeathCauseList() {
		return deathCauseList;
	}
	
	/**
	 * Sets the death cause list.
	 *
	 * @param deathCauseList the deathCauseList to set
	 */
	public void setDeathCauseList(Animaldeathcause[] deathCauseList) {
		this.deathCauseList = deathCauseList;
	}
}
