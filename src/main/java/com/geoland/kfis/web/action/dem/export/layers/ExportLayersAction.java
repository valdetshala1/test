package com.geoland.kfis.web.action.dem.export.layers;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.StringType;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class ExportLayersAction.
 */
public class ExportLayersAction extends ExportLayersBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/**
	 * Page.
	 *
	 * @return the string
	 */
	public String page(){
		layerNames=getLayerNamesFromView();
		return "page";
	}
	
	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form(){
		layerNames=getLayerNamesFromView();
		return "form";
	}
	
	/**
	 * Gets the layer names from view.
	 *
	 * @return the layer names from view
	 */
	protected List<String> getLayerNamesFromView(){
		List<String> rez=new ArrayList<String>();
		String querylayerNames="select cast( viewname as text ) from vw_layers_export";
		Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
		SQLQuery sqlQuery=session.createSQLQuery(querylayerNames);
		sqlQuery.addScalar("viewname",StringType.INSTANCE);
		List list = sqlQuery.list();
		for (Iterator iterator = list.iterator(); iterator.hasNext();) {
			Object obj= (Object) iterator.next();
			String layerName = (String) obj;
			rez.add(layerName);
		}
		return rez;
	}
}
