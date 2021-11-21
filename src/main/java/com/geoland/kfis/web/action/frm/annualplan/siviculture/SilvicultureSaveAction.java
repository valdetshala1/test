package com.geoland.kfis.web.action.frm.annualplan.siviculture;

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

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.LongType;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.ActivityDomain;
import com.geoland.kfis.model.ActivityStatus;
import com.geoland.kfis.model.StandSilvicultureImplDeclare;
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
 * The Class SilvicultureSaveAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Oct 20, 2014 , 3:10:48 PM
 */
public class SilvicultureSaveAction extends SilvicultureBaseAction{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The decision status. */
	private Activitystatus decisionStatus;
	
	/** The file. */
	private File file;
	
	/** The json details. */
	private String jsonDetails;
	
	/** The im slv geom. */
	private String imSlvGeom;
	
	/** The pl slv geom. */
	private String plSlvGeom;
	
	/** The pl geometry. */
	private Geometry plGeometry;
	
	/** The im geometry. */
	private Geometry imGeometry;
	
	/** The slv impl declare. */
	private List<StandSilvicultureImplDeclare> slvImplDeclare;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		employee = DAOFactory.getFactory().getPartyUserDAO().getEmployee(getUser().getUser().getId());
		
		if(employee==null){
			addActionError( getMessage("login.user.employee.role.empty"));
			
		}
		if(StringUtils.isEmpty(plSlvGeom)){
			addActionError( getMessage("silviculture.pl.geometry.empty"));
			plGeometry=null;
		}else {
			WKTReader wktReader=new WKTReader(new GeometryFactory(new PrecisionModel(), 900916));
			try {
				plGeometry=wktReader.read(plSlvGeom);
				plGeometry.setSRID(900916);				
			} catch (Exception e) {
			}
		}
		if(activity!=null && activity.getActivityDomain().getId()==null)
			addFieldError("activity.frmDomain.id", getMessage("activity.frmDomain.id.empty"));
		else{
			activity.setActivityDomain(DAOFactory.getFactory().getActivityDomainDAO().get(activity.getActivityDomain().getId()));
			silviculture.setActivity(activity);
		}
		boolean hasMeasuredVolume=false;
		if(standId!=null){
			stand = DAOFactory.getFactory().getStandDAO().get(standId);
			hasMeasuredVolume=hasMeasuredVolume(stand);
			silviculture.setStand(stand);
		}else {
			addFieldError("stand.id", getMessage("stand.id.empty"));
		}
		if(annualplanId!=null){
			 annualplan = DAOFactory.getFactory().getAnnualPlanningDAO().get(annualplanId);	
			 if(silviculture.getId()!=null)
					controlProcesOnPage();
		}
		if(silviculture == null)
			addFieldError("silviculture", getMessage("silviculture.empty"));
		
		
		if(silviculture != null && (silviculture.getStand() == null || silviculture.getStand().getId() == null))
			addFieldError("silviculture.stand.id", getMessage("silviculture.stand.id.empty"));
		
		if(silviculture!=null && silviculture.getPlArea()==null)
			addFieldError("silviculture.plArea",getMessage("silviculture.pl.area.empty"));
		
		if(silviculture!=null && silviculture.getTreeSpeciesGroup()==null && hasMeasuredVolume) {
			addFieldError("silviculture.treeSpeciesGroup",getMessage("silviculture.tree.species.group.empty"));	
		}else if(silviculture!=null && stand!=null && silviculture.getPlArea()!=null && activity.getActivityDomain().getId()!=null)
			validatePlannedActivityArea(stand, silviculture.getTreeSpeciesGroup(), silviculture);
		
		if(silviculture!=null && silviculture.getActivityStatus().getStatus()==Activitystatus.SUBMITTED && decisionStatus==null){
			addFieldError("silviculture.decisionStatus",getMessage("silviculture.decisionStatus.empty"));
		}
		
