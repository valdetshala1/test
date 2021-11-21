package com.geoland.kfis.persistence.hibernate.usertypes;
import com.geoland.framework.persistence.hibernate.PersistentEnumUserType;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Fri Dec 18 16:31:54 CET 2015
 * 	Domain PeriodtypeUserType.
 */

public class PeriodtypeUserType extends PersistentEnumUserType<Periodtype>{

/* (non-Javadoc)
 * @see com.geoland.framework.persistence.hibernate.PersistentEnumUserType#returnedClass()
 */
@Override
public Class<Periodtype> returnedClass() {
return Periodtype.class;
}
}
