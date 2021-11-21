package com.geoland.kfis.web.action.frm.annualplan;


import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.LongType;

import com.geoland.kfis.model.ActivityDomain;
import com.geoland.kfis.model.AnnualPlanning;
import com.geoland.kfis.model.AnnualPlanningStatus;
import com.geoland.kfis.persistence.hibernate.usertypes.Activitystatus;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class AnnualPlanBaseAction.
 */
public class AnnualPlanBaseAction extends BaseActionSupport {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 3778990350175587114L;
	
	/** The annualplan id. */
	protected Long annualplanId;
	
	/** The annualplan. */
	protected AnnualPlanning annualplan;
	
	/** The new AP. */
	protected Activitystatus newAP=Activitystatus.NEW;
	
	/** The submit AP. */
	protected Activitystatus submitAP=Activitystatus.SUBMITTED;
	
	/** The replan AP. */
	protected Activitystatus replanAP=Activitystatus.REPLANNED;
	
	/** The approve AP. */
	protected Activitystatus approveAP=Activitystatus.APPROVED;
	
	/** The reject AP. */
	protected Activitystatus rejectAP=Activitystatus.REJECTED;
	
	/** The decision status. */
	protected Activitystatus decisionStatus;
	
	/** The status. */
	protected AnnualPlanningStatus status;
	
	/** The replan. */
	protected boolean replan;
	
	/** The tables for replan. */
	protected String tablesForReplan;
	
	/** The tables. */
	protected List<ActivityDomain> tables;
	
	/** The enable field. */
	protected boolean enableField=true; 
	
	/** The centralplan. */
	protected boolean centralplan;
	
	/** The mun read only. */
	protected boolean munReadOnly;
	
	/** The reg read only. */
	protected boolean regReadOnly;
	
	/** The mun name. */
	protected String munName;
	
	/** The reg name. */
	protected String regName;
	
	/** The mun id. */
	protected Long munId;
	
	/** The reg id. */
	protected Long regId;
	
	/**
	 * 	Check for activities that have NEW or REPLANNED status, based in annual plan.
	 *
	 * @param tableName the table name
	 * @param annualPlanId the annual plan id
	 * @param session the session
	 * @return the long
	 */
	protected long countByStatusForSubmit(String tableName,Long annualPlanId,Session session){
		String countQuery = "select count(*) from " + tableName +
				" t left join tfrm_activity_status st on t.status_id=st.id " +
				" left join tfrm_activity a on t.activity_id=a.id " +
				" left join tfrm_annual_planning pl on a.annual_planning_id=pl.id " +
				" where (st.status='NEW' or st.status='RPL') and pl.id= " + annualPlanId;
		SQLQuery sqlQuery;
		sqlQuery= session.createSQLQuery(countQuery);
		sqlQuery.addScalar("count",LongType.INSTANCE);
		Object ob1 = sqlQuery.uniqueResult();
		return new Long(ob1.toString()).longValue();
	}

	/**
	 * 	Check for activities that have NEW, REPLANNED or SUBMITED status, based in annual plan.
	 *
	 * @param tableName the table name
	 * @param annualPlanId the annual plan id
	 * @param session the session
	 * @return the long
	 */
	protected long countByStatusForDecision(String tableName,Long annualPlanId,Session session){
		String countQuery = "select count(*) from " + tableName +
				" t left join tfrm_activity_status st on t.status_id=st.id " +
				" left join tfrm_activity a on t.activity_id=a.id " +
				" left join tfrm_annual_planning pl on a.annual_planning_id=pl.id " +
				" where (st.status='NEW' or st.status='RPL' or st.status='SUB') and pl.id= " + annualPlanId;
		SQLQuery sqlQuery;
		sqlQuery= session.createSQLQuery(countQuery);
		sqlQuery.addScalar("count",LongType.INSTANCE);
		Object ob1 = sqlQuery.uniqueResult();
		return new Long(ob1.toString()).longValue();
	}
	
