package com.geoland.kfis.persistence.hibernate.usertypes;
import com.geoland.framework.persistence.hibernate.PersistentEnumUserType;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Tue Nov 24 13:22:40 CET 2015
 * 	Domain ReporttypeUserType.
 */

public class ReporttypeUserType extends PersistentEnumUserType<Reporttype>{

/* (non-Javadoc)
 * @see com.geoland.framework.persistence.hibernate.PersistentEnumUserType#returnedClass()
 */
@Override
public Class<Reporttype> returnedClass() {
return Reporttype.class;
}
}
