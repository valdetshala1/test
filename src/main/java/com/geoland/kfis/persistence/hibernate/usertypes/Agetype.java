package com.geoland.kfis.persistence.hibernate.usertypes;
import javax.persistence.Entity;
import javax.persistence.Id;
import com.geoland.framework.persistence.hibernate.PersistentEnum;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Mon Dec 21 16:08:34 CET 2015.
 */

@Entity
public enum Agetype implements PersistentEnum{

/** The oneyearold. */
ONEYEAROLD("AGETYPE","ONEYEAROLD","ONE",1,"Nje vjeqar","One year","One year"),

/** The twoyearold. */
TWOYEAROLD("AGETYPE","TWOYEAROLD","TWO",2,"Dy vjeqar","Two years","Two years"),

/** The young. */
YOUNG("AGETYPE","YOUNG","YNG",3,"Te rinje","Young","Young"),

/** The medium. */
MEDIUM("AGETYPE","MEDIUM","MED",4,"Te mesem","Medium","Medium"),

/** The adults. */
ADULTS("AGETYPE","ADULTS","ADT",5,"Te rritur","Adults","Adults"),

/** The unknown. */
UNKNOWN("AGETYPE","UNKNOWN","UNK",6,"E panjohur","Unknown","Unknown");

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
 * Instantiates a new agetype.
 *
 * @param DOMNAME the domname
 * @param DOMVALUE the domvalue
 * @param DOMKEY the domkey
 * @param SORT the sort
 * @param DOMTEXT the domtext
 * @param DOMTEXT_EN the domtext en
 * @param DOMTEXT_SR the domtext sr
 */
Agetype(String DOMNAME, String DOMVALUE, String DOMKEY, Integer SORT, String DOMTEXT, String DOMTEXT_EN, String DOMTEXT_SR){
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
if(this == ONEYEAROLD){
return "ONE";
}else if(this == TWOYEAROLD){
return "TWO";
}else if(this == YOUNG){
return "YNG";
}else if(this == MEDIUM){
return "MED";
}else if(this == ADULTS){
return "ADT";
}else{
return "UNK";
}}

/**
 * Gets the domain.
 *
 * @param domKey the dom key
 * @return the domain
 */
public static Agetype getDomain(String domKey) {
if(domKey.equals( "ONE")){
return ONEYEAROLD;
}else if(domKey.equals("TWO")){
return TWOYEAROLD;
}else if(domKey.equals("YNG")){
return YOUNG;
}else if(domKey.equals("MED")){
return MEDIUM;
}else if(domKey.equals("ADT")){
return ADULTS;
}else{
return UNKNOWN;
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