	/**
	 *  Check for actvities tha have only REPLANNED status ,based in annual plan .
	 *
	 * @param tableName the table name
	 * @param annualPlanId the annual plan id
	 * @param session the session
	 * @return the long
	 */
	protected long countByRPLStatus(String tableName,Long annualPlanId,Session session){
		String countQuery = "select count(*) from " + tableName +
				" t left join tfrm_activity_status st on t.status_id=st.id " +
				" left join tfrm_activity a on t.activity_id=a.id " +
				" left join tfrm_annual_planning pl on a.annual_planning_id=pl.id " +
				" where st.status='RPL' and pl.id= " + annualPlanId;
		SQLQuery sqlQuery;
		sqlQuery= session.createSQLQuery(countQuery);
		sqlQuery.addScalar("count",LongType.INSTANCE);
		Object ob1 = sqlQuery.uniqueResult();
		return new Long(ob1.toString()).longValue();
	}
	
	/**
	 *  Get table included in annual plan.
	 * @return table name
	 */
	protected String[][] getTableNames(){
		String[][] tableName = {
				{"tfrm_stand_harvest_activity","Harvest","Shfrytëzimi i pyjeve","SeÄ�e"},
				{"tfrm_stand_silviculture_activity","Silviculture","Silvikulture","Gajenje Å¡uma"},
				{"tfrm_stand_planting_activity","Planting","Pyllezim","Sadnja"}, 
				{"tfrm_road_activity","Infrastructure","Infrastruktura","infrastruktura"},
				{"tfrm_seed_activity","Seedling","Mbjellja e farave","PoÅ¡umljavanje sadnica"},
				{"tfrm_protection_activity","Protection","Mbrojtja","ZaÅ¡tita"},
				{"tfrm_private_activity","Private","Private","Privatna"}
			};
		return tableName;
	}
	
