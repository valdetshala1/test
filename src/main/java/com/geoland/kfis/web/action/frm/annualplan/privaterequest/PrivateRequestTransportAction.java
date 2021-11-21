package com.geoland.kfis.web.action.frm.annualplan.privaterequest;

import java.io.File;
import java.util.Date;
import java.util.StringTokenizer;

import javax.persistence.Table;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.kfis.model.ActivityStatus;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.PrivateRequestDoc;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Activitystatus;
import com.geoland.kfis.web.action.base.Constants;

// TODO: Auto-generated Javadoc
/**
 * The Class PrivateRequestTransportAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Feb 19, 2015 , 4:26:48 PM
 */
public class PrivateRequestTransportAction extends PrivateRequestBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The status. */
	private ActivityStatus status;
	
	/** The file. */
	private File file[];
	
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		// TODO Auto-generated method stub
		if(privateRequest==null)
			addFieldError("privateRequest.id",getMessage("privateRequest.empty"));
		if(privateRequest!=null && file==null ||(file!=null && file[0]==null)){
			addFieldError("privateRequest.attachment",getMessage("privateRequest.attachment.empty"));
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
		privateRequest=DAOFactory.getFactory().getPrivateRequestDAO().get(privateRequest.getId());
		Employee person = getUser().getEmployee();
			if(privateRequest.getActivityStatus().getStatus().equals(Activitystatus.APPROVED)){
				status.setCreatedDate(new Date());
				status.setActivity(privateRequest.getActivity());
				status.setPerson(person);
				status.setStatus(Activitystatus.TRANSPORT);
				privateRequest.setActivityStatus(status);
				privateRequest.setTransported(true);
				DAOFactory.getFactory().getActivityStatusDAO().save(status);
				DAOFactory.getFactory().getPrivateRequestDAO().save(privateRequest);
				Class<?> c = ActivityStatus.class;
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
							PrivateRequestDoc doc=new PrivateRequestDoc();
							doc.setCreatedDate(new Date());
							doc.setParty(person);
							doc.setPrivateRequest(privateRequest);
							doc.setDocName(names[i]);
							doc.setDocType(exts[i]);
						
							doc.setDoc(getFileBytes(file[i]));
							doc.setDocSize(file[i].getTotalSpace());
							if(status!=null && !StringUtils.isEmpty(status.getRemarks()))
							doc.setNote(status.getRemarks());
							uploadDocInAlfresco(tableName,privateRequest.getActivityStatus().getId(), file[i], names[i], names[i],exts[i]);

//							DAOFactory.getFactory().getPrivateRequestDocDAO().save(doc);
						}
					}
				}
			
			
			}
		return SUCCESS;
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



	/**
	 * Gets the status.
	 *
	 * @return the status
	 */
	public ActivityStatus getStatus() {
		return status;
	}



	/**
	 * Sets the status.
	 *
	 * @param status the new status
	 */
	public void setStatus(ActivityStatus status) {
		this.status = status;
	}
	
	
}
