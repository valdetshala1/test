package com.geoland.kfis.persistence.hibernate.usertypes;
import com.geoland.framework.persistence.hibernate.PersistentEnumUserType;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Mon Oct 05 13:53:06 CEST 2015.
 */
public class StandtypeUserType extends PersistentEnumUserType<Standtype>{

/* (non-Javadoc)
 * @see com.geoland.framework.persistence.hibernate.PersistentEnumUserType#returnedClass()
 */
@Override
public Class<Standtype> returnedClass() {
return Standtype.class;
}
}
