package com.geoland.kfis.web.action.hrm.annualplan;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.HrmAnnPlanEmployee;
import com.geoland.kfis.model.HrmAnnualPlanDoc;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Hrmannplanstatus;
import com.geoland.kfis.web.action.base.Constants;

// TODO: Auto-generated Javadoc
/**
 * The Class AnnualPlanSaveAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 9:59:17 AM, Jun 2, 2015
 */
public class AnnualPlanSaveAction extends AnnualPlanBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 3193783298532185578L;
	
	/** The employee. */
	private Employee employee;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		employee=getUser().getEmployee();
		if(employee==null)
			addActionError("login.user.employee.role.empty");
		
		if(StringUtils.isEmpty(plan.getAnnualPlanAl()))
			addFieldError("plan.annualPlanAl", getMessage("finance.type.name.empty"));
		if(StringUtils.isEmpty(plan.getAnnualPlanEn()))
			addFieldError("plan.annualPlanEn", getMessage("finance.type.name.en.empty"));
		if(StringUtils.isEmpty(plan.getAnnualPlanSr()))
			addFieldError("plan.annualPlanSr", getMessage("finance.type.name.sr.empty"));
		
		if(employeeIdList==null){
			employeeIdList=new ArrayList<Long>();
		}
		if(hasActionErrors() || hasFieldErrors()){
			HttpServletResponse response=ServletActionContext.getResponse();
			response.addHeader(Constants.ERRORS_EXITS, "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		Date cdate = new Date();
		plan.setHrmAnnualPlanStatus(status);
		
		if(status.getId()==null){
			status.setCreateDate(cdate);
			status.setEmployee(employee);
		}
		status.setHrmAnnualPlan(plan);
		if(status.getStatus()==null)
			status.setStatus(Hrmannplanstatus.CREATED);
		
		User user = getUser().getUser();
		plan.setCurrentUser(user);
		status.setCurrentUser(user);
		
		DAOFactory.getFactory().getHrmAnnualPlanDAO().save(plan);
		
		DAOFactory.getFactory().getHrmAnnualPlanStatusDAO().save(status);
		
		if(plan.getId()!=null){
			if(employeeIdList!=null){
				String oldList="SELECT * FROM thrm_ann_plan_employee e WHERE e.ann_plan_id="+plan.getId();
				oldEmployeeList=DAOFactory.getFactory().getHrmAnnPlanEmployeeDAO().executeSQLQuery(oldList);
				plan.getHrmAnnPlanEmployees().addAll(oldEmployeeList);
				for(HrmAnnPlanEmployee old:oldEmployeeList){
					if(!checkOld(old,employeeIdList)){
						DAOFactory.getFactory().getHrmAnnPlanEmployeeDAO().delete(old);
						plan.getHrmAnnPlanEmployees().remove(old);
					}
				}
				for(Long i:employeeIdList){
					if(!checkNew(i, oldEmployeeList)){
						Employee emp=DAOFactory.getFactory().getEmployeeDAO().get(i);
						emp.setId(i);
						HrmAnnPlanEmployee ape=new HrmAnnPlanEmployee(plan,emp);
						ape.setCurrentUser(user);
						DAOFactory.getFactory().getHrmAnnPlanEmployeeDAO().save(ape);
						plan.getHrmAnnPlanEmployees().add(ape);
					}
				}
			}
		}
		String doc_note = doc.getNote();
		for(int i=0; i<fileUpload.size(); i++) {
			File file = fileUpload.get(i);
			if(file!=null && file.length()>0){
				String fuf = fileUploadFileName.get(i);
				String doctype = fuf.substring(fuf.lastIndexOf(".")+1);
				byte[] bytes = FileUtils.readFileToByteArray(file);
				doc=new HrmAnnualPlanDoc();
				doc.setDoc(bytes);
				doc.setDocSize(file.length());
				doc.setDocName(fuf);
				doc.setDocType(doctype);
				doc.setCreatedDate(cdate);
				doc.setEmployee(employee);
				doc.setHrmAnnualPlan(plan);
				doc.setStatusName(status.getStatus());
				doc.setNote(doc_note);
				DAOFactory.getFactory().getHrmAnnualPlanDocDAO().save(doc);
			}
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
	 * @param employee the employee to set
	 */
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	
}
