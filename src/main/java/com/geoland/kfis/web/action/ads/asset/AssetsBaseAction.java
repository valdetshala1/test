package com.geoland.kfis.web.action.ads.asset;

import com.geoland.kfis.model.Assets;
import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class AssetsBaseAction.
 *
 * @author Festim Krasniqi,GEO&LAND
 * @created May 21, 2014 4:11:33 PM
 * @Version 1.0
 */
public class AssetsBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The asset id. */
	protected Long assetId;
	
	/** The asset. */
	protected Assets asset;
	
	/**
	 * Gets the asset id.
	 *
	 * @return the assetId
	 */
	public Long getAssetId() {
		return assetId;
	}
	
	/**
	 * Sets the asset id.
	 *
	 * @param assetId the assetId to set
	 */
	public void setAssetId(Long assetId) {
		this.assetId = assetId;
	}
	
	/**
	 * Gets the asset.
	 *
	 * @return the asset
	 */
	public Assets getAsset() {
		return asset;
	}
	
	/**
	 * Sets the asset.
	 *
	 * @param asset the asset to set
	 */
	public void setAsset(Assets asset) {
		this.asset = asset;
	}

	

	
	
}
