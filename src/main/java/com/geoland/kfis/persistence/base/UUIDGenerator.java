package com.geoland.kfis.persistence.base;

import java.io.Serializable;
import java.util.UUID;

import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SessionImplementor;
import org.hibernate.id.IdentifierGenerator;

// TODO: Auto-generated Javadoc
/**
 * The Class UUIDGenerator.
 */
public class UUIDGenerator implements IdentifierGenerator {
	
	/** The Constant uuidGen. */
	public static final org.safehaus.uuid.UUIDGenerator uuidGen = org.safehaus.uuid.UUIDGenerator.getInstance();
	
	/* (non-Javadoc)
	 * @see org.hibernate.id.IdentifierGenerator#generate(org.hibernate.engine.spi.SessionImplementor, java.lang.Object)
	 */
	@Override
	public Serializable generate(SessionImplementor session, Object parent)
			throws HibernateException {
		//UUID u = UUID.randomUUID();
		//org.apache.commons.id.uuid.UUID
		//UUID u = UUID.fromString(uuidGen.generateTimeBasedUUID(uuidGen.getDummyAddress()).toString());
		UUID u = UUID.fromString(uuidGen.generateTimeBasedUUID().toString());
		return u;
	}

}
