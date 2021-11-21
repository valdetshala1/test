package com.geoland.kfis.web.action.frm.dhpet.wildanimal;

import com.geoland.kfis.model.DhpetWildAnimals;
import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class WildAnimalBaseAction.
 *
 * @author Fisnik Aliu, GEO&LAND
 * @created Oct 8, 2014 9:38:25 AM
 * @Version 1.0
 */
public class WildAnimalBaseAction extends BaseActionSupport{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1446590051816799822L;
	
	/** The dhpet wild animal id. */
	protected Long dhpetWildAnimalId;
	
	/** The dhpet wild animals. */
	protected DhpetWildAnimals dhpetWildAnimals;
	
	/**
	 * Gets the dhpet wild animal id.
	 *
	 * @return the dhpet wild animal id
	 */
	public Long getDhpetWildAnimalId() {
		return dhpetWildAnimalId;
	}
	
	/**
	 * Sets the dhpet wild animal id.
	 *
	 * @param dhpetWildAnimalId the new dhpet wild animal id
	 */
	public void setDhpetWildAnimalId(Long dhpetWildAnimalId) {
		this.dhpetWildAnimalId = dhpetWildAnimalId;
	}
	
	/**
	 * Gets the dhpet wild animals.
	 *
	 * @return the dhpet wild animals
	 */
	public DhpetWildAnimals getDhpetWildAnimals() {
		return dhpetWildAnimals;
	}
	
	/**
	 * Sets the dhpet wild animals.
	 *
	 * @param dhpetWildAnimals the new dhpet wild animals
	 */
	public void setDhpetWildAnimals(DhpetWildAnimals dhpetWildAnimals) {
		this.dhpetWildAnimals = dhpetWildAnimals;
	}
}