	/**
	 * Check for activities.
	 *
	 * @param tableName the table name
	 * @param annualPlanId the annual plan id
	 * @param session the session
	 * @return the long
	 */
	protected long checkForActivities(String tableName,Long annualPlanId, Session session){
		String countQuery = "select count(*) from " + tableName +
				" t left join tfrm_activity_status st on t.status_id=st.id " +
				" left join tfrm_activity a on t.activity_id=a.id " +
				" left join tfrm_annual_planning pl on a.annual_planning_id=pl.id " ;
		SQLQuery sqlQuery;
		sqlQuery= session.createSQLQuery(countQuery);
		sqlQuery.addScalar("count",LongType.INSTANCE);
		Object ob1 = sqlQuery.uniqueResult();
		return new Long(ob1.toString()).longValue();
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
	 * Gets the new AP.
	 *
	 * @return the newAP
	 */
	public Activitystatus getNewAP() {
		return newAP;
	}
	
	/**
	 * Sets the new AP.
	 *
	 * @param newAP the newAP to set
	 */
	public void setNewAP(Activitystatus newAP) {
		this.newAP = newAP;
	}
	
	/**
	 * Gets the submit AP.
	 *
	 * @return the submitAP
	 */
	public Activitystatus getSubmitAP() {
		return submitAP;
	}
	
	/**
	 * Sets the submit AP.
	 *
	 * @param submitAP the submitAP to set
	 */
	public void setSubmitAP(Activitystatus submitAP) {
		this.submitAP = submitAP;
	}
	
	/**
	 * Gets the replan AP.
	 *
	 * @return the replanAP
	 */
	public Activitystatus getReplanAP() {
		return replanAP;
	}
	
	/**
	 * Sets the replan AP.
	 *
	 * @param replanAP the replanAP to set
	 */
	public void setReplanAP(Activitystatus replanAP) {
		this.replanAP = replanAP;
	}
	
	/**
	 * Gets the approve AP.
	 *
	 * @return the approveAP
	 */
	public Activitystatus getApproveAP() {
		return approveAP;
	}
	
	/**
	 * Sets the approve AP.
	 *
	 * @param approveAP the approveAP to set
	 */
	public void setApproveAP(Activitystatus approveAP) {
		this.approveAP = approveAP;
	}
	
	/**
	 * Gets the reject AP.
	 *
	 * @return the rejectAP
	 */
	public Activitystatus getRejectAP() {
		return rejectAP;
	}
	
	/**
	 * Sets the reject AP.
	 *
	 * @param rejectAP the rejectAP to set
	 */
	public void setRejectAP(Activitystatus rejectAP) {
		this.rejectAP = rejectAP;
	}

	/**
	 * Gets the decision status.
	 *
	 * @return the decisionStatus
	 */
	public Activitystatus getDecisionStatus() {
		return decisionStatus;
	}

	/**
	 * Sets the decision status.
	 *
	 * @param decisionStatus the decisionStatus to set
	 */
	public void setDecisionStatus(Activitystatus decisionStatus) {
		this.decisionStatus = decisionStatus;
	}

	/**
	 * Gets the status.
	 *
	 * @return the status
	 */
	public AnnualPlanningStatus getStatus() {
		return status;
	}

	/**
	 * Sets the status.
	 *
	 * @param status the new status
	 */
	public void setStatus(AnnualPlanningStatus status) {
		this.status = status;
	}

	/**
	 * Checks if is replan.
	 *
	 * @return the replan
	 */
	public boolean isReplan() {
		return replan;
	}

	/**
	 * Sets the replan.
	 *
	 * @param replan the replan to set
	 */
	public void setReplan(boolean replan) {
		this.replan = replan;
	}

	/**
	 * Gets the tables for replan.
	 *
	 * @return the tablesForReplan
	 */
	public String getTablesForReplan() {
		return tablesForReplan;
	}

	/**
	 * Sets the tables for replan.
	 *
	 * @param tablesForReplan the tablesForReplan to set
	 */
	public void setTablesForReplan(String tablesForReplan) {
		this.tablesForReplan = tablesForReplan;
	}

	/**
	 * Gets the tables.
	 *
	 * @return the tables
	 */
	public List<ActivityDomain> getTables() {
		return tables;
	}

	/**
	 * Sets the tables.
	 *
	 * @param tables the tables to set
	 */
	public void setTables(List<ActivityDomain> tables) {
		this.tables = tables;
	}

	/**
	 * Checks if is enable field.
	 *
	 * @return true, if is enable field
	 */
	public boolean isEnableField() {
		return enableField;
	}

	/**
	 * Sets the enable field.
	 *
	 * @param enableField the new enable field
	 */
	public void setEnableField(boolean enableField) {
		this.enableField = enableField;
	}

	/**
	 * Checks if is centralplan.
	 *
	 * @return true, if is centralplan
	 */
	public boolean isCentralplan() {
		return centralplan;
	}

	/**
	 * Sets the centralplan.
	 *
	 * @param centralplan the new centralplan
	 */
	public void setCentralplan(boolean centralplan) {
		this.centralplan = centralplan;
	}
	
	/**
	 * Checks if is mun read only.
	 *
	 * @return the munReadOnly
	 */
	public boolean isMunReadOnly() {
		return munReadOnly;
	}
	
	/**
	 * Sets the mun read only.
	 *
	 * @param munReadOnly the munReadOnly to set
	 */
	public void setMunReadOnly(boolean munReadOnly) {
		this.munReadOnly = munReadOnly;
	}
	
	/**
	 * Checks if is reg read only.
	 *
	 * @return the regReadOnly
	 */
	public boolean isRegReadOnly() {
		return regReadOnly;
	}
	
	/**
	 * Sets the reg read only.
	 *
	 * @param regReadOnly the regReadOnly to set
	 */
	public void setRegReadOnly(boolean regReadOnly) {
		this.regReadOnly = regReadOnly;
	}

	/**
	 * Gets the mun name.
	 *
	 * @return the mun name
	 */
	public String getMunName() {
		return munName;
	}

	/**
	 * Sets the mun name.
	 *
	 * @param munName the new mun name
	 */
	public void setMunName(String munName) {
		this.munName = munName;
	}

	/**
	 * Gets the reg name.
	 *
	 * @return the reg name
	 */
	public String getRegName() {
		return regName;
	}

	/**
	 * Sets the reg name.
	 *
	 * @param regName the new reg name
	 */
	public void setRegName(String regName) {
		this.regName = regName;
	}

	/**
	 * Gets the mun id.
	 *
	 * @return the mun id
	 */
	public Long getMunId() {
		return munId;
	}

	/**
	 * Sets the mun id.
	 *
	 * @param munId the new mun id
	 */
	public void setMunId(Long munId) {
		this.munId = munId;
	}

	/**
	 * Gets the reg id.
	 *
	 * @return the reg id
	 */
	public Long getRegId() {
		return regId;
	}

	/**
	 * Sets the reg id.
	 *
	 * @param regId the new reg id
	 */
	public void setRegId(Long regId) {
		this.regId = regId;
	}


	



	
}
