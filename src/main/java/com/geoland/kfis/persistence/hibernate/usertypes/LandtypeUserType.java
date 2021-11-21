package com.geoland.kfis.persistence.hibernate.usertypes;
import com.geoland.framework.persistence.hibernate.PersistentEnumUserType;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Fri Dec 04 16:16:49 CET 2015
 * 	Domain LandtypeUserType.
 */

public class LandtypeUserType extends PersistentEnumUserType<Landtype>{

/* (non-Javadoc)
 * @see com.geoland.framework.persistence.hibernate.PersistentEnumUserType#returnedClass()
 */
@Override
public Class<Landtype> returnedClass() {
return Landtype.class;
}
}
