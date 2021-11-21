package com.geoland.kfis.web.action.hrm.taxrate;

import java.math.BigDecimal;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Person;
import com.geoland.kfis.persistence.dao.DAOFactory;

/**
 * 
 * Class TaxRateSaveAction
 * 
 * @author BEKIM BAJRAKTARI
 * @created 15.04.2020 09:30:53
 * @Version 1.0
 */
public class TaxRateSaveAction extends TaxRateBaseAction {

	private static final long serialVersionUID = 1L;


	@Override
	public void validate() {
		
		if(taxrate.getTaxNormName() == null || taxrate.getTaxNormName().isEmpty()) {
			addFieldError("taxrate.taxNormName", getMessage("hrml.employee.salary.taxrate.taxNormName.empty"));
		}
		
		BigDecimal zeroValue = new BigDecimal(0.0);

		if(taxrate.getPercentage() == null || zeroValue.equals(taxrate.getPercentage())) {
			addFieldError("taxrate.percent", getMessage("hrml.employee.salary.taxrate.percent.empty"));
		}

		if(taxrate.getStartAmount() == null || zeroValue.equals(taxrate.getStartAmount())) {
			addFieldError("taxrate.startAmount", getMessage("hrml.employee.salary.taxrate.startAmount.empty"));
		}
		
		if(taxrate.getEndAmount() == null || zeroValue.equals(taxrate.getEndAmount())) {
			addFieldError("taxrate.endAmount", getMessage("hrml.employee.salary.taxrate.endAmount.empty"));
		}
		
		
		if(taxrate.getValidDateFrom() == null ) {
			addFieldError("taxrate.validDateFrom", getMessage("hrml.employee.salary.taxrate.validDateFrom.empty"));
		}

		if(taxrate.getValidDateFrom() == null ) {
			addFieldError("taxrate.validDateTo", getMessage("hrml.employee.salary.taxrate.validDateTo.empty"));
		}		
		
		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exists", "true");
		}		
	}
	
	
	@Override
	public String execute() throws Exception {
		Date currentDate = new Date();
		
		if(taxrate.getId() == null) {
			Person createdBy = getUser().getPerson();
			
			taxrate.setCreatedBy(createdBy);
			taxrate.setCreatedDate(currentDate);
		}
		
		
		if(currentDate.after(taxrate.getValidDateFrom()) && currentDate.before(taxrate.getValidDateTo())) {
			taxrate.setValid(true);
		}else {
			taxrate.setValid(false);
		}
		
		DAOFactory.getFactory().getEmployeeSalaryTaxRatesDAO().save(taxrate);
		
		return SUCCESS;
	}
}
