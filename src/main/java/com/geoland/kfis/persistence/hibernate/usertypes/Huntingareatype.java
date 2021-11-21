package com.geoland.kfis.persistence.hibernate.usertypes;
import javax.persistence.Entity;
import javax.persistence.Id;
import com.geoland.framework.persistence.hibernate.PersistentEnum;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Fri Dec 04 16:16:49 CET 2015.
 */

@Entity
public enum Huntingareatype implements PersistentEnum{

/** The privatehuntingarea. */
PRIVATEHUNTINGAREA("HUNTINGAREATYPE","PRIVATEHUNTINGAREA","PHA",1,"Vendgjueti private","Private Hunting Area","Private Hunting Area"),

/** The jointhuntingareas. */
JOINTHUNTINGAREAS("HUNTINGAREATYPE","JOINTHUNTINGAREAS","JHA",2,"Vendgjueti t� p�rbashk�ta","Joint Hunting Areas","Joint Hunting Areas"),

/** The huntareasspecialimportance. */
HUNTAREASSPECIALIMPORTANCE("HUNTINGAREATYPE","HUNTAREASSPECIALIMPORTANCE","SHA",3,"Vendgjueti me r�nd�si t� ve�ant�","Hunting Areas of Special Importance","Hunting Areas of Special Importance");

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
 * Instantiates a new huntingareatype.
 *
 * @param DOMNAME the domname
 * @param DOMVALUE the domvalue
 * @param DOMKEY the domkey
 * @param SORT the sort
 * @param DOMTEXT the domtext
 * @param DOMTEXT_EN the domtext en
 * @param DOMTEXT_SR the domtext sr
 */
Huntingareatype(String DOMNAME, String DOMVALUE, String DOMKEY, Integer SORT, String DOMTEXT, String DOMTEXT_EN, String DOMTEXT_SR){
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
if(this == PRIVATEHUNTINGAREA){
return "PHA";
}else if(this == JOINTHUNTINGAREAS){
return "JHA";
}else{
return "SHA";
}}

/**
 * Gets the domain.
 *
 * @param domKey the dom key
 * @return the domain
 */
public static Huntingareatype getDomain(String domKey) {
if(domKey.equals( "PHA")){
return PRIVATEHUNTINGAREA;
}else if(domKey.equals("JHA")){
return JOINTHUNTINGAREAS;
}else{
return HUNTAREASSPECIALIMPORTANCE;
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
