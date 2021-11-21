package com.geoland.kfis.persistence.hibernate.usertypes;
import com.geoland.framework.persistence.hibernate.PersistentEnumUserType;


/**
*	Domain generated Wed Mar 18 15:02:46 CET 2020
*	Domain FincategoryUserType
*/

public class FincategoryUserType extends PersistentEnumUserType<Fincategory>{
@Override
public Class<Fincategory> returnedClass() {
return Fincategory.class;
}
}
