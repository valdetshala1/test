package com.geoland.kfis.persistence.hibernate.usertypes;
import javax.persistence.Entity;
import javax.persistence.Id;
import com.geoland.framework.persistence.hibernate.PersistentEnum;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Mon Jun 15 15:49:28 CEST 2015.
 */

@Entity
public enum Littercov implements PersistentEnum{

/** The littercov1. */
LITTERCOV1("LITTERCOV","LITTERCOV1","1",1,"0-2 cm","0-2 cm","0-2 cm"),

/** The littercov3. */
LITTERCOV3("LITTERCOV","LITTERCOV3","3",2,"2-4 cm","2-4 cm","2-4 cm"),

/** The littercov5. */
LITTERCOV5("LITTERCOV","LITTERCOV5","5",3,"4-6 cm","4-6 cm","4-6 cm"),

/** The littercov7. */
LITTERCOV7("LITTERCOV","LITTERCOV7","7",4,"6-8  cm","6-8  cm","6-8  cm"),

/** The littercov9. */
LITTERCOV9("LITTERCOV","LITTERCOV9","9",5,"> 8  cm","> 8 cm","> 8 cm");

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
 * Instantiates a new littercov.
 *
 * @param DOMNAME the domname
 * @param DOMVALUE the domvalue
 * @param DOMKEY the domkey
 * @param SORT the sort
 * @param DOMTEXT the domtext
 * @param DOMTEXT_EN the domtext en
 * @param DOMTEXT_SR the domtext sr
 */
Littercov(String DOMNAME, String DOMVALUE, String DOMKEY, Integer SORT, String DOMTEXT, String DOMTEXT_EN, String DOMTEXT_SR){
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
if(this == LITTERCOV1){
return "1";
}else if(this == LITTERCOV3){
return "3";
}else if(this == LITTERCOV5){
return "5";
}else if(this == LITTERCOV7){
return "7";
}else{
return "9";
}}

/**
 * Gets the domain.
 *
 * @param domKey the dom key
 * @return the domain
 */
public static Littercov getDomain(String domKey) {
if(domKey.equals( "1")){
return LITTERCOV1;
}else if(domKey.equals("3")){
return LITTERCOV3;
}else if(domKey.equals("5")){
return LITTERCOV5;
}else if(domKey.equals("7")){
return LITTERCOV7;
}else{
return LITTERCOV9;
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
