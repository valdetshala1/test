package com.geoland.kfis.persistence.hibernate.usertypes;
import com.geoland.framework.persistence.hibernate.PersistentEnumUserType;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Mon Jun 15 15:49:27 CEST 2015
 * 	Domain OrganisationUserType.
 */

public class OrganisationUserType extends PersistentEnumUserType<Organisation>{

/* (non-Javadoc)
 * @see com.geoland.framework.persistence.hibernate.PersistentEnumUserType#returnedClass()
 */
@Override
public Class<Organisation> returnedClass() {
return Organisation.class;
}
}
