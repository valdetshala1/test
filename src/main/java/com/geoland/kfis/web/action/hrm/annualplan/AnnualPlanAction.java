package com.geoland.kfis.web.action.hrm.annualplan;

import com.geoland.kfis.model.HrmAnnualPlan;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class AnnualPlanAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 9:58:21 AM, Jun 2, 2015
 */
public class AnnualPlanAction extends AnnualPlanBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(planId!=null){
			setPlan(DAOFactory.getFactory().getHrmAnnualPlanDAO().get(planId));
			if(plan.getHrmAnnualPlanStatus().getId()!=null)
				setStatus(DAOFactory.getFactory().getHrmAnnualPlanStatusDAO().get(plan.getHrmAnnualPlanStatus().getId()));
		}
		return "form";
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
	 * Page.
	 *
	 * @return the string
	 */
	public String page(){
		return "page";
	}
	
	/**
	 * Status popup.
	 *
	 * @return the string
	 */
	public String statusPopup(){
		if(planId!=null){
			if(plan==null){
				setPlan(new HrmAnnualPlan());
			}
			plan.setId(planId);
		}
		return "status_popup";
	}
}
