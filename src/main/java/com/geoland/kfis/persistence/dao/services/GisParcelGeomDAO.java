package com.geoland.kfis.persistence.dao.services;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.ObjectNotFoundException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.StringType;

import com.geoland.framework.persistence.dao.impl.GenericDAO;
import com.geoland.kfis.exception.BusinessException;
import com.geoland.kfis.model.GisParcelGeom;
// TODO: Auto-generated Javadoc

/**
 * The Class GisParcelGeomDAO.
 *
 * @author Adelina Gashi, GEO&LAND
 * @version 1.0
 * @created 2:46:59 PM Jan 19, 2016
 */
public class GisParcelGeomDAO extends GenericDAO<GisParcelGeom, Long>{
	
	/** The log. */
	private static Log log = LogFactory.getLog(ManagementUnitPeriodDAO.class);

	/**
	 * Gets the parcel geom.
	 *
	 * @param cadparcelid the cadparcelid
	 * @return the parcel geom
	 */
	public String getParcelGeom(String cadparcelid){
		
    	String jsonResult = null;
		Session session = getCurrentSession();
	    try{
	    	if(cadparcelid!=null){
		    	String subselect = "SELECT 'Feature' As type , ST_AsGeoJSON(v.geom)\\:\\:json As geometry, row_to_json((id, id)) As properties FROM tgis_parcelgeom As v where v.cadparcelid ilike " +cadparcelid ;
		    	String query = "SELECT row_to_json(fc) as json FROM ( SELECT 'FeatureCollection' As type, array_to_json(array_agg(f)) As features FROM (" + subselect + ") As f )  As fc;";
				SQLQuery q = session.createSQLQuery(query);
				q.addScalar("json", StringType.INSTANCE);
				jsonResult = (String) q.uniqueResult();	    
	    	}
    	} catch (ObjectNotFoundException e) {
			log.error(e.getMessage(), e);
			throw new BusinessException(e);    		
		} catch (HibernateException e) {
			log.error(e.getMessage(), e);
			throw new BusinessException(e);
		}    	
    	

		return jsonResult;		
	}
}
