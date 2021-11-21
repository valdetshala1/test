package com.geoland.kfis.web.action.frm.annualplan.seedling;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.LongType;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.ActivityDomain;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.SeedActivity;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Activityfield;
import com.geoland.kfis.persistence.hibernate.usertypes.Activitystatus;
import com.geoland.kfis.web.action.base.Constants;
import com.vividsolutions.jts.geom.Geometry;
import com.vividsolutions.jts.geom.GeometryFactory;
import com.vividsolutions.jts.geom.PrecisionModel;
import com.vividsolutions.jts.io.WKTReader;

// TODO: Auto-generated Javadoc
/**
 * The Class SeedActivitySaveAction.
 *
 * @author Fisnik Aliu, GEO&LAND
 * @created Oct 20, 2014 11:44:08 AM
 * @Version 1.0
 */
public class SeedActivitySaveAction extends SeedActivityBaseAction{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -1176740669633100773L;
	
	/** The employee. */
	private Employee employee;
	
	/** The file. */
	private File file;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	public void validate(){
		employee = DAOFactory.getFactory().getPartyUserDAO().getEmployee(getUser().getUser().getId());
		if(employee==null){
			addActionError("login.user.employee.role.empty");
		}
		
		if(annualplanId != null){
			 annualplan = DAOFactory.getFactory().getAnnualPlanningDAO().get(annualplanId);	
			 seedActivity.setYear(annualplan.getYear());
		}
					
		
//		if(seedActivity!=null && seedActivity.getActivity()==null)
//			addFieldError("seedActivity.activity", getMessage("seed.activity.activity.empty"));
		if(seedActivity!=null && seedActivity.getTreeSpecies().getId()==null){
			addFieldError("seedActivity.treeSpecies", getMessage("seed.activity.tree.species.empty"));
		}else{
			seedActivity.setTreeSpecies(DAOFactory.getFactory().getTreeSpeciesDAO().get(seedActivity.getTreeSpecies().getId()));
		}
//		if(seedActivity!=null && StringUtils.isEmpty(seedActivity.getWorkStage()))
//			addFieldError("seedActivity.workStage", getMessage("seed.activity.work.stage.empty"));
		if(seedActivity.getId()==null || "R".equals(seedActivity.getWorkStage()) || (seedActivity.getActivityStatus().getStandHarvestActivities().equals(Activitystatus.NEW) || seedActivity.getActivityStatus().getStandHarvestActivities().equals(Activitystatus.SUBMITTED))){
			if(seedActivity!=null && seedActivity.getPrValue()==null)
				addFieldError("seedActivity.prValue", getMessage("seed.activity.pr.value.empty"));
		}
		if(decisionStatus==true && activityStatus.getStatus()==Activitystatus.SUBMITTED)
			addFieldError("activityStatus.status", getMessage("activityStatus.status.empty"));
		if(activityStatus.getStatus()!=null && activityStatus.getStatus().equals(Activitystatus.APPROVED)){
			if(seedActivity!=null && seedActivity.getPlValue()==null)
				addFieldError("seedActivity.plValue", getMessage("seed.activity.pl.value.empty"));
			if(seedActivity!=null && seedActivity.getExValue()==null)
				addFieldError("seedActivity.exValue", getMessage("seed.activity.ex.value.empty"));
		}
		
		if(activity.getActivityDomain()==null || activity.getActivityDomain().getId()==null){
			addFieldError("activity.frmDomain",getMessage("activity.frm.domain.empty"));
		}else{
			activity.setActivityDomain(DAOFactory.getFactory().getActivityDomainDAO().get(activity.getActivityDomain().getId()));
		}
		if(seedActivity!=null && (seedActivity.getExValue()!=null && seedActivity.getPlValue()!=null ) )
			if(seedActivity.getExValue()>seedActivity.getPlValue())
				addFieldError("seedActivity.exValue", getMessage("seed.activity.ex.value.less.than.pl.value"));
		
		if(seedActivity!=null && seedActivity.getProdType()==null)
			addFieldError("seedActivity.prodType",getMessage("seedlingInventory.prodType.empty"));
		
		if(seedActivity!=null && seedActivity.getImValue()!=null && seedActivity.getImValue()>seedActivity.getPlValue())
			addFieldError("seedActivity.imValue", getMessage("seedActivity.imValue.is.bigger"));
		if(seedActivity!=null && seedActivity.getProdType()!=null && seedActivity.getTreeSpecies().getId()!=null && seedActivity.getYear()!=null && seedActivity.getId()==null){
			String checkQuery="select sa.* from tfrm_seed_activity as sa where sa.prod_type='"+seedActivity.getProdType()+"'  and sa.tree_species_id="+seedActivity.getTreeSpecies().getId()+" and sa.year="+seedActivity.getYear();
			List<SeedActivity> saList=DAOFactory.getFactory().getSeedActivityDAO().executeSQLQuery(checkQuery);
			if(saList.size()>0){
				addFieldError("seedActivity.treeSpecies", getMessage("seed.activity.exist.in.data.set"));
			}
		}
		
		if(seedActivity!=null && StringUtils.isEmpty(planedGeom))
			addActionError("activity.planedGeom.empty");
		else if(seedActivity!=null && StringUtils.isNotEmpty(planedGeom)){
			Geometry geom = null;
			try {
				WKTReader reader = new WKTReader(new GeometryFactory(
						new PrecisionModel(), 900916));
				geom = reader.read(planedGeom);
				
				geom.setSRID(900916);
				activity.setPlanedGeom(geom);
			} catch (com.vividsolutions.jts.io.ParseException e) {
				e.printStackTrace();
			}
		}
//		if(seedActivity!=null && activityStatus.getStatus()==Activitystatus.APPROVED && StringUtils.isEmpty(implementPlanedGeom))
// 
////		addActionError("activity.implementGeom.empty");
		 if(seedActivity!=null && StringUtils.isNotEmpty(implementPlanedGeom)){
			Geometry geom = null;
			try {
				WKTReader reader = new WKTReader(new GeometryFactory(
						new PrecisionModel(), 900916));
				geom = reader.read(implementPlanedGeom);
				
				geom.setSRID(900916);
				activity.setImplementedGeom(geom);
			} catch (com.vividsolutions.jts.io.ParseException e) {
				e.printStackTrace();
			}
		}
		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response=ServletActionContext.getResponse();
			response.addHeader(Constants.ERRORS_EXITS, "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	public String execute() throws Exception{
		
		ActivityDomain dom=activity.getActivityDomain();
		
		if(activity.getId()!=null){
			Geometry plan=activity.getPlanedGeom();
			Geometry impl=activity.getImplementedGeom();
			activity=DAOFactory.getFactory().getActivityDAO().get(activity.getId());
			activity.setPlanedGeom(plan);
			activity.setImplementedGeom(impl);
		}else{
			activity.setAnnualPlanning(annualplan);
			activity.setActivityField(Activityfield.SEEDLING);
			activity.setOperationLevel(employee.getOrganisation().getOperLevel());
			activity.setPerson(employee);
			activity.setCreatedDate(new Date());
		}
		activity.setActivityDomain(dom);
		
		if(seedActivity!=null && seedActivity.getId()==null && annualplan!=null && annualplan.getYear()!=null ){
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
		
//		ActivityStatus status = new ActivityStatus();
		activityStatus.setCreatedDate(new Date());
		activityStatus.setActivity(activity);
		activityStatus.setPerson(employee);
		if(seedActivity.getId()==null){
			seedActivity.setPersonByPrCreatedBy(employee);
			seedActivity.setPrCreatedDate(new Date());
			seedActivity.setWorkStage("R");
		}else if("P".equals(seedActivity.getWorkStage())){
			seedActivity.setPersonByPlCreatedBy(employee);
			seedActivity.setPlCreatedDate(new Date());
		}else if("I".equals(seedActivity.getWorkStage())){
			seedActivity.setPersonByImCreatedBy(employee);
			seedActivity.setImCreatedDate(new Date());
		}
		
		if(seedActivity.getActivityStatus().getStatus()==null)
			activityStatus.setStatus(Activitystatus.NEW);
		else if(activityStatus.getStatus()==null)
			activityStatus.setStatus(seedActivity.getActivityStatus().getStatus());
		
		seedActivity.setActivity(activity);
		if(activityStatus.getStatus()==Activitystatus.APPROVED)
			seedActivity.setWorkStage("P");
		if(seedActivity.getImValue()!=null)
			seedActivity.setWorkStage("I");
		
		if(seedActivity.getPersonByImCreatedBy().getId()==null)
			seedActivity.setPersonByImCreatedBy(null);
		if(seedActivity.getPersonByPlCreatedBy().getId()==null)
			seedActivity.setPersonByPlCreatedBy(null);
		
		seedActivity.setActivityStatus(activityStatus);	
		
		User user = getUser().getUser();
		activity.setCurrentUser(user);
		activityStatus.setCurrentUser(user);
		seedActivity.setCurrentUser(user);
		
		DAOFactory.getFactory().getActivityDAO().save(activity);
		DAOFactory.getFactory().getActivityStatusDAO().save(activityStatus);
		DAOFactory.getFactory().getSeedActivityDAO().save(seedActivity);
		
		
		if(file!=null){
			
			doc.setDoc(getFileBytes(file));
			doc.setActivityStatus(activityStatus);
			doc.setCreatedDate(new Date());
			doc.setEmployee(employee);
			doc.setCurrentUser(user);
			
			DAOFactory.getFactory().getActivityStatusDocDAO().save(doc);
		}
		return SUCCESS;
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
	 * @param file the file to set
	 */
	public void setFile(File file) {
		this.file = file;
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

}
