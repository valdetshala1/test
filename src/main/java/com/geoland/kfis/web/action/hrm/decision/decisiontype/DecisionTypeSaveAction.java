package com.geoland.kfis.web.action.hrm.decision.decisiontype;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class DecisionTypeSaveAction.
 */
public class DecisionTypeSaveAction extends DecisionTypeBaseAction{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The person. */
	private Person person;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		
		person = getUser().getPerson();
		if(person==null)
			addActionError("");
		
		if(decisionType!=null && StringUtils.isEmpty(decisionType.getNameAl()))
			addFieldError("decisionType.nameAl", getMessage("finance.type.name.empty"));
		
		if(decisionType!=null && StringUtils.isEmpty(decisionType.getNameEn()))
			addFieldError("decisionType.nameEn", getMessage("finance.type.name.en.empty"));
		
		if (hasActionErrors() || hasFieldErrors()) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exits", "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		decisionType.setCreatedDate(new Date());
		decisionType.setPerson(person);
		User user = getUser().getUser();
		decisionType.setCurrentUser(user);
		DAOFactory.getFactory().getDecisionTypeDAO().save(decisionType);
		return SUCCESS;
	}
}
