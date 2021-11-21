package com.geoland.kfis.persistence.hibernate.usertypes;
import javax.persistence.Entity;
import javax.persistence.Id;
import com.geoland.framework.persistence.hibernate.PersistentEnum;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Mon Jun 15 15:49:27 CEST 2015.
 */

@Entity
public enum Languagelevel implements PersistentEnum{

/** The elementary prof. */
ELEMENTARY_PROF("LANGUAGELEVEL","ELEMENTARY_PROF","EP",1,"Njohuri elementare","Elementary Proficiency","Osnovno saznanje"),

/** The limited working prof. */
LIMITED_WORKING_PROF("LANGUAGELEVEL","LIMITED_WORKING_PROF","LWP",2,"Njohuri jo e mjafueshme per pune","Limited working proficiency","Nedovoljno saznanje za rad"),

/** The professional working prof. */
PROFESSIONAL_WORKING_PROF("LANGUAGELEVEL","PROFESSIONAL_WORKING_PROF","PWP",3,"Njohuri profesionale","Profesional working proficiency","Stručno saznanje"),

/** The full professional prof. */
FULL_PROFESSIONAL_PROF("LANGUAGELEVEL","FULL_PROFESSIONAL_PROF","FPP",4,"Njohuri e larte profesionale","Full profesional proficiency","Visoko stručno saznanje"),

/** The native or bilinguage prof. */
NATIVE_OR_BILINGUAGE_PROF("LANGUAGELEVEL","NATIVE_OR_BILINGUAGE_PROF","NBP",5,"Gjuhe amtare ose dygjuhesh","Native or bilanguage proficiency","Materni jezik ili dvojezično");

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
 * Instantiates a new languagelevel.
 *
 * @param DOMNAME the domname
 * @param DOMVALUE the domvalue
 * @param DOMKEY the domkey
 * @param SORT the sort
 * @param DOMTEXT the domtext
 * @param DOMTEXT_EN the domtext en
 * @param DOMTEXT_SR the domtext sr
 */
Languagelevel(String DOMNAME, String DOMVALUE, String DOMKEY, Integer SORT, String DOMTEXT, String DOMTEXT_EN, String DOMTEXT_SR){
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
if(this == ELEMENTARY_PROF){
return "EP";
}else if(this == LIMITED_WORKING_PROF){
return "LWP";
}else if(this == PROFESSIONAL_WORKING_PROF){
return "PWP";
}else if(this == FULL_PROFESSIONAL_PROF){
return "FPP";
}else{
return "NBP";
}}

/**
 * Gets the domain.
 *
 * @param domKey the dom key
 * @return the domain
 */
public static Languagelevel getDomain(String domKey) {
if(domKey.equals( "EP")){
return ELEMENTARY_PROF;
}else if(domKey.equals("LWP")){
return LIMITED_WORKING_PROF;
}else if(domKey.equals("PWP")){
return PROFESSIONAL_WORKING_PROF;
}else if(domKey.equals("FPP")){
return FULL_PROFESSIONAL_PROF;
}else{
return NATIVE_OR_BILINGUAGE_PROF;
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
