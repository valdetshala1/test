package com.geoland.kfis.persistence.hibernate.usertypes;
import javax.persistence.Entity;
import javax.persistence.Id;
import com.geoland.framework.persistence.hibernate.PersistentEnum;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Mon Jun 15 15:49:28 CEST 2015.
 */

@Entity
public enum Activityfield implements PersistentEnum{

/** The harvest. */
HARVEST("ACTIVITYFIELD","HARVEST","HAR",1,"Prerja","Harvest","Seča"),

/** The silviculture. */
SILVICULTURE("ACTIVITYFIELD","SILVICULTURE","SLV",2,"Kultivimi i pyjeve","Silviculture","Gajenje šuma"),

/** The planting. */
PLANTING ("ACTIVITYFIELD","PLANTING ","PLA",3,"Pyllezimi","Planting","Pošumljavanje"),

/** The infrastructure. */
INFRASTRUCTURE("ACTIVITYFIELD","INFRASTRUCTURE","INF",4,"Infrastruktura","Infrastructure","Infrastruktura"),

/** The seedling. */
SEEDLING ("ACTIVITYFIELD","SEEDLING ","SDL",5,"Mbjellja","Seedling","Sadnja"),

/** The protection. */
PROTECTION ("ACTIVITYFIELD","PROTECTION ","PRO",6,"Mbrojtja","Protection","Zaštita"),

/** The private. */
PRIVATE("ACTIVITYFIELD","PRIVATE","PVT",7,"Private","Private","Privatno"),

/** The privaterequest. */
PRIVATEREQUEST("ACTIVITYFIELD","PRIVATEREQUEST","PRQ",7,"Kerkesa private ","Private Request","Privatni zahtevi");

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
 * Instantiates a new activityfield.
 *
 * @param DOMNAME the domname
 * @param DOMVALUE the domvalue
 * @param DOMKEY the domkey
 * @param SORT the sort
 * @param DOMTEXT the domtext
 * @param DOMTEXT_EN the domtext en
 * @param DOMTEXT_SR the domtext sr
 */
Activityfield(String DOMNAME, String DOMVALUE, String DOMKEY, Integer SORT, String DOMTEXT, String DOMTEXT_EN, String DOMTEXT_SR){
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
if(this == HARVEST){
return "HAR";
}else if(this == SILVICULTURE){
return "SLV";
}else if(this == PLANTING ){
return "PLA";
}else if(this == INFRASTRUCTURE){
return "INF";
}else if(this == SEEDLING ){
return "SDL";
}else if(this == PROTECTION ){
return "PRO";
}else if(this == PRIVATE){
return "PVT";
}else{
return "PRQ";
}}

/**
 * Gets the domain.
 *
 * @param domKey the dom key
 * @return the domain
 */
public static Activityfield getDomain(String domKey) {
if(domKey.equals( "HAR")){
return HARVEST;
}else if(domKey.equals("SLV")){
return SILVICULTURE;
}else if(domKey.equals("PLA")){
return PLANTING ;
}else if(domKey.equals("INF")){
return INFRASTRUCTURE;
}else if(domKey.equals("SDL")){
return SEEDLING ;
}else if(domKey.equals("PRO")){
return PROTECTION ;
}else if(domKey.equals("PVT")){
return PRIVATE;
}else{
return PRIVATEREQUEST;
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
