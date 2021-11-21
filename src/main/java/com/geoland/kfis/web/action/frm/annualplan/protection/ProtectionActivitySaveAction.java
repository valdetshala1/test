package com.geoland.kfis.web.action.frm.annualplan.protection;

import java.io.File;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.persistence.Table;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.LongType;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.ActivityStatus;
import com.geoland.kfis.model.ManagementUnitPeriod;
import com.geoland.kfis.model.ProtectionImplDeclare;
import com.geoland.kfis.model.UnitsMetric;
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
 * The Class ProtectionActivitySaveAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Oct 29, 2014 , 2:07:10 PM
 */
public class ProtectionActivitySaveAction extends ProtectionActivityBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The decision status. */
	private Activitystatus decisionStatus;
	
	/** The file. */
	private File file;
	
	/** The json details. */
	private String jsonDetails;
	
	/** The protection impl declare. */
	private List<ProtectionImplDeclare> protectionImplDeclare;
	
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		
		employee = DAOFactory.getFactory().getPartyUserDAO().getEmployee(getUser().getUser().getId());
		
		if(activity!=null && activity.getActivityDomain()!=null && activity.getActivityDomain().getId()==null)
			addFieldError("activity.frmDomain.id", getMessage("activity.frmDomain.id.empty"));
		else activity.setActivityDomain(DAOFactory.getFactory().getActivityDomainDAO().get(activity.getActivityDomain().getId()));
	
		if(protection!=null && protection.getManagementUnit().getId()==null)
			addFieldError("protection.managementUnit", getMessage("compartment.management.unit.id.empty"));
		
		if(protection!=null && protection.getPlValue()==null)
			addFieldError("protection.plValue", getMessage("protection.plValue.empty"));
		
		
		if(protection!=null && protection.getUnitsMetric().getId()==null)
			addFieldError("protection.unitsMetric", getMessage("protection.unitsMetric.empty"));
		else {
			UnitsMetric m=DAOFactory.getFactory().getUnitsMetricDAO().get(protection.getUnitsMetric().getId());
			protection.setUnitsMetric(m);
			
		}
		
		if(annualplanId!=null){
			setAnnualplan(DAOFactory.getFactory().getAnnualPlanningDAO().get(annualplanId));
			protection.setCadastralMunicipality(getAnnualplan().getCadastralMunicipality());
			controlProcesOnPage();
		}
		
		if(protection!=null && protection.getActivityStatus().getStatus()==Activitystatus.SUBMITTED && decisionStatus==null){
			addFieldError("protection.decisionStatus",getMessage("protection.decisionStatus.empty"));
		}
		
		if(protection!=null && protection.getWorkStage().equalsIgnoreCase("I")){
			double imValueTotal=0.0;
			if(jsonDetails!=null && StringUtils.isNotEmpty(jsonDetails)){
				JSONArray array=(JSONArray)JSONSerializer.toJSON(jsonDetails);
				if(array.size()>0){
					protectionImplDeclare=new ArrayList<ProtectionImplDeclare>();
					for(Iterator<JSONObject>  iterator = array.iterator(); iterator.hasNext();){
						JSONObject o=iterator.next();
						ProtectionImplDeclare pd=new ProtectionImplDeclare();
						pd.setProtectionActivity(protection);
						if(o.get("pd_id")!=null && StringUtils.isNotEmpty(o.get("pd_id").toString())){
							Long id=Long.valueOf(o.get("pd_id").toString());
							pd.setId(id);
						}
						if(o.get("im_value")!=null && StringUtils.isNotEmpty(o.get("im_value").toString())){
							Double imValue=Double.valueOf(o.get("im_value").toString());
							imValueTotal+=imValue.doubleValue();
							pd.setImValue(imValue.doubleValue());
						}else {
							addFieldError("protection.imValue", getMessage("protection.imValue.empty"));
						}
						if(o.get("im_geom")!=null && StringUtils.isNotEmpty(o.get("im_geom").toString())){
							Geometry geom=null;
							WKTReader wktReader=new WKTReader(new GeometryFactory(new PrecisionModel(), 900916));
							try {
								geom=wktReader.read(o.get("im_geom").toString());
								geom.setSRID(900916);	
								pd.setImGeom(geom);
							} catch (Exception e) {
							}
						}else {
							addFieldError("silviculture.imGeom",  getMessage("silviculture.imGeom.empty"));
						}
						if(o.get("im_date")!=null && StringUtils.isNotEmpty(o.get("im_date").toString())){
						    try {
						    	pd.setImDate(DATE_FORMAT.parse(o.get("im_date").toString().trim()));
						    } catch (ParseException e) {
						        e.printStackTrace();
						    }
						}else {
							addFieldError("slv.declare.imDate",  getMessage("harv.declare.imDate.empty"));
						}
						pd.setCreatedDate(new Date());
						pd.setPerson(employee);
						protectionImplDeclare.add(pd);
					}
				}
			}
			protection.setImValue(imValueTotal);
			
			if(protection.getImValue()>protection.getPlValue())
				addFieldError("protection.imValue",getMessage("protection.imValue.is.bigger.than.plValue.empty"));
		}
		String mup_query="select mp.* from tgis_mu_period mp left join tgis_management_unit mu on mp.mu_id=mu.id where isactive='Y' and mu.id="+protection.getManagementUnit().getId();
		List<ManagementUnitPeriod> mupList=DAOFactory.getFactory().getManagementUnitPeriodDAO().executeSQLQuery(mup_query);
		if(mupList.size()>0){
			ManagementUnitPeriod mup=mupList.get(0);
			muperiodId=mup.getId();	
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
//		 	if(activity.getId()!=null){
//		 		Geometry plan=activity.getPlanedGeom();
//				Geometry impl=activity.getImplementedGeom();
//				activity=DAOFactory.getFactory().getActivityDAO().get(activity.getId());
//				activity.setPlanedGeom(plan);
//				activity.setImplementedGeom(impl);
//		 	}
			if(activity.getId()==null){
				activity.setAnnualPlanning(annualplan);
				activity.setActivityField(Activityfield.PROTECTION);
				activity.setOperationLevel(employee.getOrganisation().getOperLevel());
				activity.setPerson(employee);
				activity.setCreatedDate(new Date());
			}else{
				activity=DAOFactory.getFactory().getActivityDAO().get(activity.getId());
			}

			if(protection!=null && protection.getId()==null && annualplan!=null && annualplan.getYear()!=null ){
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
			
			activityStatus.setCreatedDate(new Date());
			activityStatus.setActivity(activity);
			activityStatus.setPerson(employee);
			activityStatus.setStatus(Activitystatus.NEW);
			
			if(protection.getId()!=null && protection.getActivityStatus().getStatus()==Activitystatus.SUBMITTED ){
				activityStatus.setStatus(decisionStatus);
			}else if(protection.getId()==null){
				activityStatus.setStatus(Activitystatus.NEW);	
				
			}else {
				activityStatus.setStatus(protection.getActivityStatus().getStatus());
			}
			
			if(protection.getId()==null){
				protection.setPersonByPlCreatedBy(employee);
				protection.setPlCreatedDate(new Date());
				protection.setWorkStage("P");
			}else if("I".equals(protection.getWorkStage())){
				protection.setPersonByImCreatedBy(employee);
				protection.setImCreatedDate(new Date());
			}
				
			if (activityStatus.getStatus()==Activitystatus.APPROVED) {
				protection.setWorkStage("I");
				protection.setPersonByImCreatedBy(employee);
			}else {
				protection.setWorkStage(protection.getWorkStage());
			}
			if(protection.getPersonByImCreatedBy().getId()==null)
				protection.setPersonByImCreatedBy(null);
			
			protection.setActivity(activity);
			protection.setActivityStatus(activityStatus);
			
			User user = getUser().getUser();
			activity.setCurrentUser(user);
			activityStatus.setCurrentUser(user);
			protection.setCurrentUser(user);
			
			DAOFactory.getFactory().getActivityDAO().save(activity);
			DAOFactory.getFactory().getActivityStatusDAO().save(activityStatus);
		
			
			DAOFactory.getFactory().getProtectionActivityDAO().save(protection);
			
			if(protection.getId()!=null && protectionImplDeclare!=null){
				for(ProtectionImplDeclare p:protectionImplDeclare){
					DAOFactory.getFactory().getProtectionImplDeclareDAO().save(p);
				}
			}
			if(file!=null){
				Class<?> c = ActivityStatus.class;
				Table table = c.getAnnotation(Table.class);
				String tableName = table.name();
				uploadDocInAlfresco(tableName,protection.getActivityStatus().getId(), file, docNameAlf, docNameAlf,docTypeAlf);
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
	 * @param file the file to set
	 */
	public void setFile(File file) {
		this.file = file;
	}


	/**
	 * Gets the json details.
	 *
	 * @return the json details
	 */
	public String getJsonDetails() {
		return jsonDetails;
	}


	/**
	 * Sets the json details.
	 *
	 * @param jsonDetails the new json details
	 */
	public void setJsonDetails(String jsonDetails) {
		this.jsonDetails = jsonDetails;
	}


	/**
	 * Gets the protection impl declare.
	 *
	 * @return the protection impl declare
	 */
	public List<ProtectionImplDeclare> getProtectionImplDeclare() {
		return protectionImplDeclare;
	}


	/**
	 * Sets the protection impl declare.
	 *
	 * @param protectionImplDeclare the new protection impl declare
	 */
	public void setProtectionImplDeclare(
			List<ProtectionImplDeclare> protectionImplDeclare) {
		this.protectionImplDeclare = protectionImplDeclare;
	}

}
