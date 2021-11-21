package com.geoland.kfis.web.action.hrm.skill;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Skill;
// TODO: Auto-generated Javadoc

/**
 * The Class EmployeeCertificationSaveAction.
 *
 * @author ADELINA GASHI, GEO&LAND
 * @created May , 2014 10:22:18 AM
 * @Version 1.0
 */
public class EmployeeCertificationSaveAction extends EmployeeSkillBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The created by. */
	private Employee createdBy;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		createdBy=getUser().getEmployee();
		if(createdBy==null)
			addActionError("");
		
		if(employeeSkill!=null && employeeSkill.getEmployee().getId()==null){
			addFieldError("employeeSkill.employee.id",getMessage("employee.skill.employee.empty"));
		}
		if(employeeSkill!=null && employeeSkill.getSkillName().isEmpty()){
				addFieldError("employeeSkill.skillName",getMessage("employee.skill.name.empty"));
		}
		Date actualDate=new Date();
		if(employeeSkill!=null && employeeSkill.getDateStart()==null){
			addFieldError("employeeSkill.dateStart", getMessage("payment.start.date.empty"));
		}else if(employeeSkill.getDateStart().compareTo(actualDate)==1){
			addFieldError("employeeSkill.dateStart.toLarge", getMessage("employee.start.date.greater"));
		}
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
		if(file!=null ){
			employeeSkill.setDoc(getFileBytes(file));
		}else if(employeeSkill.getId()!=null){
			Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
			SQLQuery sqlQuery= session.createSQLQuery("select doc from thrm_employee_skill where id="+employeeSkill.getId());
			sqlQuery.addScalar("doc");
			Object ob1 = sqlQuery.uniqueResult();
			employeeSkill.setDoc((byte[])ob1);
		}
		if(employeeSkill.getDoc()==null){
			employeeSkill.setDocName(null);
			employeeSkill.setDocType(null);
		}
		
		employeeSkill.setSkillType(Skill.CERTIFICATE);
		employeeSkill.setCreatedDate(new Date());
		employeeSkill.setParty(createdBy);
		
		DAOFactory.getFactory().getEmployeeSkillDAO().save(employeeSkill);
		return SUCCESS;
	}
	
	/**
	 * Gets the created by.
	 *
	 * @return the createdBy
	 */
	public Employee getCreatedBy() {
		return createdBy;
	}
	
	/**
	 * Sets the created by.
	 *
	 * @param createdBy the createdBy to set
	 */
	public void setCreatedBy(Employee createdBy) {
		this.createdBy = createdBy;
	}
	
}
