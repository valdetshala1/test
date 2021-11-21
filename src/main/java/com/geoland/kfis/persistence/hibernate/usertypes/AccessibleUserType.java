package com.geoland.kfis.persistence.hibernate.usertypes;
import com.geoland.framework.persistence.hibernate.PersistentEnumUserType;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Tue Oct 06 13:42:50 CEST 2015
 * 	Domain AccessibleUserType.
 */

public class AccessibleUserType extends PersistentEnumUserType<Accessible>{

/* (non-Javadoc)
 * @see com.geoland.framework.persistence.hibernate.PersistentEnumUserType#returnedClass()
 */
@Override
public Class<Accessible> returnedClass() {
return Accessible.class;
}
}
