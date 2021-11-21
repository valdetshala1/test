package com.geoland.kfis.logic.tree;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.geoland.framework.security.rbac.tree.Node;
import com.geoland.kfis.model.EconomicCode;

import net.sf.json.JSONObject;

/**
 * The Class EconomicCodeNode.
 */
public class EconomicCodeNode extends Node<EconomicCode>{
	
	/** The date format. */
	protected static SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd.MM.yyyy");
	
	/** The timestamp format. */
	protected static SimpleDateFormat TIMESTAMP_FORMAT = new SimpleDateFormat("dd.MM.yyyy HH:mm:ss");
	
	/**
	 * Instantiates a new organisation node.
	 */
	public EconomicCodeNode(){
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
		
		if(getData().getParent() != null){
			jo.element("parent_id", getData().getParent().getId());
		}else{
			jo.element("parent_id", "");
		}
		
		jo.element("code", getData().getCode());
		jo.element("level", getData().getLevel());
		//jo.element("level", getData().gett);
		jo.element("allocation", getData().getAllocation());
		jo.element("name_al", getData().getNameAl());
		jo.element("name_en", getData().getNameEn());
		jo.element("name_sr", getData().getNameSr());
		jo.element("path", getData().getPath());
		String createdDate = DATE_FORMAT.format(getData().getCreatedDate());
		jo.element("created_date", createdDate);
		jo.element("notes", getData().getNotes());
		
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
