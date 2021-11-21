/**
 * 
 */
package com.geoland.kfis.web.action.frm.annualplan.planting;

import java.io.File;
import java.math.BigDecimal;
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
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.SeedlingInventory;
import com.geoland.kfis.model.StandPlantingImplDeclare;
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
 * The Class PlantingSaveAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 11:30:47 AM, Oct 20, 2014
 */
public class PlantingSaveAction extends PlantingBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 2337274495294742433L;
	
	/** The employee. */
	private Employee employee;
	
	/** The file. */
	private File file;
	
	/** The json details. */
	private String jsonDetails;
	
	/** The plant impl declare. */
	private List<StandPlantingImplDeclare> plantImplDeclare;

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		employee = getUser().getEmployee();
		if(employee==null){
			addActionError( getMessage("login.user.employee.role.empty"));
		}
		
		if(activity!=null && activity.getActivityDomain().getId()==null)
			addFieldError("activity.activityDomain.id", getMessage("activity.frmDomain.id.empty"));
		else activity.setActivityDomain(DAOFactory.getFactory().getActivityDomainDAO().get(activity.getActivityDomain().getId()));
		
		if(planting!=null && planting.getTreeSpecies().getId()==null)
			addFieldError("planting.treeSpecies.id", getMessage("planting.treeSpecies.id.empty"));
		else{
			TreeSpecies treeS = DAOFactory.getFactory().getTreeSpeciesDAO().get(planting.getTreeSpecies().getId());
			planting.setTreeSpecies(treeS);
		}
			
		if(planting!=null && stand.getId()==null)
			addFieldError("planting.stand.id", getMessage("planting.stand.id.empty"));
		else{
			stand=DAOFactory.getFactory().getStandDAO().get(stand.getId());
			planting.setStand(stand);
		}
		

		if(planting!=null && planting.getProdType()==null)
			addFieldError("planting.prodType", getMessage("seedlingInventory.prodType.empty"));
		
		if(planting!=null && planting.getPlArea()==null)
			addFieldError("planting.plArea", getMessage("planting.plArea.empty"));
		
		if(planting!=null && planting.getPlTrees()==null)
			addFieldError("planting.plTrees", getMessage("planting.plTrees.empty"));
		
		if(decisionStatus && activityStatus.getStatus().equals(Activitystatus.SUBMITTED))
			addFieldError("activityStatus.status", getMessage("activityStatus.status.empty"));
		
		if(annualplanId!=null)
			 annualplan = DAOFactory.getFactory().getAnnualPlanningDAO().get(annualplanId);	
		
		/*if(stand!=null && planting!=null && planting.getPlArea()!=null && stand.getBasalArea()!=null && activity!=null && planting.getTreeSpecies()!=null){
			Session s=HibSessionFactory.getSessionFactory().getCurrentSession();
			String sumQuery = "select coalesce(sum(pl_area), 0) as area" +
					" from tfrm_stand_planting_activity p " +
					" left join tfrm_activity a on p.activity_id=a.id" +
					" where work_stage='P' and p.stand_id="+stand.getId()+" and a.activity_domain_id="+activity.getActivityDomain().getId();
			if(planting.getId()!=null)
				sumQuery+=" and p.id!="+planting.getId();
			
			SQLQuery sql=s.createSQLQuery(sumQuery);
			sql.addScalar("area");
			Object ob = sql.uniqueResult();
			double area=((Double)ob).doubleValue();
			if(stand.getBasalArea()-area<planting.getPlArea()){
				addFieldError("planting.plArea", getMessage("planting.plArea.is.bigger"));
			}
			
		}*/
		if(planting!=null && StringUtils.isEmpty(plantPlanedGeom))
			addActionError( getMessage("activity.planedGeom.empty"));
		else if(StringUtils.isNotEmpty(plantPlanedGeom)){
			Geometry geom = null;
			try {
				WKTReader reader = new WKTReader(new GeometryFactory(
						new PrecisionModel(), 900916));
				geom = reader.read(plantPlanedGeom);
				
				geom.setSRID(900916);
				activity.setPlanedGeom(geom);
			} catch (com.vividsolutions.jts.io.ParseException e) {
				e.printStackTrace();
			}
		}
		/*if(planting!=null && planting.getWorkStage().equals("I") && StringUtils.isEmpty(implementPlanedGeom))
			addActionError("activity.implementGeom.empty");
		else if(StringUtils.isNotEmpty(implementPlanedGeom)){
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
		}*/
		if(fromInventory && planting!=null && activityStatus!=null && (activityStatus.getStatus()==null || (activityStatus.getStatus()!=null && activityStatus.getStatus().equals(Activitystatus.NEW)))){
			if(planting.getPlArea()!=null && planting.getSeedlingAge()!=null && planting.getProdType()!=null && planting.getTreeSpecies()!=null && planting.getTreeSpecies().getId()!=null )
				validateByInventory(planting);
		}
		if(planting!=null && "I".equals(planting.getWorkStage()) && !decisionStatus){
			double imAreaTotal=0.0;
			long imTreesTotal=0;
			if(jsonDetails!=null && StringUtils.isNotEmpty(jsonDetails)){
				JSONArray array=(JSONArray)JSONSerializer.toJSON(jsonDetails);
				if(array.size()>0){
					plantImplDeclare=new ArrayList<StandPlantingImplDeclare>();
					for(Iterator<JSONObject>  iterator = array.iterator(); iterator.hasNext();){
						JSONObject o=iterator.next();
						StandPlantingImplDeclare pd=new StandPlantingImplDeclare();
						pd.setPerson(employee);
						pd.setCreatedDate(new Date());
						pd.setStandPlantingActivity(planting);
						if(o.get("pd_id")!=null && StringUtils.isNotEmpty(o.get("pd_id").toString())){
							Long id=Long.valueOf(o.get("pd_id").toString());
							pd.setId(id);
						}
						if(o.get("im_area")!=null && StringUtils.isNotEmpty(o.get("im_area").toString())){
							Double imArea=Double.valueOf(o.get("im_area").toString());
							imAreaTotal+=imArea.doubleValue();
							pd.setImArea(imArea.doubleValue());
						}else {
							addFieldError("planting.imArea",  getMessage("planting.plArea.empty"));
						}
						if(o.get("im_geom")!=null && StringUtils.isNotEmpty(o.get("im_geom").toString())){
							String im_geom=o.get("im_geom").toString();
							Geometry geom = null;
							try {
								WKTReader reader = new WKTReader(new GeometryFactory(
										new PrecisionModel(), 900916));
								geom = reader.read(im_geom);
								
								geom.setSRID(900916);
								pd.setImGeom(geom);
								if(activity.getImplementedGeom()==null)
									activity.setImplementedGeom(pd.getImGeom());
								else activity.setImplementedGeom(activity.getImplementedGeom().union(pd.getImGeom()));
								
							} catch (com.vividsolutions.jts.io.ParseException e) {
								e.printStackTrace();
							}
						}else {
							addFieldError("planting.imArea",  getMessage("planting.plArea.empty"));
						}
						if(o.get("im_trees")!=null && StringUtils.isNotEmpty(o.get("im_trees").toString())){
							Long imTrees=Long.valueOf(o.get("im_trees").toString());
							imTreesTotal+=imTrees.intValue();
							pd.setImTrees(imTrees.longValue());
						}else {
							addFieldError("planting.imTrees",  getMessage("planting.plTrees.empty"));
						}if(o.get("im_date")!=null && StringUtils.isNotEmpty(o.get("im_date").toString())){
						    try {
						    	pd.setImDate(DATE_FORMAT.parse(o.get("im_date").toString().trim()));
						    }catch (ParseException e) {
						        e.printStackTrace();
						    }
						}else {
							addFieldError("pln.declare.imDate",  getMessage("harv.declare.imDate.empty"));
						}
						
						plantImplDeclare.add(pd);
				}
					
			  }
			}
			planting.setImArea(imAreaTotal);
			planting.setImTrees(imTreesTotal);
			if(planting.getPlArea()<planting.getImArea())
				addFieldError("planting.imArea", getMessage("planting.imArea.is.bigger"));
		    if(planting.getImTrees()!=null && planting.getPlTrees()<planting.getImTrees())
				addFieldError("planting.imTrees", getMessage("planting.plTrees.is.bigger")); 
		}

		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader(Constants.ERRORS_EXITS, "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		User user = getUser().getUser();
		ActivityDomain dom=activity.getActivityDomain();
		if(activity.getId()!=null){
			Geometry plan=activity.getPlanedGeom();
			Geometry impl=activity.getImplementedGeom();
			activity=DAOFactory.getFactory().getActivityDAO().get(activity.getId());
			activity.setPlanedGeom(plan);
			activity.setImplementedGeom(impl);
		}else{
			activity.setAnnualPlanning(annualplan);
			activity.setActivityField(Activityfield.PLANTING);
			activity.setOperationLevel(employee.getOrganisation().getOperLevel());
			activity.setPerson(employee);
			activity.setCreatedDate(new Date());
		}
		activity.setActivityDomain(dom);
		
		if(planting!=null && planting.getId()==null && annualplan!=null && annualplan.getYear()!=null ){
			Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
			SQLQuery sqlForReqNo=session.createSQLQuery("select * from gen_activity_no("+annualplan.getYear()+",'"+planting.getStand().getStandId()+"')");
			sqlForReqNo.addScalar("gen_activity_no",LongType.INSTANCE);
			Object actNo=sqlForReqNo.uniqueResult();
			Long activityNo=null;
			if(actNo!=null && !StringUtils.isEmpty(actNo.toString())){
				activityNo=(Long)actNo;
			}
			if(activityNo!=null){
				activity.setActivityNo((activityNo+1)+"/"+annualplan.getYear()+"/"+planting.getStand().getStandId());
			}else {
				activity.setActivityNo("1/"+annualplan.getYear()+"/"+planting.getStand().getStandId());
			}
			File qrCodeImg=createQRCode(activity.getActivityNo(), 150, 150);
			activity.setQrCode(getFileBytes(qrCodeImg));
		}
//		ActivityStatus status=new ActivityStatus();
		activityStatus.setCreatedDate(new Date());
		activityStatus.setActivity(activity);
		activityStatus.setPerson(employee);
		if(planting.getActivityStatus().getStatus()==null)
			activityStatus.setStatus(Activitystatus.NEW);
		else if(activityStatus.getStatus()==null)
			activityStatus.setStatus(planting.getActivityStatus().getStatus());
		
		if(planting.getId()==null){
			planting.setPersonByPlCreatedBy(employee);
			planting.setPlCreatedDate(new Date());
		}else if("I".equals(planting.getWorkStage())){
			planting.setPersonByImCreatedBy(employee);
			planting.setImCreatedDate(new Date());
		}
		planting.setActivity(activity);
		if(activityStatus.getStatus()==Activitystatus.APPROVED)
			planting.setWorkStage("I");
		else
			planting.setWorkStage("P");
		
		if(planting.getPersonByImCreatedBy().getId()==null)
			planting.setPersonByImCreatedBy(null);
		
		planting.setActivityStatus(activityStatus);
		
		if(fromInventory){
			planting.setSeedlingInventoryPOS(inventoryPos);
			if(planting!=null && planting.getId()==null){
				inventoryPos.setAge(new Short(planting.getSeedlingAge()));
				
				inventoryPos.setQuantity(new BigDecimal(planting.getPlTrees()));
				if(inventoryPos.getId()==null || inventoryPos.getCreatedDate()==null)
					inventoryPos.setCreatedDate(new Date());
				if(inventoryPos.getId()==null || inventoryPos.getPersonByCreatedBy().getId()==null)
					inventoryPos.setPersonByCreatedBy(employee);
				inventoryPos.setTreeSpecies(planting.getTreeSpecies());
				inventoryPos.setProdType(planting.getProdType());
				inventoryPos.setAge(new Short(planting.getSeedlingAge()));
				
			}
			if("I".equals(planting.getWorkStage())){
				inventoryPos.setIsapproved("Y");
				inventoryPos.setIsdelivered("Y");
			} else {
				inventoryPos.setIsapproved("O");
				inventoryPos.setIsdelivered("N");
			}
			
			inventoryPos.setCurrentUser(user);
			DAOFactory.getFactory().getSeedlingInventoryPosDAO().save(inventoryPos);
			
			if(planting.getImTrees()!=null && !"D".equals(planting.getWorkStage())){
				SeedlingInventory inv=DAOFactory.getFactory().getSeedlingInventoryDAO().get(inventoryPos.getSeedlingInventory().getId());
				Long stock = inv.getStock();
				inv.setStock(stock-planting.getImTrees());
				inv.setChangedDate(new Date());
				inv.setPersonByChangedBy(employee);
				inv.setCurrentUser(user);
				DAOFactory.getFactory().getSeedlingInventoryDAO().save(inv);
//				planting.setWorkStage("D");
			}
		}
		if(planting.getSeedlingInventoryPOS()!=null && planting.getSeedlingInventoryPOS().getId()==null)
			planting.setSeedlingInventoryPOS(null);
		
		activity.setCurrentUser(user);
		activityStatus.setCurrentUser(user);
		planting.setCurrentUser(user);
		DAOFactory.getFactory().getActivityDAO().save(activity);
		DAOFactory.getFactory().getActivityStatusDAO().save(activityStatus);
		planting.setActivity(activity);
		if(planting.getActivity()!=null && planting.getActivity().getQrCode()!=null )
			barCodeImg=new String(Base64.encodeBase64(planting.getActivity().getQrCode()));
		DAOFactory.getFactory().getStandPlantingActivityDAO().save(planting);
		
		if(planting.getId()!=null && (plantImplDeclare!=null &&plantImplDeclare.size()>0)){
			for(StandPlantingImplDeclare s:plantImplDeclare){
				s.setCurrentUser(user);
				DAOFactory.getFactory().getStandPlantingImplDeclareDAO().save(s);
			}
		}
		
		
		if(file!=null){
			Class<?> c = ActivityStatus.class;
			Table table = c.getAnnotation(Table.class);
			String tableName = table.name();
			uploadDocInAlfresco(tableName,planting.getActivityStatus().getId(), file, docNameAlf, docNameAlf,docTypeAlf);
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
	 * Gets the plant impl declare.
	 *
	 * @return the plant impl declare
	 */
	public List<StandPlantingImplDeclare> getPlantImplDeclare() {
		return plantImplDeclare;
	}

	/**
	 * Sets the plant impl declare.
	 *
	 * @param plantImplDeclare the new plant impl declare
	 */
	public void setPlantImplDeclare(List<StandPlantingImplDeclare> plantImplDeclare) {
		this.plantImplDeclare = plantImplDeclare;
	}
	
	
	
}
