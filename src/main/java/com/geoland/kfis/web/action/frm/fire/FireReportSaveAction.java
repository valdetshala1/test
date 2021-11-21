package com.geoland.kfis.web.action.frm.fire;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.Compartment;
import com.geoland.kfis.model.FireDetails;
import com.geoland.kfis.model.FirePoint;
import com.geoland.kfis.model.FirePolygon;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.model.Stand;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.Constants;
import com.vividsolutions.jts.geom.GeometryFactory;
import com.vividsolutions.jts.geom.PrecisionModel;
import com.vividsolutions.jts.io.ParseException;
import com.vividsolutions.jts.io.WKTReader;

// TODO: Auto-generated Javadoc
/**
 * The Class FireReportSaveAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 1:21:42 PM, May 18, 2015
 */
public class FireReportSaveAction extends FireReportBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -4120553194936172605L;
	
	/** The cperson. */
	private Person cperson;
	
	/** The pub damage m 3. */
	protected double pub_damage_m3=0.0;
	
	/** The pub damage euro. */
	protected double pub_damage_euro=0.0;
	
	/** The pub damage m 2. */
	protected double pub_damage_m2=0.0;
	
	/** The file. */
	private File file;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		cperson=getUser().getPerson();
		if(cperson==null)
			addActionError("login.user.employee.role.empty");
		
		if(fire==null)
			addActionError("");
		else{
			if(fire.getRegion()==null || (fire.getRegion()!=null && fire.getRegion().getId()==null))
				addFieldError("fire.region", getMessage("dem.fiskos.import.regionName.empty"));
			if(fire.getCadastralMunicipality()==null || (fire.getCadastralMunicipality()!=null && fire.getCadastralMunicipality().getId()==null))
				addFieldError("fire.cadastralMunicipality", getMessage("fin.input.organisation.empty"));
			if(fire.getManagementUnit()==null || (fire.getManagementUnit()!=null && fire.getManagementUnit().getId()==null))
				addFieldError("fire.managementUnit", getMessage("compartment.management.unit.id.empty"));
//			if(StringUtils.isEmpty(fire.getFireType()))
//				addFieldError("fire.fireType", getMessage("fire.fireType.empty"));
			if(fire.getOccurrenceDate()==null)
				addFieldError("fire.occurrenceDate", getMessage("fire.occurrenceDate.empty"));
			if(fire.getExtinguishDate()==null)
				addFieldError("fire.extinguishDate", getMessage("fire.extinguishDate.empty"));
//			if(StringUtils.isEmpty(fire.getExtinguishedBy()))
//				addFieldError("fire.extinguishedBy", getMessage("fire.extinguishedBy.empty"));
			
			if(!inPvtForest){
				fire.setPvtDamageEuro(null);
				fire.setPvtDamageM2(null);
				fire.setPvtDamageM3(null);
			}
			
			fireDetailsList=new ArrayList<FireDetails>();
			if(inPubForest){
				if(jsonDetails!=null && StringUtils.isNotEmpty(jsonDetails)){
					JSONArray array = (JSONArray) JSONSerializer.toJSON(jsonDetails);
					if(array.size()>0){
						for (Iterator<JSONObject> iterator = array.iterator(); iterator.hasNext();) {
							JSONObject o =  iterator.next();
							FireDetails fd=new FireDetails();
							fd.setFireReport(fire);
							
							if(o.get("fd_id")!=null && StringUtils.isNotEmpty(o.get("fd_id").toString())){
								Long id=Long.valueOf(o.get("fd_id").toString());
								fd.setId(id);
							}
							if(o.get("comp_id")!=null && StringUtils.isNotEmpty(o.get("comp_id").toString())){
								Long id=Long.valueOf(o.get("comp_id").toString());
								Compartment c=new Compartment();
								c.setId(id);
								fd.setCompartment(c);
							}else addFieldError("comp_id", getMessage("stand.compartment.id.empty"));
							
							if(o.get("stand_id")!=null && StringUtils.isNotEmpty(o.get("stand_id").toString())){
								Long id=Long.valueOf(o.get("stand_id").toString());
								Stand s=new Stand();
								s.setId(id);
								fd.setStand(s);
							}else addFieldError("stand_id", getMessage("stand.compartment.id.empty"));
							
							if(o.get("damage_m2")!=null && StringUtils.isNotEmpty(o.get("damage_m2").toString())){
								Double damageM2=Double.valueOf(o.get("damage_m2").toString());
								fd.setDamageM2(damageM2);
								pub_damage_m2+=damageM2;
							}
							
							if(o.get("damage_m3")!=null && StringUtils.isNotEmpty(o.get("damage_m3").toString())){
								Double damageM3=Double.valueOf(o.get("damage_m3").toString());
								fd.setDamageM3(damageM3);
								pub_damage_m3+=damageM3;
							}
							
							if(o.get("damage_euro")!=null && StringUtils.isNotEmpty(o.get("damage_euro").toString())){
								Double damageEuro=Double.valueOf(o.get("damage_euro").toString());
								fd.setDamageEuro(damageEuro);
								pub_damage_euro+=damageEuro;
							}
							fireDetailsList.add(fd);
						}
					}else addFieldError("fireDetails", getMessage("fireDetails.empty"));
				}else addFieldError("fireDetails", getMessage("fireDetails.empty"));
			}
		}
		
		if(!StringUtils.isEmpty(pointFire)){
			WKTReader wktReader=new WKTReader(new GeometryFactory(new PrecisionModel(), 900916));
			try {
				firePointGeometry=wktReader.read(pointFire);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			firePointGeometry.setSRID(900916);
		}
		if(!StringUtils.isEmpty(polygonFire)){
			WKTReader wktReader=new WKTReader(new GeometryFactory(new PrecisionModel(), 900916));
			try {
				firePolygonGeometry=wktReader.read(polygonFire);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			firePolygonGeometry.setSRID(900916);
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
		Long fire_id = fire.getId();
		if(fire.getId()==null){
			fire.setPerson(cperson);
			fire.setCreatedDate(new Date());
		}
		fire.setPubDamageEuro(pub_damage_euro!=0.0?pub_damage_euro:null);
		fire.setPubDamageM2(pub_damage_m2!=0.0?pub_damage_m2:null);
		fire.setPubDamageM3(pub_damage_m3!=0.0?pub_damage_m3:null);
		
		if(file!=null){
			fire.setDoc(getFileBytes(file));
		}else if(fire_id!=null){
			Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
			SQLQuery sqlQuery= session.createSQLQuery("select doc from tfrm_fire_report where id="+fire_id);
			sqlQuery.addScalar("doc");
			Object ob = sqlQuery.uniqueResult();
			fire.setDoc((byte[])ob);
		}
		User user = getUser().getUser();
		fire.setCurrentUser(user);
		DAOFactory.getFactory().getFireReportDAO().save(fire);
		
		if(!StringUtils.isEmpty(pointFire)){
			FirePoint fp=null;
			if(firePoint==null){
				fp=new FirePoint();
			}else{
				fp=firePoint;
			}
			fp.setPoint(firePointGeometry);
			fp.setFireReport(fire);
			DAOFactory.getFactory().getFirePointDAO().save(fp);
		}
		if(!StringUtils.isEmpty(polygonFire)){
			FirePolygon fpolygon=null;
			if(firePolygon==null){
				fpolygon=new FirePolygon();
			}else{
				fpolygon=firePolygon;
			}
			fpolygon.setPolygon(firePolygonGeometry);
			fpolygon.setFireReport(fire);
			DAOFactory.getFactory().getFirePolygonDAO().save(fpolygon);
		}
		
		for(FireDetails fd:fireDetailsList){
			fd.setCurrentUser(user);
			DAOFactory.getFactory().getFireDetailsDAO().save(fd);
		}
		if(fire_id!=null){
			List<FireDetails> oldDetails = DAOFactory.getFactory().getFireDetailsDAO().executeSQLQuery("select * from tfrm_fire_details where fire_report_id="+fire_id);//new ArrayList<>(fire.getFireDetailses());
			if(!fireDetailsList.equals(oldDetails)){
				for(FireDetails old:oldDetails){
					if(!fireDetailsList.contains(old)){
						old.setCurrentUser(user);
						DAOFactory.getFactory().getFireDetailsDAO().delete(old);
					}
				}
			}
		}
		
		return SUCCESS;
	}

	/**
	 * Gets the cperson.
	 *
	 * @return the cperson
	 */
	public Person getCperson() {
		return cperson;
	}

	/**
	 * Sets the cperson.
	 *
	 * @param cperson the cperson to set
	 */
	public void setCperson(Person cperson) {
		this.cperson = cperson;
	}

	/**
	 * Gets the pub damage m 3.
	 *
	 * @return the pub_damage_m3
	 */
	public double getPub_damage_m3() {
		return pub_damage_m3;
	}

	/**
	 * Sets the pub damage m 3.
	 *
	 * @param pub_damage_m3 the pub_damage_m3 to set
	 */
	public void setPub_damage_m3(double pub_damage_m3) {
		this.pub_damage_m3 = pub_damage_m3;
	}

	/**
	 * Gets the pub damage euro.
	 *
	 * @return the pub_damage_euro
	 */
	public double getPub_damage_euro() {
		return pub_damage_euro;
	}

	/**
	 * Sets the pub damage euro.
	 *
	 * @param pub_damage_euro the pub_damage_euro to set
	 */
	public void setPub_damage_euro(double pub_damage_euro) {
		this.pub_damage_euro = pub_damage_euro;
	}

	/**
	 * Gets the pub damage m 2.
	 *
	 * @return the pub_damage_m2
	 */
	public double getPub_damage_m2() {
		return pub_damage_m2;
	}

	/**
	 * Sets the pub damage m 2.
	 *
	 * @param pub_damage_m2 the pub_damage_m2 to set
	 */
	public void setPub_damage_m2(double pub_damage_m2) {
		this.pub_damage_m2 = pub_damage_m2;
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

}
