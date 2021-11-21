package com.geoland.kfis.persistence.hibernate.usertypes;
import javax.persistence.Entity;
import javax.persistence.Id;
import com.geoland.framework.persistence.hibernate.PersistentEnum;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Mon Jun 15 15:49:28 CEST 2015.
 */

@Entity
public enum Organisationtype implements PersistentEnum{

/** The organisation. */
ORGANISATION("ORGANISATIONTYPE","ORGANISATION","O",1,"Organizate","Organisation","Organizacije"),

/** The division. */
DIVISION("ORGANISATIONTYPE","DIVISION","V",2,"Divizion","Division","Divizija"),

/** The department. */
DEPARTMENT("ORGANISATIONTYPE","DEPARTMENT","D",3,"Departament","Department","Departman"),

/** The sector. */
SECTOR("ORGANISATIONTYPE","SECTOR","S",4,"Sektor","Sector","Sektor"),

/** The office. */
OFFICE("ORGANISATIONTYPE","OFFICE","W",5,"Zyre","Office","Koncelarija"),

/** The institute. */
INSTITUTE("ORGANISATIONTYPE","INSTITUTE","I",6,"Institut","Institute","Institut");

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
 * Instantiates a new organisationtype.
 *
 * @param DOMNAME the domname
 * @param DOMVALUE the domvalue
 * @param DOMKEY the domkey
 * @param SORT the sort
 * @param DOMTEXT the domtext
 * @param DOMTEXT_EN the domtext en
 * @param DOMTEXT_SR the domtext sr
 */
Organisationtype(String DOMNAME, String DOMVALUE, String DOMKEY, Integer SORT, String DOMTEXT, String DOMTEXT_EN, String DOMTEXT_SR){
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
if(this == ORGANISATION){
return "O";
}else if(this == DIVISION){
return "V";
}else if(this == DEPARTMENT){
return "D";
}else if(this == SECTOR){
return "S";
}else if(this == OFFICE){
return "W";
}else{
return "I";
}}

/**
 * Gets the domain.
 *
 * @param domKey the dom key
 * @return the domain
 */
public static Organisationtype getDomain(String domKey) {
if(domKey.equals( "O")){
return ORGANISATION;
}else if(domKey.equals("V")){
return DIVISION;
}else if(domKey.equals("D")){
return DEPARTMENT;
}else if(domKey.equals("S")){
return SECTOR;
}else if(domKey.equals("W")){
return OFFICE;
}else{
return INSTITUTE;
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
