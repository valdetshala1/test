package com.geoland.kfis.persistence.hibernate.usertypes;
import com.geoland.framework.persistence.hibernate.PersistentEnumUserType;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Mon Jun 15 15:49:28 CEST 2015
 * 	Domain OrganisationtypeUserType.
 */

public class OrganisationtypeUserType extends PersistentEnumUserType<Organisationtype>{

/* (non-Javadoc)
 * @see com.geoland.framework.persistence.hibernate.PersistentEnumUserType#returnedClass()
 */
@Override
public Class<Organisationtype> returnedClass() {
return Organisationtype.class;
}
}
