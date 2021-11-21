package com.geoland.kfis.web.action.frm.annualplan.siviculture;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.model.Activity;
import com.geoland.kfis.model.ActivityStatus;
import com.geoland.kfis.model.ActivityStatusDoc;
import com.geoland.kfis.model.AnnualPlanning;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.EstimateVolume;
import com.geoland.kfis.model.Stand;
import com.geoland.kfis.model.StandSilvicultureActivity;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Activitystatus;
import com.geoland.kfis.persistence.hibernate.usertypes.Estimatetrees;
import com.geoland.kfis.persistence.hibernate.usertypes.Mngmclass;
import com.geoland.kfis.persistence.hibernate.usertypes.Treespeciesgroup;
import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class SilvicultureBaseAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Oct 20, 2014 , 11:27:22 AM
 */

public class SilvicultureBaseAction extends BaseActionSupport{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The silviculture. */
	protected StandSilvicultureActivity  silviculture;
	
	/** The silviculture id. */
	protected Long silvicultureId;
	
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
	
	/** The employee. */
	protected Employee employee;
	
	/** The treespeciesgroup list. */
	protected Treespeciesgroup[] treespeciesgroupList=Treespeciesgroup.values();
	
	/** The slv replanned. */
	protected Activitystatus slvReplanned=Activitystatus.REPLANNED;
	
	/** The slv rejected. */
	protected Activitystatus slvRejected=Activitystatus.REJECTED;
	
	/** The slv approved. */
	protected Activitystatus slvApproved=Activitystatus.APPROVED;
	
	/** The slv submitted. */
	protected Activitystatus slvSubmitted=Activitystatus.SUBMITTED;
	
	/** The activity status. */
	protected ActivityStatus activityStatus;
	
	/** The mun view. */
	protected boolean munView=false;
	
	/** The hide toolbar. */
	protected boolean hideToolbar=false;
	
	/** The kfa view. */
	protected boolean kfaView=false;
	
	/** The doc. */
	protected ActivityStatusDoc doc;
	
	/** The mngmclass list. */
	protected Mngmclass mngmclassList[]=Mngmclass.values();
	
	/** The est volume list. */
	protected List<EstimateVolume> estVolumeList=DAOFactory.getFactory().getEstimateVolumeDAO().executeSQLQuery("select * from tfrm_estimate_volume order by code asc");
	
	/** The est trees list. */
	protected Estimatetrees[] estTreesList=Estimatetrees.values();
	
	/** The standgrowth. */
	protected boolean standgrowth;
	
	/** The bar code img. */
	protected String barCodeImg;
	
	/**
	 * Control proces on page.
	 */
	protected void controlProcesOnPage(){
		employee = DAOFactory.getFactory().getPartyUserDAO().getEmployee(getUser().getUser().getId());
		if(silviculture!=null){
			Activitystatus slvStatus=silviculture.getActivityStatus().getStatus();
			Activitystatus annStatus = annualplan.getAnnualPlanningStatus().getStatus();
			if(employee.getOrganisation().getOperLevelVal()=='C'){
				if(slvStatus==Activitystatus.SUBMITTED  && annualplan!=null && annStatus==Activitystatus.SUBMITTED){
					kfaView=true;
				}else {
					hideToolbar=true;
					kfaView=false;
				}
				
			}else if (employee.getOrganisation().getOperLevelVal()=='R' && !(silviculture.getId()==null || slvStatus==Activitystatus.APPROVED || slvStatus==Activitystatus.NEW || (slvStatus==Activitystatus.REPLANNED && annualplan!=null && annStatus==Activitystatus.REPLANNED))) {
				hideToolbar=true;
				
			}else if(employee.getOrganisation().getOperLevelVal()=='M'){
				hideToolbar=true;
			}
			
		}
	}
	
	/**
	 * Validate planned activity area.
	 *
	 * @param s the s
	 * @param sg the sg
	 * @param act the act
	 */
	protected void validatePlannedActivityArea(Stand s,Treespeciesgroup sg, StandSilvicultureActivity act){
		Session ses=HibSessionFactory.getSessionFactory().getCurrentSession();
		String sumQuery = "select coalesce(sum(pl_area), 0) as area" +
				" from tfrm_stand_silviculture_activity h " +
				" left join tfrm_activity a on h.activity_id=a.id" +
				" where work_stage='P' and h.stand_id="+s.getId()+" and a.activity_domain_id="+act.getActivity().getActivityDomain().getId();
		if(hasMeasuredVolume(s)){
			sumQuery+=" and h.tree_species_group='"+sg+"'";
		}
		
		
		if(act.getId()!=null)
			sumQuery+=" and h.id!="+act.getId();
		
		SQLQuery sql=ses.createSQLQuery(sumQuery);
		sql.addScalar("area");
		Object ob = sql.uniqueResult();
		double area=((Double)ob).doubleValue();
		double standArea = s.getBasalArea()-area;
		if(hasMeasuredVolume(s)){
			if(sg.equals(Treespeciesgroup.CONIFERS)){
				if(s.getConiferPerc()!=null && s.getConiferPerc()>0){
					double confiersArea=standArea*s.getConiferPerc()/100;
					if(silviculture.getPlArea()>confiersArea){
						addFieldError("silviculture.plArea",getMessage("silviculture.pl.area.conf.is.biggier"));
					}
				}else {
					addFieldError("silviculture.treeSpeciesGroup",getMessage("silviculture.tree.species.group.conf.empty"));	
				}
				
			}else {
				if(s.getDecidousePerc()!=null && s.getDecidousePerc()>0){
					double broadleaveArea=standArea*s.getDecidousePerc()/100;
					if(silviculture.getPlArea()>broadleaveArea){
						addFieldError("silviculture.plArea",getMessage("silviculture.pl.area.broadleave.is.biggier"));
					}
					
				}else {
					addFieldError("silviculture.treeSpeciesGroup",getMessage("silviculture.tree.species.group.broadleave.empty"));	
				}
				
			}
		}else {
			if(standArea<act.getPlArea()){
				addFieldError("silviculture.plArea",getMessage("silviculture.pl.area.is.biggier"));
			}
		}

		
		
	}
	
	
	/**
	 * Gets the silviculture.
	 *
	 * @return the silviculture
	 */
	public StandSilvicultureActivity getSilviculture() {
		return silviculture;
	}
	
