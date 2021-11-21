package com.geoland.kfis.persistence.dao.services;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.ObjectNotFoundException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.StringType;

import com.geoland.framework.persistence.dao.impl.GenericDAO;
import com.geoland.kfis.exception.BusinessException;
import com.geoland.kfis.model.ParcelDetail;
// TODO: Auto-generated Javadoc

/**
 * The Class ParcelDetailDAO.
 *
 * @author Adelina Gashi, GEO&LAND
 * @version 1.0
 * @created 2:46:59 PM Jan 19, 2016
 */
public class ParcelDetailDAO extends GenericDAO<ParcelDetail, Long>{

	/** The log. */
	private static Log log = LogFactory.getLog(ManagementUnitPeriodDAO.class);
	
	/**
	 * Gets the json feature parcel.
	 *
	 * @param cadParcId the cad parc id
	 * @return the json feature parcel
	 */
	public String getJsonFeatureParcel(String  cadParcId){
    	String jsonResult = null;
		Session session = getCurrentSession();
	    try{
	    	if(!StringUtils.isEmpty(cadParcId)){
		    	String subselect = "SELECT 'Feature' As type , ST_AsGeoJSON(p.geom)\\:\\:json As geometry, row_to_json((p.id, p.id)) As properties FROM  tgis_parcelgeom p   where p.cadparcelid ilike '" + cadParcId+"'";
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