		double imAreaTotal=0.0;
		if(jsonDetails!=null && StringUtils.isNotEmpty(jsonDetails)){
			JSONArray array=(JSONArray)JSONSerializer.toJSON(jsonDetails);
			if(array.size()>0){
				slvImplDeclare=new ArrayList<StandSilvicultureImplDeclare>();
				for(Iterator<JSONObject>  iterator = array.iterator(); iterator.hasNext();){
					JSONObject o=iterator.next();
					StandSilvicultureImplDeclare sd=new StandSilvicultureImplDeclare();
					sd.setStandSilvicultureActivity(silviculture);
					if(o.get("sd_id")!=null && StringUtils.isNotEmpty(o.get("sd_id").toString())){
						Long id=Long.valueOf(o.get("sd_id").toString());
						sd.setId(id);
					}
					if(o.get("im_area")!=null && StringUtils.isNotEmpty(o.get("im_area").toString())){
						Double imArea=Double.valueOf(o.get("im_area").toString());
						imAreaTotal+=imArea.doubleValue();
						sd.setImArea(imArea.doubleValue());
					}else {
						addFieldError("silviculture.imArea",  getMessage("silviculture.imArea.empty"));
					}
					
					if(o.get("im_geom")!=null && StringUtils.isNotEmpty(o.get("im_geom").toString())){
						Geometry geom=null;
						WKTReader wktReader=new WKTReader(new GeometryFactory(new PrecisionModel(), 900916));
						try {
							geom=wktReader.read(o.get("im_geom").toString());
							geom.setSRID(900916);	
							sd.setImGeom(geom);
						} catch (Exception e) {
						}
					}else {
						addFieldError("silviculture.imGeom",  getMessage("silviculture.imGeom.empty"));
					}
					if(o.get("im_date")!=null && StringUtils.isNotEmpty(o.get("im_date").toString())){
					    try {
					    	sd.setImDate(DATE_FORMAT.parse(o.get("im_date").toString().trim()));
					    } catch (ParseException e) {
					        e.printStackTrace();
					    }
					}else {
						addFieldError("slv.declare.imDate",  getMessage("harv.declare.imDate.empty"));
					}
					sd.setCreatedDate(new Date());
					sd.setPerson(employee);
					slvImplDeclare.add(sd);
				}
			}
		}
		silviculture.setImArea(imAreaTotal);
		
		if(silviculture!=null && silviculture.getWorkStage().equalsIgnoreCase("I") && silviculture.getImArea()>silviculture.getPlArea())
			addFieldError("silviculture.imArea",getMessage("silviculture.imArea.is.bigger.than.plArea.empty"));
		
		if(silviculture!=null && silviculture.getWorkStage().equalsIgnoreCase("I") && silviculture.getImArea()>silviculture.getPlArea())
			addFieldError("silviculture.imArea",getMessage("silviculture.imArea.is.bigger.than.plArea.empty"));
			
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
		
		
		ActivityDomain dom=activity.getActivityDomain();
		if(activity.getId()!=null){
			activity=DAOFactory.getFactory().getActivityDAO().get(activity.getId());
		}else{
			activity.setAnnualPlanning(annualplan);
			activity.setActivityField(Activityfield.SILVICULTURE);
			activity.setOperationLevel(employee.getOrganisation().getOperLevel());
			activity.setPerson(employee);
			activity.setCreatedDate(new Date());
		}
		activity.setPlanedGeom(plGeometry);
		activity.setImplementedGeom(imGeometry);
		activity.setActivityDomain(dom);
		
		if(silviculture!=null && silviculture.getId()==null && annualplan!=null && annualplan.getYear()!=null ){
			Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
			SQLQuery sqlForReqNo=session.createSQLQuery("select * from gen_activity_no("+annualplan.getYear()+",'"+silviculture.getStand().getStandId()+"')");
			sqlForReqNo.addScalar("gen_activity_no",LongType.INSTANCE);
			Object actNo=sqlForReqNo.uniqueResult();
			Long activityNo=null;
			if(actNo!=null && !StringUtils.isEmpty(actNo.toString())){
				activityNo=(Long)actNo;
			}
			if(activityNo!=null){
				activity.setActivityNo((activityNo+1)+"/"+annualplan.getYear()+"/"+silviculture.getStand().getStandId());
			}else {
				activity.setActivityNo("1/"+annualplan.getYear()+"/"+silviculture.getStand().getStandId());
			}
			File qrCodeImg=createQRCode(activity.getActivityNo(), 150, 150);
			activity.setQrCode(getFileBytes(qrCodeImg));
		}
		activityStatus.setCreatedDate(new Date());
		activityStatus.setActivity(activity);
		activityStatus.setPerson(employee);
		if(decisionStatus!=null){
			activityStatus.setStatus(decisionStatus);
		}else if(silviculture.getId()==null){
			activityStatus.setStatus(Activitystatus.NEW);	
		}else {
			activityStatus.setStatus(silviculture.getActivityStatus().getStatus());
		}
		
