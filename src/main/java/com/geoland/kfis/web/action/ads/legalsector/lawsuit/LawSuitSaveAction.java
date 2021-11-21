package com.geoland.kfis.web.action.ads.legalsector.lawsuit;

import java.io.File;
import java.io.FileInputStream;
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
import org.hibernate.type.LongType;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.LawSuit;
import com.geoland.kfis.model.LawSuitDamage;
import com.geoland.kfis.model.LawSuitStatus;
import com.geoland.kfis.model.TreeSpecies;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Lawsuitstatus;
import com.ibm.icu.util.Calendar;
// TODO: Auto-generated Javadoc

/**
 * The Class LawSuitSaveAction.
 *
 * @author ADELINA GASHI, GEO&LAND
 * @created May 30, 2014 9:35:07 AM
 * @Version 1.0
 */
public class LawSuitSaveAction extends LawSuitBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -5174528780840966163L;
	
	/** The law suit damage. */
	private List<LawSuitDamage> lawSuitDamage;
	
	/** The law suit status. */
	private LawSuitStatus lawSuitStatus;
	
	/** The employee. */
	private Employee employee;
	
	/** The totla damage. */
	private Double totla_damage = 0.0;
	
	/** The total damage euro. */
	private Double total_damage_euro = 0.0;
	
	/** The file. */
	protected File file;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
			employee=getUser().getEmployee();
			if(employee==null)
				addActionError("login.user.employee.role.empty");
			
			lawSuitDamage=new ArrayList<LawSuitDamage>();

			JSONArray array = (JSONArray) JSONSerializer.toJSON(jsonDamageDetail);
			for (Iterator<JSONObject> iterator = array.iterator(); iterator.hasNext();) {
				JSONObject obj =  iterator.next();
				LawSuitDamage lsd=new LawSuitDamage();
				lsd.setLawSuit(lawsuit);
				
				if(obj.get("lawsuit_damage_id")!=null && StringUtils.isNotEmpty(obj.get("lawsuit_damage_id").toString())){
					String id = obj.get("lawsuit_damage_id").toString();
					lsd.setId(new Long(id));
				}
				
				if(obj.get("tree_species_id")!=null && StringUtils.isNotEmpty(obj.get("tree_species_id").toString())){
					String id = obj.get("tree_species_id").toString();
					TreeSpecies ts=new TreeSpecies();
					ts.setId(new Long(id));
					lsd.setTreeSpecies(ts);
				}else{
					addFieldError("tree_species_id", getMessage("annu.prod.wood.type.wood.type.empty"));
				}
				if(obj.get("timberNumber")!=null && StringUtils.isNotEmpty(obj.get("timberNumber").toString())){
					Long timberNumber =Long.valueOf(obj.get("timberNumber").toString());
					lsd.setTimberNumber(timberNumber);
				}
				if(obj.get("timberDiameterStump")!=null && StringUtils.isNotEmpty(obj.get("timberDiameterStump").toString())){
					Double timberDiameterStump =Double.valueOf(obj.get("timberDiameterStump").toString());
					lsd.setTimberDiameterStump(timberDiameterStump);
				}
				if(obj.get("timberDiameter13")!=null && StringUtils.isNotEmpty(obj.get("timberDiameter13").toString())){
					Double timberDiameter13 =Double.valueOf(obj.get("timberDiameter13").toString());
					lsd.setTimberDiameter13(timberDiameter13);
				}
				if(obj.get("timberHeight")!=null && StringUtils.isNotEmpty(obj.get("timberHeight").toString())){
					Double timberHeight =Double.valueOf(obj.get("timberHeight").toString());
					lsd.setTimberHeight(timberHeight);
				}
				if(obj.get("volumeUnitPrice")!=null && StringUtils.isNotEmpty(obj.get("volumeUnitPrice").toString())){
					Double volumeUnitPrice =Double.valueOf(obj.get("volumeUnitPrice").toString());
					lsd.setVolumeUnitPrice(volumeUnitPrice);
				}
				if(obj.get("volumeDamage")!=null && StringUtils.isNotEmpty(obj.get("volumeDamage").toString())){
					Double volumeDamage =Double.valueOf(obj.get("volumeDamage").toString());
					lsd.setVolumeDamage(volumeDamage);
					totla_damage+=volumeDamage;
				}else addFieldError("volumeDamage", getMessage("lawsuit.volumeDamage.empty"));
				
				if(obj.get("damageEuro")!=null && StringUtils.isNotEmpty(obj.get("damageEuro").toString())){
					Double damageEuro =Double.valueOf(obj.get("damageEuro").toString());
					lsd.setDamageEuro(damageEuro);
					total_damage_euro+=damageEuro;
				}else addFieldError("damageEuro", getMessage("lawsuit.damageEuro.empty"));
					
				lawsuit.getLawSuitDamages().add(lsd);
				lawSuitDamage.add(lsd);
			}
		
			if(getLawsuit().getOrganisation().getId()==null)
				addFieldError("lawsuit.organisation.id", getMessage("lawsuit.office.empty"));
			if(getLawsuit().getSuitType()==null || StringUtils.isEmpty(getLawsuit().getSuitType().toString()))
				addFieldError("lawsuit.suitType", getMessage("lawsuit.suit.type.empty"));	
			if(getLawsuit().getOrigin()==null || StringUtils.isEmpty(getLawsuit().getOrigin().toString()))
				addFieldError("lawsuit.origin", getMessage("lawsuit.origin.empty"));
			if(getLawsuit().getDamageType()==null || StringUtils.isEmpty(getLawsuit().getDamageType().toString()))
				addFieldError("lawsuit.damageType", getMessage("lawsuit.damage.type.empty"));	
			if(StringUtils.isEmpty(getLawsuit().getName()))
				addFieldError("lawsuit.name", getMessage("organisation.orga.name.empty"));
			if(StringUtils.isEmpty(getLawsuit().getLastName()))
				addFieldError("lawsuit.lastName", getMessage("person.lastName.empty"));
			if(getLawsuit().getDate()==null)
				addFieldError("lawsuit.date", getMessage("lawsuit.date.empty"));
			if(getLawsuit().getEmployee().getId()==null)
				addFieldError("lawsuit.employee.id", getMessage("lawsuit.employee.empty"));
			if(file==null && getLawsuit()!=null  && getLawsuit().getId()==null )
				addFieldError("file", getMessage("employee.file.content.empty"));
			
			if(getLawsuit().getId()==null){
				int year = Calendar.getInstance().get(Calendar.YEAR);
				int month = Calendar.getInstance().get(Calendar.MONTH) + 1;
				Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
				SQLQuery sql=session.createSQLQuery("select * from gen_lawsuit_no("+month+","+year+")");
				sql.addScalar("gen_lawsuit_no",LongType.INSTANCE);
				Object reqNo=sql.uniqueResult();
				Long maxNo=null;
				if(reqNo!=null && !StringUtils.isEmpty(reqNo.toString())){
					maxNo=(Long)reqNo;
				}
				if(maxNo!=null){
					getLawsuit().setLawsuitNo((maxNo+1)+"/"+month+"/"+year);
				}else {
					getLawsuit().setLawsuitNo("1/"+month+"/"+year);
				}
			}
			if(StringUtils.isEmpty(getLawsuit().getLawsuitNo()))
				addFieldError("lawsuit.lawsuitNo", getMessage("lawsuit.lawsuit.no.empty"));
			
			if (!getFieldErrors().isEmpty() || !getActionErrors().isEmpty()) {
				HttpServletResponse response = ServletActionContext.getResponse();
				response.addHeader("errors_exits", "true");
			}
