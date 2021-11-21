package com.geoland.kfis.persistence.hibernate.usertypes;
import javax.persistence.Entity;
import javax.persistence.Id;
import com.geoland.framework.persistence.hibernate.PersistentEnum;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Mon Jun 15 15:49:28 CEST 2015.
 */

@Entity
public enum Operationlevel implements PersistentEnum{

/** The central. */
CENTRAL("OPERATIONLEVEL","CENTRAL","C",1,"Qendror","Central","Centralni"),

/** The regional. */
REGIONAL("OPERATIONLEVEL","REGIONAL","R",2,"Regjional","Regional","Regionalni"),

/** The municipality. */
MUNICIPALITY("OPERATIONLEVEL","MUNICIPALITY","M",3,"Komunal","Municipality","Opštinski"),

/** The locale. */
LOCALE("OPERATIONLEVEL","LOCALE","L",4,"Lokal","Locale","Lokalni"),

/** The undefined. */
UNDEFINED("OPERATIONLEVEL","UNDEFINED","X",5,"I pa definuar","Undefined","Ne odredjen");

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
 * Instantiates a new operationlevel.
 *
 * @param DOMNAME the domname
 * @param DOMVALUE the domvalue
 * @param DOMKEY the domkey
 * @param SORT the sort
 * @param DOMTEXT the domtext
 * @param DOMTEXT_EN the domtext en
 * @param DOMTEXT_SR the domtext sr
 */
Operationlevel(String DOMNAME, String DOMVALUE, String DOMKEY, Integer SORT, String DOMTEXT, String DOMTEXT_EN, String DOMTEXT_SR){
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
if(this == CENTRAL){
return "C";
}else if(this == REGIONAL){
return "R";
}else if(this == MUNICIPALITY){
return "M";
}else if(this == LOCALE){
return "L";
}else{
return "X";
}}

/**
 * Gets the domain.
 *
 * @param domKey the dom key
 * @return the domain
 */
public static Operationlevel getDomain(String domKey) {
if(domKey.equals( "C")){
return CENTRAL;
}else if(domKey.equals("R")){
return REGIONAL;
}else if(domKey.equals("M")){
return MUNICIPALITY;
}else if(domKey.equals("L")){
return LOCALE;
}else{
return UNDEFINED;
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
