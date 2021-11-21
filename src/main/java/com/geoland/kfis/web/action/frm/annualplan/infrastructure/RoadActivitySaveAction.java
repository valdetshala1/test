package com.geoland.kfis.web.action.frm.annualplan.infrastructure;


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
import com.geoland.kfis.model.ActivityDomain;
import com.geoland.kfis.model.ActivityStatus;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.RoadImplDeclare;
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
 * The Class RoadActivitySaveAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Oct 27, 2014 , 2:30:03 PM
 */
public class RoadActivitySaveAction extends RoadActivityBaseAction{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The employee. */
	private Employee employee;
	
	/** The file. */
	private File file;
	
	/** The json details. */
	private String jsonDetails;
	
	/** The road impl declare. */
	private List<RoadImplDeclare> roadImplDeclare;
	
	/** The pl geometry. */
	private Geometry plGeometry;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {

		employee = getUser().getEmployee();
		if(employee==null){
			addActionError( getMessage("login.user.employee.role.empty"));
		}
		
		if(StringUtils.isEmpty(plLine)){
			addActionError( getMessage("silviculture.pl.geometry.empty"));
			plGeometry=null;
		}else {
			WKTReader wktReader=new WKTReader(new GeometryFactory(new PrecisionModel(), 900916));
			try {
				plGeometry=wktReader.read(plLine);
				plGeometry.setSRID(900916);				
			} catch (Exception e) {
			}
		}
		
		if(roadActivity!=null && road.getId()==null)
			addFieldError("roadActivity.road.id", getMessage("roadActivity.road.id.empty"));
		else roadActivity.setRoad(road);
		
		if(roadActivity!=null && roadActivity.getPlLenght()==null)
			addFieldError("roadActivity.plLenght", getMessage("roadActivity.plLenght.empty"));
		else if(roadActivity.getPlLenght()>road.getRoadLength()){
			addFieldError("roadActivity.plLenght", getMessage("roadActivity.plLenght.big.value"));
		}
		if(roadActivity!=null && roadActivity.getPlStartM()==null)
			addFieldError("roadActivity.plStartM", getMessage("roadActivity.plStartM.empty"));
		
		if(roadActivity!=null && roadActivity.getPlEndM()==null)
			addFieldError("roadActivity.plEndM", getMessage("roadActivity.plEndM.empty"));
		
		if(roadActivity!=null && roadActivity.getPlWidth()==null)
			addFieldError("roadActivity.plWidth", getMessage("roadActivity.plWidth.empty"));
		
		if(roadActivity!=null && roadActivity.getPlEndM()!=null && roadActivity.getPlStartM()!=null && roadActivity.getPlEndM()<roadActivity.getPlStartM())
			addFieldError("roadActivity.plEndM", getMessage("roadActivity.plEndM.short"));
		if(activity!=null && activity.getActivityDomain().getId()==null)
			addFieldError("activity.activityDomain.id", getMessage("activity.frmDomain.id.empty"));
		else activity.setActivityDomain(DAOFactory.getFactory().getActivityDomainDAO().get(activity.getActivityDomain().getId()));

		if(decisionStatus && activityStatus.getStatus().equals(Activitystatus.SUBMITTED))
			addFieldError("activityStatus.status", getMessage("activityStatus.status.empty"));

		if(roadActivity!=null && "I".equals(roadActivity.getWorkStage()) && !decisionStatus){
			double imWidthTotal=0.0;
			if(jsonDetails!=null && StringUtils.isNotEmpty(jsonDetails)){
				JSONArray array=(JSONArray)JSONSerializer.toJSON(jsonDetails);
				if(array.size()>0){
					roadImplDeclare=new ArrayList<RoadImplDeclare>();
					boolean hasEmptyCell=false;
					for(Iterator<JSONObject>  iterator = array.iterator(); iterator.hasNext();){
						JSONObject o=iterator.next();
						RoadImplDeclare rd=new RoadImplDeclare();
						rd.setRoadActivity(roadActivity);
						if(o.get("rd_id")!=null && StringUtils.isNotEmpty(o.get("rd_id").toString())){
							Long id=Long.valueOf(o.get("rd_id").toString());
							rd.setId(id);
						}
						if(o.get("im_start_m")!=null && StringUtils.isNotEmpty(o.get("im_start_m").toString())){
							Double imStartM=Double.valueOf(o.get("im_start_m").toString());
							rd.setImStartM(imStartM.doubleValue());
						}else {
							hasEmptyCell=true;
							addFieldError("roadActivity.imStartM",  getMessage("roadActivity.plStartM.empty"));
						}
						if(o.get("im_end_m")!=null && StringUtils.isNotEmpty(o.get("im_end_m").toString())){
							Double imEndM=Double.valueOf(o.get("im_end_m").toString());
							rd.setImEndM(imEndM.doubleValue());
						}else {
							hasEmptyCell=true;
							addFieldError("roadActivity.imEndM",  getMessage("roadActivity.plEndM.empty"));
						}
						if(o.get("im_width")!=null && StringUtils.isNotEmpty(o.get("im_width").toString())){
							Double imWidth=Double.valueOf(o.get("im_width").toString());
							imWidthTotal+=imWidth.doubleValue();
							rd.setImWidth(imWidth.doubleValue());
						}else {
							hasEmptyCell=true;
							addFieldError("roadActivity.imWidth", getMessage("roadActivity.imWidth.empty"));
						}
						if(o.get("im_date")!=null && StringUtils.isNotEmpty(o.get("im_date").toString())){
						    try {
						    	rd.setImDate(DATE_FORMAT.parse(o.get("im_date").toString().trim()));
						    } catch (ParseException e) {
						        e.printStackTrace();
						    }
						}else {
							hasEmptyCell=true;
							addFieldError("slv.declare.imDate",  getMessage("harv.declare.imDate.empty"));
						}
						rd.setCreatedDate(new Date());
						rd.setPerson(employee);
						if(rd.getImEndM()!=null &&  rd.getImStartM()!=null){
							rd.setImLenght(rd.getImEndM()-rd.getImStartM());
						}
						roadImplDeclare.add(rd);
					}
					if(!hasEmptyCell && roadImplDeclare.size()>0){
						roadActivity.setImStartM(findStartM(roadImplDeclare));
						roadActivity.setImEndM(findEndM(roadImplDeclare));
						roadActivity.setImWidth(imWidthTotal/roadImplDeclare.size());
						roadActivity.setImLenght(roadActivity.getImEndM()-roadActivity.getImStartM());
					}
				}else{
					addFieldError("roadActivity.imStartM",  getMessage("roadActivity.plStartM.empty"));
					addFieldError("slv.declare.imDate",  getMessage("harv.declare.imDate.empty"));
					addFieldError("roadActivity.imEndM",  getMessage("roadActivity.plEndM.empty"));
					addFieldError("roadActivity.imWidth", getMessage("roadActivity.imWidth.empty"));
					addFieldError("roadActivity.imLenght", getMessage("roadActivity.plLenght.empty"));
				}
			}
			if(roadActivity.getImStartM()<roadActivity.getPlStartM())
				addFieldError("roadActivity.imStartM", getMessage("roadActivity.not.in.range"));
		    if(roadActivity.getImEndM()>roadActivity.getPlEndM())
				addFieldError("roadActivity.imEndM", getMessage("roadActivity.not.in.range"));
			if(roadActivity.getPlLenght()<roadActivity.getImLenght())
				addFieldError("roadActivity.imLenght", getMessage("roadActivity.imLenght.is.bigger"));
			if(roadActivity.getImWidth()>roadActivity.getPlWidth())
				addFieldError("roadActivity.imWidth", getMessage("roadActivity.not.in.range"));
		}
		if(activity!=null) 
			activity.setPlanedGeom(plGeometry);
		
			
		if(annualPlanId!=null)
			 annualPlan = DAOFactory.getFactory().getAnnualPlanningDAO().get(annualPlanId);
		
		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response=ServletActionContext.getResponse();
			response.addHeader(Constants.ERRORS_EXITS, "true");
		}
	}
	
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {

		ActivityDomain dom=activity.getActivityDomain();
		if(activity.getId()!=null){
			activity=DAOFactory.getFactory().getActivityDAO().get(activity.getId());
			activity.setActivityDomain(dom);
		}else{
			activity.setAnnualPlanning(annualPlan);
			activity.setActivityField(Activityfield.INFRASTRUCTURE);
			activity.setOperationLevel(employee.getOrganisation().getOperLevel());
			activity.setPerson(employee);
			activity.setCreatedDate(new Date());
		}
		activity.setPlanedGeom(plGeometry);
		
		if(roadActivity!=null && roadActivity.getId()==null && annualPlan!=null && annualPlan.getYear()!=null ){
			Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
			SQLQuery sqlForReqNo=session.createSQLQuery("select * from gen_activity_no("+annualPlan.getYear()+",'')");
			sqlForReqNo.addScalar("gen_activity_no",LongType.INSTANCE);
			Object actNo=sqlForReqNo.uniqueResult();
			Long activityNo=null;
			if(actNo!=null && !StringUtils.isEmpty(actNo.toString())){
				activityNo=(Long)actNo;
			}
			if(activityNo!=null){
				activity.setActivityNo((activityNo+1)+"/"+annualPlan.getYear()+"/");
			}else {
				activity.setActivityNo("1/"+annualPlan.getYear()+"/");
			}
			File qrCodeImg=createQRCode(activity.getActivityNo(), 150, 150);
			activity.setQrCode(getFileBytes(qrCodeImg));
		}
		
		
//		ActivityStatus status=new ActivityStatus();
		activityStatus.setCreatedDate(new Date());
		activityStatus.setActivity(activity);
		activityStatus.setPerson(employee);
		if(roadActivity.getActivityStatus().getStatus()==null)
			activityStatus.setStatus(Activitystatus.NEW);
		else if(activityStatus.getStatus()==null)
			activityStatus.setStatus(roadActivity.getActivityStatus().getStatus());
		
		if(roadActivity.getId()==null){
			roadActivity.setPersonByPlCreatedBy(employee);
			roadActivity.setPlCreatedDate(new Date());
		}else if("I".equals(roadActivity.getWorkStage())){
			roadActivity.setPersonByImCreatedBy(employee);
			roadActivity.setImCreatedDate(new Date());
		}
		roadActivity.setActivity(activity);
		if(activityStatus.getStatus()==Activitystatus.APPROVED)
			roadActivity.setWorkStage("I");
		else
			roadActivity.setWorkStage("P");
		
		if(roadActivity.getPersonByImCreatedBy().getId()==null)
			roadActivity.setPersonByImCreatedBy(null);
		
		roadActivity.setActivity(activity);
		roadActivity.setActivityStatus(activityStatus);
		
		User user = getUser().getUser();
		activity.setCurrentUser(user);
		activityStatus.setCurrentUser(user);
		roadActivity.setCurrentUser(user);
		DAOFactory.getFactory().getActivityDAO().save(activity);
		DAOFactory.getFactory().getActivityStatusDAO().save(activityStatus);
		DAOFactory.getFactory().getRoadActivityDAO().save(roadActivity);
		
		if(roadActivity.getId()!=null && roadImplDeclare!=null &&  roadImplDeclare.size()>0){
			for(RoadImplDeclare rd:roadImplDeclare){
				rd.setCurrentUser(user);
				DAOFactory.getFactory().getRoadImplDeclareDAO().save(rd);
			}
		}
		if(file!=null){
			Class<?> c = ActivityStatus.class;
			Table table = c.getAnnotation(Table.class);
			String tableName = table.name();
			uploadDocInAlfresco(tableName,roadActivity.getActivityStatus().getId(), file, docNameAlf, docNameAlf,docTypeAlf);
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
	 * Gets the road impl declare.
	 *
	 * @return the road impl declare
	 */
	public List<RoadImplDeclare> getRoadImplDeclare() {
		return roadImplDeclare;
	}


	/**
	 * Sets the road impl declare.
	 *
	 * @param roadImplDeclare the new road impl declare
	 */
	public void setRoadImplDeclare(List<RoadImplDeclare> roadImplDeclare) {
		this.roadImplDeclare = roadImplDeclare;
	}

	
	

}
