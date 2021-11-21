package com.geoland.kfis.persistence.hibernate.usertypes;
import javax.persistence.Entity;
import javax.persistence.Id;
import com.geoland.framework.persistence.hibernate.PersistentEnum;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Mon Jun 15 15:49:29 CEST 2015.
 */

@Entity
public enum Animaldeathcause implements PersistentEnum{

/** The hunted. */
HUNTED("ANIMALDEATHCAUSE","HUNTED","HNT",1,"Te vrara","Hunted","Odstreljeno"),

/** The roadtraffic. */
ROADTRAFFIC("ANIMALDEATHCAUSE","ROADTRAFFIC","RTR",2,"Trafik rrugor","Road Traffic","Putni saobračaj"),

/** The diseases. */
DISEASES("ANIMALDEATHCAUSE","DISEASES","DES",3,"Semundje","Diseases","Bolest"),

/** The othercause. */
OTHERCAUSE("ANIMALDEATHCAUSE","OTHERCAUSE","OCU",4,"Shkaqet tjera","Other cause","Ostali uzroci"),

/** The intrap. */
INTRAP("ANIMALDEATHCAUSE","INTRAP","ITR",5,"Ne kurth","In trap","U zamku");

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
 * Instantiates a new animaldeathcause.
 *
 * @param DOMNAME the domname
 * @param DOMVALUE the domvalue
 * @param DOMKEY the domkey
 * @param SORT the sort
 * @param DOMTEXT the domtext
 * @param DOMTEXT_EN the domtext en
 * @param DOMTEXT_SR the domtext sr
 */
Animaldeathcause(String DOMNAME, String DOMVALUE, String DOMKEY, Integer SORT, String DOMTEXT, String DOMTEXT_EN, String DOMTEXT_SR){
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
if(this == HUNTED){
return "HNT";
}else if(this == ROADTRAFFIC){
return "RTR";
}else if(this == DISEASES){
return "DES";
}else if(this == OTHERCAUSE){
return "OCU";
}else{
return "ITR";
}}

/**
 * Gets the domain.
 *
 * @param domKey the dom key
 * @return the domain
 */
public static Animaldeathcause getDomain(String domKey) {
if(domKey.equals( "HNT")){
return HUNTED;
}else if(domKey.equals("RTR")){
return ROADTRAFFIC;
}else if(domKey.equals("DES")){
return DISEASES;
}else if(domKey.equals("OCU")){
return OTHERCAUSE;
}else{
return INTRAP;
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
