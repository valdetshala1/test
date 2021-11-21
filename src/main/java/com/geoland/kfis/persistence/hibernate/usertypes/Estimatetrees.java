package com.geoland.kfis.persistence.hibernate.usertypes;
import javax.persistence.Entity;
import javax.persistence.Id;
import com.geoland.framework.persistence.hibernate.PersistentEnum;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Mon Jun 15 15:49:28 CEST 2015.
 */

@Entity
public enum Estimatetrees implements PersistentEnum{

/** The estimatetrees0. */
ESTIMATETREES0("ESTIMATETREES","ESTIMATETREES0","0",1,"0","0","0"),

/** The estimatetrees500. */
ESTIMATETREES500("ESTIMATETREES","ESTIMATETREES500","500",2,"< 1000","< 1000","< 1000"),

/** The estimatetrees1500. */
ESTIMATETREES1500("ESTIMATETREES","ESTIMATETREES1500","1500",3,"1000 - 2000","1000 - 2000","1000 - 2000"),

/** The estimatetrees2500. */
ESTIMATETREES2500("ESTIMATETREES","ESTIMATETREES2500","2500",4,"2000 - 3000","2000 - 3000","2000 - 3000"),

/** The estimatetrees3500. */
ESTIMATETREES3500("ESTIMATETREES","ESTIMATETREES3500","3500",5,"> 3000","> 3000","> 3000");

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
 * Instantiates a new estimatetrees.
 *
 * @param DOMNAME the domname
 * @param DOMVALUE the domvalue
 * @param DOMKEY the domkey
 * @param SORT the sort
 * @param DOMTEXT the domtext
 * @param DOMTEXT_EN the domtext en
 * @param DOMTEXT_SR the domtext sr
 */
Estimatetrees(String DOMNAME, String DOMVALUE, String DOMKEY, Integer SORT, String DOMTEXT, String DOMTEXT_EN, String DOMTEXT_SR){
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
if(this == ESTIMATETREES0){
return "0";
}else if(this == ESTIMATETREES500){
return "500";
}else if(this == ESTIMATETREES1500){
return "1500";
}else if(this == ESTIMATETREES2500){
return "2500";
}else{
return "3500";
}}

/**
 * Gets the domain.
 *
 * @param domKey the dom key
 * @return the domain
 */
public static Estimatetrees getDomain(String domKey) {
if(domKey.equals( "0")){
return ESTIMATETREES0;
}else if(domKey.equals("500")){
return ESTIMATETREES500;
}else if(domKey.equals("1500")){
return ESTIMATETREES1500;
}else if(domKey.equals("2500")){
return ESTIMATETREES2500;
}else{
return ESTIMATETREES3500;
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
