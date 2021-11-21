/**
 * 
 */
package com.geoland.kfis.web.action.ads.dp.doctype;

import com.geoland.kfis.model.DocType;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class DocTypeBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 2:03:05 PM, Feb 4, 2015
 */
public class DocTypeBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -3929312165535470392L;

	/** The doc type id. */
	protected Long docTypeId;
	
	/** The doc type. */
	protected DocType docType;
	
	/**
	 * Gets the doc type id.
	 *
	 * @return the docTypeId
	 */
	public Long getDocTypeId() {
		return docTypeId;
	}
	
	/**
	 * Sets the doc type id.
	 *
	 * @param docTypeId the docTypeId to set
	 */
	public void setDocTypeId(Long docTypeId) {
		this.docTypeId = docTypeId;
	}
	
	/**
	 * Gets the doc type.
	 *
	 * @return the docType
	 */
	public DocType getDocType() {
		return docType;
	}
	
	/**
	 * Sets the doc type.
	 *
	 * @param docType the docType to set
	 */
	public void setDocType(DocType docType) {
		this.docType = docType;
	}
	
	
}
