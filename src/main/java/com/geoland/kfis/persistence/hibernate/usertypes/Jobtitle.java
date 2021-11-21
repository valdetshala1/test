package com.geoland.kfis.persistence.hibernate.usertypes;
import javax.persistence.Entity;
import javax.persistence.Id;
import com.geoland.framework.persistence.hibernate.PersistentEnum;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Mon Jun 15 15:49:29 CEST 2015.
 */

@Entity
public enum Jobtitle implements PersistentEnum{

/** The leadinghighlevel. */
LEADINGHIGHLEVEL("JOBTITLE","LEADINGHIGHLEVEL","LHL",1,"Niveli i larte drejtues","Leading high level","Visoko upravni nivo"),

/** The leadinglevel. */
LEADINGLEVEL("JOBTITLE","LEADINGLEVEL","LDL",2,"Niveli drejtues","Leading  level","Upravni nivo"),

/** The professionallevel. */
PROFESSIONALLEVEL("JOBTITLE","PROFESSIONALLEVEL","PRL",3,"Niveli profesional","Professional level","Profesionalni nivo"),

/** The admandtechlevel. */
ADMANDTECHLEVEL("JOBTITLE","ADMANDTECHLEVEL","ATL",4,"Niveli tekniko administrativ","Administrative and technical level","Tehničko administrativni nivo"),

/** The publicservants. */
PUBLICSERVANTS("JOBTITLE","PUBLICSERVANTS","PSV",4,"Nepunesit publik","Public servants","Javni službenici");

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
 * Instantiates a new jobtitle.
 *
 * @param DOMNAME the domname
 * @param DOMVALUE the domvalue
 * @param DOMKEY the domkey
 * @param SORT the sort
 * @param DOMTEXT the domtext
 * @param DOMTEXT_EN the domtext en
 * @param DOMTEXT_SR the domtext sr
 */
Jobtitle(String DOMNAME, String DOMVALUE, String DOMKEY, Integer SORT, String DOMTEXT, String DOMTEXT_EN, String DOMTEXT_SR){
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
if(this == LEADINGHIGHLEVEL){
return "LHL";
}else if(this == LEADINGLEVEL){
return "LDL";
}else if(this == PROFESSIONALLEVEL){
return "PRL";
}else if(this == ADMANDTECHLEVEL){
return "ATL";
}else{
return "PSV";
}}

/**
 * Gets the domain.
 *
 * @param domKey the dom key
 * @return the domain
 */
public static Jobtitle getDomain(String domKey) {
if(domKey.equals( "LHL")){
return LEADINGHIGHLEVEL;
}else if(domKey.equals("LDL")){
return LEADINGLEVEL;
}else if(domKey.equals("PRL")){
return PROFESSIONALLEVEL;
}else if(domKey.equals("ATL")){
return ADMANDTECHLEVEL;
}else{
return PUBLICSERVANTS;
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
