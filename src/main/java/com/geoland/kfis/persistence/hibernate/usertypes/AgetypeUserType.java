package com.geoland.kfis.persistence.hibernate.usertypes;
import com.geoland.framework.persistence.hibernate.PersistentEnumUserType;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Mon Dec 21 16:08:34 CET 2015
 * 	Domain AgetypeUserType.
 */

public class AgetypeUserType extends PersistentEnumUserType<Agetype>{

/* (non-Javadoc)
 * @see com.geoland.framework.persistence.hibernate.PersistentEnumUserType#returnedClass()
 */
@Override
public Class<Agetype> returnedClass() {
return Agetype.class;
}
}
