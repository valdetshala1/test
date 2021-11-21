package com.geoland.kfis.web.action.frm.annualplan.seedling.inventory;

import com.geoland.kfis.model.SeedlingInventory;
import com.geoland.kfis.persistence.dao.DAOFactory;
// TODO: Auto-generated Javadoc

/**
 * The Class SeedInventoryAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Feb 6, 2015 , 11:08:16 AM
 */
public class SeedInventoryAction extends SeedInventoryBaseAction{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(seedlingInventoryId!=null){
			seedlingInventory=DAOFactory.getFactory().getSeedlingInventoryDAO().get(seedlingInventoryId);
			if(seedlingInventory.getSeedActivity()!=null){
				seedFromFrIns=true;
			}else {
				seedFromAnother=true;
			}
		}else {
			if(seedActivityId!=null){
				seedActivity=DAOFactory.getFactory().getSeedActivityDAO().get(seedActivityId);
				seedlingInventory=new SeedlingInventory();
				seedlingInventory.setSeedActivity(seedActivity);
			}
			
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
	 * Report generator.
	 *
	 * @return the string
	 */
	public String reportGenerator(){
		return "report_generator";
	}

	/**
	 * Page.
	 *
	 * @return the string
	 */
	public String page(){
		
			if(seedActivityId!=null){
				seedActivity=DAOFactory.getFactory().getSeedActivityDAO().get(seedActivityId);
				seedlingInventory=new SeedlingInventory();
				seedlingInventory.setSeedActivity(seedActivity);
			}
		return "page";
	}
}
