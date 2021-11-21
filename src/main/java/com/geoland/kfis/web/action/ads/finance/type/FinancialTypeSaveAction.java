/**
 * 
 */
package com.geoland.kfis.web.action.ads.finance.type;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.FinancialType;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.FinancialTypeDAO;


public class FinancialTypeSaveAction extends FinancialTypeBaseAction {

	private static final long serialVersionUID = 9148482098113849990L;

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		
		String fieldIsRequired = getMessage("fin.economiccode.field.required");
		
		if(getFinancialTypeParentId() == null) {
			addFieldError("financialType.parent", getMessage("fin.economiccode.parent") + " " + fieldIsRequired);
		}else {
			FinancialType parent = DAOFactory.getFactory().getFinancialTypeDAO().get(getFinancialTypeParentId());
			getFinancialType().setParent(parent);
		}
		
		if(StringUtils.isEmpty(getFinancialType().getNameAl()))
			addFieldError("financialType.nameAl", getMessage("fin.economiccode.name") + " " + fieldIsRequired);
		
		if(StringUtils.isEmpty(getFinancialType().getNameEn()))
			addFieldError("financialType.nameEn", getMessage("fin.economiccode.name.en") + " " + fieldIsRequired);
		
		if(StringUtils.isEmpty(getFinancialType().getNameSr()))
			addFieldError("financialType.nameSr", getMessage("fin.economiccode.name.sr") + " " + fieldIsRequired);
		
		if(StringUtils.isEmpty(getFinancialType().getCode())) {
			addFieldError("financialType.code", getMessage("fin.economiccode.code") + " " + fieldIsRequired);
		}
		
		if(codeValidation) {
			FinancialType parent = getFinancialType().getParent();
			if(parent != null && parent.getLevel() != null && parent.getLevel() > 1) {
				String parentCode = getFinancialType().getParent().getCode();
				if(!getFinancialType().getCode().startsWith(parentCode)) {
					addFieldError("financialType.code", getMessage("fin.economiccode.code.prefix.invalid"));
				}
			}	
		}
		
		
/*		
		if(getFinancialType().getType() == null)
			addFieldError("financialType.type", getMessage("fin.economiccode.type") + " " + fieldIsRequired);
*/
		
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
		FinancialTypeDAO dao = DAOFactory.getFactory().getFinancialTypeDAO();
		
		User currentUser = getUser().getUser();
		short level = (short) (getFinancialType().getParent().getLevel() + 1);
		getFinancialType().setLevel(level);
		
		if(getFinancialType().getId() == null){
			getFinancialType().setCreatedDate(new Date());
		}
		
		if(getFinancialType().getAllocation() == null) {
			getFinancialType().setAllocation(false);
		}
		
		getFinancialType().setCurrentUser(currentUser);
		dao.save(getFinancialType());
		
		
		return SUCCESS;
	}
}
