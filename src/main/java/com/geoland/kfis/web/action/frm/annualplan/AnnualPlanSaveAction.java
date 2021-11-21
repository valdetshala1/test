package com.geoland.kfis.web.action.frm.annualplan;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.AnnualPlanning;
import com.geoland.kfis.model.AnnualPlanningStatus;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Activitystatus;
import com.geoland.kfis.web.action.base.Constants;

// TODO: Auto-generated Javadoc
/**
 * The Class AnnualPlanSaveAction.
 */
public class AnnualPlanSaveAction extends AnnualPlanBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 3428455760161662430L;
	
	/** The employee. */
	private Employee employee;
	
	/** The status. */
	protected AnnualPlanningStatus status;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		employee = DAOFactory.getFactory().getPartyUserDAO().getEmployee(getUser().getUser().getId());
		if(employee==null){
			addActionError("login.user.employee.role.empty");
		}
		
		if(annualplan!=null && annualplan.getCadastralMunicipality().getId() == null && !centralplan)
			addFieldError("annualplan.cadastralMunicipality.id", getMessage("annual.planning.cadastral.municipality.id.empty"));
		
		if(annualplan!=null && annualplan.getYear() == null)
			addFieldError("annualplan.year", getMessage("annual.planning.year.empty"));
		
		if(annualplan.getYear()!=null){
			String query = "select * from tfrm_annual_planning where year="+annualplan.getYear();
			if(annualplan.getCadastralMunicipality().getId() != null){
				query+=" and mun_id="+annualplan.getCadastralMunicipality().getId();
			}else{
				query+=" and mun_id is null";
			}
			if(annualplan.getId()!=null)
				query+=" and id!="+annualplan.getId();
			List<AnnualPlanning> list = DAOFactory.getFactory().getAnnualPlanningDAO().executeSQLQuery(query);
			if(!list.isEmpty()){
				addFieldError("annualplan.year", getMessage("annual.planning.year.exists"));
			}
		}
		if (!getFieldErrors().isEmpty()) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader(Constants.ERRORS_EXITS, "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		if(annualplan!=null && annualplan.getId()==null){
			status = new AnnualPlanningStatus();
			status.setStatus(Activitystatus.NEW);
			status.setAnnualPlanning(annualplan);
			status.setCreatedDate(new Date());
			status.setPerson(employee);
		}else {
			status=DAOFactory.getFactory().getAnnualPlanningStatusDAO().get(annualplan.getAnnualPlanningStatus().getId());
		}
		if(annualplan.getCadastralMunicipality().getId()==null)
			annualplan.setCadastralMunicipality(null);
		
		annualplan.setAnnualPlanningStatus(status);
		annualplan.setPerson(employee);
		annualplan.setOperationLevel(employee.getOrganisation().getOperLevel());
		annualplan.setCreatedDate(new Date());
		
		User user = getUser().getUser();
		annualplan.setCurrentUser(user);
		status.setCurrentUser(user);
		
		DAOFactory.getFactory().getAnnualPlanningDAO().save(annualplan);
		DAOFactory.getFactory().getAnnualPlanningStatusDAO().save(status);
		
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

	/* (non-Javadoc)
	 * @see com.geoland.kfis.web.action.frm.annualplan.AnnualPlanBaseAction#getStatus()
	 */
	public AnnualPlanningStatus getStatus() {
		return status;
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.web.action.frm.annualplan.AnnualPlanBaseAction#setStatus(com.geoland.kfis.model.AnnualPlanningStatus)
	 */
	public void setStatus(AnnualPlanningStatus status) {
		this.status = status;
	}
	
	
}
