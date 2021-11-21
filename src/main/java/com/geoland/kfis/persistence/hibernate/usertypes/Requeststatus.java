package com.geoland.kfis.persistence.hibernate.usertypes;
import javax.persistence.Entity;
import javax.persistence.Id;
import com.geoland.framework.persistence.hibernate.PersistentEnum;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Wed Nov 18 11:45:54 CET 2015.
 */

@Entity
public enum Requeststatus implements PersistentEnum{

/** The new. */
NEW("REQUESTSTATUS","NEW","NEW",1,"E re","New","New"),

/** The approved. */
APPROVED("REQUESTSTATUS","APPROVED","APP",2,"Aprovuar","Approved","Approved"),

/** The rejected. */
REJECTED("REQUESTSTATUS","REJECTED","REJ",3,"Refuzuar","Rejected","Rejected"),

/** The disconnected. */
DISCONNECTED("REQUESTSTATUS","DISCONNECTED","DIS",4,"Shkeputur","Disconnected","Disconnected"),

/** The completed. */
COMPLETED("REQUESTSTATUS","COMPLETED","COM",5,"Perfunduar","Completed","Completed");

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
 * Instantiates a new requeststatus.
 *
 * @param DOMNAME the domname
 * @param DOMVALUE the domvalue
 * @param DOMKEY the domkey
 * @param SORT the sort
 * @param DOMTEXT the domtext
 * @param DOMTEXT_EN the domtext en
 * @param DOMTEXT_SR the domtext sr
 */
Requeststatus(String DOMNAME, String DOMVALUE, String DOMKEY, Integer SORT, String DOMTEXT, String DOMTEXT_EN, String DOMTEXT_SR){
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
return "APP";
}else if(this == REJECTED){
return "REJ";
}else if(this == DISCONNECTED){
return "DIS";
}else{
return "COM";
}}

/**
 * Gets the domain.
 *
 * @param domKey the dom key
 * @return the domain
 */
public static Requeststatus getDomain(String domKey) {
if(domKey.equals( "NEW")){
return NEW;
}else if(domKey.equals("APP")){
return APPROVED;
}else if(domKey.equals("REJ")){
return REJECTED;
}else if(domKey.equals("DIS")){
return DISCONNECTED;
}else{
return COMPLETED;
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
