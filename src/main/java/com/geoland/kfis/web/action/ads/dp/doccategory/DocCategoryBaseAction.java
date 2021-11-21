/**
 * 
 */
package com.geoland.kfis.web.action.ads.dp.doccategory;

import com.geoland.kfis.model.DocCategory;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class DocCategoryBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 8:57:14 AM, Feb 4, 2015
 */
public class DocCategoryBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The doc category id. */
	protected Long docCategoryId;
	
	/** The doc category. */
	protected DocCategory docCategory;
	
	/**
	 * Gets the doc category id.
	 *
	 * @return the docCategoryId
	 */
	public Long getDocCategoryId() {
		return docCategoryId;
	}
	
	/**
	 * Sets the doc category id.
	 *
	 * @param docCategoryId the docCategoryId to set
	 */
	public void setDocCategoryId(Long docCategoryId) {
		this.docCategoryId = docCategoryId;
	}
	
	/**
	 * Gets the doc category.
	 *
	 * @return the docCategory
	 */
	public DocCategory getDocCategory() {
		return docCategory;
	}
	
	/**
	 * Sets the doc category.
	 *
	 * @param docCategory the docCategory to set
	 */
	public void setDocCategory(DocCategory docCategory) {
		this.docCategory = docCategory;
	}
	
	
}
