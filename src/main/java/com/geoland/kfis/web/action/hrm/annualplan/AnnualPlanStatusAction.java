package com.geoland.kfis.web.action.hrm.annualplan;

import java.io.File;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.DpMngmtAttach;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.HrmAnnualPlanDoc;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Hrmannplanstatus;
import com.geoland.kfis.web.action.base.Constants;

// TODO: Auto-generated Javadoc
/**
 * The Class AnnualPlanStatusAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 3:20:28 PM, Jun 2, 2015
 */
public class AnnualPlanStatusAction extends AnnualPlanBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 4465283325179720636L;
	
	/** The file. */
	private File file;
	
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
		
		if(plan==null || (plan!=null && plan.getId()==null))
			addFieldError("", getMessage(""));
		if(status!=null && status.getStatus()==null)
			addFieldError("status.status", getMessage("order.item.status.code.empty"));
		
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
		Date cdate = new Date();
		if(status.getId()==null){
			status.setCreateDate(cdate);
			status.setEmployee(employee);
		}
		
		plan=DAOFactory.getFactory().getHrmAnnualPlanDAO().get(plan.getId());
		plan.setHrmAnnualPlanStatus(status);
		status.setHrmAnnualPlan(plan);
		
		DAOFactory.getFactory().getHrmAnnualPlanDAO().save(plan);
		
		DAOFactory.getFactory().getHrmAnnualPlanStatusDAO().save(status);
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
	 * Gets the file.
	 *
	 * @return the file
	 */
	public File getFile() {
		return file;
	}

	/**
	 * Sets the file.
	 *
	 * @param file the file to set
	 */
	public void setFile(File file) {
		this.file = file;
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
