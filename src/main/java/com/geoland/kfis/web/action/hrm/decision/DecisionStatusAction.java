package com.geoland.kfis.web.action.hrm.decision;

import java.io.File;
import java.util.Date;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Decision;
import com.geoland.kfis.model.DecisionDoc;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class DecisionStatusAction.
 */
public class DecisionStatusAction extends DecisionBaseAction{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The decision. */
	private Decision decision;
	
	/** The employee. */
	private Employee employee;
	
	/** The file stat. */
	private File fileStat[];
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		
		employee = getUser().getEmployee();
		if(decisionId == null)
			addActionError("");
		else{
			decision = DAOFactory.getFactory().getDecisionDAO().get(decisionId);
		}
		
		if (decisionStatus == null)
			addFieldError("statusDecision", getMessage("order.item.status.code.empty"));

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
		status.setCreateDate(new Date());
		status.setDecision(decision);
		status.setEmployee(employee);
		status.setStatus(decisionStatus);
		
		decision.setDecisionStatus(status);
		DAOFactory.getFactory().getDecisionStatusDAO().save(status);
		DAOFactory.getFactory().getDecisionDAO().save(decision);
		
		if(fileStat!=null && fileStat.length>0){
			StringTokenizer st=new StringTokenizer(docNamesStat,";");
			int length = st.countTokens();
			String names[]=new String[length];
			for(int i=0;i<length;i++){
				String a=st.nextToken();
				if(StringUtils.isNotEmpty(a))
					names[i]=a;
			}
			st=new StringTokenizer(docExtsStat, ";");
			length=st.countTokens();
			String exts[]=new String[length];
			for(int i=0;i<length;i++){
				String a=st.nextToken();
				if(StringUtils.isNotEmpty(a))
					exts[i]=a;
			}
			for(int i=0;i<fileStat.length;i++){
				if(fileStat[i]!=null){
					DecisionDoc doc=new DecisionDoc();
					doc.setCreatedDate(new Date());
					doc.setDecision(decision);
					doc.setDocName(names[i]);
					doc.setDocType(exts[i]);
				    doc.setEmployee(employee);
					doc.setDoc(getFileBytes(fileStat[i]));
					doc.setDocSize(fileStat[i].getTotalSpace());
					doc.setStatusName(status.getStatus());
					
					DAOFactory.getFactory().getDecisionDocDAO().save(doc);
				}
			}
		}
		return SUCCESS;
	}

	/**
	 * Gets the file stat.
	 *
	 * @return the file stat
	 */
	public File[] getFileStat() {
		return fileStat;
	}

	/**
	 * Sets the file stat.
	 *
	 * @param fileStat the new file stat
	 */
	public void setFileStat(File[] fileStat) {
		this.fileStat = fileStat;
	}


	
}
