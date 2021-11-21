package com.geoland.kfis.persistence.hibernate.usertypes;
import com.geoland.framework.persistence.hibernate.PersistentEnumUserType;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Thu Jan 28 15:38:33 CET 2016
 * 	Domain ZonetypeUserType.
 */

public class ZonetypeUserType extends PersistentEnumUserType<Zonetype>{

/* (non-Javadoc)
 * @see com.geoland.framework.persistence.hibernate.PersistentEnumUserType#returnedClass()
 */
@Override
public Class<Zonetype> returnedClass() {
return Zonetype.class;
}
}
