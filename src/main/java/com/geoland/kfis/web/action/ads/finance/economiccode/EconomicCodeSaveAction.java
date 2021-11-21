/**
 * 
 */
package com.geoland.kfis.web.action.ads.finance.economiccode;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.EconomicCode;
import com.geoland.kfis.persistence.dao.DAOFactory;

public class EconomicCodeSaveAction extends EconomicCodeBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1769671403084554571L;

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		
		String fieldIsRequired = getMessage("fin.economiccode.field.required");
		
		if(getEconomicCodeParentId() == null) {
			addFieldError("economicCode.parent", getMessage("fin.economiccode.parent") + " " + fieldIsRequired);
		}else {
			EconomicCode parent = DAOFactory.getFactory().getEconomicCodeDAO().get(getEconomicCodeParentId());
			getEconomicCode().setParent(parent);
		}
		
		if(StringUtils.isEmpty(getEconomicCode().getNameAl()))
			addFieldError("economicCode.nameAl", getMessage("fin.economiccode.name") + " " + fieldIsRequired);
		
		if(StringUtils.isEmpty(getEconomicCode().getNameEn()))
			addFieldError("economicCode.nameEn", getMessage("fin.economiccode.name.en") + " " + fieldIsRequired);
		
		if(StringUtils.isEmpty(getEconomicCode().getNameSr()))
			addFieldError("economicCode.nameSr", getMessage("fin.economiccode.name.sr") + " " + fieldIsRequired);
		
		if(StringUtils.isEmpty(getEconomicCode().getCode()))
			addFieldError("economicCode.code", getMessage("fin.economiccode.code") + " " + fieldIsRequired);
		
		
		if (!getFieldErrors().isEmpty()) {
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
		if(getEconomicCode().getId() != null){
			EconomicCode parent = DAOFactory.getFactory().getEconomicCodeDAO().get(getEconomicCodeParentId());
			getEconomicCode().setParent(parent);
			short level = (short) (parent.getLevel() + 1);
			getEconomicCode().setLevel(level);
		}else {
			short level = 1;
			getEconomicCode().setLevel(level);
			getEconomicCode().setCreatedDate(new Date());
			
			EconomicCode parent = DAOFactory.getFactory().getEconomicCodeDAO().get(getEconomicCodeParentId());
			getEconomicCode().setParent(parent);
		}
		
		getEconomicCode().setCurrentUser(currentUser);
		DAOFactory.getFactory().getEconomicCodeDAO().save(getEconomicCode());
		
		
		return SUCCESS;
	}
	
}
