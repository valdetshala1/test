package com.geoland.kfis.persistence.hibernate.usertypes;
import javax.persistence.Entity;
import javax.persistence.Id;
import com.geoland.framework.persistence.hibernate.PersistentEnum;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Mon Jun 15 15:49:28 CEST 2015.
 */

@Entity
public enum Activitystatus implements PersistentEnum{

/** The new. */
NEW("ACTIVITYSTATUS","NEW","NEW",1,"E re","New","Novo"),

/** The approved. */
APPROVED("ACTIVITYSTATUS","APPROVED","APR",2,"E aprovuar","Approved","Usvojeno"),

/** The rejected. */
REJECTED("ACTIVITYSTATUS","REJECTED","REJ",3,"E refuzuar","Rejected","Odbijeno"),

/** The reviewed. */
REVIEWED("ACTIVITYSTATUS","REVIEWED","REV",4,"E rishikuar ","Reviewed","Razmatrano"),

/** The submitted. */
SUBMITTED("ACTIVITYSTATUS","SUBMITTED","SUB",5,"Paraqit","Submit","Prijava"),

/** The published. */
PUBLISHED("ACTIVITYSTATUS","PUBLISHED","PUB",6,"E publikuar","Published","Publikovan"),

/** The replanned. */
REPLANNED("ACTIVITYSTATUS","REPLANNED","RPL",7,"E riplanifikuar","Replanning","Novo planirano"),

/** The terrain done. */
TERRAIN_DONE("ACTIVITYSTATUS","TERRAIN_DONE","TER",8,"Terren","Terrain done","Teren"),

/** The transport. */
TRANSPORT("ACTIVITYSTATUS","TRANSPORT","TRN",9,"Transport","Transport","Transport");

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
 * Instantiates a new activitystatus.
 *
 * @param DOMNAME the domname
 * @param DOMVALUE the domvalue
 * @param DOMKEY the domkey
 * @param SORT the sort
 * @param DOMTEXT the domtext
 * @param DOMTEXT_EN the domtext en
 * @param DOMTEXT_SR the domtext sr
 */
Activitystatus(String DOMNAME, String DOMVALUE, String DOMKEY, Integer SORT, String DOMTEXT, String DOMTEXT_EN, String DOMTEXT_SR){
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
if(this == NEW){
return "NEW";
}else if(this == APPROVED){
return "APR";
}else if(this == REJECTED){
return "REJ";
}else if(this == REVIEWED){
return "REV";
}else if(this == SUBMITTED){
return "SUB";
}else if(this == PUBLISHED){
return "PUB";
}else if(this == REPLANNED){
return "RPL";
}else if(this == TERRAIN_DONE){
return "TER";
}else{
return "TRN";
}}

/**
 * Gets the domain.
 *
 * @param domKey the dom key
 * @return the domain
 */
public static Activitystatus getDomain(String domKey) {
if(domKey.equals( "NEW")){
return NEW;
}else if(domKey.equals("APR")){
return APPROVED;
}else if(domKey.equals("REJ")){
return REJECTED;
}else if(domKey.equals("REV")){
return REVIEWED;
}else if(domKey.equals("SUB")){
return SUBMITTED;
}else if(domKey.equals("PUB")){
return PUBLISHED;
}else if(domKey.equals("RPL")){
return REPLANNED;
}else if(domKey.equals("TER")){
return TERRAIN_DONE;
}else{
return TRANSPORT;
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
