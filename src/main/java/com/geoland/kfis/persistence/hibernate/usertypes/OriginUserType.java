package com.geoland.kfis.persistence.hibernate.usertypes;
import com.geoland.framework.persistence.hibernate.PersistentEnumUserType;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Tue Oct 06 13:58:08 CEST 2015
 * 	Domain OriginUserType.
 */

public class OriginUserType extends PersistentEnumUserType<Origin>{

/* (non-Javadoc)
 * @see com.geoland.framework.persistence.hibernate.PersistentEnumUserType#returnedClass()
 */
@Override
public Class<Origin> returnedClass() {
return Origin.class;
}
}
