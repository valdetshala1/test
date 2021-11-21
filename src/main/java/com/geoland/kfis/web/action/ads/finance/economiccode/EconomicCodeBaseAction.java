/**
 * 
 */
package com.geoland.kfis.web.action.ads.finance.economiccode;

import com.geoland.kfis.model.EconomicCode;
import com.geoland.kfis.web.action.base.BaseActionSupport;


public class EconomicCodeBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	private Long economicCodeId;
	private Long economicCodeParentId;
	private  EconomicCode economicCode; 	
	private  EconomicCode economicCodeParent;
	public Long getEconomicCodeId() {
		return economicCodeId;
	}
	public void setEconomicCodeId(Long economicCodeId) {
		this.economicCodeId = economicCodeId;
	}
	public Long getEconomicCodeParentId() {
		return economicCodeParentId;
	}
	public void setEconomicCodeParentId(Long economicCodeParentId) {
		this.economicCodeParentId = economicCodeParentId;
	}
	public EconomicCode getEconomicCode() {
		return economicCode;
	}
	public void setEconomicCode(EconomicCode economicCode) {
		this.economicCode = economicCode;
	}
	public EconomicCode getEconomicCodeParent() {
		return economicCodeParent;
	}
	public void setEconomicCodeParent(EconomicCode economicCodeParent) {
		this.economicCodeParent = economicCodeParent;
	}
	
}
