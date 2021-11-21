package com.geoland.kfis.web.action.frm.dhpet.dhpetannualplan;

import com.geoland.kfis.model.DhpetAnimalLocation;
import com.geoland.kfis.model.DhpetAnnualPlan;
import com.geoland.kfis.model.DhpetWildAnimals;
import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class DhpetAnnualPlanBaseAction.
 *
 * @author Adelina Gashi, GEO&LAND
 * @version 1.0
 * @created Dec 8, 2015 , 1:43:07 PM
 */
public class DhpetAnnualPlanBaseAction extends BaseActionSupport {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The annualplan id. */
	protected Long annualplanId;
	
	/** The annualplan. */
	protected DhpetAnnualPlan annualplan;
	
	/** The period id. */
	protected Long periodId;
	
	/** The w animal location id. */
	protected Long w_animal_location_id;
	
	/** The wanimal. */
	protected DhpetWildAnimals wanimal;
	
	/** The alocation. */
	protected DhpetAnimalLocation alocation;
	
	/**
	 * Gets the annualplan id.
	 *
	 * @return the annualplan id
	 */
	public Long getAnnualplanId() {
		return annualplanId;
	}
	
	/**
	 * Sets the annualplan id.
	 *
	 * @param annualplanId the new annualplan id
	 */
	public void setAnnualplanId(Long annualplanId) {
		this.annualplanId = annualplanId;
	}
	
	/**
	 * Gets the annualplan.
	 *
	 * @return the annualplan
	 */
	public DhpetAnnualPlan getAnnualplan() {
		return annualplan;
	}
	
	/**
	 * Sets the annualplan.
	 *
	 * @param annualplan the new annualplan
	 */
	public void setAnnualplan(DhpetAnnualPlan annualplan) {
		this.annualplan = annualplan;
	}
	
	/**
	 * Gets the period id.
	 *
	 * @return the periodId
	 */
	public Long getPeriodId() {
		return periodId;
	}
	
	/**
	 * Sets the period id.
	 *
	 * @param periodId the periodId to set
	 */
	public void setPeriodId(Long periodId) {
		this.periodId = periodId;
	}
	
	/**
	 * Gets the w animal location id.
	 *
	 * @return the w animal location id
	 */
	public Long getW_animal_location_id() {
		return w_animal_location_id;
	}
	
	/**
	 * Sets the w animal location id.
	 *
	 * @param w_animal_location_id the new w animal location id
	 */
	public void setW_animal_location_id(Long w_animal_location_id) {
		this.w_animal_location_id = w_animal_location_id;
	}
	
	/**
	 * Gets the wanimal.
	 *
	 * @return the wanimal
	 */
	public DhpetWildAnimals getWanimal() {
		return wanimal;
	}
	
	/**
	 * Sets the wanimal.
	 *
	 * @param wanimal the new wanimal
	 */
	public void setWanimal(DhpetWildAnimals wanimal) {
		this.wanimal = wanimal;
	}

	
	

}
