package com.geoland.kfis.web.action.frm.layergis;
/**
 * 
 * @author Adelina Gashi
 * May 28, 2018 , 10:28:59 AM
 * version 2.0
 */

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.LayersGis;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.BaseActionSupport;
import com.geoland.kfis.web.action.base.Constants;

// TODO: Auto-generated Javadoc
/**
 * The Class LayerGisSaveAction.
 */
public class LayerGisSaveAction extends BaseActionSupport  {
    
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The layergis. */
	private LayersGis layergis;
    
    /** The layergis id. */
    private Long layergisId;
    
    /** The parent id. */
    private Long parentId;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		
		if(layergis!=null && StringUtils.isEmpty(layergis.getStore())){
			addFieldError("layergis.store", getMessage("frm.layergis.store.empty"));
		}
		if(layergis!=null && StringUtils.isEmpty(layergis.getFeatureTypeLayer())){
			addFieldError("layergis.featureTypeLayer", getMessage("frm.layergis.feature.type.layer.empty"));
		}
		if (hasFieldErrors() || hasActionErrors()) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader(Constants.ERRORS_EXITS, "true");
		}

	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		if(parentId==null){
			layergis.setLayersGis(null);
		}else {
			layergis.setLayersGis(DAOFactory.getFactory().getLayersGisDAO().get(parentId));
		}
		DAOFactory.getFactory().getLayersGisDAO().save(layergis);
		return SUCCESS;
	}

	/**
	 * Gets the layergis.
	 *
	 * @return the layergis
	 */
	public LayersGis getLayergis() {
		return layergis;
	}

	/**
	 * Sets the layergis.
	 *
	 * @param layergis the new layergis
	 */
	public void setLayergis(LayersGis layergis) {
		this.layergis = layergis;
	}

	/**
	 * Gets the layergis id.
	 *
	 * @return the layergis id
	 */
	public Long getLayergisId() {
		return layergisId;
	}

	/**
	 * Sets the layergis id.
	 *
	 * @param layergisId the new layergis id
	 */
	public void setLayergisId(Long layergisId) {
		this.layergisId = layergisId;
	}

	/**
	 * Gets the parent id.
	 *
	 * @return the parent id
	 */
	public Long getParentId() {
		return parentId;
	}

	/**
	 * Sets the parent id.
	 *
	 * @param parentId the new parent id
	 */
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}
	

}
