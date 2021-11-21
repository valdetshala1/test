package com.geoland.kfis.persistence.dao.services;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.ObjectNotFoundException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.LongType;
import org.hibernate.type.StringType;

import com.geoland.framework.persistence.dao.impl.GenericDAO;
import com.geoland.kfis.exception.BusinessException;
import com.geoland.kfis.model.Stand;

// TODO: Auto-generated Javadoc
/**
 * The Class StandDAO.
 *
 * @author GEO&LAND
 * @created October 10, 2014 11:19:01 PM
 * @Version 1.0
 */
public class StandDAO extends GenericDAO<Stand, Long>{
	
	/** The log. */
	private static Log log = LogFactory.getLog(ManagementUnitPeriodDAO.class);
	
	/**
	 * Gets the json feature.
	 *
	 * @param standId the stand id
	 * @return the json feature
	 */
	public String getJsonFeature(Long standId){
    	String jsonResult = null;
		Session session = getCurrentSession();
	    try{
	    	if(standId!=null){
		    	String subselect = "SELECT 'Feature' As type , ST_AsGeoJSON(v.the_geom)\\:\\:json As geometry, row_to_json((id, id)) As properties FROM tgis_stand As v where v.id = " + standId;
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
	 * Infopoint.
	 *
	 * @param query the query
	 * @return the list
	 * @throws BusinessException the business exception
	 */
	@SuppressWarnings("unchecked")
	public List<Long> infopoint(String query) throws BusinessException {
    	List<Long> result = null;
		Session session = getCurrentSession();
	    try{
			SQLQuery q = session.createSQLQuery(query);
			q.addScalar("ID", LongType.INSTANCE);
			result = q.list();	    	  
    	} catch (ObjectNotFoundException e) {
			log.error(e.getMessage(), e);
			throw new BusinessException(e);    		
		} catch (HibernateException e) {
			log.error(e.getMessage(), e);
			throw new BusinessException(e);
		}    	
		return result;
    }
	
	/**
	 * Transform.
	 *
	 * @param query the query
	 * @return the list
	 * @throws BusinessException the business exception
	 */
	@SuppressWarnings("unchecked")
	public List<String> transform(String query) throws BusinessException {
    
		List<String> result = new ArrayList<String>();
		Session session = getCurrentSession();

	    try{
			SQLQuery q = session.createSQLQuery(query);
			result = q.list();    	  
    	} catch (ObjectNotFoundException e) {
			log.error(e.getMessage(), e);
			throw new BusinessException(e);    		
		} catch (HibernateException e) {
			log.error(e.getMessage(), e);
			throw new BusinessException(e);
		} 

		return result;

    } 
}
