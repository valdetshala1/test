package com.geoland.kfis.web.action.frm.annualplan.privateplan;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.DoubleType;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.model.Activity;
import com.geoland.kfis.model.ActivityDomain;
import com.geoland.kfis.model.ActivityStatus;
import com.geoland.kfis.model.ActivityStatusDoc;
import com.geoland.kfis.model.AnnualPlanning;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.PrivateActivity;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Activitystatus;
import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class PrivateBaseAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Jan 5, 2015 , 4:07:08 PM
 */
public class PrivateBaseAction  extends BaseActionSupport{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The annualplan id. */
	protected Long annualplanId;
	
	/** The annualplan. */
	protected AnnualPlanning annualplan;	
	
	/** The private activity id. */
	protected Long privateActivityId;
	
	/** The private activity. */
	protected PrivateActivity privateActivity;
	
	/** The activity. */
	protected Activity activity; 
	
	/** The activity status. */
	protected ActivityStatus activityStatus;
	
	/** The domain id. */
	protected Long domainId;
	
	/** The pvt replanned. */
	protected Activitystatus pvtReplanned=Activitystatus.REPLANNED;
	
	/** The pvt rejected. */
	protected Activitystatus pvtRejected=Activitystatus.REJECTED;
	
	/** The pvt approved. */
	protected Activitystatus pvtApproved=Activitystatus.APPROVED;
	
	/** The pvt submitted. */
	protected Activitystatus pvtSubmitted=Activitystatus.SUBMITTED;
	
	/** The pvt new. */
	protected Activitystatus pvtNew=Activitystatus.NEW;
	
	/** The mun view. */
	protected boolean munView=false;
	
	/** The hide save. */
	protected boolean hideSave=false;
	
	/** The display subbmit. */
	protected boolean displaySubbmit=false;
	
	/** The kfa view. */
	protected boolean kfaView=false;
	
	/** The employee. */
	protected Employee employee;
	
	/** The activity domain. */
	protected ActivityDomain activityDomain;
	
	/** The doc. */
	protected ActivityStatusDoc doc;
	
	/** The bar code img. */
	protected String barCodeImg;
	
	
	
	/**
	 * Control proces on page.
	 */
	public void controlProcesOnPage(){
		employee = DAOFactory.getFactory().getPartyUserDAO().getEmployee(getUser().getUser().getId());
		if(privateActivity!=null){
			Activitystatus pvtStatus=privateActivity.getActivityStatus().getStatus();
			Activitystatus annStatus = annualplan.getAnnualPlanningStatus().getStatus();
			if(employee.getOrganisation().getOperLevelVal()=='C'){
				if(pvtStatus==Activitystatus.SUBMITTED  && annualplan!=null && annStatus==Activitystatus.SUBMITTED){
					kfaView=true;
				}else {
					hideSave=true;
					kfaView=false;
				}
				
			}else if (employee.getOrganisation().getOperLevelVal()=='R' && !(privateActivity.getId()==null || pvtStatus==Activitystatus.NEW || (pvtStatus==Activitystatus.REPLANNED && annStatus==Activitystatus.REPLANNED))) {
				hideSave=true;
				
			}else if(employee.getOrganisation().getOperLevelVal()=='M' && pvtStatus!=Activitystatus.APPROVED ){
				hideSave=true;
			}
			if(employee.getOrganisation().getOperLevelVal()=='R' && (pvtStatus==Activitystatus.NEW || (pvtStatus==Activitystatus.REPLANNED && annStatus==Activitystatus.REPLANNED))){
				displaySubbmit=true;
			}
			
		}else if(annualplan!=null && annualplan.getAnnualPlanningStatus()!=null && (annualplan.getAnnualPlanningStatus().getStatus()!=pvtNew || annualplan.getAnnualPlanningStatus().getStatus()!=pvtReplanned) && employee.getOrganisation().getOperLevelVal()!='R'){
			hideSave=true;
			
		}else if(annualplan!=null && annualplan.getAnnualPlanningStatus()!=null && annualplan.getAnnualPlanningStatus().getStatus()==pvtApproved  && employee.getOrganisation().getOperLevelVal()=='R'){
			hideSave=true;
		}
	}
	