//			addValidationErrors(getLawSuitBo().validate());
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		LawSuit ls=getLawSuitBo().getPersistence();
		ls.setTotalDamage(totla_damage!=null?total_damage_euro:0.0);
		ls.setTotalDamageEuro(total_damage_euro!=null?total_damage_euro:0.0);
	
		User user=getUser().getUser();	
		if(ls.getId()==null){
			lawSuitStatus.setStatus(Lawsuitstatus.REPORTED);
			lawSuitStatus.setCreateDate(new Date());
			lawSuitStatus.setEmployee(employee);
			lawSuitStatus.setActive(true);
			lawSuitStatus.setLawSuit(ls);
//			ls.getLawSuitStatuses().add(lawSuitStatus);
			if(file!=null){
				byte[] bFile = new byte[(int) file.length()];
				try {
					FileInputStream fileInputStream = new FileInputStream(file);
					// convert file into array of bytes
					fileInputStream.read(bFile);
					lawSuitStatus.setDoc(bFile);
					lawSuitStatus.setDocSize(file.getTotalSpace());
					fileInputStream.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			ls.setLawSuitStatus(lawSuitStatus);
			ls.setCurrentUser(user);
			DAOFactory.getFactory().getLawSuitDAO().save(ls);
			lawSuitStatus.setCurrentUser(user);
			DAOFactory.getFactory().getLawsuitStatusDAO().save(lawSuitStatus);
			
		}else {
			ls.setCurrentUser(user);
			DAOFactory.getFactory().getLawSuitDAO().save(ls);
		}

		for(LawSuitDamage lsd: lawSuitDamage){
			lsd.setCurrentUser(user);
			DAOFactory.getFactory().getLawsuitDamageDAO().save(lsd);
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
	 * @param file the new file
	 */
	public void setFile(File file) {
		this.file = file;
	}
	
	/**
	 * Gets the law suit status.
	 *
	 * @return the law suit status
	 */
	public LawSuitStatus getLawSuitStatus() {
		return lawSuitStatus;
	}
	
	/**
	 * Sets the law suit status.
	 *
	 * @param lawSuitStatus the new law suit status
	 */
	public void setLawSuitStatus(LawSuitStatus lawSuitStatus) {
		this.lawSuitStatus = lawSuitStatus;
	}
	

}
