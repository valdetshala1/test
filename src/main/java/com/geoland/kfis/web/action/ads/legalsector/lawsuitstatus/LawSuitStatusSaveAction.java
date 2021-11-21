package com.geoland.kfis.web.action.ads.legalsector.lawsuitstatus;

import java.io.FileInputStream;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.LawSuit;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class LawSuitStatusSaveAction.
 *
 * @author ADELINA GASHI, GEO&LAND
 * @created Jun 4, 2014 4:42:02 PM
 * @Version 1.0
 */
public class LawSuitStatusSaveAction extends LawSuitStatusBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -5174528780840966163L;
	
	/** The employee. */
	private Employee employee;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		employee=getUser().getEmployee();
		if(employee==null)
			addFieldError("", "");
		
		if(lawSuitStatus!=null && lawSuitStatus.getStatus()==null){
			addFieldError("lawSuitStatus.status",getMessage("law.suit.status.empty"));
		}
		
		if(file==null)
			addFieldError("file", getMessage("employee.file.content.empty"));
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
		LawSuit ls=DAOFactory.getFactory().getLawSuitDAO().get(lawSuitStatus.getLawSuit().getId());
		if(lawSuitStatus.getId()==null){
			lawSuitStatus.setEmployee(employee);
			lawSuitStatus.setCreateDate(new Date());
			deactiveOldStatus(lawSuitStatus.getLawSuit().getId());
			lawSuitStatus.setActive(true);
		}
		if(file!=null){
			byte[] bFile = new byte[(int) file.length()];
			try {
				FileInputStream fileInputStream = new FileInputStream(file);
				// convert file into array of bytes
				fileInputStream.read(bFile);
				lawSuitStatus.setDoc(bFile);
				lawSuitStatus.setDocSize(file.getTotalSpace());
				fileInputStream.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		lawSuitStatus.setCurrentUser(getUser().getUser());
		DAOFactory.getFactory().getLawsuitStatusDAO().save(lawSuitStatus);
		ls.setLawSuitStatus(lawSuitStatus);
		return SUCCESS;
	}
	
}
