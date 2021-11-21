package com.geoland.kfis.web.action.frm.annualplan.privateplan;

import java.io.File;
import java.util.Date;

import javax.persistence.Table;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.LongType;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.ActivityStatus;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Activityfield;
import com.geoland.kfis.persistence.hibernate.usertypes.Activitystatus;
import com.geoland.kfis.web.action.base.Constants;

// TODO: Auto-generated Javadoc
/**
 * The Class PrivateSaveAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Jan 5, 2015 , 4:22:50 PM
 */
public class PrivateSaveAction extends PrivateBaseAction{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The decision status. */
	private Activitystatus decisionStatus;
	
	/** The file. */
	private File file;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		employee = getUser().getEmployee();
		
		if(employee==null){
			addActionError("login.user.employee.role.empty");
		}
		if(activity!=null && activity.getActivityDomain()!=null && activity.getActivityDomain().getId()==null)
			addFieldError("activity.frmDomain.id", getMessage("activity.frmDomain.id.empty"));
		else activity.setActivityDomain(DAOFactory.getFactory().getActivityDomainDAO().get(activity.getActivityDomain().getId()));
		
		if(annualplanId != null)
			 annualplan = DAOFactory.getFactory().getAnnualPlanningDAO().get(annualplanId);	
		
		if(privateActivity!=null && privateActivity.getPlTechVolume()==null)
			addFieldError("privateActivity.plTechVolume", getMessage("privateActivity.plTechVolume.empty"));
		
		if(privateActivity!=null && privateActivity.getPlFireVolume()==null)
			addFieldError("privateActivity.plFireVolume", getMessage("privateActivity.plFireVolume.empty"));
		
		if(privateActivity!=null && StringUtils.isEmpty(privateActivity.getActivityUnit()))
			addFieldError("privateActivity.activityUnit", getMessage("privateActivity.activityUnit.empty"));
		
		Date actualDate=new Date();
		
		if(privateActivity!=null && privateActivity.getStartCmpgnDate()==null)
			addFieldError("privateActivity.startCmpgnDate", getMessage("frm.private.plan.start.cmpg.date.empty"));
		else if(privateActivity.getStartCmpgnDate().compareTo(actualDate)==-1 && (privateActivity.getActivityStatus().getStatus()==null ||privateActivity.getActivityStatus().getStatus()==Activitystatus.NEW))
			addFieldError("privateActivity.dateStart.less", getMessage("frm.private.plan.start.cmpg.less"));
		
		if(privateActivity!=null && privateActivity.getEndCmpgnDate()==null)
				addFieldError("privateActivity.endCmpgnDate", getMessage("frm.private.plan.end.cmpg.date.empty"));
		else if(privateActivity.getEndCmpgnDate().compareTo(privateActivity.getStartCmpgnDate())==-1)
				addFieldError("privateActivity.dateEnd.less", getMessage("frm.private.plan.end.cmpg.less"));
			

		if(privateActivity!=null && privateActivity.getActivityStatus().getStatus()==Activitystatus.SUBMITTED && decisionStatus==null){
			addFieldError("privateActivity.decisionStatus",getMessage("privateActivity.decisionStatus.empty"));
		}

		
		privateActivity.setActivity(activity);
		controlProcesOnPage();
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

		if(activity.getId()!=null){
			activity=DAOFactory.getFactory().getActivityDAO().get(activity.getId());
		}else{
			activity.setAnnualPlanning(annualplan);
			activity.setActivityField(Activityfield.PRIVATE);
			activity.setOperationLevel(employee.getOrganisation().getOperLevel());
			activity.setPerson(employee);
			activity.setCreatedDate(new Date());
		}
		
	
		
		activityStatus.setCreatedDate(new Date());
		activityStatus.setActivity(activity);
		activityStatus.setPerson(employee);
		
		if(privateActivity!=null && privateActivity.getId()==null && annualplan!=null && annualplan.getYear()!=null ){
			Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
			SQLQuery sqlForReqNo=session.createSQLQuery("select * from gen_activity_no("+annualplan.getYear()+",'')");
			sqlForReqNo.addScalar("gen_activity_no",LongType.INSTANCE);
			Object actNo=sqlForReqNo.uniqueResult();
			Long activityNo=null;
			if(actNo!=null && !StringUtils.isEmpty(actNo.toString())){
				activityNo=(Long)actNo;
			}
			if(activityNo!=null){
				activity.setActivityNo((activityNo+1)+"/"+annualplan.getYear()+"/");
			}else {
				activity.setActivityNo("1/"+annualplan.getYear()+"/");
			}
			File qrCodeImg=createQRCode(activity.getActivityNo(), 150, 150);
			activity.setQrCode(getFileBytes(qrCodeImg));
		}		
		
		if(privateActivity.getId()!=null && privateActivity.getActivityStatus().getStatus()==Activitystatus.SUBMITTED ){
			activityStatus.setStatus(decisionStatus);
		}else if(privateActivity.getId()==null){
			activityStatus.setStatus(Activitystatus.NEW);	
			
		}else {
			activityStatus.setStatus(privateActivity.getActivityStatus().getStatus());
		}
		
		if(privateActivity.getId()==null){
			privateActivity.setPersonByPlCreatedBy(employee);
			privateActivity.setPlCreatedDate(new Date());
			privateActivity.setWorkStage("P");
		}else if("I".equals(privateActivity.getWorkStage())){
			privateActivity.setPersonByImCreatedBy(employee);
			privateActivity.setImCreatedDate(new Date());
		}
			
		if (activityStatus.getStatus()==Activitystatus.APPROVED) {
			privateActivity.setWorkStage("I");
		}else {
			privateActivity.setWorkStage(privateActivity.getWorkStage());
		}
		if(privateActivity.getPersonByImCreatedBy().getId()==null)
			privateActivity.setPersonByImCreatedBy(null);
		
		
		
		privateActivity.setCadastralMunicipality(activity.getAnnualPlanning().getCadastralMunicipality());
		privateActivity.setActivityStatus(activityStatus);
		
		User user = getUser().getUser();
		activity.setCurrentUser(user);
		activityStatus.setCurrentUser(user);
		
		privateActivity.setActivity(activity);
		privateActivity.setCurrentUser(user);
		
		if(privateActivity.getActivity()!=null && privateActivity.getActivity().getQrCode()!=null )
			barCodeImg=new String(Base64.encodeBase64(privateActivity.getActivity().getQrCode()));
		
 		DAOFactory.getFactory().getActivityDAO().save(activity);
		DAOFactory.getFactory().getActivityStatusDAO().save(activityStatus);
		DAOFactory.getFactory().getPrivateActivityDAO().save(privateActivity);
		controlProcesOnPage();
		if(file!=null){
			Class<?> c = ActivityStatus.class;
			Table table = c.getAnnotation(Table.class);
			String tableName = table.name();
			uploadDocInAlfresco(tableName,privateActivity.getActivityStatus().getId(), file, docNameAlf, docNameAlf,docTypeAlf);
		}
		
		return SUCCESS;
	}

	/**
	 * Gets the decision status.
	 *
	 * @return the decision status
	 */
	public Activitystatus getDecisionStatus() {
		return decisionStatus;
	}

	/**
	 * Sets the decision status.
	 *
	 * @param decisionStatus the new decision status
	 */
	public void setDecisionStatus(Activitystatus decisionStatus) {
		this.decisionStatus = decisionStatus;
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
	 * @param file the new file
	 */
	public void setFile(File file) {
		this.file = file;
	}
	
	


	
}
