package com.geoland.kfis.persistence.hibernate.usertypes;
import com.geoland.framework.persistence.hibernate.PersistentEnumUserType;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Mon Aug 15 10:12:16 CEST 2016
 * 	Domain ConfiscationtypeUserType.
 */

public class ConfiscationtypeUserType extends PersistentEnumUserType<Confiscationtype>{

/* (non-Javadoc)
 * @see com.geoland.framework.persistence.hibernate.PersistentEnumUserType#returnedClass()
 */
@Override
public Class<Confiscationtype> returnedClass() {
return Confiscationtype.class;
}
}
