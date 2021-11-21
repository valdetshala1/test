/**
 * 
 */
package com.geoland.kfis.web.action.frm.confiscation;

import com.geoland.kfis.model.Confiscation;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class ConfiscationBaseAction.
 *
 * @author ADELINA GASHI, GEO&LAND
 * @created Aug 9, 2016 , 10:20:34 AM
 * @Version 1.0
 */
public class ConfiscationBaseAction extends BaseActionSupport{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The confiscation. */
	protected Confiscation confiscation;
	
	/** The confiscation id. */
	protected Long confiscationId;
	
	/** The conf type. */
	protected String confType;
	
	/**
	 * Gets the confiscation.
	 *
	 * @return the confiscation
	 */
	public Confiscation getConfiscation() {
		return confiscation;
	}
	
	/**
	 * Sets the confiscation.
	 *
	 * @param confiscation the new confiscation
	 */
	public void setConfiscation(Confiscation confiscation) {
		this.confiscation = confiscation;
	}
	
	/**
	 * Gets the confiscation id.
	 *
	 * @return the confiscation id
	 */
	public Long getConfiscationId() {
		return confiscationId;
	}
	
	/**
	 * Sets the confiscation id.
	 *
	 * @param confiscationId the new confiscation id
	 */
	public void setConfiscationId(Long confiscationId) {
		this.confiscationId = confiscationId;
	}
	
	/**
	 * Gets the conf type.
	 *
	 * @return the conf type
	 */
	public String getConfType() {
		return confType;
	}
	
	/**
	 * Sets the conf type.
	 *
	 * @param confType the new conf type
	 */
	public void setConfType(String confType) {
		this.confType = confType;
	}
	

}
