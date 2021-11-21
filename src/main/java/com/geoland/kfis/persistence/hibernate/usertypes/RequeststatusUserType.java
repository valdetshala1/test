package com.geoland.kfis.persistence.hibernate.usertypes;
import com.geoland.framework.persistence.hibernate.PersistentEnumUserType;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Wed Nov 18 11:45:54 CET 2015
 * 	Domain RequeststatusUserType.
 */

public class RequeststatusUserType extends PersistentEnumUserType<Requeststatus>{

/* (non-Javadoc)
 * @see com.geoland.framework.persistence.hibernate.PersistentEnumUserType#returnedClass()
 */
@Override
public Class<Requeststatus> returnedClass() {
return Requeststatus.class;
}
}
