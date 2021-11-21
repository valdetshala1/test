package com.geoland.kfis.persistence.hibernate.usertypes;
import javax.persistence.Entity;
import javax.persistence.Id;
import com.geoland.framework.persistence.hibernate.PersistentEnum;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Mon Jun 15 15:49:27 CEST 2015.
 */

@Entity
public enum Education implements PersistentEnum{

/** The sec high school. */
SEC_HIGH_SCHOOL("EDUCATION","SEC_HIGH_SCHOOL","HS",1,"Shkolla e mesme e larte","Secondary high school","Visoka srednja škola"),

/** The highschool. */
HIGHSCHOOL("EDUCATION","HIGHSCHOOL","HW",2,"Shkolla e larte","High school","Viša škola"),

/** The bachelor. */
BACHELOR("EDUCATION","BACHELOR","MC",3,"Bachelor","Bachelor","Bačelar"),

/** The fouryears. */
FOURYEARS("EDUCATION","FOURYEARS","FY",4,"Shkollimi universitar 4 vjecar","Four year university education","Univerzitetsko obrazovanje 4 godine"),

/** The master degrees. */
MASTER_DEGREES("EDUCATION","MASTER_DEGREES","MC",5,"Master","Master Degrees","Master"),

/** The doctor of science. */
DOCTOR_OF_SCIENCE("EDUCATION","DOCTOR_OF_SCIENCE","DS",6,"Doktor shkence","Doctor of science","Doktor nauke");

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
 * Instantiates a new education.
 *
 * @param DOMNAME the domname
 * @param DOMVALUE the domvalue
 * @param DOMKEY the domkey
 * @param SORT the sort
 * @param DOMTEXT the domtext
 * @param DOMTEXT_EN the domtext en
 * @param DOMTEXT_SR the domtext sr
 */
Education(String DOMNAME, String DOMVALUE, String DOMKEY, Integer SORT, String DOMTEXT, String DOMTEXT_EN, String DOMTEXT_SR){
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
if(this == SEC_HIGH_SCHOOL){
return "HS";
}else if(this == HIGHSCHOOL){
return "HW";
}else if(this == BACHELOR){
return "MC";
}else if(this == FOURYEARS){
return "FY";
}else if(this == MASTER_DEGREES){
return "MC";
}else{
return "DS";
}}

/**
 * Gets the domain.
 *
 * @param domKey the dom key
 * @return the domain
 */
public static Education getDomain(String domKey) {
if(domKey.equals( "HS")){
return SEC_HIGH_SCHOOL;
}else if(domKey.equals("HW")){
return HIGHSCHOOL;
}else if(domKey.equals("MC")){
return BACHELOR;
}else if(domKey.equals("FY")){
return FOURYEARS;
}else if(domKey.equals("MC")){
return MASTER_DEGREES;
}else{
return DOCTOR_OF_SCIENCE;
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
