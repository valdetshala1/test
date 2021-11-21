package com.geoland.kfis.web.action.hrm.taxrate;

import com.geoland.kfis.model.EmployeeSalaryTaxRates;
import com.geoland.kfis.web.action.base.BaseActionSupport;

/**
 * 
 * Class TaxRateBaseAction
 * 
 * @author BEKIM BAJRAKTARI
 * @created 14.04.2020
 * @Version 1.0
 */
public class TaxRateBaseAction extends BaseActionSupport {

	private static final long serialVersionUID = 1L;

	protected Long taxrateId;
;
	
	protected EmployeeSalaryTaxRates taxrate;
	
	public void setTaxrateId(Long taxrateId) {
		this.taxrateId = taxrateId;
	}
	
	public Long getTaxrateId() {
		return taxrateId;
	}
	
	public void setTaxrate(EmployeeSalaryTaxRates taxrate) {
		this.taxrate = taxrate;
	}
	
	public EmployeeSalaryTaxRates getTaxrate() {
		return taxrate;
	}

}
