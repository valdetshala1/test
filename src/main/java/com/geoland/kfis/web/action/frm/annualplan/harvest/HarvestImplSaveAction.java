package com.geoland.kfis.web.action.frm.annualplan.harvest;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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

import com.geoland.kfis.model.Person;
import com.geoland.kfis.model.StandHarvestImplDeclare;
import com.geoland.kfis.web.action.base.Constants;

// TODO: Auto-generated Javadoc
/**
 * The Class HarvestImplSaveAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Jul 3, 2015 , 8:52:45 AM
 */
public class HarvestImplSaveAction extends HarvestBaseAction {
	
	/** The person. */
	private Person person;
	
	/** The json details. */
	private String jsonDetails;
	
	/** The harv impl declare list. */
	private List<StandHarvestImplDeclare> harvImplDeclareList;
	
	/** The harv id. */
	private Long harvId;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
			person=getUser().getPerson();
			double fireVolumeTotal=0.0;
			double techVolumeTotal=0.0;
			double pulpVolumeTotal=0.0;
			if(jsonDetails!=null && StringUtils.isNotEmpty(jsonDetails)){
				JSONArray array=(JSONArray) JSONSerializer.toJSON(jsonDetails);
				if(array.size()>0){
					for (Iterator<JSONObject> iterator = array.iterator(); iterator.hasNext();) {
						JSONObject o =  iterator.next();
						StandHarvestImplDeclare hd=new StandHarvestImplDeclare();
						harvImplDeclareList=new ArrayList<StandHarvestImplDeclare>();
						hd.setStandHarvestActivity(standharvest);
						if(o.get("hd_id")!=null && StringUtils.isNotEmpty(o.get("hd_id").toString())){
							Long id=Long.valueOf(o.get("hd_id").toString());
							hd.setId(id);
						}
						if(o.get("im_tech_volume_dec")!=null && StringUtils.isNotEmpty(o.get("im_tech_volume_dec").toString())){
							Double imTechVolume=Double.valueOf(o.get("im_tech_volume_dec").toString());
							techVolumeTotal+=imTechVolume.doubleValue();
							hd.setTechVolume(imTechVolume);
						}else {
							addFieldError("harv.declare.imTechVolume",  getMessage("standharvest.impl.tech.volume.empty"));
						}
						if(o.get("im_fire_volume_dec")!=null && StringUtils.isNotEmpty(o.get("im_fire_volume_dec").toString())){
							Double imFireVolume=Double.valueOf(o.get("im_fire_volume_dec").toString());
							fireVolumeTotal+=imFireVolume.doubleValue();
							hd.setFireVolume(imFireVolume);
						}else {
							addFieldError("harv.declare.imFireVolume",  getMessage("standharvest.impl.fire.volume.empty"));
						}
						if(o.get("im_pulp_volume_dec")!=null && StringUtils.isNotEmpty(o.get("im_pulp_volume_dec").toString())){
							Double imPulpVolume=Double.valueOf(o.get("im_pulp_volume_dec").toString());
							pulpVolumeTotal+=imPulpVolume.doubleValue();
							hd.setPulpVolume(imPulpVolume);
						}else {
							addFieldError("harv.declare.imPulpVolume",  getMessage("standharvest.impl.pulp.volume.empty"));
						}
						if(o.get("im_date_dec")!=null && StringUtils.isNotEmpty(o.get("im_date_dec").toString())){
						    DateFormat df = new SimpleDateFormat("MM.dd.yyyy"); 
						    Date imDate;
						    try {
						    	imDate = df.parse(o.get("im_date_dec").toString());
						    	hd.setImDate(imDate);
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
			}
			else {
				addFieldError("harv.declare.imTechVolume",  getMessage("harv.declare.empty"));
			}
			
			if(hasMeasuredVolume(stand)) recalculateStandVolume(standharvest.getTreeSpecies().getSpeciesGroup(),stand,standharvest);
		
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
		
		
		return super.execute();
	}

	/**
	 * Gets the person.
	 *
	 * @return the person
	 */
	public Person getPerson() {
		return person;
	}

	/**
	 * Sets the person.
	 *
	 * @param person the new person
	 */
	public void setPerson(Person person) {
		this.person = person;
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
	 * Gets the harv id.
	 *
	 * @return the harv id
	 */
	public Long getHarvId() {
		return harvId;
	}

	/**
	 * Sets the harv id.
	 *
	 * @param harvId the new harv id
	 */
	public void setHarvId(Long harvId) {
		this.harvId = harvId;
	}
	

}
