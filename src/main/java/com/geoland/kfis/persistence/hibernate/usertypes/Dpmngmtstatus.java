package com.geoland.kfis.persistence.hibernate.usertypes;
import javax.persistence.Entity;
import javax.persistence.Id;
import com.geoland.framework.persistence.hibernate.PersistentEnum;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Mon Jun 15 15:49:29 CEST 2015.
 */

@Entity
public enum Dpmngmtstatus implements PersistentEnum{

/** The new. */
NEW("DPMNGMTSTATUS","NEW","NEW",1,"I ri","New","Mlad"),

/** The received. */
RECEIVED("DPMNGMTSTATUS","RECEIVED","REC",2,"I pranuar","Received","Primljen"),

/** The shipped. */
SHIPPED("DPMNGMTSTATUS","SHIPPED","SHP",3,"Derguar","Shipped","Slato"),

/** The forwarded. */
FORWARDED("DPMNGMTSTATUS","FORWARDED","FWD",4,"Percjellur","Forwarded","Ispračeno"),

/** The posted. */
POSTED("DPMNGMTSTATUS","POSTED","PST",5,"Publikuar","Posted","Objavljen");

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
 * Instantiates a new dpmngmtstatus.
 *
 * @param DOMNAME the domname
 * @param DOMVALUE the domvalue
 * @param DOMKEY the domkey
 * @param SORT the sort
 * @param DOMTEXT the domtext
 * @param DOMTEXT_EN the domtext en
 * @param DOMTEXT_SR the domtext sr
 */
Dpmngmtstatus(String DOMNAME, String DOMVALUE, String DOMKEY, Integer SORT, String DOMTEXT, String DOMTEXT_EN, String DOMTEXT_SR){
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
}else if(this == RECEIVED){
return "REC";
}else if(this == SHIPPED){
return "SHP";
}else if(this == FORWARDED){
return "FWD";
}else{
return "PST";
}}

/**
 * Gets the domain.
 *
 * @param domKey the dom key
 * @return the domain
 */
public static Dpmngmtstatus getDomain(String domKey) {
if(domKey.equals( "NEW")){
return NEW;
}else if(domKey.equals("REC")){
return RECEIVED;
}else if(domKey.equals("SHP")){
return SHIPPED;
}else if(domKey.equals("FWD")){
return FORWARDED;
}else{
return POSTED;
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
