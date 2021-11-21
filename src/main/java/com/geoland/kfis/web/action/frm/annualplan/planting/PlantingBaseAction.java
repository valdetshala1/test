/**
 * 
 */
package com.geoland.kfis.web.action.frm.annualplan.planting;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.model.Activity;
import com.geoland.kfis.model.ActivityStatus;
import com.geoland.kfis.model.ActivityStatusDoc;
import com.geoland.kfis.model.AnnualPlanning;
import com.geoland.kfis.model.EstimateVolume;
import com.geoland.kfis.model.SeedlingInventory;
import com.geoland.kfis.model.SeedlingInventoryPOS;
import com.geoland.kfis.model.Stand;
import com.geoland.kfis.model.StandPlantingActivity;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Activitystatus;
import com.geoland.kfis.persistence.hibernate.usertypes.Estimatetrees;
import com.geoland.kfis.persistence.hibernate.usertypes.Mngmclass;
import com.geoland.kfis.persistence.hibernate.usertypes.Prodtype;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class PlantingBaseAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 11:30:06 AM, Oct 20, 2014
 */
public class PlantingBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 2156806504944230652L;
	
	/** The stand id. */
	protected Long standId;
	
	/** The annualplan id. */
	protected Long annualplanId;
	
	/** The stand. */
	protected Stand stand;
	
	/** The annualplan. */
	protected AnnualPlanning annualplan;
	
	/** The planting id. */
	protected Long plantingId;
	
	/** The planting. */
	protected StandPlantingActivity planting;
	
	/** The activity id. */
	protected Long activityId;
	
	/** The activity. */
	protected Activity activity;
	
	/** The activity list. */
	protected String activityList;
	
	/** The new status. */
	protected Activitystatus newStatus=Activitystatus.NEW;
	
	/** The rejected. */
	protected Activitystatus rejected=Activitystatus.REJECTED;
	
	/** The replan. */
	protected Activitystatus replan=Activitystatus.REPLANNED;
	
	/** The approved. */
	protected Activitystatus approved=Activitystatus.APPROVED;
	
	/** The activity status. */
	protected ActivityStatus activityStatus;
	
	/** The decision status. */
	protected boolean decisionStatus;
	
	/** The edit. */
	protected boolean edit;
	
	/** The doc. */
	protected ActivityStatusDoc doc;
	
	/** The from inventory. */
	protected boolean fromInventory;
	
	/** The inventory pos. */
	protected SeedlingInventoryPOS inventoryPos;
	
	/** The prod type list. */
	protected Prodtype prodTypeList[]=Prodtype.values();
	
	/** The mngmclass list. */
	protected Mngmclass mngmclassList[]=Mngmclass.values();
	
	/** The est volume list. */
	protected List<EstimateVolume> estVolumeList=DAOFactory.getFactory().getEstimateVolumeDAO().executeSQLQuery("select * from tfrm_estimate_volume order by code asc");
	
	/** The est trees list. */
	protected Estimatetrees[] estTreesList=Estimatetrees.values();
	
	/** The from forest institute. */
	protected String fromForestInstitute;
	
	/** The standgrowth. */
	protected boolean standgrowth;
	
	/** The plant planed geom. */
	protected String plantPlanedGeom;
	
	/** The implement planed geom. */
	protected String implementPlanedGeom;
	
	/** The stand geom. */
	protected String standGeom;
	
	/** The bar code img. */
	protected String barCodeImg;
	
	/**
	 * Validate by inventory.
	 *
	 * @param planting the planting
	 */
	protected void validateByInventory(StandPlantingActivity planting){
		String inventorySQL="select i.* from tfrm_seedling_inventory i where i.tree_species_id="+planting.getTreeSpecies().getId();
		if(StringUtils.isNotEmpty(planting.getSeedlingAge()))
			inventorySQL+=" and i.age="+planting.getSeedlingAge();
		if(planting.getProdType()!=null)
			inventorySQL+=" and prod_type='"+planting.getProdType().getDOMKEY()+"'";
		if("Y".equals(fromForestInstitute))
			inventorySQL+=" and seed_activity_id is not null";
		else inventorySQL+=" and seed_activity_id is null";
		
		 List<SeedlingInventory> inventoryStock = DAOFactory.getFactory().getSeedlingInventoryDAO().executeSQLQuery(inventorySQL);
		 if(inventoryStock!=null && inventoryStock.size()>0){
			 String plantingSQL = "select sum(p.quantity) as quantity from tfrm_seedling_inventory_pos p where p.inventory_id="+inventoryStock.get(0).getId();
			 if(planting.getSeedlingInventoryPOS()!=null && planting.getSeedlingInventoryPOS().getId()!=null)
				 plantingSQL+=" and p.id!="+planting.getSeedlingInventoryPOS().getId();
			 Session s=HibSessionFactory.getSessionFactory().getCurrentSession();
			 SQLQuery query=s.createSQLQuery(plantingSQL);
			 query.addScalar("quantity");
			 Object quantity = query.uniqueResult();
			 if(quantity!=null){
				Double plantingPlanned = new Double(quantity.toString());
				if(planting.getPlTrees()>(inventoryStock.get(0).getStock().doubleValue()-plantingPlanned.doubleValue())){
					addFieldError("planting.plTrees", getMessage("planting.plTrees.not.enough.trees.in.stock"));
				}
			 }else if(planting.getPlTrees()>inventoryStock.get(0).getStock().doubleValue()){
				 addFieldError("planting.plTrees", getMessage("planting.plTrees.not.enough.trees.in.stock"));
			 }
			 inventoryPos.setSeedlingInventory(inventoryStock.get(0));
		 }else{
			 addFieldError("planting.plTrees", getMessage("planting.plTrees.no.trees.in.stock"));
		 }
	}
	
	/**
	 * Gets the stand id.
	 *
	 * @return the standId
	 */
	public Long getStandId() {
		return standId;
	}
	
	/**
	 * Sets the stand id.
	 *
	 * @param standId the standId to set
	 */
	public void setStandId(Long standId) {
		this.standId = standId;
	}
	
	/**
	 * Gets the annualplan id.
	 *
	 * @return the annualplanId
	 */
	public Long getAnnualplanId() {
		return annualplanId;
	}
	
	/**
	 * Sets the annualplan id.
	 *
	 * @param annualplanId the annualplanId to set
	 */
	public void setAnnualplanId(Long annualplanId) {
		this.annualplanId = annualplanId;
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
	 * @param stand the stand to set
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
	 * @param annualplan the annualplan to set
	 */
	public void setAnnualplan(AnnualPlanning annualplan) {
		this.annualplan = annualplan;
	}
	
	/**
	 * Gets the planting id.
	 *
	 * @return the plantingId
	 */
	public Long getPlantingId() {
		return plantingId;
	}
	
	/**
	 * Sets the planting id.
	 *
	 * @param plantingId the plantingId to set
	 */
	public void setPlantingId(Long plantingId) {
		this.plantingId = plantingId;
	}
	
	/**
	 * Gets the planting.
	 *
	 * @return the planting
	 */
	public StandPlantingActivity getPlanting() {
		return planting;
	}
	
	/**
	 * Sets the planting.
	 *
	 * @param planting the planting to set
	 */
	public void setPlanting(StandPlantingActivity planting) {
		this.planting = planting;
	}
	
	/**
	 * Gets the serialversionuid.
	 *
	 * @return the serialversionuid
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	/**
	 * Gets the activity id.
	 *
	 * @return the activityId
	 */
	public Long getActivityId() {
		return activityId;
	}
	
	/**
	 * Sets the activity id.
	 *
	 * @param activityId the activityId to set
	 */
	public void setActivityId(Long activityId) {
		this.activityId = activityId;
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
	 * @param activity the activity to set
	 */
	public void setActivity(Activity activity) {
		this.activity = activity;
	}
	
	/**
	 * Gets the activity list.
	 *
	 * @return the activityList
	 */
	public String getActivityList() {
		return activityList;
	}
	
	/**
	 * Sets the activity list.
	 *
	 * @param activityList the activityList to set
	 */
	public void setActivityList(String activityList) {
		this.activityList = activityList;
	}
	
	/**
	 * Gets the new status.
	 *
	 * @return the newStatus
	 */
	public Activitystatus getNewStatus() {
		return newStatus;
	}
	
	/**
	 * Sets the new status.
	 *
	 * @param newStatus the newStatus to set
	 */
	public void setNewStatus(Activitystatus newStatus) {
		this.newStatus = newStatus;
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
	 * @param rejected the rejected to set
	 */
	public void setRejected(Activitystatus rejected) {
		this.rejected = rejected;
	}
	
	/**
	 * Gets the replan.
	 *
	 * @return the replan
	 */
	public Activitystatus getReplan() {
		return replan;
	}
	
	/**
	 * Sets the replan.
	 *
	 * @param replan the replan to set
	 */
	public void setReplan(Activitystatus replan) {
		this.replan = replan;
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
	 * @param approved the approved to set
	 */
	public void setApproved(Activitystatus approved) {
		this.approved = approved;
	}
	
	/**
	 * Gets the activity status.
	 *
	 * @return the activityStatus
	 */
	public ActivityStatus getActivityStatus() {
		return activityStatus;
	}
	
	/**
	 * Sets the activity status.
	 *
	 * @param activityStatus the activityStatus to set
	 */
	public void setActivityStatus(ActivityStatus activityStatus) {
		this.activityStatus = activityStatus;
	}
	
	/**
	 * Checks if is decision status.
	 *
	 * @return the decisionStatus
	 */
	public boolean isDecisionStatus() {
		return decisionStatus;
	}
	
	/**
	 * Sets the decision status.
	 *
	 * @param decisionStatus the decisionStatus to set
	 */
	public void setDecisionStatus(boolean decisionStatus) {
		this.decisionStatus = decisionStatus;
	}
	
	/**
	 * Checks if is edits the.
	 *
	 * @return the edit
	 */
	public boolean isEdit() {
		return edit;
	}
	
	/**
	 * Sets the edits the.
	 *
	 * @param edit the edit to set
	 */
	public void setEdit(boolean edit) {
		this.edit = edit;
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
	 * Checks if is from inventory.
	 *
	 * @return the fromInventory
	 */
	public boolean isFromInventory() {
		return fromInventory;
	}
	
	/**
	 * Sets the from inventory.
	 *
	 * @param fromInventory the fromInventory to set
	 */
	public void setFromInventory(boolean fromInventory) {
		this.fromInventory = fromInventory;
	}



	/**
	 * Gets the inventory pos.
	 *
	 * @return the inventoryPos
	 */
	public SeedlingInventoryPOS getInventoryPos() {
		return inventoryPos;
	}



	/**
	 * Sets the inventory pos.
	 *
	 * @param inventoryPos the inventoryPos to set
	 */
	public void setInventoryPos(SeedlingInventoryPOS inventoryPos) {
		this.inventoryPos = inventoryPos;
	}

	/**
	 * Gets the prod type list.
	 *
	 * @return the prodTypeList
	 */
	public Prodtype[] getProdTypeList() {
		return prodTypeList;
	}

	/**
	 * Sets the prod type list.
	 *
	 * @param prodTypeList the prodTypeList to set
	 */
	public void setProdTypeList(Prodtype[] prodTypeList) {
		this.prodTypeList = prodTypeList;
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
	 * Checks if is from forest institute.
	 *
	 * @return the fromForestInstitute
	 */
	public String isFromForestInstitute() {
		return fromForestInstitute;
	}

	/**
	 * Sets the from forest institute.
	 *
	 * @param fromForestInstitute the fromForestInstitute to set
	 */
	public void setFromForestInstitute(String fromForestInstitute) {
		this.fromForestInstitute = fromForestInstitute;
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
	 * Gets the from forest institute.
	 *
	 * @return the fromForestInstitute
	 */
	public String getFromForestInstitute() {
		return fromForestInstitute;
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
	 * Gets the plant planed geom.
	 *
	 * @return the plantPlanedGeom
	 */
	public String getPlantPlanedGeom() {
		return plantPlanedGeom;
	}

	/**
	 * Sets the plant planed geom.
	 *
	 * @param plantPlanedGeom the plantPlanedGeom to set
	 */
	public void setPlantPlanedGeom(String plantPlanedGeom) {
		this.plantPlanedGeom = plantPlanedGeom;
	}

	/**
	 * Gets the implement planed geom.
	 *
	 * @return the implementPlanedGeom
	 */
	public String getImplementPlanedGeom() {
		return implementPlanedGeom;
	}

	/**
	 * Sets the implement planed geom.
	 *
	 * @param implementPlanedGeom the implementPlanedGeom to set
	 */
	public void setImplementPlanedGeom(String implementPlanedGeom) {
		this.implementPlanedGeom = implementPlanedGeom;
	}

	/**
	 * Gets the stand geom.
	 *
	 * @return the standGeom
	 */
	public String getStandGeom() {
		return standGeom;
	}

	/**
	 * Sets the stand geom.
	 *
	 * @param standGeom the standGeom to set
	 */
	public void setStandGeom(String standGeom) {
		this.standGeom = standGeom;
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
		this.barCodeImg  = barCodeImg;
	}
	
	

}
