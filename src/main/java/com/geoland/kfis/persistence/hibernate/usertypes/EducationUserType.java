package com.geoland.kfis.persistence.hibernate.usertypes;
import com.geoland.framework.persistence.hibernate.PersistentEnumUserType;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Mon Jun 15 15:49:27 CEST 2015
 * 	Domain EducationUserType.
 */

public class EducationUserType extends PersistentEnumUserType<Education>{

/* (non-Javadoc)
 * @see com.geoland.framework.persistence.hibernate.PersistentEnumUserType#returnedClass()
 */
@Override
public Class<Education> returnedClass() {
return Education.class;
}
}
