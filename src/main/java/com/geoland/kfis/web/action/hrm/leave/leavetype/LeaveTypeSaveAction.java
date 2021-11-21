package com.geoland.kfis.web.action.hrm.leave.leavetype;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.LeaveType;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class LeaveTypeSaveAction.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created April 24, 2014 12:06:53 AM
 * @Version 1.0
 */
public class LeaveTypeSaveAction extends LeaveTypeBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		if(StringUtils.isEmpty(leaveType.getName()))
			addFieldError("leaveType.name", getMessage("finance.type.name.empty"));
		if(StringUtils.isEmpty(leaveType.getNameEn()))
			addFieldError("leaveType.nameEn", getMessage("finance.type.name.en.empty"));
		if(StringUtils.isEmpty(leaveType.getNameSr()))
			addFieldError("leaveType.nameSr", getMessage("finance.type.name.sr.empty"));
		if(StringUtils.isEmpty(leaveType.getCode()))
			addFieldError("leaveType.code", getMessage("organisation.code.empty"));
		if(leaveType.getCode().length()>3)
			addFieldError("leaveType.code", getMessage("leaveType.code.length.less.than.four"));
		else if(!StringUtils.isEmpty(leaveType.getCode())) {
			String code = leaveType.getCode().toUpperCase();
			String query = "SELECT * FROM thrm_leave_type WHERE code='"+code+"'";
			if(leaveType.getId()!=null){
				query+=" and id!="+leaveType.getId();
			}
			List<LeaveType> list=DAOFactory.getFactory().getLeaveTypeDAO().executeSQLQuery(query);
			if(list.size()>0){		
					addFieldError("leaveType.code", getMessage("leaveType.code.value.does.exists"));
			}
		}
				
		if(!getFieldErrors().isEmpty() || !getActionErrors().isEmpty()){
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exits", "true");					
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		if(getLeaveType().getDeleted()==null){
			getLeaveType().setDeleted(new Short("0"));	
		}
		if(getLeaveType().getExcludeInReportsIfNoEntitlement()==null){
			getLeaveType().setExcludeInReportsIfNoEntitlement(new Short("0"));	
		}
		if(getLeaveType().getIsannual()==null){
			getLeaveType().setIsannual(new Short("0"));
		}
		if(getLeaveType().getIsawol()==null){
			getLeaveType().setIsawol(new Short("0"));
		}
		if(getLeaveType().getIspaid()==null){
			getLeaveType().setIspaid(new Short("0"));
		}
		if(getLeaveType().getBgColor()==null){
			getLeaveType().setBgColor("");
		}
		if( leaveType!=null && leaveType.getCode()!=null){
			String code = leaveType.getCode().toUpperCase();
			leaveType.setCode(code); //Save coreatedDate(new Date());
		}
		leaveType.setCreatedDate(new Date());
		leaveType.setParty((Employee)DAOFactory.getFactory().getPartyUserDAO().getPerson(getUser().getUser().getId()));
		User user = getUser().getUser();
		getLeaveType().setCurrentUser(user);
		DAOFactory.getFactory().getLeaveTypeDAO().save(getLeaveType());
		return SUCCESS;
	}
}
	
