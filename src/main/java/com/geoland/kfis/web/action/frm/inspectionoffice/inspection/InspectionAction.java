package com.geoland.kfis.web.action.frm.inspectionoffice.inspection;

import com.geoland.kfis.model.Inspection;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class InspectionAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Feb 26, 2015 , 1:08:58 PM
 */
public class InspectionAction extends InspectionBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(inspectionId!=null){
			inspection=DAOFactory.getFactory().getInspectionDAO().get(inspectionId);
			
		}
		if(parentId!=null){
			Inspection i=DAOFactory.getFactory().getInspectionDAO().get(parentId);
			refNo=i.getInspectionNo();
			if(inspection==null)
				setInspection(new Inspection());
			inspection.setInspection(i);
		}
		return "form";
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
	 * Grid.
	 *
	 * @return the string
	 */
	public String grid(){
		
		return "grid";
	}
	
	/**
	 * Doc grid.
	 *
	 * @return the string
	 */
	public String docGrid(){
		if(inspectionId!=null){
			inspection=DAOFactory.getFactory().getInspectionDAO().get(inspectionId);
			
		}
		return "docGrid";
	}
	
	/**
	 * Report generator.
	 *
	 * @return the string
	 */
	public String reportGenerator(){
		return "report_generator";
	}
}