	/**
	 * Sets the silviculture.
	 *
	 * @param silviculture the new silviculture
	 */
	public void setSilviculture(StandSilvicultureActivity silviculture) {
		this.silviculture = silviculture;
	}
	
	/**
	 * Gets the silviculture id.
	 *
	 * @return the silviculture id
	 */
	public Long getSilvicultureId() {
		return silvicultureId;
	}
	
	/**
	 * Sets the silviculture id.
	 *
	 * @param silvicultureId the new silviculture id
	 */
	public void setSilvicultureId(Long silvicultureId) {
		this.silvicultureId = silvicultureId;
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
	 * Gets the treespeciesgroup list.
	 *
	 * @return the treespeciesgroup list
	 */
	public Treespeciesgroup[] getTreespeciesgroupList() {
		return treespeciesgroupList;
	}
	
	/**
	 * Sets the treespeciesgroup list.
	 *
	 * @param treespeciesgroupList the new treespeciesgroup list
	 */
	public void setTreespeciesgroupList(Treespeciesgroup[] treespeciesgroupList) {
		this.treespeciesgroupList = treespeciesgroupList;
	}
	
	/**
	 * Gets the slv replanned.
	 *
	 * @return the slv replanned
	 */
	public Activitystatus getSlvReplanned() {
		return slvReplanned;
	}
	
	/**
	 * Sets the slv replanned.
	 *
	 * @param slvReplanned the new slv replanned
	 */
	public void setSlvReplanned(Activitystatus slvReplanned) {
		this.slvReplanned = slvReplanned;
	}
	
	/**
	 * Gets the slv rejected.
	 *
	 * @return the slv rejected
	 */
	public Activitystatus getSlvRejected() {
		return slvRejected;
	}
	
	/**
	 * Sets the slv rejected.
	 *
	 * @param slvRejected the new slv rejected
	 */
	public void setSlvRejected(Activitystatus slvRejected) {
		this.slvRejected = slvRejected;
	}
	
	/**
	 * Gets the slv approved.
	 *
	 * @return the slv approved
	 */
	public Activitystatus getSlvApproved() {
		return slvApproved;
	}
	
	/**
	 * Sets the slv approved.
	 *
	 * @param slvApproved the new slv approved
	 */
	public void setSlvApproved(Activitystatus slvApproved) {
		this.slvApproved = slvApproved;
	}
	
	/**
	 * Gets the slv submitted.
	 *
	 * @return the slv submitted
	 */
	public Activitystatus getSlvSubmitted() {
		return slvSubmitted;
	}
	
	/**
	 * Sets the slv submitted.
	 *
	 * @param slvSubmitted the new slv submitted
	 */
	public void setSlvSubmitted(Activitystatus slvSubmitted) {
		this.slvSubmitted = slvSubmitted;
	}




	/**
	 * Gets the mun view.
	 *
	 * @return the mun view
	 */
	public boolean getMunView() {
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
	 * Gets the kfa view.
	 *
	 * @return the kfa view
	 */
	public boolean getKfaView() {
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
	 * Checks if is hide toolbar.
	 *
	 * @return true, if is hide toolbar
	 */
	public boolean isHideToolbar() {
		return hideToolbar;
	}




	/**
	 * Sets the hide toolbar.
	 *
	 * @param hideToolbar the new hide toolbar
	 */
	public void setHideToolbar(boolean hideToolbar) {
		this.hideToolbar = hideToolbar;
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
	 * @param doc the doc to set
	 */
	public void setDoc(ActivityStatusDoc doc) {
		this.doc = doc;
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
	 * Gets the mngmclass list.
	 *
	 * @return the mngmclassList
	 */
	public Mngmclass[] getMngmclassList() {
		return mngmclassList;
	}

	/**
	 * Sets the mngmclass list.
	 *
	 * @param mngmclassList the mngmclassList to set
	 */
	public void setMngmclassList(Mngmclass[] mngmclassList) {
		this.mngmclassList = mngmclassList;
	}

	/**
	 * Gets the est volume list.
	 *
	 * @return the estVolumeList
	 */
	public List<EstimateVolume> getEstVolumeList() {
		return estVolumeList;
	}

	/**
	 * Sets the est volume list.
	 *
	 * @param estVolumeList the estVolumeList to set
	 */
	public void setEstVolumeList(List<EstimateVolume> estVolumeList) {
		this.estVolumeList = estVolumeList;
	}

	/**
	 * Gets the est trees list.
	 *
	 * @return the estTreesList
	 */
	public Estimatetrees[] getEstTreesList() {
		return estTreesList;
	}

	/**
	 * Sets the est trees list.
	 *
	 * @param estTreesList the estTreesList to set
	 */
	public void setEstTreesList(Estimatetrees[] estTreesList) {
		this.estTreesList = estTreesList;
	}

	/**
	 * Checks if is standgrowth.
	 *
	 * @return the standgrowth
	 */
	public boolean isStandgrowth() {
		return standgrowth;
	}

	/**
	 * Sets the standgrowth.
	 *
	 * @param standgrowth the standgrowth to set
	 */
	public void setStandgrowth(boolean standgrowth) {
		this.standgrowth = standgrowth;
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
