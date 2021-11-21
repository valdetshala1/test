package com.geoland.kfis.persistence.hibernate.usertypes;
import com.geoland.framework.persistence.hibernate.PersistentEnumUserType;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Thu Oct 22 11:27:35 CEST 2015
 * 	Domain RoadtypeUserType.
 */

public class RoadtypeUserType extends PersistentEnumUserType<Roadtype>{

/* (non-Javadoc)
 * @see com.geoland.framework.persistence.hibernate.PersistentEnumUserType#returnedClass()
 */
@Override
public Class<Roadtype> returnedClass() {
return Roadtype.class;
}
}
