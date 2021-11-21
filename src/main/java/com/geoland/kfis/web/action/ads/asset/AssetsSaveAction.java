/**
 * 
 */
package com.geoland.kfis.web.action.ads.asset;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class AssetsSaveAction.
 *
 * @author Festim Krasniqi,GEO&LAND
 * @created May 21, 2014 4:11:41 PM
 * @Version 1.0
 */
public class AssetsSaveAction extends AssetsBaseAction{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The employee. */
	private Employee employee;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		employee=getUser().getEmployee();
		if(employee==null)
			addActionError("");
		if(StringUtils.isEmpty(getAsset().getBarcode()))
			addFieldError("asset.barcode", getMessage("asset.barcode.empty"));
		if(StringUtils.isEmpty(getAsset().getName()))
			addFieldError("asset.name", getMessage("finance.type.name.empty"));
		if(getAsset().getOrganisation().getId()==null)
			addFieldError("asset.organisation.id", getMessage("asset.organisation.empty"));
		if(getAsset().getDateOfPurchase()==null)
			addFieldError("asset.dateOfPurchase", getMessage("asset.dateOfPurchase.empty"));
//		if(getAsset().getQuantity()==null)
//			addFieldError("asset.quantity", getMessage("asset.quantity.empty"));
		if(getAsset().getPurchaseValue()==null)
			addFieldError("asset.purchaseValue", getMessage("asset.purchaseValue.empty"));
		if(getAsset().getAmortizationGrade()==null)
			addFieldError("asset.amortizationGrade", getMessage("asset.amortizationGrade.empty"));
		if(getAsset().getAmortizationGrade()!=null && getAsset().getAmortizationGrade()>1)
			addFieldError("asset.amortizationGrade", getMessage("This value should be under 1"));
		
		if (!getFieldErrors().isEmpty() || !getActionErrors().isEmpty()) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exits", "true");
		}
	}
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		User currentUser = getUser().getUser();
		getAsset().setEmployee(employee);
		getAsset().setQuantity(1.0);
		getAsset().setPurchaseTotal(getAsset().getPurchaseValue()*getAsset().getQuantity());
		if(getAsset().getNetAfterDevalYear()==null){	
			getAsset().setNetAfterDevalYear(getAsset().getPurchaseTotal());
		}
		getAsset().setCreatedDate(new Date());
		getAsset().setCurrentUser(currentUser);
		DAOFactory.getFactory().getAssetsDAO().save(getAsset());
		
		return SUCCESS;
	}
	
	/**
	 * Gets the employee.
	 *
	 * @return the employee
	 */
	public Employee getEmployee() {
		return employee;
	}
	
	/**
	 * Sets the employee.
	 *
	 * @param employee the employee to set
	 */
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
}
