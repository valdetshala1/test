package com.geoland.kfis.persistence.hibernate.usertypes;
import javax.persistence.Entity;
import javax.persistence.Id;
import com.geoland.framework.persistence.hibernate.PersistentEnum;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Mon Jun 15 15:49:28 CEST 2015.
 */

@Entity
public enum Degree implements PersistentEnum{

/** The doctor. */
DOCTOR ("DEGREE","DOCTOR ","DOC",1,"Doktor","Doctor","Doktor"),

/** The master. */
MASTER ("DEGREE","MASTER ","MAS",2,"Master","Master","Master"),

/** The bachelor. */
BACHELOR ("DEGREE","BACHELOR ","BAC",3,"Bachelor","Bachelor","Bačelar"),

/** The high school. */
HIGH_SCHOOL("DEGREE","HIGH_SCHOOL","HSC",4,"Shkolla e mesme","High School","Srednja škola"),

/** The primary school. */
PRIMARY_SCHOOL("DEGREE","PRIMARY_SCHOOL","PSC",5,"Shkolla fillore","Primary School","Osnovna škola"),

/** The other. */
OTHER("DEGREE","OTHER","OTH",6,"Tjeter","Other","Ostalo");

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
 * Instantiates a new degree.
 *
 * @param DOMNAME the domname
 * @param DOMVALUE the domvalue
 * @param DOMKEY the domkey
 * @param SORT the sort
 * @param DOMTEXT the domtext
 * @param DOMTEXT_EN the domtext en
 * @param DOMTEXT_SR the domtext sr
 */
Degree(String DOMNAME, String DOMVALUE, String DOMKEY, Integer SORT, String DOMTEXT, String DOMTEXT_EN, String DOMTEXT_SR){
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
if(this == DOCTOR ){
return "DOC";
}else if(this == MASTER ){
return "MAS";
}else if(this == BACHELOR ){
return "BAC";
}else if(this == HIGH_SCHOOL){
return "HSC";
}else if(this == PRIMARY_SCHOOL){
return "PSC";
}else{
return "OTH";
}}

/**
 * Gets the domain.
 *
 * @param domKey the dom key
 * @return the domain
 */
public static Degree getDomain(String domKey) {
if(domKey.equals( "DOC")){
return DOCTOR ;
}else if(domKey.equals("MAS")){
return MASTER ;
}else if(domKey.equals("BAC")){
return BACHELOR ;
}else if(domKey.equals("HSC")){
return HIGH_SCHOOL;
}else if(domKey.equals("PSC")){
return PRIMARY_SCHOOL;
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
