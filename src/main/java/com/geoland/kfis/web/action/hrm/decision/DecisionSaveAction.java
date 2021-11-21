package com.geoland.kfis.web.action.hrm.decision;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.StringTokenizer;

import javax.persistence.Table;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.Decision;
import com.geoland.kfis.model.DecisionDoc;
import com.geoland.kfis.model.DecisionEmployee;
import com.geoland.kfis.model.DecisionStatus;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Hrmdecisionstatus;

// TODO: Auto-generated Javadoc
/**
 * The Class DecisionSaveAction.
 */
public class DecisionSaveAction extends DecisionBaseAction{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The employee. */
	private Employee employee;
	
	/** The file. */
	private File file[];

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		
		employee = getUser().getEmployee();
		if(employee==null )
			addActionError("user.login");
		
		if(decision !=null && (decision.getDecisionType() == null || (decision.getDecisionType()!=null && decision.getDecisionType().getId()==null)))
			addFieldError("decision.decisionType.id", getMessage("hrm.decision.decisiontype.validate.empty"));
		
		if(decision != null && decision.getDateOfRequest()==null)
			addFieldError("decision.dateOfRequest", getMessage("hrm.decision.request.date"));

		if(employeeIdList==null){
			employeeIdList=new ArrayList<Long>();
		}
		
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
		
		DecisionStatus decisionStatus = new DecisionStatus();
		boolean status = false;
		User user = getUser().getUser();
		
		if(decision!=null && decision.getId()==null){
			decisionStatus.setCreateDate(new Date());
			decisionStatus.setNote(decision.getNote());
			decisionStatus.setEmployee(employee);
			decisionStatus.setStatus(Hrmdecisionstatus.CREATED);
			decision.setDecisionStatus(decisionStatus);
			status = true;
		}
		decision.setCurrentUser(user);
		DAOFactory.getFactory().getDecisionDAO().save(decision);
		if(status){
			decisionStatus.setDecision(decision);
			decisionStatus.setCurrentUser(user);
			DAOFactory.getFactory().getDecisionStatusDAO().save(decisionStatus);
		}
		
		
		if(decision!=null && decision.getDecisionStatus().getStatus().equals(Hrmdecisionstatus.CREATED)){
			String query="select i.* from thrm_decision_employee as i  where i.decision_id="+decision.getId();
			existsEmployees=DAOFactory.getFactory().getDecisionEmployeeDAO().executeSQLQuery(query);
				for(Long i: employeeIdList){
					boolean exist=false;
					for(DecisionEmployee e:existsEmployees){
						if(i.equals(e.getEmployee().getId())){
							exist=true; 
							decision.getDecisionEmployees().add(e);
							break;
						}
					}
					if(!exist){
						DecisionEmployee demp=new DecisionEmployee();
						Employee emp=DAOFactory.getFactory().getEmployeeDAO().get(i);
						demp.setEmployee(emp);
						demp.setDecision(decision);
						demp.setCurrentUser(user);
						DAOFactory.getFactory().getDecisionEmployeeDAO().save(demp);
						decision.getDecisionEmployees().add(demp);
					}
				}
				 for(DecisionEmployee e:existsEmployees){
					 boolean toDelete=true;
					 for(Long i:employeeIdList){
						 if(e.getEmployee().getId().equals(i)){
							 toDelete=false;
							 break;
						 }
					 }
					 if(toDelete){
						 DAOFactory.getFactory().getDecisionEmployeeDAO().delete(e);
						 decision.getDecisionEmployees().remove(e);
					 }
				 	}
			}
		Class<?> c = DecisionStatus.class;
		Table table = c.getAnnotation(Table.class);
		String tableName = table.name();
		if(file!=null && file.length>0){
			StringTokenizer st=new StringTokenizer(docNames,";");
			int length = st.countTokens();
			String names[]=new String[length];
			for(int i=0;i<length;i++){
				String a=st.nextToken();
				if(StringUtils.isNotEmpty(a))
					names[i]=a;
			}
			st=new StringTokenizer(docExts, ";");
			length=st.countTokens();
			String exts[]=new String[length];
			for(int i=0;i<length;i++){
				String a=st.nextToken();
				if(StringUtils.isNotEmpty(a))
					exts[i]=a;
			}
			for(int i=0;i<file.length;i++){
				if(file[i]!=null){
//					DecisionDoc doc=new DecisionDoc();
//					doc.setCreatedDate(new Date());
//					doc.setDecision(decision);
//					doc.setDocName(names[i]);
//					doc.setDocType(exts[i]);
//				    doc.setEmployee(employee);
//					doc.setDoc(getFileBytes(file[i]));
//					doc.setDocSize(file[i].getTotalSpace());
//					doc.setStatusName(decision.getDecisionStatus().getStatus());
//					doc.setCurrentUser(user);
//					DAOFactory.getFactory().getDecisionDocDAO().save(doc);
					uploadDocInAlfresco(tableName,decision.getDecisionStatus().getId(), file[i], names[i], names[i], exts[i]);

				}
			}
		}
		
		//readContentFromAlfresco(tableName, "1");
		return 	SUCCESS;
	}

	/**
	 * Gets the file.
	 *
	 * @return the file
	 */
	public File[] getFile() {
		return file;
	}

	/**
	 * Sets the file.
	 *
	 * @param file the new file
	 */
	public void setFile(File[] file) {
		this.file = file;
	}
}
