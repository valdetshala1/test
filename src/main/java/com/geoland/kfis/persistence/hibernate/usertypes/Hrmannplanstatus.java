package com.geoland.kfis.persistence.hibernate.usertypes;
import javax.persistence.Entity;
import javax.persistence.Id;
import com.geoland.framework.persistence.hibernate.PersistentEnum;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Mon Jun 15 15:49:29 CEST 2015.
 */

@Entity
public enum Hrmannplanstatus implements PersistentEnum{

/** The created. */
CREATED("HRMANNPLANSTATUS","CREATED","CRE",1,"Krijuar","Created","Stvoreno"),

/** The approved. */
APPROVED("HRMANNPLANSTATUS","APPROVED","APP",2,"Aprovuar","Approved","Usvojeno"),

/** The midyear. */
MIDYEAR("HRMANNPLANSTATUS","MIDYEAR","MYE",3,"Vleresimi gjysmë vjetor","Mid year evaluation","Pologodišnja ocena"),

/** The yearevaluation. */
YEAREVALUATION("HRMANNPLANSTATUS","YEAREVALUATION","YEE",4,"Vleresimi i fundvitit","End-year evaluation","Krajgodišnja ocena");

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
 * Instantiates a new hrmannplanstatus.
 *
 * @param DOMNAME the domname
 * @param DOMVALUE the domvalue
 * @param DOMKEY the domkey
 * @param SORT the sort
 * @param DOMTEXT the domtext
 * @param DOMTEXT_EN the domtext en
 * @param DOMTEXT_SR the domtext sr
 */
Hrmannplanstatus(String DOMNAME, String DOMVALUE, String DOMKEY, Integer SORT, String DOMTEXT, String DOMTEXT_EN, String DOMTEXT_SR){
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
return "CRE";
}else if(this == APPROVED){
return "APP";
}else if(this == MIDYEAR){
return "MYE";
}else{
return "YEE";
}}

/**
 * Gets the domain.
 *
 * @param domKey the dom key
 * @return the domain
 */
public static Hrmannplanstatus getDomain(String domKey) {
if(domKey.equals( "CRE")){
return CREATED;
}else if(domKey.equals("APP")){
return APPROVED;
}else if(domKey.equals("MYE")){
return MIDYEAR;
}else{
return YEAREVALUATION;
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
