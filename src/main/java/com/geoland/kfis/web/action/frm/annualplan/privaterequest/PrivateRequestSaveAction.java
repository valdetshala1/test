package com.geoland.kfis.web.action.frm.annualplan.privaterequest;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.StringTokenizer;

import javax.persistence.Table;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.LongType;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.ActivityStatus;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.model.PrivateRequestDoc;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Activityfield;
import com.geoland.kfis.persistence.hibernate.usertypes.Activitystatus;
import com.geoland.kfis.web.action.base.Constants;
import com.google.zxing.WriterException;
import com.ibm.icu.util.Calendar;

// TODO: Auto-generated Javadoc
/**
 * The Class PrivateRequestSaveAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Nov 7, 2014 , 5:34:23 PM
 */
public class PrivateRequestSaveAction extends PrivateRequestBaseAction {
	
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

		if(privateRequest!=null && privateRequest.getRequester().getId()==null)
			addFieldError("privateRequest.requester",getMessage("privateRequest.requester.empty"));
		       
//		if(privateRequest!=null && StringUtils.isEmpty(privateRequest.getParcelNo()))
//			addFieldError("privateRequest.parcelNo",getMessage("privateRequest.parcelNo.empty"));
		
		if(privateRequest!=null && privateRequest.getCadastralZone().getId()==null)
			addFieldError("privateRequest.cadastralZone",getMessage("privateRequest.cadastralZone.empty"));
		
//		if(privateRequest!=null && privateRequest.getParcelArea()==null)
//			addFieldError("privateRequest.parcelArea",getMessage("privateRequest.parcelArea.empty"));
//		
		if(privateRequest!=null && privateRequest.getPlTechVolume()==null)
			addFieldError("privateRequest.plTechVolume",getMessage("privateActivity.plTechVolume.empty"));
		
		if(privateRequest!=null && privateRequest.getPlFireVolume()==null)
			addFieldError("privateRequest.plFireVolume",getMessage("privateActivity.plFireVolume.empty"));

		if (activity != null && activity.getActivityDomain().getId()==null)
			addFieldError("activity.frmDomain.id",getMessage("activity.frmDomain.id.empty"));
		else {
			activity.setActivityDomain(DAOFactory.getFactory().getActivityDomainDAO().get(activity.getActivityDomain().getId()));
		}
		
		if (annualplanId != null){
			annualplan = DAOFactory.getFactory().getAnnualPlanningDAO().get(annualplanId);
			privateActivity=getPvtActivityForAnnPlan(annualplan);
			if(privateRequest!=null && privateRequest.getRequestDate()==null){
				addFieldError("privateRequest.requestDate",getMessage("privateRequest.requestDate.empty"));
			}else if(privateRequest.getRequestDate().compareTo(privateActivity.getStartCmpgnDate())==-1
					||  privateRequest.getRequestDate().compareTo(privateActivity.getEndCmpgnDate())==1) {
				addFieldError("privateRequest.requestDate",getMessage("privateRequest.requestDate.is.not.in.cmpgn"));
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
		Person person = getUser().getPerson();
		employee = getUser().getEmployee();
		
		//FIXME
		//if user is farmer/forest owner, how to deal with organisation/operation level
		//assign municipality to user or person, or add a person to municipality
		//or user should select municipality --> management unit??
		activity.setAnnualPlanning(annualplan);
		activity.setPerson(person);
		activity.setCreatedDate(new Date());
		activity.setActivityField(Activityfield.PRIVATEREQUEST);
		activity.setOperationLevel(new Short("4"));
		

		ActivityStatus status = new ActivityStatus();
		status.setCreatedDate(new Date());
		status.setActivity(activity);
		status.setPerson(person);
		status.setStatus(Activitystatus.NEW);
		
		privateRequest.setActivity(activity);
		privateRequest.setCadastralMunicipality(annualplan.getCadastralMunicipality());
		privateRequest.setWorkStage("P");
		privateRequest.setActivityStatus(status);
		privateRequest.setPlCreatedBy(person);
		privateRequest.setPlCreatedDate(new Date());
		
		User user = getUser().getUser();
		activity.setCurrentUser(user);
		status.setCurrentUser(user);
		privateRequest.setCurrentUser(user);
		
		if(annualplan.getCadastralMunicipality().getId()!=null && privateRequest.getId()==null && activity!=null){
			Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
			SQLQuery sqlForReqNo=session.createSQLQuery("select * from gen_private_request_no("+Calendar.getInstance().get(Calendar.YEAR)+","+annualplan.getCadastralMunicipality().getId()+")");
			sqlForReqNo.addScalar("gen_private_request_no",LongType.INSTANCE);
			Object reqNo=sqlForReqNo.uniqueResult();
			Long pvtReqNo=null;
			if(reqNo!=null && !StringUtils.isEmpty(reqNo.toString())){
				pvtReqNo=(Long)reqNo;
			}
			if(pvtReqNo!=null){
				privateRequest.setRequestNo((pvtReqNo+1)+"/"+annualplan.getYear()+"/"+annualplan.getCadastralMunicipality().getId());
			}else {
				privateRequest.setRequestNo("1/"+annualplan.getYear()+"/"+annualplan.getCadastralMunicipality().getId());
			}
			File qrCodeImg = null;
			try {
				qrCodeImg = createQRCode(privateRequest.getRequestNo(), 150, 150);
			} catch (WriterException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			activity.setQrCode(getFileBytes(qrCodeImg));
		}
		activity.setActivityNo(privateRequest.getRequestNo());
		
		
		DAOFactory.getFactory().getActivityDAO().save(activity);
		DAOFactory.getFactory().getActivityStatusDAO().save(status);
		DAOFactory.getFactory().getPrivateRequestDAO().save(privateRequest);
		editable=canEdit(privateRequest);
		if(file!=null && file.length>0){
			StringTokenizer st=new StringTokenizer(docNames,";");
			int length = st.countTokens();
			String names[]=new String[length];
			Class<?> c = ActivityStatus.class;
			Table table = c.getAnnotation(Table.class);
			String tableName = table.name();
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
					uploadDocInAlfresco(tableName,privateRequest.getActivityStatus().getId(), file[i], names[i], names[i],exts[i]);
				}
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
	 * @param file the file to set
	 */
	public void setFile(File file[]) {
		this.file = file;
	}



}
