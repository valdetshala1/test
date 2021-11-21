package com.geoland.kfis.web.action.frm.dhpet.dhpetannualplan;

import com.geoland.kfis.model.DhpetAnnualPlan;
import com.geoland.kfis.persistence.dao.DAOFactory;


// TODO: Auto-generated Javadoc
/**
 * The Class DhpetAnnualPlanAction.
 *
 * @author Adelina Gashi, GEO&LAND
 * @version 1.0
 * @created Dec 8, 2015 , 1:43:20 PM
 */
public class DhpetAnnualPlanAction extends DhpetAnnualPlanBaseAction{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(annualplanId!=null){
			annualplan=DAOFactory.getFactory().getDhpetAnnualPlanDAO().get(annualplanId);
		}
		if(periodId!=null){
			if(annualplan==null)
				setAnnualplan(new DhpetAnnualPlan());
			annualplan.setDhpetPeriodPlan(DAOFactory.getFactory().getDhpetPeriodPlanDAO().get(periodId));
		}
		return "form";
	}
	
	/**
	 * Page.
	 *
	 * @return the string
	 */
	public String page(){
		if(periodId!=null){
			if(annualplan==null)
				setAnnualplan(new DhpetAnnualPlan());
			annualplan.setDhpetPeriodPlan(DAOFactory.getFactory().getDhpetPeriodPlanDAO().get(periodId));
		}
		return "page";
	}
	
	/**
	 * Grid.
	 *
	 * @return the string
	 */
	public String grid(){
		return "grid";
	}
	
	/**
	 * Activities.
	 *
	 * @return the string
	 */
	public String activities(){
		return "activities";
	}
	
	/**
	 * Activities tab.
	 *
	 * @return the string
	 */
	public String activitiesTab(){
		if(w_animal_location_id!=null){
			alocation=DAOFactory.getFactory().getDhpetAnimalLocationDAO().get(w_animal_location_id);
			wanimal=alocation.getDhpetWildAnimals();
		}
		return "activitiesTab";
	}
}
