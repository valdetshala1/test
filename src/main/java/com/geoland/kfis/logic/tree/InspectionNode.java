package com.geoland.kfis.logic.tree;

import java.text.SimpleDateFormat;

import net.sf.json.JSONObject;

import com.geoland.framework.security.rbac.tree.Node;
import com.geoland.kfis.model.Inspection;

// TODO: Auto-generated Javadoc
/**
 * The Class InspectionNode.
 */
public class InspectionNode extends Node<Inspection>{
	
	/** The date format. */
	protected static SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd.MM.yyyy");
	
	/** The timestamp format. */
	protected static SimpleDateFormat TIMESTAMP_FORMAT = new SimpleDateFormat("dd.MM.yyyy HH:mm:ss");
	
	/** The language. */
	protected String language="";
	
	/**
	 * Instantiates a new inspection node.
	 *
	 * @param language the language
	 */
	public InspectionNode(String language){
		super();
		this.language=language;
	}
	
	/**
	 * Instantiates a new inspection node.
	 */
	public InspectionNode(){
		super();
	}
	
	/**
	 * Gets the JSON object.
	 *
	 * @return the JSON object
	 */
	public JSONObject getJSONObject(){
		JSONObject jo = new JSONObject();
		jo.element("id", "\"" + getData().getId() + "\"");
		
//		
		if(getData().getInspection() != null){
			jo.element("parent_id", getData().getInspection().getId());
		}else{
			jo.element("parent_id", "");
		}
		
		jo.element("inspection_no", getData().getInspectionNo());
		jo.element("procesverbal", getData().getProcesverbal());
		jo.element("procesverbal_no", getData().getProcesverbalNo());
		jo.element("procesverbal_note", getData().getProcesverbalNote());
		jo.element("sequestration", getData().getSequestration());
		jo.element("seq_teach_volume", getData().getSeqTeachVolume());
		jo.element("seq_fire_volume", getData().getSeqFireVolume());
		jo.element("seq_note", getData().getSeqNote());
		jo.element("charges", getData().getCharges());
		
		jo.element("charges_ref_no", getData().getChargesRefNo());
		jo.element("charges_note", getData().getChargesNote());
		
		if(getData().getChargesType()!=null){
			if(language.equals("en"))
				jo.element("charges_type", getData().getChargesType().getDOMTEXT_EN());
			else if(language.equals("al"))
				jo.element("charges_type", getData().getChargesType().getDOMTEXT());
			else if(language.equals("sr"))
				jo.element("charges_type", getData().getChargesType().getDOMTEXT_SR());
			
		}else {
			jo.element("charges_type", "");
			}
		
		if(getData().getInspectionType()!=null){
			if(language.equals("en"))
				jo.element("inspection_type", getData().getInspectionType().getDOMTEXT_EN());
			else if(language.equals("al"))
				jo.element("inspection_type", getData().getInspectionType().getDOMTEXT());
			else if(language.equals("sr"))
				jo.element("inspection_type", getData().getInspectionType().getDOMTEXT_SR());
			
		}else {
			jo.element("inspection_type", "");
			}
		
		if(getData().getRegion()!=null){
			if(language.equals("en"))
				jo.element("region_name", getData().getRegion().getNameEn());
			else if(language.equals("al"))
				jo.element("region_name",getData().getRegion().getName());
			else if(language.equals("sr"))
				jo.element("region_name",getData().getRegion().getNameSr());
			
		}
		else {
			jo.element("region_name", "");
			
		}
		if(getData().getCadastralMunicipality()!=null){
			if(language.equals("en"))
				jo.element("mun_name",getData().getCadastralMunicipality().getNameEn());
			else if(language.equals("al"))
				jo.element("mun_name", getData().getCadastralMunicipality().getName());
			else if(language.equals("sr"))
				jo.element("mun_name", getData().getCadastralMunicipality().getNameSr());	
		}
		else {
			jo.element("mun_name", "");
		}
		
		
		if(getData().getInspActionType()!=null){
			if(language.equals("en"))
				jo.element("type_action", getData().getInspActionType().getNameEn());
			else if(language.equals("al"))
				jo.element("type_action", getData().getInspActionType().getNameAl());
			else if(language.equals("sr"))
				jo.element("type_action", getData().getInspActionType().getNameSr());	
		}
		else {
			jo.element("type_action", "");
		}
		
		jo.element("contact_person", getData().getContactPerson());	
		if(getData().getDate()!=null)
			jo.element("inspection_date",DATE_FORMAT.format(getData().getDate()));	
		else 
			jo.element("inspection_date","");
		if(getData().getCreatedDate()!=null)
			jo.element("created_date",DATE_FORMAT.format(getData().getCreatedDate()));	
		else 
			jo.element("created_date","");
		jo.element("created_by",getData().getEmployee().getFirstName()+" "+getData().getEmployee().getLastName());
		jo.element("notes", getData().getNotes());
		if(getData().getInspection() != null){
			jo.element("parent", "\"" + getData().getInspection().getId() + "\"");
		}else{
			jo.element("parent", "");
		}
		jo.element("level", getLevel());	
		
		if(getChildCount() <= 0){
			jo.element("isLeaf", true);
		}
		else {
			jo.element("isLeaf", false);
		}		
		jo.element("expanded", true);
		jo.element("loaded", true);
		
		return jo;
	}
}
