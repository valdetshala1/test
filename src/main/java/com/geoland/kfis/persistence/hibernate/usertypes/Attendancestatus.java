package com.geoland.kfis.persistence.hibernate.usertypes;
import javax.persistence.Entity;
import javax.persistence.Id;
import com.geoland.framework.persistence.hibernate.PersistentEnum;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Mon Jun 15 15:49:28 CEST 2015.
 */

@Entity
public enum Attendancestatus implements PersistentEnum{

/** The present. */
PRESENT("ATTENDANCESTATUS","PRESENT","P",1,"Prezent","Present","Prisutan"),

/** The halfpresent. */
HALFPRESENT("ATTENDANCESTATUS","HALFPRESENT","HP",2,"Gjysme dite","Half present","Pola dana"),

/** The absent. */
ABSENT("ATTENDANCESTATUS","ABSENT","A",3,"Mungon","Absent","Odsutan"),

/** The holiday. */
HOLIDAY("ATTENDANCESTATUS","HOLIDAY","H",4,"Feste","Holiday","Praznik"),

/** The annual. */
ANNUAL("ATTENDANCESTATUS","ANNUAL","AN",5,"Pushim vjetor","Annual","Godišnji odmor"),

/** The maternity. */
MATERNITY("ATTENDANCESTATUS","MATERNITY","MT",6,"Pushim i lehonise","Maternity","Porodilno odstustvo"),

/** The medical. */
MEDICAL("ATTENDANCESTATUS","MEDICAL","ME",7,"Pushim mjekesor","Medical","Bolovanje"),

/** The absenceallowed. */
ABSENCEALLOWED("ATTENDANCESTATUS","ABSENCEALLOWED","AA",8,"Pushim i lejuar","Absence allowed","Dozvoljeni odmor"),

/** The sick. */
SICK("ATTENDANCESTATUS","SICK","S",9,"Semure","Sick","Bolesno");

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
 * Instantiates a new attendancestatus.
 *
 * @param DOMNAME the domname
 * @param DOMVALUE the domvalue
 * @param DOMKEY the domkey
 * @param SORT the sort
 * @param DOMTEXT the domtext
 * @param DOMTEXT_EN the domtext en
 * @param DOMTEXT_SR the domtext sr
 */
Attendancestatus(String DOMNAME, String DOMVALUE, String DOMKEY, Integer SORT, String DOMTEXT, String DOMTEXT_EN, String DOMTEXT_SR){
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
if(this == PRESENT){
return "P";
}else if(this == HALFPRESENT){
return "HP";
}else if(this == ABSENT){
return "A";
}else if(this == HOLIDAY){
return "H";
}else if(this == ANNUAL){
return "AN";
}else if(this == MATERNITY){
return "MT";
}else if(this == MEDICAL){
return "ME";
}else if(this == ABSENCEALLOWED){
return "AA";
}else{
return "S";
}}

/**
 * Gets the domain.
 *
 * @param domKey the dom key
 * @return the domain
 */
public static Attendancestatus getDomain(String domKey) {
if(domKey.equals( "P")){
return PRESENT;
}else if(domKey.equals("HP")){
return HALFPRESENT;
}else if(domKey.equals("A")){
return ABSENT;
}else if(domKey.equals("H")){
return HOLIDAY;
}else if(domKey.equals("AN")){
return ANNUAL;
}else if(domKey.equals("MT")){
return MATERNITY;
}else if(domKey.equals("ME")){
return MEDICAL;
}else if(domKey.equals("AA")){
return ABSENCEALLOWED;
}else{
return SICK;
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