	/**
	 * Sets the impl value for private plan.
	 *
	 * @param pa the new impl value for private plan
	 */
	public void  setImplValueForPrivatePlan(PrivateActivity pa){
		String query="select a.annual_planning_id, sum(pr.ap_tech_volume) as ap_tech_volume,sum(pr.ap_fire_volume ) as ap_fire_volume from" +
				" (select p.activity_id,p.ap_tech_volume,p.ap_fire_volume from " +
				" tfrm_private_request as p left join tfrm_activity_status as s on p.status_id=s.id where s.status='APR' or s.status='TRN') as pr" +
				" left join tfrm_activity as a " +
				" on pr.activity_id=a.id  " +
				" where a.annual_planning_id="+pa.getActivity().getAnnualPlanning().getId() +
				" group by a.annual_planning_id";
		
		Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
		SQLQuery sqlQuery=session.createSQLQuery(query);
		sqlQuery.addScalar("ap_tech_volume",DoubleType.INSTANCE);
		sqlQuery.addScalar("ap_fire_volume",DoubleType.INSTANCE);
		List list = sqlQuery.list();
		if(list!=null && list.size()>0){
			 Object obj[] =(Object[])list.get(0);
			 Double ap_tech_volume = (Double) obj[0];
			 Double ap_fire_volume = (Double) obj[1];
			 if(ap_tech_volume!=null){
				 pa.setImTechVolume(ap_tech_volume);
			 }
			 if(ap_fire_volume!=null){ 
				 pa.setImFireVolume(ap_fire_volume);
			 }
			
			
		}
		
		
	}
	
	
	/**
	 * Gets the annualplan id.
	 *
	 * @return the annualplan id
	 */
	public Long getAnnualplanId() {
		return annualplanId;
	}
	
	/**
	 * Sets the annualplan id.
	 *
	 * @param annualplanId the new annualplan id
	 */
	public void setAnnualplanId(Long annualplanId) {
		this.annualplanId = annualplanId;
	}
	
	/**
	 * Gets the annualplan.
	 *
	 * @return the annualplan
	 */
	public AnnualPlanning getAnnualplan() {
		return annualplan;
	}
	
	/**
	 * Sets the annualplan.
	 *
	 * @param annualplan the new annualplan
	 */
	public void setAnnualplan(AnnualPlanning annualplan) {
		this.annualplan = annualplan;
	}
	
	/**
	 * Gets the private activity id.
	 *
	 * @return the private activity id
	 */
	public Long getPrivateActivityId() {
		return privateActivityId;
	}
	
	/**
	 * Gets the private activity.
	 *
	 * @return the private activity
	 */
	public PrivateActivity getPrivateActivity() {
		return privateActivity;
	}
	
	/**
	 * Sets the private activity.
	 *
	 * @param privateActivity the new private activity
	 */
	public void setPrivateActivity(PrivateActivity privateActivity) {
		this.privateActivity = privateActivity;
	}
	
	/**
	 * Sets the private activity id.
	 *
	 * @param privateActivityId the new private activity id
	 */
	public void setPrivateActivityId(Long privateActivityId) {
		this.privateActivityId = privateActivityId;
	}
	
	/**
	 * Gets the activity.
	 *
	 * @return the activity
	 */
	public Activity getActivity() {
		return activity;
	}
	
	/**
	 * Sets the activity.
	 *
	 * @param activity the new activity
	 */
	public void setActivity(Activity activity) {
		this.activity = activity;
	}
	
	/**
	 * Gets the activity status.
	 *
	 * @return the activity status
	 */
	public ActivityStatus getActivityStatus() {
		return activityStatus;
	}
	
	/**
	 * Sets the activity status.
	 *
	 * @param activityStatus the new activity status
	 */
	public void setActivityStatus(ActivityStatus activityStatus) {
		this.activityStatus = activityStatus;
	}
	
	/**
	 * Gets the domain id.
	 *
	 * @return the domain id
	 */
	public Long getDomainId() {
		return domainId;
	}
	
	/**
	 * Sets the domain id.
	 *
	 * @param domainId the new domain id
	 */
	public void setDomainId(Long domainId) {
		this.domainId = domainId;
	}
	
	/**
	 * Gets the pvt replanned.
	 *
	 * @return the pvt replanned
	 */
	public Activitystatus getPvtReplanned() {
		return pvtReplanned;
	}
	
	/**
	 * Sets the pvt replanned.
	 *
	 * @param pvtReplanned the new pvt replanned
	 */
	public void setPvtReplanned(Activitystatus pvtReplanned) {
		this.pvtReplanned = pvtReplanned;
	}
	
