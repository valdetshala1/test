package com.geoland.kfis.persistence.hibernate.usertypes;
import javax.persistence.Entity;
import javax.persistence.Id;
import com.geoland.framework.persistence.hibernate.PersistentEnum;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Tue Jun 16 10:17:13 CEST 2015.
 */

@Entity
public enum Fininputstatus implements PersistentEnum{

/** The created. */
CREATED("FININPUTSTATUS","CREATED","CR",1,"Krijuar","Created","Created"),

/** The regionalvalidated. */
REGIONALVALIDATED("FININPUTSTATUS","REGIONALVALIDATED","RV",2,"Validuar ne regjion","Regional validated","Regional validated"),

/** The centralapproval. */
CENTRALAPPROVAL("FININPUTSTATUS","CENTRALAPPROVAL","CV",3,"Validuar ne qender","Central validated","Central validated"),

/** The rejected. */
REJECTED("FININPUTSTATUS","REJECTED","RE",4,"Refuzuar","Rejected","Rejected");

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
 * Instantiates a new fininputstatus.
 *
 * @param DOMNAME the domname
 * @param DOMVALUE the domvalue
 * @param DOMKEY the domkey
 * @param SORT the sort
 * @param DOMTEXT the domtext
 * @param DOMTEXT_EN the domtext en
 * @param DOMTEXT_SR the domtext sr
 */
Fininputstatus(String DOMNAME, String DOMVALUE, String DOMKEY, Integer SORT, String DOMTEXT, String DOMTEXT_EN, String DOMTEXT_SR){
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
if(this == CREATED){
return "CR";
}else if(this == REGIONALVALIDATED){
return "RV";
}else if(this == CENTRALAPPROVAL){
return "CV";
}else{
return "RE";
}}

/**
 * Gets the domain.
 *
 * @param domKey the dom key
 * @return the domain
 */
public static Fininputstatus getDomain(String domKey) {
if(domKey.equals( "CR")){
return CREATED;
}else if(domKey.equals("RV")){
return REGIONALVALIDATED;
}else if(domKey.equals("CV")){
return CENTRALAPPROVAL;
}else{
return REJECTED;
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
