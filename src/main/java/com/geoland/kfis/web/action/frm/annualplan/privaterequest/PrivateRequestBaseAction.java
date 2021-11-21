package com.geoland.kfis.web.action.frm.annualplan.privaterequest;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.DoubleType;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.model.Activity;
import com.geoland.kfis.model.ActivityDomain;
import com.geoland.kfis.model.AnnualPlanning;
import com.geoland.kfis.model.ParcelDetail;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.model.PrivateActivity;
import com.geoland.kfis.model.PrivateRequest;
import com.geoland.kfis.model.Stand;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.PrivateActivityDAO;
import com.geoland.kfis.persistence.hibernate.usertypes.Activitystatus;
import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class PrivateRequestBaseAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Nov 7, 2014 , 5:33:32 PM
 */

public class PrivateRequestBaseAction extends BaseActionSupport{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The date format. */
	protected static SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd.MM.yyyy");
	
	/** The domain id. */
	protected Long domainId;
	
	/** The stand id. */
	protected Long standId;
	
	/** The stand. */
	protected Stand stand;
	
	/** The annualplan. */
	protected AnnualPlanning annualplan;	
	
	/** The annualplan id. */
	protected Long annualplanId;
	
	/** The frm doman id. */
	protected Long frmDomanId;
	
	/** The activity. */
	protected Activity activity;
	
	/** The private request. */
	protected PrivateRequest privateRequest;
	
	/** The private activity. */
	protected PrivateActivity privateActivity;
	
	/** The requester. */
	protected Person requester;
	
	/** The requester id. */
	protected Long requesterId;
	
	/** The private request id. */
	protected Long privateRequestId;
	
	/** The status new. */
	protected Activitystatus statusNew=Activitystatus.NEW;
	
	/** The approved. */
	protected Activitystatus approved=Activitystatus.APPROVED;
	
	/** The rejected. */
	protected Activitystatus rejected=Activitystatus.REJECTED;
	
	/** The terrain done. */
	protected Activitystatus terrainDone=Activitystatus.TERRAIN_DONE;
	
	/** The submitted. */
	protected Activitystatus submitted=Activitystatus.SUBMITTED;
	
	/** The transport. */
	protected Activitystatus transport=Activitystatus.TRANSPORT;
	
	/** The activity domain. */
	protected ActivityDomain activityDomain;
	
	/** The doc names. */
	protected String docNames;
	
	/** The doc exts. */
	protected String docExts;
	
	/** The user is forest owner. */
	protected boolean userIsForestOwner=false;
	
	/** The pvt activity dont exist. */
	protected boolean pvtActivityDontExist=false;
	
	/** The campaign is open. */
	protected boolean campaignIsOpen=false;
	
	/** The just farmer can edit. */
	protected boolean  justFarmerCanEdit=false;
	
	/** The editable. */
	protected boolean editable=false;
	
	/** The cad parc id. */
	protected String cadParcId;
	
	/** The parcel detail. */
	protected ParcelDetail parcelDetail;
	
	/** The parcel detail id. */
	protected Long parcelDetailId;
	
	/** The reject req popup. */
	protected boolean rejectReqPopup;
	
	/**
	 * Checks if is reject req popup.
	 *
	 * @return true, if is reject req popup
	 */
	public boolean isRejectReqPopup() {
		return rejectReqPopup;
	}
	
	/**
	 * Sets the reject req popup.
	 *
	 * @param rejectReqPopup the new reject req popup
	 */
	public void setRejectReqPopup(boolean rejectReqPopup) {
		this.rejectReqPopup = rejectReqPopup;
	}
	
	/**
	 * Method to .
	 *
	 * @param ap the ap
	 */
	protected void controlNewRequest(AnnualPlanning ap){
		Date actualDate=new Date();
		privateActivity=getPvtActivityForAnnPlan(ap);
		if(privateActivity!=null){
			if(actualDate.compareTo(privateActivity.getStartCmpgnDate())==1 &&
					actualDate.compareTo(privateActivity.getEndCmpgnDate())==-1){
				campaignIsOpen=true;
			}
			
		}else {
			pvtActivityDontExist=true;
		}
		
	}
	
