package com.geoland.kfis.persistence.hibernate.usertypes;
import javax.persistence.Entity;
import javax.persistence.Id;
import com.geoland.framework.persistence.hibernate.PersistentEnum;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Mon Jun 15 15:49:28 CEST 2015.
 */

@Entity
public enum Slope implements PersistentEnum{

/** The slope0. */
SLOPE0("SLOPE","SLOPE0","0",1,"0 - 25%","0-25%","0-25%"),

/** The slope3. */
SLOPE3("SLOPE","SLOPE3","3",2,"2.5 - 7.5%","2.5 - 7.5%","2.5 - 7.5%"),

/** The slope10. */
SLOPE10("SLOPE","SLOPE10","10",3,"7.5 - 12.15%","7.5 - 12.15%","7.5 - 12.15%"),

/** The slope15. */
SLOPE15("SLOPE","SLOPE15","15",4,"12.5 - 17.5%","12.5 - 17.5%","12.5 - 17.5%"),

/** The slope20. */
SLOPE20("SLOPE","SLOPE20","20",5,"17.5-22.5%","17.5-22.5%","17.5-22.5%"),

/** The slope25. */
SLOPE25("SLOPE","SLOPE25","25",6,"22.5-27.5%","22.5-27.5%","22.5-27.5%"),

/** The slope30. */
SLOPE30("SLOPE","SLOPE30","30",7,"27.5-32.5%","27.5-32.5%","27.5-32.5%"),

/** The slope35. */
SLOPE35("SLOPE","SLOPE35","35",8,"32.5-37.5%","32.5-37.5%","32.5-37.5%"),

/** The slope40. */
SLOPE40("SLOPE","SLOPE40","40",9,"37.5-42.5%","37.5-42.5%","37.5-42.5%"),

/** The slope45. */
SLOPE45("SLOPE","SLOPE45","45",10,"42.5-47.5%","42.5-47.5%","42.5-47.5%"),

/** The slope50. */
SLOPE50("SLOPE","SLOPE50","50",11,"> 47.5%","> 47.5%","> 47.5%");

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
 * Instantiates a new slope.
 *
 * @param DOMNAME the domname
 * @param DOMVALUE the domvalue
 * @param DOMKEY the domkey
 * @param SORT the sort
 * @param DOMTEXT the domtext
 * @param DOMTEXT_EN the domtext en
 * @param DOMTEXT_SR the domtext sr
 */
Slope(String DOMNAME, String DOMVALUE, String DOMKEY, Integer SORT, String DOMTEXT, String DOMTEXT_EN, String DOMTEXT_SR){
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
if(this == SLOPE0){
return "0";
}else if(this == SLOPE3){
return "3";
}else if(this == SLOPE10){
return "10";
}else if(this == SLOPE15){
return "15";
}else if(this == SLOPE20){
return "20";
}else if(this == SLOPE25){
return "25";
}else if(this == SLOPE30){
return "30";
}else if(this == SLOPE35){
return "35";
}else if(this == SLOPE40){
return "40";
}else if(this == SLOPE45){
return "45";
}else{
return "50";
}}

/**
 * Gets the domain.
 *
 * @param domKey the dom key
 * @return the domain
 */
public static Slope getDomain(String domKey) {
if(domKey.equals( "0")){
return SLOPE0;
}else if(domKey.equals("3")){
return SLOPE3;
}else if(domKey.equals("10")){
return SLOPE10;
}else if(domKey.equals("15")){
return SLOPE15;
}else if(domKey.equals("20")){
return SLOPE20;
}else if(domKey.equals("25")){
return SLOPE25;
}else if(domKey.equals("30")){
return SLOPE30;
}else if(domKey.equals("35")){
return SLOPE35;
}else if(domKey.equals("40")){
return SLOPE40;
}else if(domKey.equals("45")){
return SLOPE45;
}else{
return SLOPE50;
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
