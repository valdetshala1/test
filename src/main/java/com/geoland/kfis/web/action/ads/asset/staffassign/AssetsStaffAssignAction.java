/**
 * 
 */
package com.geoland.kfis.web.action.ads.asset.staffassign;

import com.geoland.kfis.model.AssetsStaffAssign;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class AssetsStaffAssignAction.
 *
 * @author Festim Krasniqi,GEO&LAND
 * @created May 21, 2014 4:17:33 PM
 * @Version 1.0
 */
public class AssetsStaffAssignAction extends AssetsStaffAssignBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -6529050812720185018L;
	
	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(assetStaffAssignId!=null){
			AssetsStaffAssign a=DAOFactory.getFactory().getAssetsStaffAssignDAO().get(assetStaffAssignId);
			setAssetStaffAssign(a);
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
}