	/**
	 * we are sure that we have just one pvt activity for one annual plan .
	 *
	 * @param ap annual Plan
	 * @return privateActivity
	 */
	protected PrivateActivity getPvtActivityForAnnPlan(AnnualPlanning ap){
		String pvtActivityQuery="select pa.* from tfrm_private_activity  as pa  left join tfrm_activity as a on pa.activity_id= a.id " +
				" left join tfrm_activity_status as actstat on pa.status_id=actstat.id" +
				" left join tfrm_annual_planning as apl on a.annual_planning_id=apl.id where actstat.status='APR' and a.annual_planning_id="+ap.getId();
		
		PrivateActivityDAO dao=DAOFactory.getFactory().getPrivateActivityDAO();
		List<PrivateActivity> list=dao.executeSQLQuery(pvtActivityQuery);
		if(list!=null && list.size()>0){ 
			privateActivity=list.get(0);
		}
		
		return privateActivity;
		
	}
	
	/**
	 * control the volume allowed for priavte request based on pl volume in  private activity for annual plan .
	 *
	 * @param apl the apl
	 * @param pvtReq the pvt req
	 */
	protected void validateAllowedVlBasedInAnnPl(AnnualPlanning apl,PrivateRequest pvtReq){
		String allPvtReqForAnnPlan="select pr.* from tfrm_private_request as pr left join tfrm_activity as a" +
				" on a.id=pr.activity_id where a.annual_planning_id="+apl.getId();
		
		List<PrivateRequest> pvtReqListforAnnuPlan=DAOFactory.getFactory().getPrivateRequestDAO().executeSQLQuery(allPvtReqForAnnPlan);
		double allAlwFireVolume=0.0;//fire volume on going 
		double allAlwTechVolume=0.0;//tech volume  on going 
		if(pvtReqListforAnnuPlan!=null && pvtReqListforAnnuPlan.size()>0 ){
			for(PrivateRequest pr:pvtReqListforAnnuPlan){
				if(pr.getAlwFireVolume()!=null && pr.getAlwTechVolume()!=null){
					allAlwFireVolume+=pr.getAlwFireVolume();
					allAlwTechVolume+=pr.getAlwTechVolume();
				}
			
			}
			
		}
		double totalAlwFireVolume=allAlwFireVolume+pvtReq.getAlwFireVolume();//to validate
		double totalAlwTechVolume=allAlwTechVolume+pvtReq.getAlwTechVolume();
		privateActivity=getPvtActivityForAnnPlan(apl);
		if(privateActivity!=null ){
			if(privateActivity.getPlFireVolume()<totalAlwFireVolume){
				addFieldError("privateRequest.alwFireVolume",getMessage("privateRequest.alwFireVolume.bigger"));
			}
			if(privateActivity.getPlTechVolume()<totalAlwTechVolume){
				addFieldError("privateRequest.alwTechVolume",getMessage("privateRequest.alwTechVolume.bigger"));
			}
			
		}
	
	}
	
