package com.geoland.kfis.logic.tree;

import java.text.SimpleDateFormat;
import java.util.Locale;

import com.geoland.framework.security.rbac.tree.Node;
import com.geoland.kfis.model.FinancialType;
import com.geoland.kfis.persistence.hibernate.usertypes.Financialtype;

import net.sf.json.JSONObject;

/**
 * The Class EconomicCodeNode.
 */
public class FinancialTypeNode extends Node<FinancialType>{
	
	/** The date format. */
	protected static SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd.MM.yyyy");
	
	/** The timestamp format. */
	protected static SimpleDateFormat TIMESTAMP_FORMAT = new SimpleDateFormat("dd.MM.yyyy HH:mm:ss");
	
	private Locale locale;
	
	/**
	 * Instantiates a new organisation node.
	 */
	public FinancialTypeNode(Locale locale){
		super();
		this.locale = locale;
	}
	
	/**
	 * Gets the JSON object.
	 *
	 * @return the JSON object
	 */
	public JSONObject getJSONObject(){
		
		String lang = locale.getLanguage();
		
		JSONObject jo = new JSONObject();
		jo.element("id", "\"" + getData().getId() + "\"");
		
		if(getData().getParent() != null){
			jo.element("parent_id", getData().getParent().getId());
		}else{
			jo.element("parent_id", "");
		}
		
		jo.element("code", getData().getCode());
		jo.element("level", getData().getLevel());
		jo.element("type", getData().getType());
		Financialtype type = getData().getType();
		if(type!=null) {
			jo.element("typeDesc", "al".equals(lang)?type.getDOMTEXT():"en".equals(lang)?type.getDOMTEXT_EN():type.getDOMTEXT_SR());
		}else {
			jo.element("typeDesc", "");
		}
		jo.element("allocation", getData().getAllocation());
		
		jo.element("name", "al".equals(lang)?getData().getNameAl():"en".equals(lang)?getData().getNameEn():getData().getNameSr());
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
