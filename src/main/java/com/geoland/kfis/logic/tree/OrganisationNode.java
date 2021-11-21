package com.geoland.kfis.logic.tree;

import java.text.SimpleDateFormat;
import java.util.Iterator;

import net.sf.json.JSONObject;

import com.geoland.framework.security.rbac.tree.Node;
import com.geoland.kfis.model.Organisation;
import com.geoland.kfis.model.OrganisationMun;

// TODO: Auto-generated Javadoc
/**
 * The Class OrganisationNode.
 */
public class OrganisationNode extends Node<Organisation>{
	
	/** The date format. */
	protected static SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd.MM.yyyy");
	
	/** The timestamp format. */
	protected static SimpleDateFormat TIMESTAMP_FORMAT = new SimpleDateFormat("dd.MM.yyyy HH:mm:ss");
	
	/**
	 * Instantiates a new organisation node.
	 */
	public OrganisationNode(){
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
		
		if(getData().getParty() != null){
			jo.element("parent_id", getData().getParty().getId());
			jo.element("party_type", getData().getParty().getPartyType());
		}else{
			jo.element("parent_id", "");
			jo.element("party_type", "");
		}
		
		jo.element("orga_name", getData().getOrgaName());
		jo.element("orga_name_en", getData().getOrgaNameEn());
		jo.element("orga_name_sr", getData().getOrgaNameSr());
		jo.element("orga_type", getData().getOrgaType());
		
		jo.element("code", getData().getCode());
		jo.element("op_level", getData().getOperLevelVal());
		jo.element("op_level_val", getData().getOperLevelVal());
		jo.element("orga_category", getData().getOrgaCategory());
		jo.element("active", getData().getActive());
		
		StringBuffer buf = new StringBuffer();
		for (Iterator<OrganisationMun> iterator = getData().getOrganisationMuns().iterator(); iterator.hasNext();) {
			OrganisationMun next = iterator.next();
			buf.append(next.getCadastralMunicipality().getName());
			if(iterator.hasNext()){
				buf.append(", ");
			}
		}

		jo.element("municipality", buf.toString());
		
		if(getData().getStartDate()!=null)
			jo.element("start_date", DATE_FORMAT.format(getData().getStartDate()));
		else 
			jo.element("start_date", "");
		
		if(getData().getEndDate()!=null)
			jo.element("end_date", DATE_FORMAT.format(getData().getEndDate()));
		else
			jo.element("end_date", "");
			
		if(getData().getParty() != null){
			jo.element("parent", "\"" + getData().getParty().getId() + "\"");
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
