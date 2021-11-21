package com.geoland.kfis.persistence.hibernate.usertypes;
import javax.persistence.Entity;
import javax.persistence.Id;
import com.geoland.framework.persistence.hibernate.PersistentEnum;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Tue Oct 06 13:42:50 CEST 2015.
 */

@Entity
public enum Accessible implements PersistentEnum{

/** The accessible1. */
ACCESSIBLE1("ACCESSIBLE","ACCESSIBLE1","1",1,"Arritshem","Achievable","Dostupan"),

/** The accessible2. */
ACCESSIBLE2("ACCESSIBLE","ACCESSIBLE2","2",2,"Veshtire e arritshme","Hardly achievable","TeÅ¡ko dostupan"),

/** The accessible3. */
ACCESSIBLE3("ACCESSIBLE","ACCESSIBLE3","3",3,"Jo e arritshme","Not achievable","Nedostupan"),

/** The accessible0. */
ACCESSIBLE0("ACCESSIBLE","ACCESSIBLE0","0",4,"E panjohur","Unkonwn","Unkonwn");

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
 * Instantiates a new accessible.
 *
 * @param DOMNAME the domname
 * @param DOMVALUE the domvalue
 * @param DOMKEY the domkey
 * @param SORT the sort
 * @param DOMTEXT the domtext
 * @param DOMTEXT_EN the domtext en
 * @param DOMTEXT_SR the domtext sr
 */
Accessible(String DOMNAME, String DOMVALUE, String DOMKEY, Integer SORT, String DOMTEXT, String DOMTEXT_EN, String DOMTEXT_SR){
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
if(this == ACCESSIBLE1){
return "1";
}else if(this == ACCESSIBLE2){
return "2";
}else if(this == ACCESSIBLE3){
return "3";
}else{
return "0";
}}

/**
 * Gets the domain.
 *
 * @param domKey the dom key
 * @return the domain
 */
public static Accessible getDomain(String domKey) {
if(domKey.equals( "1")){
return ACCESSIBLE1;
}else if(domKey.equals("2")){
return ACCESSIBLE2;
}else if(domKey.equals("3")){
return ACCESSIBLE3;
}else{
return ACCESSIBLE0;
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
