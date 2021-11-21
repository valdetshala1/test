/**
 * 
 */
package com.geoland.kfis.web.action.ads.asset;

import com.geoland.kfis.model.Assets;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class AssetsAction.
 *
 * @author Festim Krasniqi,GEO&LAND
 * @created May 21, 2014 5:26:26 PM
 * @Version 1.0
 */
public class AssetsAction extends AssetsBaseAction{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		if(assetId!=null){
			Assets a=DAOFactory.getFactory().getAssetsDAO().get(assetId);
			setAsset(a);
		}
		return "form";
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
	 * Asset.
	 *
	 * @return the string
	 */
	public String asset(){
		if(assetId!=null){
			asset=DAOFactory.getFactory().getAssetsDAO().get(assetId);
		}
		return "asset";
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
