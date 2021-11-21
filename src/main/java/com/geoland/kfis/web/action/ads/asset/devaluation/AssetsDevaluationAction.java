/**
 * 
 */
package com.geoland.kfis.web.action.ads.asset.devaluation;

import com.geoland.kfis.model.AssetsDevaluation;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class AssetsDevaluationAction.
 *
 * @author Festim Krasniqi,GEO&LAND
 * @created May 22, 2014 1:25:47 PM
 * @Version 1.0
 */
public class AssetsDevaluationAction extends AssetsDevaluationBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(assetDevalationId!=null){
			AssetsDevaluation ad=DAOFactory.getFactory().getAssetsDevaluationDAO().get(assetDevalationId);
			setAssetsDevaluation(ad);
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
}
