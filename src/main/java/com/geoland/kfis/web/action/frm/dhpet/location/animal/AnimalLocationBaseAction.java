/**
 * 
 */
package com.geoland.kfis.web.action.frm.dhpet.location.animal;

import com.geoland.kfis.model.DhpetAnimalLocation;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class AnimalLocationBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 4:40:25 PM, Mar 10, 2015
 */
public class AnimalLocationBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -507600837269748644L;

	/** The animal id. */
	protected Long animalId;
	
	/** The animal. */
	protected DhpetAnimalLocation animal;
	
	/**
	 * Gets the animal id.
	 *
	 * @return the animalId
	 */
	public Long getAnimalId() {
		return animalId;
	}
	
	/**
	 * Sets the animal id.
	 *
	 * @param animalId the animalId to set
	 */
	public void setAnimalId(Long animalId) {
		this.animalId = animalId;
	}
	
	/**
	 * Gets the animal.
	 *
	 * @return the animal
	 */
	public DhpetAnimalLocation getAnimal() {
		return animal;
	}
	
	/**
	 * Sets the animal.
	 *
	 * @param animal the animal to set
	 */
	public void setAnimal(DhpetAnimalLocation animal) {
		this.animal = animal;
	}
	
	
}
