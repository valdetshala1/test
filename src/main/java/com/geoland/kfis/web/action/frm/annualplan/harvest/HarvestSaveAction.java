package com.geoland.kfis.web.action.frm.annualplan.harvest;

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
import com.geoland.kfis.model.Activity;
import com.geoland.kfis.model.ActivityDomain;
import com.geoland.kfis.model.ActivityStatus;
import com.geoland.kfis.model.DecisionStatus;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.StandHarvestImplDeclare;
import com.geoland.kfis.model.StandHarvestMarked;
import com.geoland.kfis.model.TreeSpecies;
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
 * The Class HarvestSaveAction.
 *
 * @author GEO&LAND
 * @created October 19, 2014 6:52:50 PM
 * @Version 1.0
 */
public class HarvestSaveAction extends HarvestBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 3428455760161662430L;
	
	/** The employee. */
	private Employee employee;
	
	/** The file. */
	private File file;
	
	/** The json details. */
	private String jsonDetails;
	
	/** The harv impl declare list. */
	private List<StandHarvestImplDeclare> harvImplDeclareList;
	
	/** The json harv marked. */
	private String jsonHarvMarked;
	
	/** The harvest marked list. */
	private List<StandHarvestMarked> harvestMarkedList;
	
	/** The pl multipolygon. */
	private String plMultipolygon;
	
	/** The im multipolygon. */
	private String imMultipolygon;
	
	/** The pl geometry. */
	private Geometry plGeometry;
	
	/** The im geometry. */
	private Geometry imGeometry;
	
	/** The doc name. */
	private String docName;
	
	/** The doc type. */
	private String docType;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		employee = getUser().getEmployee();
		if(employee==null){
			addActionError("login.user.employee.role.empty");
		}
		if(StringUtils.isEmpty(plMultipolygon)){
			addActionError( getMessage("harvest.multipolygon.is.empty"));
			plGeometry=null;
		}else {
			WKTReader wktReader=new WKTReader(new GeometryFactory(new PrecisionModel(), 900916));
			try {
				plGeometry=wktReader.read(plMultipolygon);
				plGeometry.setSRID(900916);
				
			} catch (Exception e) {
			}
			
		}
		if(standharvest!=null && standharvest.getWorkStage().equalsIgnoreCase("I")){
			if(!StringUtils.isEmpty(imMultipolygon)){
				WKTReader wktReader=new WKTReader(new GeometryFactory(new PrecisionModel(), 900916));
				try {
					imGeometry=wktReader.read(imMultipolygon);
					imGeometry.setSRID(900916);
					
				} catch (Exception e) {
				}
			}else{
				addActionError(getMessage("harvest.multipolygon.is.empty"));
				imGeometry=null;
			}
		}else{
			imGeometry=null;
		}
		
		String message=null;
		if(standId != null)
			stand = DAOFactory.getFactory().getStandDAO().get(standId);
		
		if(annualplanId != null)
			 annualplan = DAOFactory.getFactory().getAnnualPlanningDAO().get(annualplanId);	
		
		if(stand!=null && stand.getId()!=null && annualplan!=null && annualplan.getId()!=null && hasMeasuredVolume(stand)){
			if(!hasAnnualGrowth(stand,annualplan.getYear().toString())){
				message=getMessage("no.stand.growth");
				addFieldError("", message);
			}
		}
		if(standharvest == null)
			addFieldError("standharvest", getMessage("standharvest.empty"));
		if(domainId == null)
			addFieldError("domainId", getMessage("standharvest.domainId.empty"));
		else{
			ActivityDomain activityDomain = DAOFactory.getFactory().getActivityDomainDAO().get(domainId);
			Activity activity = new Activity();
			activity.setActivityDomain(activityDomain);
			activity.setPlanedGeom(plGeometry);
			activity.setImplementedGeom(imGeometry);
			standharvest.setActivity(activity);
		}
		if(treeTypeId == null)
			addFieldError("treeTypeId", getMessage("standharvest.treeTypeId.empty"));
		else{
			TreeSpecies treeSpecies = DAOFactory.getFactory().getTreeSpeciesDAO().get(treeTypeId);
			standharvest.setTreeSpecies(treeSpecies);
		}
		if(standharvest != null && (standharvest.getStand() == null || standharvest.getStand().getId() == null))
			addFieldError("standharvest.stand.id", getMessage("standharvest.stand.id.empty"));

		if(standharvest != null && standharvest.getPlFireVolume() == null)
			addFieldError("standharvest.plFireVolume", getMessage("standharvest.plan.fire.volume.empty"));
		
		if(standharvest != null && standharvest.getPlTechVolume() == null)
			addFieldError("standharvest.plTechVolume", getMessage("standharvest.plan.technic.volume.empty"));

		if(standharvest != null && standharvest.getPlPulpVolume() == null)
			addFieldError("standharvest.plPulpVolume", getMessage("standharvest.plan.pulp.volume.empty"));
		if(!decisionStatus && ("P".equals(standharvest.getWorkStage()) || "".equals(standharvest.getWorkStage()))){
			if(standharvest.getTreeSpecies()!=null && standharvest.getPlFireVolume()!=null && stand != null && standharvest.getPlTechVolume()!=null && standharvest.getPlPulpVolume()!=null)
				validatePlannedActivities(standharvest.getTreeSpecies().getSpeciesGroup(),stand,standharvest);
		}
		if(decisionStatus && activityStatus.getStatus().equals(Activitystatus.SUBMITTED))
			addFieldError("activityStatus.status", getMessage("activityStatus.status.empty"));
		if(!decisionStatus && standharvest!=null &&"M".equals(standharvest.getWorkStage())){
			harvestMarkedList=addHarvMarked(jsonHarvMarked, standharvest);
		}
		boolean errors=false;
		if(!decisionStatus && "I".equals(standharvest.getWorkStage())){
			double fireVolumeTotal=0.0;
			double techVolumeTotal=0.0;
			double pulpVolumeTotal=0.0;
			
			double fireVolumeToDiscount=0.0;
			double techVolumeToDiscount=0.0;
			double pulpVolumeToDiscount=0.0;
			
			if(jsonDetails!=null && StringUtils.isNotEmpty(jsonDetails)){
				JSONArray array=(JSONArray) JSONSerializer.toJSON(jsonDetails);
				harvImplDeclareList=new ArrayList<StandHarvestImplDeclare>();
				if(array.size()>0){
					for (Iterator<JSONObject> iterator = array.iterator(); iterator.hasNext();) {
						JSONObject o =  iterator.next();
						StandHarvestImplDeclare hd=new StandHarvestImplDeclare();
						hd.setStandHarvestActivity(standharvest);
						boolean toRecalculateStand=true;
						if(o.get("hd_id")!=null && StringUtils.isNotEmpty(o.get("hd_id").toString())){
							Long id=Long.valueOf(o.get("hd_id").toString());
							hd.setId(id);
							toRecalculateStand=false;
						}
						if(o.get("hd_trans_id")!=null && StringUtils.isNotEmpty(o.get("hd_trans_id").toString())){
							Long hdTransId=Long.valueOf(o.get("hd_trans_id").toString());
							hd.setStandHarvestImplTransport(DAOFactory.getFactory().getStandHarvestImplTransportDAO().get(hdTransId));
						}
						if(o.get("im_tech_volume_dec")!=null && StringUtils.isNotEmpty(o.get("im_tech_volume_dec").toString())){
							Double imTechVolume=Double.valueOf(o.get("im_tech_volume_dec").toString());
							techVolumeTotal+=imTechVolume.doubleValue();
							hd.setTechVolume(imTechVolume);
							if(toRecalculateStand){
								techVolumeToDiscount+=imTechVolume.doubleValue();
							}
						}else {
							errors=true;
							addFieldError("harv.declare.imTechVolume",  getMessage("standharvest.impl.tech.volume.empty"));
						}
						if(o.get("im_fire_volume_dec")!=null && StringUtils.isNotEmpty(o.get("im_fire_volume_dec").toString())){
							Double imFireVolume=Double.valueOf(o.get("im_fire_volume_dec").toString());
							fireVolumeTotal+=imFireVolume.doubleValue();
							hd.setFireVolume(imFireVolume);
							if(toRecalculateStand){
								fireVolumeToDiscount+=imFireVolume.doubleValue();
							}
						}else {
							errors=true;
							addFieldError("harv.declare.imFireVolume",  getMessage("standharvest.impl.fire.volume.empty"));
						}
						if(o.get("im_pulp_volume_dec")!=null && StringUtils.isNotEmpty(o.get("im_pulp_volume_dec").toString())){
							Double imPulpVolume=Double.valueOf(o.get("im_pulp_volume_dec").toString());
							pulpVolumeTotal+=imPulpVolume.doubleValue();
							hd.setPulpVolume(imPulpVolume);
							if(toRecalculateStand){
								errors=true;
								pulpVolumeToDiscount+=imPulpVolume.doubleValue();
							}
						}else {
							addFieldError("harv.declare.imPulpVolume",  getMessage("standharvest.impl.pulp.volume.empty"));
						}
						if(o.get("im_date_dec")!=null && StringUtils.isNotEmpty(o.get("im_date_dec").toString())){
						    try {
						    	hd.setImDate(DATE_FORMAT.parse(o.get("im_date_dec").toString().trim()));
						    } catch (ParseException e) {
						        e.printStackTrace();
						    }
						}else {
							addFieldError("harv.declare.imPulpVolume",  getMessage("harv.declare.imPulpVolume.empty"));
						}
						hd.setPerson(getUser().getPerson());
						hd.setCreatedDate(new Date());
						harvImplDeclareList.add(hd);
					}
				}
				standharvest.setImFireVolume(fireVolumeTotal);
				standharvest.setImTechVolume(techVolumeTotal);
				standharvest.setImPulpVolume(pulpVolumeTotal);
				
				if(jsonHarvMarked!=null && StringUtils.isNotEmpty(jsonHarvMarked)){
					addHarvMarked(jsonHarvMarked, standharvest);
				}
			   if(standharvest!=null && standharvest.getImFireVolume()>standharvest.getPlFireVolume()){
					addFieldError("standharvest.imFireVolume", getMessage("standharvest.fire.volume.implementing.more.than.planned"));
					errors=true;
				}
			   if(standharvest!=null && standharvest.getImTechVolume()>standharvest.getPlTechVolume()){
					addFieldError("standharvest.imTechVolume", getMessage("standharvest.tech.volume.implementing.more.than.planned"));
					errors=true;
				}
			   if(standharvest!=null && standharvest.getImPulpVolume()>standharvest.getPlPulpVolume()){
					addFieldError("standharvest.imPulpVolume", getMessage("standharvest.pulp.volume.implementing.more.than.planned"));
					errors=true;
				}
			}
			else {
				addFieldError("harv.declare.imDate",  getMessage("harv.declare.empty"));
			}
//			if(!errors && hasMeasuredVolume(stand)) recalculateStandVolume(standharvest.getTreeSpecies().getSpeciesGroup(),stand,standharvest);
			if(!errors && hasMeasuredVolume(stand)) recalculateStandVolume(standharvest.getTreeSpecies().getSpeciesGroup(),stand,standharvest,fireVolumeToDiscount,techVolumeToDiscount, pulpVolumeToDiscount);

		}
		
		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader(Constants.ERRORS_EXITS, "true");
			if(message!=null)
				response.addHeader("message", message);
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {

		ActivityDomain activityDomain = DAOFactory.getFactory().getActivityDomainDAO().get(domainId);
		TreeSpecies treeSpecies = DAOFactory.getFactory().getTreeSpeciesDAO().get(treeTypeId);
		
		standharvest.setTreeSpecies(treeSpecies);
		
		if(standharvest!=null && standharvest.getId()!=null){
			if(standharvest.getActivityStatus()!=null && standharvest.getActivityStatus().getStatus().getDOMKEY().equals(approved.getDOMKEY()) && terrainDone){
				activityStatus=new ActivityStatus();
				activityStatus.setStatus(terrain_done);
			}
		}
		if(activity.getId()!=null){
			activity=DAOFactory.getFactory().getActivityDAO().get(activity.getId());
		}else{
			activity.setAnnualPlanning(annualplan);
			activity.setActivityField(Activityfield.HARVEST);
			activity.setOperationLevel(employee.getOrganisation().getOperLevel());
			activity.setPerson(employee);
			activity.setCreatedDate(new Date());
		}
		activity.setPlanedGeom(plGeometry);
		activity.setImplementedGeom(imGeometry);
		
		activity.setActivityDomain(activityDomain);
//		ActivityStatus status = new ActivityStatus();
		activityStatus.setCreatedDate(new Date());
		activityStatus.setActivity(activity);
		activityStatus.setPerson(employee);
		if(standharvest.getActivityStatus().getStatus()==null)
			activityStatus.setStatus(Activitystatus.NEW);
		else if(activityStatus.getStatus()==null)
			activityStatus.setStatus(standharvest.getActivityStatus().getStatus());
		
		if(standharvest.getId()==null){
			standharvest.setPersonByPlCreatedBy(employee);
			standharvest.setPlCreatedDate(new Date());
		}else if("I".equals(standharvest.getWorkStage())){
			standharvest.setPersonByImCreatedBy(employee);
			standharvest.setImCreatedDate(new Date());
		}
		
		if(activityStatus.getStatus()==Activitystatus.APPROVED)
			standharvest.setWorkStage("M");//Work Stage M-marked
		else if(activityStatus.getStatus()==Activitystatus.TERRAIN_DONE)
			standharvest.setWorkStage("I");
		else standharvest.setWorkStage("P");
		
		if(standharvest.getPersonByImCreatedBy().getId()==null)
			standharvest.setPersonByImCreatedBy(null);
		
		standharvest.setActivity(activity);
		standharvest.setStand(stand);
		standharvest.setActivityStatus(activityStatus);
		
		if(standharvest!=null && standharvest.getId()==null && annualplan!=null && annualplan.getYear()!=null ){
			Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
			SQLQuery sqlForReqNo=session.createSQLQuery("select * from gen_activity_no("+annualplan.getYear()+",'"+standharvest.getStand().getStandId()+"')");
			sqlForReqNo.addScalar("gen_activity_no",LongType.INSTANCE);
			Object actNo=sqlForReqNo.uniqueResult();
			Long activityNo=null;
			if(actNo!=null && !StringUtils.isEmpty(actNo.toString())){
				activityNo=(Long)actNo;
			}
			if(activityNo!=null){
				activity.setActivityNo((activityNo+1)+"/"+annualplan.getYear()+"/"+standharvest.getStand().getStandId());
			}else {
				activity.setActivityNo("1/"+annualplan.getYear()+"/"+standharvest.getStand().getStandId());
			}
			File qrCodeImg=createQRCode(activity.getActivityNo(), 150, 150);
			activity.setQrCode(getFileBytes(qrCodeImg));
		}
		User user = getUser().getUser();
		stand.setCurrentUser(user);
		activity.setCurrentUser(user);
		activityStatus.setCurrentUser(user);
		DAOFactory.getFactory().getStandDAO().save(stand);
		DAOFactory.getFactory().getActivityDAO().save(activity);
		DAOFactory.getFactory().getActivityStatusDAO().save(activityStatus);
		
		if(standharvest!=null && standharvest.getId()!=null){
			if(harvImplDeclareList!=null && harvImplDeclareList.size()>0){
				for(StandHarvestImplDeclare hid:harvImplDeclareList){
					hid.setCurrentUser(user);
					DAOFactory.getFactory().getStandHarvestImplDeclareDAO().save(hid);
				}
			}
			if(harvestMarkedList!=null && harvestMarkedList.size()>0){
				for (StandHarvestMarked shm:harvestMarkedList) {
					if(shm.getId()==null){
						shm.setCreatedDate(new Date());
						shm.setEmployee(employee);
					}
					shm.setCurrentUser(user);
					DAOFactory.getFactory().getStandHarvestMarkedDAO().save(shm);
				}
			}

		}
		standharvest.setCurrentUser(user);
		DAOFactory.getFactory().getStandHarvestActivityDAO().save(standharvest);
		if(file!=null){
			Class<?> c = ActivityStatus.class;
			Table table = c.getAnnotation(Table.class);
			String tableName = table.name();
			uploadDocInAlfresco(tableName,standharvest.getActivityStatus().getId(), file, docNameAlf, docNameAlf,docTypeAlf);
		}
		
	
		return SUCCESS;
	}

	
	
	/**
	 * Gets the pl multipolygon.
	 *
	 * @return the pl multipolygon
	 */
	public String getPlMultipolygon() {
		return plMultipolygon;
	}

	/**
	 * Sets the pl multipolygon.
	 *
	 * @param plMultipolygon the new pl multipolygon
	 */
	public void setPlMultipolygon(String plMultipolygon) {
		this.plMultipolygon = plMultipolygon;
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
	 * Gets the im multipolygon.
	 *
	 * @return the im multipolygon
	 */
	public String getImMultipolygon() {
		return imMultipolygon;
	}

	/**
	 * Sets the im multipolygon.
	 *
	 * @param imMultipolygon the new im multipolygon
	 */
	public void setImMultipolygon(String imMultipolygon) {
		this.imMultipolygon = imMultipolygon;
	}

	/**
	 * Gets the json harv marked.
	 *
	 * @return the json harv marked
	 */
	public String getJsonHarvMarked() {
		return jsonHarvMarked;
	}

	/**
	 * Sets the json harv marked.
	 *
	 * @param jsonHarvMarked the new json harv marked
	 */
	public void setJsonHarvMarked(String jsonHarvMarked) {
		this.jsonHarvMarked = jsonHarvMarked;
	}
	
	/**
	 * Gets the doc name.
	 *
	 * @return the doc name
	 */
	public String getDocName() {
		return docName;
	}

	/**
	 * Sets the doc name.
	 *
	 * @param docName the new doc name
	 */
	public void setDocName(String docName) {
		this.docName = docName;
	}

	/**
	 * Gets the doc type.
	 *
	 * @return the doc type
	 */
	public String getDocType() {
		return docType;
	}

	/**
	 * Sets the doc type.
	 *
	 * @param docType the new doc type
	 */
	public void setDocType(String docType) {
		this.docType = docType;
	}
	
}
