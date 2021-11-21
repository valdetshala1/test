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
import com.geoland.kfis.model.SeedActivity;
// TODO: Auto-generated Javadoc

/**
 * The Class SeedActivityDAO.
 *
 * @author Fisnik Aliu, GEO&LAND
 * @created Oct 20, 2014 11:31:25 AM
 * @Version 1.0
 */
public class SeedActivityDAO extends GenericDAO<SeedActivity,Long>{
	
	
	/** The log. */
	private static Log log = LogFactory.getLog(SeedActivityDAO.class);
	
	
	/**
	 * Gets the json feature.
	 *
	 * @param seedId the seed id
	 * @return the json feature
	 */
	public String getJsonFeature(Long seedId){
    	String jsonResult = null;
		Session session = getCurrentSession();
	    try{
	    	if(seedId!=null){
		    	String subselect = "SELECT 'Feature' As type , ST_AsGeoJSON(a.planed_geom)\\:\\:json As geometry, row_to_json((s.id, s.id)) As properties FROM tfrm_seed_activity as s LEFT JOIN tfrm_activity as a on a.id=s.activity_id where s.id = " + seedId;
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
	
	/**
	 * Gets the impl json feature.
	 *
	 * @param seedId the seed id
	 * @return the impl json feature
	 */
	public String getImplJsonFeature(Long seedId){
    	String jsonResult = null;
		Session session = getCurrentSession();
	    try{
	    	if(seedId!=null){
		    	String subselect = "SELECT 'Feature' As type , ST_AsGeoJSON(a.implemented_geom)\\:\\:json As geometry, row_to_json((s.id, s.id)) As properties FROM tfrm_seed_activity as s LEFT JOIN tfrm_activity as a on a.id=s.activity_id where s.id = " + seedId;
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
