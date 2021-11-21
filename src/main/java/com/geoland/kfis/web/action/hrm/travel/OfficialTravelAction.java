/**
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created Apr 21, 2014 11:41:53 AM
 * @Version 1.0
 *
 */
package com.geoland.kfis.web.action.hrm.travel;

import com.geoland.kfis.model.OfficalTravel;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Month;

// TODO: Auto-generated Javadoc
/**
 * The Class OfficialTravelAction.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created April 21, 2014 11:41:53 AM
 * @Version 1.0
 */
public class OfficialTravelAction extends OfficialTravelBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form() {
		if(getOfficialTravelId() != null){
			OfficalTravel ot= DAOFactory.getFactory().getOfficialTravelDAO().get(getOfficialTravelId());
			setOfficialTravel(ot);
		}

		return "form";
	}

	/**
	 * List.
	 *
	 * @return the string
	 */
	public String list() {
		return "list";
	}

	/**
	 * Grid.
	 *
	 * @return the string
	 */
	public String grid() {
		return "grid";
	}

	/**
	 * Page.
	 *
	 * @return the string
	 */
	public String page() {
		return "page";
	}
	
	/**
	 * Status form.
	 *
	 * @return the string
	 */
	public String statusForm(){
		if(officialTravelId!=null)
			setOfficialTravel(DAOFactory.getFactory().getOfficialTravelDAO().get(officialTravelId));
		
		return "status_form";
	}
	
	/**
	 * Report generator.
	 *
	 * @return the string
	 */
	public String reportGenerator(){
		monthList=Month.values();
		return "report_generator";
	}
}
