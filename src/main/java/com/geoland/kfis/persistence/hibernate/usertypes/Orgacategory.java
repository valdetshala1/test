package com.geoland.kfis.persistence.hibernate.usertypes;
import javax.persistence.Entity;
import javax.persistence.Id;
import com.geoland.framework.persistence.hibernate.PersistentEnum;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Mon Jun 15 15:49:28 CEST 2015.
 */

@Entity
public enum Orgacategory implements PersistentEnum{

/** The goverment. */
GOVERMENT("ORGACATEGORY","GOVERMENT","GOV",1,"Qeveritare","Government","Vladino"),

/** The nongovermentorganisation. */
NONGOVERMENTORGANISATION("ORGACATEGORY","NONGOVERMENTORGANISATION","NGO",2,"Jo qeveritare","Non government","Nevladino"),

/** The partner. */
PARTNER("ORGACATEGORY","PARTNER","PAR",3,"Partnere","Partner","Partner"),

/** The charities. */
CHARITIES("ORGACATEGORY","CHARITIES","CHA",4,"Bamirese","Charities","Dobrotvorstvo"),

/** The communities. */
COMMUNITIES("ORGACATEGORY","COMMUNITIES","COM",5,"Komunitete","Communities","Zajednice"),

/** The locationregion. */
LOCATIONREGION("ORGACATEGORY","LOCATIONREGION","REG",6,"Regjionale","Regional","Regionalno"),

/** The local. */
LOCAL("ORGACATEGORY","LOCAL","LOC",7,"Lokale","Local","Lokalno");

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
 * Instantiates a new orgacategory.
 *
 * @param DOMNAME the domname
 * @param DOMVALUE the domvalue
 * @param DOMKEY the domkey
 * @param SORT the sort
 * @param DOMTEXT the domtext
 * @param DOMTEXT_EN the domtext en
 * @param DOMTEXT_SR the domtext sr
 */
Orgacategory(String DOMNAME, String DOMVALUE, String DOMKEY, Integer SORT, String DOMTEXT, String DOMTEXT_EN, String DOMTEXT_SR){
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
if(this == GOVERMENT){
return "GOV";
}else if(this == NONGOVERMENTORGANISATION){
return "NGO";
}else if(this == PARTNER){
return "PAR";
}else if(this == CHARITIES){
return "CHA";
}else if(this == COMMUNITIES){
return "COM";
}else if(this == LOCATIONREGION){
return "REG";
}else{
return "LOC";
}}

/**
 * Gets the domain.
 *
 * @param domKey the dom key
 * @return the domain
 */
public static Orgacategory getDomain(String domKey) {
if(domKey.equals( "GOV")){
return GOVERMENT;
}else if(domKey.equals("NGO")){
return NONGOVERMENTORGANISATION;
}else if(domKey.equals("PAR")){
return PARTNER;
}else if(domKey.equals("CHA")){
return CHARITIES;
}else if(domKey.equals("COM")){
return COMMUNITIES;
}else if(domKey.equals("REG")){
return LOCATIONREGION;
}else{
return LOCAL;
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
