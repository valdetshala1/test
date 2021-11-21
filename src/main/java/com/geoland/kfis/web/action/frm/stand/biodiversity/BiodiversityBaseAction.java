package com.geoland.kfis.web.action.frm.stand.biodiversity;

import com.geoland.kfis.model.ShapeStandBiodiversity;
import com.geoland.kfis.web.action.dem.importshape.ImportShapeBaseAction;

// TODO: Auto-generated Javadoc
/**
 * The Class BiodiversityBaseAction.
 */
public class BiodiversityBaseAction extends ImportShapeBaseAction  {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The biodiversity. */
	protected ShapeStandBiodiversity biodiversity;
	
	/** The biodiversity id. */
	protected long biodiversityId;
	
	/** The stand id. */
	protected long standId;
	
	/**
	 * Gets the biodiversity.
	 *
	 * @return the biodiversity
	 */
	public ShapeStandBiodiversity getBiodiversity() {
		return biodiversity;
	}
	
	/**
	 * Sets the biodiversity.
	 *
	 * @param biodiversity the new biodiversity
	 */
	public void setBiodiversity(ShapeStandBiodiversity biodiversity) {
		this.biodiversity = biodiversity;
	}
	
	/**
	 * Gets the biodiversity id.
	 *
	 * @return the biodiversity id
	 */
	public long getBiodiversityId() {
		return biodiversityId;
	}
	
	/**
	 * Sets the biodiversity id.
	 *
	 * @param biodiversityId the new biodiversity id
	 */
	public void setBiodiversityId(long biodiversityId) {
		this.biodiversityId = biodiversityId;
	}
	
	/**
	 * Gets the stand id.
	 *
	 * @return the stand id
	 */
	public long getStandId() {
		return standId;
	}
	
	/**
	 * Sets the stand id.
	 *
	 * @param standId the new stand id
	 */
	public void setStandId(long standId) {
		this.standId = standId;
	}
	
	

}