	/**
	 * Can edit.
	 *
	 * @param pvtReq the pvt req
	 * @return true, if successful
	 */
	protected boolean canEdit(PrivateRequest pvtReq){
		if(userIsForestOwner()){
			if(pvtReq.getPlCreatedBy().getId()==getUser().getPerson().getId()){
				return true;
			}
		}else if(pvtReq.getRequester().getId()!=pvtReq.getPlCreatedBy().getId()){
			return true;
		}else if(pvtReq.getRequester().getId()==pvtReq.getPlCreatedBy().getId() && userIsForestOwner() ){
			return true;
		}
		
		return false;
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
		if(sqlQuery.list().size()>0){
			 Object obj[] =(Object[])sqlQuery.list().get(0);
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
	 * Gets the stand id.
	 *
	 * @return the stand id
	 */
	public Long getStandId() {
		return standId;
	}
	
	/**
	 * Sets the stand id.
	 *
	 * @param standId the new stand id
	 */
	public void setStandId(Long standId) {
		this.standId = standId;
	}
	
	/**
	 * Gets the stand.
	 *
	 * @return the stand
	 */
	public Stand getStand() {
		return stand;
	}
	
	/**
	 * Sets the stand.
	 *
	 * @param stand the new stand
	 */
	public void setStand(Stand stand) {
		this.stand = stand;
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
	 * Gets the frm doman id.
	 *
	 * @return the frm doman id
	 */
	public Long getFrmDomanId() {
		return frmDomanId;
	}
	
	/**
	 * Sets the frm doman id.
	 *
	 * @param frmDomanId the new frm doman id
	 */
	public void setFrmDomanId(Long frmDomanId) {
		this.frmDomanId = frmDomanId;
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
	 * Gets the private request.
	 *
	 * @return the private request
	 */
	public PrivateRequest getPrivateRequest() {
		return privateRequest;
	}
	
	/**
	 * Sets the private request.
	 *
	 * @param privateRequest the new private request
	 */
	public void setPrivateRequest(PrivateRequest privateRequest) {
		this.privateRequest = privateRequest;
	}
	
	/**
	 * Gets the private request id.
	 *
	 * @return the private request id
	 */
	public Long getPrivateRequestId() {
		return privateRequestId;
	}
	
	/**
	 * Sets the private request id.
	 *
	 * @param privateRequestId the new private request id
	 */
	public void setPrivateRequestId(Long privateRequestId) {
		this.privateRequestId = privateRequestId;
	}
	
	/**
	 * Gets the approved.
	 *
	 * @return the approved
	 */
	public Activitystatus getApproved() {
		return approved;
	}
	
	/**
	 * Sets the approved.
	 *
	 * @param approved the new approved
	 */
	public void setApproved(Activitystatus approved) {
		this.approved = approved;
	}
	
	/**
	 * Gets the rejected.
	 *
	 * @return the rejected
	 */
	public Activitystatus getRejected() {
		return rejected;
	}
	
	/**
	 * Sets the rejected.
	 *
	 * @param rejected the new rejected
	 */
	public void setRejected(Activitystatus rejected) {
		this.rejected = rejected;
	}
	
	/**
	 * Gets the terrain done.
	 *
	 * @return the terrain done
	 */
	public Activitystatus getTerrainDone() {
		return terrainDone;
	}
	
	/**
	 * Sets the terrain done.
	 *
	 * @param terrainDone the new terrain done
	 */
	public void setTerrainDone(Activitystatus terrainDone) {
		this.terrainDone = terrainDone;
	}
	
	/**
	 * Gets the status new.
	 *
	 * @return the status new
	 */
	public Activitystatus getStatusNew() {
		return statusNew;
	}
	
	/**
	 * Sets the status new.
	 *
	 * @param statusNew the new status new
	 */
	public void setStatusNew(Activitystatus statusNew) {
		this.statusNew = statusNew;
	}
	
	/**
	 * Gets the submitted.
	 *
	 * @return the submitted
	 */
	public Activitystatus getSubmitted() {
		return submitted;
	}
	
	/**
	 * Sets the submitted.
	 *
	 * @param submitted the new submitted
	 */
	public void setSubmitted(Activitystatus submitted) {
		this.submitted = submitted;
	}
	
	/**
	 * Gets the transport.
	 *
	 * @return the transport
	 */
	public Activitystatus getTransport() {
		return transport;
	}
	
	/**
	 * Sets the transport.
	 *
	 * @param transport the new transport
	 */
	public void setTransport(Activitystatus transport) {
		this.transport = transport;
	}
	
	/**
	 * Gets the requester.
	 *
	 * @return the requester
	 */
	public Person getRequester() {
		return requester;
	}
	
	/**
	 * Sets the requester.
	 *
	 * @param requester the new requester
	 */
	public void setRequester(Person requester) {
		this.requester = requester;
	}
	
	/**
	 * Gets the requester id.
	 *
	 * @return the requester id
	 */
	public Long getRequesterId() {
		return requesterId;
	}
	
	/**
	 * Sets the requester id.
	 *
	 * @param requesterId the new requester id
	 */
	public void setRequesterId(Long requesterId) {
		this.requesterId = requesterId;
	}
	
	/**
	 * Gets the doc names.
	 *
	 * @return the docNames
	 */
	public String getDocNames() {
		return docNames;
	}
	
	/**
	 * Sets the doc names.
	 *
	 * @param docNames the docNames to set
	 */
	public void setDocNames(String docNames) {
		this.docNames = docNames;
	}
	
	/**
	 * Gets the doc exts.
	 *
	 * @return the docExts
	 */
	public String getDocExts() {
		return docExts;
	}
	
	/**
	 * Sets the doc exts.
	 *
	 * @param docExts the docExts to set
	 */
	public void setDocExts(String docExts) {
		this.docExts = docExts;
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
	 * Checks if is user is forest owner.
	 *
	 * @return true, if is user is forest owner
	 */
	public boolean isUserIsForestOwner() {
		return userIsForestOwner;
	}
	
	/**
	 * Sets the user is forest owner.
	 *
	 * @param userIsForestOwner the new user is forest owner
	 */
	public void setUserIsForestOwner(boolean userIsForestOwner) {
		this.userIsForestOwner = userIsForestOwner;
	}

	/**
	 * Checks if is editable.
	 *
	 * @return true, if is editable
	 */
	public boolean isEditable() {
		return editable;
	}

	/**
	 * Sets the editable.
	 *
	 * @param editable the new editable
	 */
	public void setEditable(boolean editable) {
		this.editable = editable;
	}

	/**
	 * Checks if is pvt activity dont exist.
	 *
	 * @return true, if is pvt activity dont exist
	 */
	public boolean isPvtActivityDontExist() {
		return pvtActivityDontExist;
	}

	/**
	 * Sets the pvt activity dont exist.
	 *
	 * @param pvtActivityDontExist the new pvt activity dont exist
	 */
	public void setPvtActivityDontExist(boolean pvtActivityDontExist) {
		this.pvtActivityDontExist = pvtActivityDontExist;
	}

	/**
	 * Checks if is campaign is open.
	 *
	 * @return true, if is campaign is open
	 */
	public boolean isCampaignIsOpen() {
		return campaignIsOpen;
	}

	/**
	 * Sets the campaign is open.
	 *
	 * @param campaignIsOpen the new campaign is open
	 */
	public void setCampaignIsOpen(boolean campaignIsOpen) {
		this.campaignIsOpen = campaignIsOpen;
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
	 * Gets the parcel detail.
	 *
	 * @return the parcel detail
	 */
	public ParcelDetail getParcelDetail() {
		return parcelDetail;
	}
	
	/**
	 * Sets the parcel detail.
	 *
	 * @param parcelDetail the new parcel detail
	 */
	public void setParcelDetail(ParcelDetail parcelDetail) {
		this.parcelDetail = parcelDetail;
	}
	
	/**
	 * Gets the cad parc id.
	 *
	 * @return the cad parc id
	 */
	public String getCadParcId() {
		return cadParcId;
	}
	
	/**
	 * Sets the cad parc id.
	 *
	 * @param cadParcId the new cad parc id
	 */
	public void setCadParcId(String cadParcId) {
		this.cadParcId = cadParcId;
	}
	
	/**
	 * Gets the parcel detail id.
	 *
	 * @return the parcel detail id
	 */
	public Long getParcelDetailId() {
		return parcelDetailId;
	}
	
	/**
	 * Sets the parcel detail id.
	 *
	 * @param parcelDetailId the new parcel detail id
	 */
	public void setParcelDetailId(Long parcelDetailId) {
		this.parcelDetailId = parcelDetailId;
	}
	
	
	
}
