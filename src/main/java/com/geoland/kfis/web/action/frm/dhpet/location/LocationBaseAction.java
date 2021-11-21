package com.geoland.kfis.web.action.frm.dhpet.location;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.geoland.kfis.model.DhpetLocation;
import com.geoland.kfis.model.DhpetLocationLandType;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.persistence.hibernate.usertypes.Animallanduse;
import com.geoland.kfis.persistence.hibernate.usertypes.Huntingareatype;
import com.geoland.kfis.web.action.base.BaseActionSupport;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

// TODO: Auto-generated Javadoc
/**
 * The Class LocationBaseAction.
 *
 * @author Fisnik Aliu, GEO&LAND
 * @created Oct 3, 2014 11:20:31 AM
 * @Version 1.0
 */
public class LocationBaseAction extends BaseActionSupport{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -4107799477255871351L;
	
	/** The dhpet location id. */
	protected Long dhpetLocationId;
	
	/** The dhpet location. */
	protected DhpetLocation dhpetLocation;
	
	/** The table list. */
	protected String [][] tableList;
	
	/** The geometry. */
	protected String geometry;
	
	/** The huntingareatype list. */
	protected Huntingareatype[] huntingareatypeList=Huntingareatype.values();
	
	/** The private public land area. */
	protected double privatePublicLandArea=0.0;
	
	/** The hunting owner. */
	protected Person huntingOwner;

	
	/**
	 * Adds the location land type.
	 *
	 * @param jsonLocationLandType the json location land type
	 * @param location the location
	 * @return the list
	 */
	protected List<DhpetLocationLandType> addLocationLandType(String jsonLocationLandType,DhpetLocation location){
		List<DhpetLocationLandType> locationLandTypes=new ArrayList<DhpetLocationLandType>(); 
		JSONArray array= (JSONArray) JSONSerializer.toJSON(jsonLocationLandType);
		if(array.size()>0){
			for(Iterator<JSONObject> iterator = array.iterator(); iterator.hasNext();) {
				JSONObject obj=iterator.next();
				DhpetLocationLandType lt=new DhpetLocationLandType();
				if(obj.get("t_id")!=null && StringUtils.isNotEmpty(obj.getString("t_id").toString())){
					Long id=Long.valueOf(obj.get("t_id").toString());
					lt.setId(id);
				}
				if(obj.get("land_type")!=null && StringUtils.isNotEmpty(obj.get("land_type").toString())){
					String landt= obj.get("land_type").toString();
					Animallanduse[] a=Animallanduse.values();
					for(Animallanduse an:a){
						if(an.getDOMTEXT().equalsIgnoreCase(landt)){
							lt.setLandType(an);
						}
					}
				}else{
					addFieldError("land_type", getMessage("frm.dhpet.land.type.empty"));
				}	
				Double private_land_area=0.0;
				if(obj.get("private_land_area")!=null && StringUtils.isNotEmpty(obj.get("private_land_area").toString())){
					String dia= obj.get("private_land_area").toString();
					private_land_area=Double.parseDouble(dia);
					privatePublicLandArea+=private_land_area.doubleValue();
					lt.setPrivateLandArea(private_land_area);
				}else{
					addFieldError("private_land_area", getMessage("frm.dhpet.private.land.area.empty"));
				}
				Double public_land_area=0.0;
				if(obj.get("public_land_area")!=null && StringUtils.isNotEmpty(obj.get("public_land_area").toString())){
					String h= obj.get("public_land_area").toString();
				    public_land_area=Double.parseDouble(h);
				    privatePublicLandArea+=public_land_area.doubleValue();
					lt.setPublicLandArea(public_land_area);
					
				}else{
					addFieldError("height", getMessage("height.empty"));
				}
				lt.setTotalArea(public_land_area +private_land_area);
				locationLandTypes.add(lt);
			}
		}	
		return locationLandTypes;
	}
	
	
	/**
	 * Gets the dhpet location id.
	 *
	 * @return the dhpet location id
	 */
	public Long getDhpetLocationId() {
		return dhpetLocationId;
	}
	
	/**
	 * Sets the dhpet location id.
	 *
	 * @param dhpetLocationId the new dhpet location id
	 */
	public void setDhpetLocationId(Long dhpetLocationId) {
		this.dhpetLocationId = dhpetLocationId;
	}
	
	/**
	 * Gets the dhpet location.
	 *
	 * @return the dhpet location
	 */
	public DhpetLocation getDhpetLocation() {
		return dhpetLocation;
	}
	
	/**
	 * Sets the dhpet location.
	 *
	 * @param dhpetLocation the new dhpet location
	 */
	public void setDhpetLocation(DhpetLocation dhpetLocation) {
		this.dhpetLocation = dhpetLocation;
	}
	
	/**
	 * Gets the table names.
	 *
	 * @return the table names
	 */
	protected String[][] getTableNames(){
		String[][] tableName = {{"animallocation","Animals","Kafte e egra","Animals"},
				{"huntedgroundeval","Hunting Ground Evaluation","Vleresimi i Vendgjuetive","Hunting Ground Evaluation"},
				{"animalcapacity","Animal Capacity","Kapaciteti i Kafsheve te Egra","Animal Capacity"},
				{"huntedanimals","Hunted Animals","Kafshte e gjuajtura","Hunted Animals"},
				};
		return tableName;
	}
	
	/**
	 * Gets the table list.
	 *
	 * @return the table list
	 */
	public String[][] getTableList() {
		return tableList;
	}
	
	/**
	 * Sets the table list.
	 *
	 * @param tableList the new table list
	 */
	public void setTableList(String[][] tableList) {
		this.tableList = tableList;
	}
	
	/**
	 * Gets the geometry.
	 *
	 * @return the geometry
	 */
	public String getGeometry() {
		return geometry;
	}
	
	/**
	 * Sets the geometry.
	 *
	 * @param geometry the new geometry
	 */
	public void setGeometry(String geometry) {
		this.geometry = geometry;
	}
	
	/**
	 * Gets the huntingareatype list.
	 *
	 * @return the huntingareatype list
	 */
	public Huntingareatype[] getHuntingareatypeList() {
		return huntingareatypeList;
	}
	
	/**
	 * Sets the huntingareatype list.
	 *
	 * @param huntingareatypeList the new huntingareatype list
	 */
	public void setHuntingareatypeList(Huntingareatype[] huntingareatypeList) {
		this.huntingareatypeList = huntingareatypeList;
	}

	/**
	 * Gets the hunting owner.
	 *
	 * @return the hunting owner
	 */
	public Person getHuntingOwner() {
		return huntingOwner;
	}

	/**
	 * Sets the hunting owner.
	 *
	 * @param huntingOwner the new hunting owner
	 */
	public void setHuntingOwner(Person huntingOwner) {
		this.huntingOwner = huntingOwner;
	}
	
}
