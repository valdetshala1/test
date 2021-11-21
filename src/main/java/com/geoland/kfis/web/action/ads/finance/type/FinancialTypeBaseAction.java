/**
 * 
 */
package com.geoland.kfis.web.action.ads.finance.type;

import com.geoland.kfis.model.FinancialType;
import com.geoland.kfis.persistence.hibernate.usertypes.Financialtype;
import com.geoland.kfis.web.action.base.BaseActionSupport;


public class FinancialTypeBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 8845608540538645960L;
	
	/** The fin type id. */
	protected Long financialTypeId;
	
	/** The fin type. */
	protected FinancialType financialType;
	
	protected FinancialType financialTypeParent;
	
	protected Long financialTypeParentId;
	
	protected boolean codeValidation;
	
	/** The type list. */
	protected Financialtype typeList[] = Financialtype.values();


	public Long getFinancialTypeId() {
		return financialTypeId;
	}


	public void setFinancialTypeId(Long financialTypeId) {
		this.financialTypeId = financialTypeId;
	}


	public FinancialType getFinancialType() {
		return financialType;
	}


	public void setFinancialType(FinancialType financialType) {
		this.financialType = financialType;
	}


	public FinancialType getFinancialTypeParent() {
		return financialTypeParent;
	}


	public void setFinancialTypeParent(FinancialType financialTypeParent) {
		this.financialTypeParent = financialTypeParent;
	}


	public Long getFinancialTypeParentId() {
		return financialTypeParentId;
	}


	public void setFinancialTypeParentId(Long financialTypeParentId) {
		this.financialTypeParentId = financialTypeParentId;
	}


	public Financialtype[] getTypeList() {
		return typeList;
	}


	public void setTypeList(Financialtype[] typeList) {
		this.typeList = typeList;
	}


	public boolean isCodeValidation() {
		return codeValidation;
	}


	public void setCodeValidation(boolean codeValidation) {
		this.codeValidation = codeValidation;
	}

	
}
