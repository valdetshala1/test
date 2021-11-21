/**
 * 
 */
package com.geoland.kfis.web.action.ads.asset.devaluation;

import java.util.List;

import com.geoland.kfis.model.Assets;
import com.geoland.kfis.model.AssetsDevaluation;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class AssetsDevaluationBaseAction.
 *
 * @author Festim Krasniqi,GEO&LAND
 * @created May 22, 2014 1:23:10 PM
 * @Version 1.0
 */
public class AssetsDevaluationBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -702324844351539896L;
	
	/** The asset devalation id. */
	protected Long assetDevalationId;
	
	/** The assets devaluation. */
	protected AssetsDevaluation assetsDevaluation;
	
	/** The assets list. */
	protected String assetsList;
	
	/** The existing. */
	protected List<AssetsDevaluation> existing;
	
	/**
	 * Gets the assets SQL query.
	 *
	 * @param list the list
	 * @return the assets SQL query
	 */
	public String getAssetsSQLQuery(List<String> list){
		String sqlQuery="";
		if(list!=null){
			sqlQuery="SELECT asset.* FROM tassets as asset where (";
			 for (int i=0;i < list.size();i++){
					if(i<list.size()-1){
						sqlQuery=sqlQuery+"asset.id="+list.get(i)+" or ";
					}else {
						sqlQuery=sqlQuery+"asset.id="+list.get(i)+")";
					}
				}
		}
		return sqlQuery;
	}
	
	/**
	 * Gets the existing assets devaluation.
	 *
	 * @param assetDeval the asset deval
	 * @return the existing assets devaluation
	 */
	public String getExistingAssetsDevaluation(List<AssetsDevaluation> assetDeval){
		String sqlQuery="";
		if(assetDeval!=null){
			sqlQuery="select a.* from tassets_devaluation as a where (";
			for(int i=0;i<assetDeval.size();i++){
				if(i<assetDeval.size()-1)
					sqlQuery=sqlQuery+"(a.asset_id="+assetDeval.get(i).getAssets().getId()+" and a.year_of_deval="+assetDeval.get(i).getYearOfDeval()+") or ";
				else 
					sqlQuery=sqlQuery+"(a.asset_id="+assetDeval.get(i).getAssets().getId()+" and a.year_of_deval="+assetDeval.get(i).getYearOfDeval()+"))";
			}
		}
		return sqlQuery;
	}
	
	/**
	 * Check existin assets devaluation.
	 *
	 * @param assetsDevaluation the assets devaluation
	 * @param assetToDeval the asset to deval
	 * @param yearOfDeval the year of deval
	 * @return true, if successful
	 */
	public boolean checkExistinAssetsDevaluation(List<AssetsDevaluation> assetsDevaluation,Assets assetToDeval,Long yearOfDeval){
		for(AssetsDevaluation ad:assetsDevaluation){
			if(ad.getAssets().equals(assetToDeval) && ad.getYearOfDeval().equals(yearOfDeval)){
				return true;
			}
		}
		return false;
	}
	
	/**
	 * Gets the asset devalation id.
	 *
	 * @return the assetDevalationId
	 */
	public Long getAssetDevalationId() {
		return assetDevalationId;
	}
	
	/**
	 * Sets the asset devalation id.
	 *
	 * @param assetDevalationId the assetDevalationId to set
	 */
	public void setAssetDevalationId(Long assetDevalationId) {
		this.assetDevalationId = assetDevalationId;
	}
	
	/**
	 * Gets the assets devaluation.
	 *
	 * @return the assetsDevaluation
	 */
	public AssetsDevaluation getAssetsDevaluation() {
		return assetsDevaluation;
	}
	
	/**
	 * Sets the assets devaluation.
	 *
	 * @param assetsDevaluation the assetsDevaluation to set
	 */
	public void setAssetsDevaluation(AssetsDevaluation assetsDevaluation) {
		this.assetsDevaluation = assetsDevaluation;
	}
	
	/**
	 * Gets the assets list.
	 *
	 * @return the assetsList
	 */
	public String getAssetsList() {
		return assetsList;
	}
	
	/**
	 * Sets the assets list.
	 *
	 * @param assetsList the assetsList to set
	 */
	public void setAssetsList(String assetsList) {
		this.assetsList = assetsList;
	}
	
	/**
	 * Gets the existing.
	 *
	 * @return the existing
	 */
	public List<AssetsDevaluation> getExisting() {
		return existing;
	}
	
	/**
	 * Sets the existing.
	 *
	 * @param existing the existing to set
	 */
	public void setExisting(List<AssetsDevaluation> existing) {
		this.existing = existing;
	}
	
}
