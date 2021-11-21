package com.geoland.kfis.web.action.frm.dhpet.wildanimal.animalrequest;

import com.geoland.kfis.model.DhpetWildAnimalsRequest;
import com.geoland.kfis.persistence.hibernate.usertypes.Animalneeds;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class AnimalRequestBaseAction.
 */
public class AnimalRequestBaseAction extends  BaseActionSupport{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The animal request id. */
	protected Long animalRequestId;
	
	/** The animals request. */
	protected DhpetWildAnimalsRequest animalsRequest;
	
	/** The animalneeds list. */
	protected Animalneeds[] animalneedsList=Animalneeds.values();
	
	/**
	 * Gets the animal request id.
	 *
	 * @return the animal request id
	 */
	public Long getAnimalRequestId() {
		return animalRequestId;
	}
	
	/**
	 * Sets the animal request id.
	 *
	 * @param animalRequestId the new animal request id
	 */
	public void setAnimalRequestId(Long animalRequestId) {
		this.animalRequestId = animalRequestId;
	}
	
	/**
	 * Gets the animalneeds list.
	 *
	 * @return the animalneeds list
	 */
	public Animalneeds[] getAnimalneedsList() {
		return animalneedsList;
	}
	
	/**
	 * Sets the animalneeds list.
	 *
	 * @param animalneedsList the new animalneeds list
	 */
	public void setAnimalneedsList(Animalneeds[] animalneedsList) {
		this.animalneedsList = animalneedsList;
	}
	
	/**
	 * Gets the animals request.
	 *
	 * @return the animals request
	 */
	public DhpetWildAnimalsRequest getAnimalsRequest() {
		return animalsRequest;
	}
	
	/**
	 * Sets the animals request.
	 *
	 * @param animalsRequest the new animals request
	 */
	public void setAnimalsRequest(DhpetWildAnimalsRequest animalsRequest) {
		this.animalsRequest = animalsRequest;
	}
	
	
	
	
	

}