		if(silviculture.getId()==null){
			silviculture.setPersonByPlCreatedBy(employee);
			silviculture.setPlCreatedDate(new Date());
			silviculture.setWorkStage("P"); /*P=Planning, I=Implementation*/
			
		}else if("I".equals(silviculture.getWorkStage())){
			silviculture.setPersonByImCreatedBy(employee);
			silviculture.setImCreatedDate(new Date());
		}
			
		if (activityStatus.getStatus()==Activitystatus.APPROVED) {
			silviculture.setWorkStage("I");
		}else {
			silviculture.setWorkStage(silviculture.getWorkStage());
		}
		if(silviculture.getPersonByImCreatedBy().getId()==null)
			silviculture.setPersonByImCreatedBy(null);
	
		silviculture.setStand(stand);
		
		User user = getUser().getUser();
		activity.setCurrentUser(user);
		activityStatus.setCurrentUser(user);
		silviculture.setCurrentUser(user);
		
		DAOFactory.getFactory().getActivityDAO().save(activity);
		DAOFactory.getFactory().getActivityStatusDAO().save(activityStatus);
		silviculture.setActivityStatus(activityStatus);
		silviculture.setActivity(activity);
		if(silviculture.getActivity()!=null && silviculture.getActivity().getQrCode()!=null )
			barCodeImg=new String(Base64.encodeBase64(silviculture.getActivity().getQrCode()));
		
		DAOFactory.getFactory().getStandSilvicultureActivityDAO().save(silviculture);
		
		if(silviculture.getId()!=null){
			if(slvImplDeclare!=null && slvImplDeclare.size()>0){
				for(StandSilvicultureImplDeclare s:slvImplDeclare){
					s.setCurrentUser(user);
					DAOFactory.getFactory().getStandSilvicultureImplDeclareDAO().save(s);
				}
			}
		}
		if(file!=null){
			Class<?> c = ActivityStatus.class;
			Table table = c.getAnnotation(Table.class);
			String tableName = table.name();
			uploadDocInAlfresco(tableName,silviculture.getActivityStatus().getId(), file, docNameAlf, docNameAlf,docTypeAlf);
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
	 * Gets the slv impl declare.
	 *
	 * @return the slv impl declare
	 */
	public List<StandSilvicultureImplDeclare> getSlvImplDeclare() {
		return slvImplDeclare;
	}

	/**
	 * Sets the slv impl declare.
	 *
	 * @param slvImplDeclare the new slv impl declare
	 */
	public void setSlvImplDeclare(List<StandSilvicultureImplDeclare> slvImplDeclare) {
		this.slvImplDeclare = slvImplDeclare;
	}

	/**
	 * Gets the im slv geom.
	 *
	 * @return the im slv geom
	 */
	public String getImSlvGeom() {
		return imSlvGeom;
	}

	/**
	 * Sets the im slv geom.
	 *
	 * @param imSlvGeom the new im slv geom
	 */
	public void setImSlvGeom(String imSlvGeom) {
		this.imSlvGeom = imSlvGeom;
	}

	/**
	 * Gets the pl slv geom.
	 *
	 * @return the pl slv geom
	 */
	public String getPlSlvGeom() {
		return plSlvGeom;
	}

	/**
	 * Sets the pl slv geom.
	 *
	 * @param plSlvGeom the new pl slv geom
	 */
	public void setPlSlvGeom(String plSlvGeom) {
		this.plSlvGeom = plSlvGeom;
	}
	
	
	

}