	/**
	 * Gets the pvt rejected.
	 *
	 * @return the pvt rejected
	 */
	public Activitystatus getPvtRejected() {
		return pvtRejected;
	}
	
	/**
	 * Sets the pvt rejected.
	 *
	 * @param pvtRejected the new pvt rejected
	 */
	public void setPvtRejected(Activitystatus pvtRejected) {
		this.pvtRejected = pvtRejected;
	}
	
	/**
	 * Gets the pvt approved.
	 *
	 * @return the pvt approved
	 */
	public Activitystatus getPvtApproved() {
		return pvtApproved;
	}
	
	/**
	 * Sets the pvt approved.
	 *
	 * @param pvtApproved the new pvt approved
	 */
	public void setPvtApproved(Activitystatus pvtApproved) {
		this.pvtApproved = pvtApproved;
	}
	
	/**
	 * Gets the pvt submitted.
	 *
	 * @return the pvt submitted
	 */
	public Activitystatus getPvtSubmitted() {
		return pvtSubmitted;
	}
	
	/**
	 * Sets the pvt submitted.
	 *
	 * @param pvtSubmitted the new pvt submitted
	 */
	public void setPvtSubmitted(Activitystatus pvtSubmitted) {
		this.pvtSubmitted = pvtSubmitted;
	}
	
	/**
	 * Checks if is mun view.
	 *
	 * @return true, if is mun view
	 */
	public boolean isMunView() {
		return munView;
	}
	
	/**
	 * Sets the mun view.
	 *
	 * @param munView the new mun view
	 */
	public void setMunView(boolean munView) {
		this.munView = munView;
	}

	/**
	 * Checks if is kfa view.
	 *
	 * @return true, if is kfa view
	 */
	public boolean isKfaView() {
		return kfaView;
	}
	
	/**
	 * Sets the kfa view.
	 *
	 * @param kfaView the new kfa view
	 */
	public void setKfaView(boolean kfaView) {
		this.kfaView = kfaView;
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
	 * @param employee the new employee
	 */
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
	/**
	 * Gets the pvt new.
	 *
	 * @return the pvt new
	 */
	public Activitystatus getPvtNew() {
		return pvtNew;
	}
	
	/**
	 * Sets the pvt new.
	 *
	 * @param pvtNew the new pvt new
	 */
	public void setPvtNew(Activitystatus pvtNew) {
		this.pvtNew = pvtNew;
	}
	
	/**
	 * Gets the activity domain.
	 *
	 * @return the activity domain
	 */
	public ActivityDomain getActivityDomain() {
		return activityDomain;
	}
	
	/**
	 * Sets the activity domain.
	 *
	 * @param activityDomain the new activity domain
	 */
	public void setActivityDomain(ActivityDomain activityDomain) {
		this.activityDomain = activityDomain;
	}
	
	/**
	 * Checks if is hide save.
	 *
	 * @return true, if is hide save
	 */
	public boolean isHideSave() {
		return hideSave;
	}
	
	/**
	 * Sets the hide save.
	 *
	 * @param hideSave the new hide save
	 */
	public void setHideSave(boolean hideSave) {
		this.hideSave = hideSave;
	}
	
	/**
	 * Checks if is display subbmit.
	 *
	 * @return true, if is display subbmit
	 */
	public boolean isDisplaySubbmit() {
		return displaySubbmit;
	}
	
	/**
	 * Sets the display subbmit.
	 *
	 * @param displaySubbmit the new display subbmit
	 */
	public void setDisplaySubbmit(boolean displaySubbmit) {
		this.displaySubbmit = displaySubbmit;
	}
	
	/**
	 * Gets the doc.
	 *
	 * @return the doc
	 */
	public ActivityStatusDoc getDoc() {
		return doc;
	}
	
	/**
	 * Sets the doc.
	 *
	 * @param doc the new doc
	 */
	public void setDoc(ActivityStatusDoc doc) {
		this.doc = doc;
	}
	
	/**
	 * Gets the bar code img.
	 *
	 * @return the bar code img
	 */
	public String getBarCodeImg() {
		return barCodeImg;
	}
	
	/**
	 * Sets the bar code img.
	 *
	 * @param barCodeImg the new bar code img
	 */
	public void setBarCodeImg(String barCodeImg) {
		this.barCodeImg = barCodeImg;
	}

}
