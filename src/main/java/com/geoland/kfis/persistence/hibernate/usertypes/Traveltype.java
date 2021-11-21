package com.geoland.kfis.persistence.hibernate.usertypes;
import javax.persistence.Entity;
import javax.persistence.Id;
import com.geoland.framework.persistence.hibernate.PersistentEnum;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Mon Jun 15 15:49:28 CEST 2015.
 */

@Entity
public enum Traveltype implements PersistentEnum{

/** The government bus. */
GOVERNMENT_BUS("TRAVELTYPE","GOVERNMENT_BUS","BG",1,"Autobus i qeverise","Government bus","Vladin autobus"),

/** The government vehicle. */
GOVERNMENT_VEHICLE("TRAVELTYPE","GOVERNMENT_VEHICLE","VG",2,"Veture e qeverise","Government vehicle","Vladino vozilo"),

/** The train. */
TRAIN("TRAVELTYPE","TRAIN","TR",3,"Tren","Train","Voz"),

/** The airplan. */
AIRPLAN("TRAVELTYPE","AIRPLAN","AP",4,"Aeroplan","Airplain","Avion"),

/** The private vehicle. */
PRIVATE_VEHICLE("TRAVELTYPE","PRIVATE_VEHICLE","PV",5,"Veture private","Private vehicle","Privatno vozilo"),

/** The other. */
OTHER("TRAVELTYPE","OTHER","OT",6,"Tjeter","Other","Ostalo");

/** The domname. */
private final String DOMNAME;

/** The domvalue. */
private final String DOMVALUE;

/** The domkey. */
private final String DOMKEY;

/** The sort. */
private final Integer SORT;

/** The domtext. */
private final String DOMTEXT;

/** The domtext en. */
private final String DOMTEXT_EN;

/** The domtext sr. */
private final String DOMTEXT_SR;

/** The name. */
@Id
public String name = toString();

/**
 * Instantiates a new traveltype.
 *
 * @param DOMNAME the domname
 * @param DOMVALUE the domvalue
 * @param DOMKEY the domkey
 * @param SORT the sort
 * @param DOMTEXT the domtext
 * @param DOMTEXT_EN the domtext en
 * @param DOMTEXT_SR the domtext sr
 */
Traveltype(String DOMNAME, String DOMVALUE, String DOMKEY, Integer SORT, String DOMTEXT, String DOMTEXT_EN, String DOMTEXT_SR){
this.DOMNAME = DOMNAME;
this.DOMVALUE = DOMVALUE;
this.DOMKEY = DOMKEY;
this.SORT = SORT;
this.DOMTEXT = DOMTEXT;
this.DOMTEXT_EN = DOMTEXT_EN;
this.DOMTEXT_SR = DOMTEXT_SR;
}

/* (non-Javadoc)
 * @see java.lang.Enum#toString()
 */
@Override
public String toString() {
if(this == GOVERNMENT_BUS){
return "BG";
}else if(this == GOVERNMENT_VEHICLE){
return "VG";
}else if(this == TRAIN){
return "TR";
}else if(this == AIRPLAN){
return "AP";
}else if(this == PRIVATE_VEHICLE){
return "PV";
}else{
return "OT";
}}

/**
 * Gets the domain.
 *
 * @param domKey the dom key
 * @return the domain
 */
public static Traveltype getDomain(String domKey) {
if(domKey.equals( "BG")){
return GOVERNMENT_BUS;
}else if(domKey.equals("VG")){
return GOVERNMENT_VEHICLE;
}else if(domKey.equals("TR")){
return TRAIN;
}else if(domKey.equals("AP")){
return AIRPLAN;
}else if(domKey.equals("PV")){
return PRIVATE_VEHICLE;
}else{
return OTHER;
}}

/* (non-Javadoc)
 * @see com.geoland.framework.persistence.hibernate.PersistentEnum#getId()
 */
@Override
public String getId() {return this.DOMKEY;}

/**
 * Gets the domname.
 *
 * @return the domname
 */
public String getDOMNAME() {return DOMNAME;}

/**
 * Gets the domvalue.
 *
 * @return the domvalue
 */
public String getDOMVALUE() {return DOMVALUE;}

/**
 * Gets the domkey.
 *
 * @return the domkey
 */
public String getDOMKEY() {return DOMKEY;}

/**
 * Gets the sort.
 *
 * @return the sort
 */
public Integer getSORT() {return SORT;}

/**
 * Gets the domtext.
 *
 * @return the domtext
 */
public String getDOMTEXT() {return DOMTEXT;}

/**
 * Gets the domtext en.
 *
 * @return the domtext en
 */
public String getDOMTEXT_EN() {return DOMTEXT_EN;}

/**
 * Gets the domtext sr.
 *
 * @return the domtext sr
 */
public String getDOMTEXT_SR() {return DOMTEXT_SR;}
}
