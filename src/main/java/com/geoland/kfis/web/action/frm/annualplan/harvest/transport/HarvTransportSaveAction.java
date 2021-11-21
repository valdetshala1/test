package com.geoland.kfis.web.action.frm.annualplan.harvest.transport;

import java.io.IOException;
import java.util.Date;

import javax.persistence.Table;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.StandHarvestImplDeclare;
import com.geoland.kfis.model.StandHarvestImplTransport;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.Constants;

import net.sf.json.JSONException;
// TODO: Auto-generated Javadoc

/**
 * The Class HarvTransportSaveAction.
 *
 * @author Adelina Gashi, GEO&LAND
 * @version 1.0
 * @created 1:52:37 PM Jan 14, 2016
 */
public class HarvTransportSaveAction  extends HarvTransportBaseAction{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The employee. */
	private Employee employee;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		if(harvImplTransport!=null && harvImplTransport.getId()==null){
			employee = getUser().getEmployee();
			harvImplTransport.setCreatedDate(new Date());
		}
		if(employee==null){
			addActionError("login.user.employee.role.empty");
		}else{
			harvImplTransport.setPerson(employee);
		}
		if(!StringUtils.isEmpty(harvToTransIds)){
		harvImpIds=harvToTransIds.split(",");
		if(harvImplTransport!=null && harvImplTransport.getTransDate()==null){
			addFieldError("harvImplTransport.transDate", getMessage("harvImplTransport.transDate.empty"));
		}
		if(file==null){
				addFieldError("tFile", getMessage("tFile.empty"));
			}
		}else{
			addFieldError("harvImplTransport.transDate", getMessage("harvImplTransport.harvToTransIds.empty"));
		}
		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader(Constants.ERRORS_EXITS, "true");
		}
		
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		User user = getUser().getUser();
		harvImplTransport.setCurrentUser(user);
		DAOFactory.getFactory().getStandHarvestImplTransportDAO().save(harvImplTransport);
		try {
//			harvImplTransport.setDoc(getFileBytes(file));	
			Class<?> c = StandHarvestImplTransport.class;
			Table table = c.getAnnotation(Table.class);
			String tableName = table.name();
			uploadDocInAlfresco(tableName,harvImplTransport.getId(), file, harvImplTransport.getDocName(), harvImplTransport.getDocName(),harvImplTransport.getDocType());
		} catch (IOException | JSONException e) {
			e.printStackTrace();
		}
		StandHarvestImplDeclare sd=null;
		for (String hImpId:harvImpIds) {
			Long hId=new Long(hImpId).longValue();
			sd=DAOFactory.getFactory().getStandHarvestImplDeclareDAO().get(hId);
			sd.setCurrentUser(user);
			sd.setStandHarvestImplTransport(harvImplTransport);
			DAOFactory.getFactory().getStandHarvestImplDeclareDAO().save(sd);
		}
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
	 * @param employee the new employee
	 */
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	


}
