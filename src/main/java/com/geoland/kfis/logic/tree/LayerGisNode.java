package com.geoland.kfis.logic.tree;

import java.text.SimpleDateFormat;
import java.util.Iterator;

import net.sf.json.JSONObject;

import com.geoland.framework.security.rbac.tree.Node;
import com.geoland.kfis.model.LayersGis;
import com.geoland.kfis.model.Organisation;
import com.geoland.kfis.model.OrganisationMun;

// TODO: Auto-generated Javadoc
/**
 * The Class LayerGisNode.
 */
public class LayerGisNode extends Node<LayersGis>{
	
	/** The date format. */
	protected static SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd.MM.yyyy");
	
	/** The timestamp format. */
	protected static SimpleDateFormat TIMESTAMP_FORMAT = new SimpleDateFormat("dd.MM.yyyy HH:mm:ss");
	
	/**
	 * Instantiates a new layer gis node.
	 */
	public LayerGisNode(){
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
		
		if(getData().getLayersGis() != null){
			jo.element("parent_id", getData().getLayersGis().getId());
		}else{
			jo.element("parent_id", "");
		}
		
		jo.element("store", getData().getStore());

		return jo;
	}
}
