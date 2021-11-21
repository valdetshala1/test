package com.geoland.kfis.persistence.hibernate;

import java.io.Serializable;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.apache.log4j.Logger;
import org.hibernate.CallbackException;
import org.hibernate.EmptyInterceptor;
import org.hibernate.Transaction;
import org.hibernate.type.Type;

import com.geoland.framework.persistence.base.AbstractPersistentObject;


// TODO: Auto-generated Javadoc
/**
 * The Class AuditInterceptor.
 *
 * @author GEOLAND
 */
public class AuditInterceptor extends EmptyInterceptor {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 582549003254963262L;

	/** The log. */
	private static Logger _log = Logger.getLogger(AuditInterceptor.class);
     
     /** The inserts. */
     Set<AbstractPersistentObject> inserts = new HashSet<AbstractPersistentObject>();
	
	/** The updates. */
	private Set<AbstractPersistentObject> updates = new HashSet<AbstractPersistentObject>();
	
	/** The deletes. */
	private Set<AbstractPersistentObject> deletes = new HashSet<AbstractPersistentObject>();
	
	/** The oldies. */
	private Map<Long, AbstractPersistentObject> oldies = new HashMap<Long, AbstractPersistentObject>();

	/* (non-Javadoc)
	 * @see org.hibernate.EmptyInterceptor#onSave(java.lang.Object, java.io.Serializable, java.lang.Object[], java.lang.String[], org.hibernate.type.Type[])
	 */
	@Override
	public boolean onSave(Object entity, Serializable id, Object[] state,
			String[] propertyNames, Type[] types) throws CallbackException {
		if (entity instanceof AbstractPersistentObject){
			inserts.add((AbstractPersistentObject) entity);
		}
		return false;
	}
	
	/* (non-Javadoc)
	 * @see org.hibernate.EmptyInterceptor#onDelete(java.lang.Object, java.io.Serializable, java.lang.Object[], java.lang.String[], org.hibernate.type.Type[])
	 */
	@Override
	public void onDelete(Object entity, Serializable id, Object[] state,
			String[] propertyNames, Type[] types) {
		if (entity instanceof AbstractPersistentObject){
			deletes.add((AbstractPersistentObject) entity);
		}
	}

	/* (non-Javadoc)
	 * @see org.hibernate.EmptyInterceptor#onFlushDirty(java.lang.Object, java.io.Serializable, java.lang.Object[], java.lang.Object[], java.lang.String[], org.hibernate.type.Type[])
	 */
	@Override
	public boolean onFlushDirty(Object entity, Serializable id,
			Object[] currentState, Object[] previousState,
			String[] propertyNames, Type[] types) throws CallbackException {
		if (entity instanceof AbstractPersistentObject) {
			updates.add((AbstractPersistentObject) entity);
		}
		return false;
	}

	/*
	 * called after committed into database
	 * (non-Javadoc)
	 * @see org.hibernate.EmptyInterceptor#postFlush(java.util.Iterator)
	 */
	@SuppressWarnings("rawtypes")
	@Override
	public void postFlush(Iterator iterator) throws CallbackException {    
		try {
			if(inserts!=null && inserts.size()>0) AuditLog.audit("INSERT", inserts);
			if(inserts!=null && updates.size()>0) AuditLog.audit("UPDATE", updates);
			if(inserts!=null && deletes.size()>0) AuditLog.audit("DELETE", deletes);			
		} catch (Throwable e) {
			_log.error(e, e);
		} finally {
			inserts.clear();
			updates.clear();
			deletes.clear();
			oldies.clear();
		} 		
	}
	
	
	/* (non-Javadoc)
	 * @see org.hibernate.EmptyInterceptor#afterTransactionCompletion(org.hibernate.Transaction)
	 */
	@Override
	public void afterTransactionCompletion(Transaction tx) {
	   if ( tx.wasCommitted() ) {
			_log.debug("Transaction of Audit is committed");
         
       }
	}	

}
