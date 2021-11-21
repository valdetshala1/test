package com.geoland.kfis.persistence.dao.services;

import java.util.List;

import org.hibernate.Session;

import com.geoland.framework.persistence.dao.impl.GenericDAO;
import com.geoland.kfis.model.TextDomain;

// TODO: Auto-generated Javadoc
/**
 * The Class TextDomainDAO.
 */
public class TextDomainDAO extends GenericDAO<TextDomain, Long>{
	
	/* (non-Javadoc)
	 * @see com.geoland.framework.persistence.dao.impl.GenericDAO#setSession(org.hibernate.Session)
	 */
	@Override
	public void setSession(Session s){
		super.setSession(s);
	}
	
	/**
	 * Gets the domain.
	 *
	 * @param domName the dom name
	 * @return the domain
	 */
	public List<TextDomain> getDomain(String domName){
	//	String query="Select * from T"
		//executeSQLQuery(query)
		return null;
	}
}
