package com.geoland.kfis.web.action.frm.dhpet.huntgroundeval;

import java.util.List;

import com.geoland.kfis.model.DhpetHuntGroundEval;
import com.geoland.kfis.model.DhpetWildAnimalsRequest;
import com.geoland.kfis.persistence.hibernate.usertypes.Animalneeds;
import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class HuntGroundEvalBaseAction.
 *
 * @author Fisnik Aliu, GEO&LAND
 * @created Oct 7, 2014 9:36:10 AM
 * @Version 1.0
 */
public class HuntGroundEvalBaseAction extends BaseActionSupport{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 3835278445456420654L;
	
	/** The dhpet hunt ground eval id. */
	protected Long dhpetHuntGroundEvalId;
	
	/** The dhpet hunt ground eval. */
	protected DhpetHuntGroundEval dhpetHuntGroundEval;
	
	/** The animalneeds list. */
	protected Animalneeds[] animalneedsList=Animalneeds.values();
	
	/** The animal requestlist. */
	protected List<DhpetWildAnimalsRequest> animalRequestlist;
	
	/** The animal id. */
	protected Long animalId;
	
	/**
	 * Gets the dhpet hunt ground eval id.
	 *
	 * @return the dhpet hunt ground eval id
	 */
	public Long getDhpetHuntGroundEvalId() {
		return dhpetHuntGroundEvalId;
	}
	
	/**
	 * Sets the dhpet hunt ground eval id.
	 *
	 * @param dhpetHuntGroundEvalId the new dhpet hunt ground eval id
	 */
	public void setDhpetHuntGroundEvalId(Long dhpetHuntGroundEvalId) {
		this.dhpetHuntGroundEvalId = dhpetHuntGroundEvalId;
	}
	
	/**
	 * Gets the dhpet hunt ground eval.
	 *
	 * @return the dhpet hunt ground eval
	 */
	public DhpetHuntGroundEval getDhpetHuntGroundEval() {
		return dhpetHuntGroundEval;
	}
	
	/**
	 * Sets the dhpet hunt ground eval.
	 *
	 * @param dhpetHuntGroundEval the new dhpet hunt ground eval
	 */
	public void setDhpetHuntGroundEval(DhpetHuntGroundEval dhpetHuntGroundEval) {
		this.dhpetHuntGroundEval = dhpetHuntGroundEval;
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
	 * Gets the animal requestlist.
	 *
	 * @return the animal requestlist
	 */
	public List<DhpetWildAnimalsRequest> getAnimalRequestlist() {
		return animalRequestlist;
	}
	
	/**
	 * Sets the animal requestlist.
	 *
	 * @param animalRequestlist the new animal requestlist
	 */
	public void setAnimalRequestlist(List<DhpetWildAnimalsRequest> animalRequestlist) {
		this.animalRequestlist = animalRequestlist;
	}
	
	/**
	 * Gets the animal id.
	 *
	 * @return the animal id
	 */
	public Long getAnimalId() {
		return animalId;
	}
	
	/**
	 * Sets the animal id.
	 *
	 * @param animalId the new animal id
	 */
	public void setAnimalId(Long animalId) {
		this.animalId = animalId;
	}
	
	
	

}
