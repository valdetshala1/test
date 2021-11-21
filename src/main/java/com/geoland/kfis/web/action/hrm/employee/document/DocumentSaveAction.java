package com.geoland.kfis.web.action.hrm.employee.document;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class DocumentSaveAction.
 *
 * @author ADELINA GASHI, GEO&LAND
 * @created May 22, 2014 10:30:55 AM
 * @Version 1.0
 */
public class DocumentSaveAction extends DocumentBaseAction {
	
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
		
		if(employeeDocument!=null && employeeDocument.getDocumentType()==null){
			addFieldError("employeeDocument.documentType",getMessage("employee.file.document.type.empty"));
		}
		if(employeeDocument!=null && fileDocument==null && employeeDocument.getId()==null){
			addFieldError("employeeDocument.fileContent",getMessage("employee.file.content.empty"));
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
		employeeDocument.setCreatedDate(new Date());
		User user = getUser().getUser();
		if(fileDocument!=null){
			employeeDocument.setDocSize(fileDocument.getTotalSpace());
			employeeDocument.setDoc(getFileBytes(fileDocument));
		}else if(employeeDocument.getId()!=null){
			Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
			SQLQuery sqlQuery= session.createSQLQuery("select doc from thrm_employee_doc where id="+employeeDocument.getId());
			sqlQuery.addScalar("doc");
			Object ob1 = sqlQuery.uniqueResult();
			byte[] b=(byte[])ob1;
			employeeDocument.setDoc(b);
			employeeDocument.setDocSize(b!=null?new Long(b.length):1L);
		}
		employeeDocument.setParty(createdBy);
		employeeDocument.setCurrentUser(user);
		DAOFactory.getFactory().getEmployeeDocumentDAO().save(employeeDocument);
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
