/**
 * 
 */
package com.geoland.kfis.web.action.frm.dhpet.huntedanimals;

import com.geoland.kfis.model.DhpetHuntedAnimals;
import com.geoland.kfis.persistence.hibernate.usertypes.Animaldeathcause;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class HuntedAnimalBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 4:18:22 PM, Mar 17, 2015
 */
public class HuntedAnimalBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -6081937085887560212L;

	/** The hunt id. */
	protected Long huntId;
	
	/** The hunt. */
	protected DhpetHuntedAnimals hunt;
	
	/** The death cause list. */
	protected Animaldeathcause deathCauseList[]=Animaldeathcause.values();
	
	/**
	 * Gets the hunt id.
	 *
	 * @return the huntId
	 */
	public Long getHuntId() {
		return huntId;
	}
	
	/**
	 * Sets the hunt id.
	 *
	 * @param huntId the huntId to set
	 */
	public void setHuntId(Long huntId) {
		this.huntId = huntId;
	}
	
	/**
	 * Gets the hunt.
	 *
	 * @return the hunt
	 */
	public DhpetHuntedAnimals getHunt() {
		return hunt;
	}
	
	/**
	 * Sets the hunt.
	 *
	 * @param hunt the hunt to set
	 */
	public void setHunt(DhpetHuntedAnimals hunt) {
		this.hunt = hunt;
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
	public void setDeathCauseList(Animaldeathcause deathCauseList[]) {
		this.deathCauseList = deathCauseList;
	}
	
}
