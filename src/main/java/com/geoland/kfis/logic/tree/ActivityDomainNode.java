package com.geoland.kfis.logic.tree;

import java.text.SimpleDateFormat;

import net.sf.json.JSONObject;

import com.geoland.framework.security.rbac.tree.Node;
import com.geoland.kfis.model.ActivityDomain;

// TODO: Auto-generated Javadoc
/**
 * The Class ActivityDomainNode.
 */
public class ActivityDomainNode extends Node<ActivityDomain>{
	
	/** The date format. */
	protected static SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd.MM.yyyy");
	
	/** The timestamp format. */
	protected static SimpleDateFormat TIMESTAMP_FORMAT = new SimpleDateFormat("dd.MM.yyyy HH:mm:ss");
	
	/**
	 * Instantiates a new activity domain node.
	 */
	public ActivityDomainNode(){
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
		
		if(getData().getActivityDomain() != null){
			jo.element("parent_id", getData().getActivityDomain().getId());
		}else{
			jo.element("parent_id", "");
		}
		jo.element("name_al", getData().getNameAl());
		jo.element("name_en", getData().getNameEn());
		jo.element("name_sr", getData().getNameSr());
		jo.element("type", getData().getType());
		jo.element("code", getData().getCode());
		
		if(getData().getActivityDomain() != null){
			jo.element("parent", "\"" + getData().getActivityDomain().getId()+ "\"");
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
