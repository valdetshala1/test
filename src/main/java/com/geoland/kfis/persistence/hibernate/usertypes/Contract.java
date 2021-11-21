package com.geoland.kfis.persistence.hibernate.usertypes;
import javax.persistence.Entity;
import javax.persistence.Id;
import com.geoland.framework.persistence.hibernate.PersistentEnum;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Mon Jun 15 15:49:28 CEST 2015.
 */

@Entity
public enum Contract implements PersistentEnum{

/** The full time contract. */
FULL_TIME_CONTRACT("CONTRACT","FULL_TIME_CONTRACT","FTC",1,"Akt-emerim i perhershem","Full time contract","Akt-stalnog imenovanja"),

/** The part time contract. */
PART_TIME_CONTRACT("CONTRACT","PART_TIME_CONTRACT","PTC",2,"Akt-emerim jo i perhereshem","Part time contract","Akt-nestalnog imenovanja"),

/** The full time permanent. */
FULL_TIME_PERMANENT("CONTRACT","FULL_TIME_PERMANENT","FTP",3,"Kontrate pune me afat te caktuar","Full time permanent","Radni ugovor za odredjeni rok"),

/** The part time permanent. */
PART_TIME_PERMANENT("CONTRACT","PART_TIME_PERMANENT","PTP",4,"Kontrate pune me afat te pacaktuar","Part time permanent","Radni ugovor za neodredjeni rok"),

/** The recruit. */
RECRUIT("CONTRACT","RECRUIT","REC",5,"Kontrate pune per pune specifike","Recruit","Radni ugovor za specifičan rad"),

/** The specialserviceagreement. */
SPECIALSERVICEAGREEMENT("CONTRACT","SPECIALSERVICEAGREEMENT","SSA",6,"Marreveshje per sherbime te vecanta","Special Service Agreement","Sporazum za zajedničke usluge");

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
 * Instantiates a new contract.
 *
 * @param DOMNAME the domname
 * @param DOMVALUE the domvalue
 * @param DOMKEY the domkey
 * @param SORT the sort
 * @param DOMTEXT the domtext
 * @param DOMTEXT_EN the domtext en
 * @param DOMTEXT_SR the domtext sr
 */
Contract(String DOMNAME, String DOMVALUE, String DOMKEY, Integer SORT, String DOMTEXT, String DOMTEXT_EN, String DOMTEXT_SR){
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
if(this == FULL_TIME_CONTRACT){
return "FTC";
}else if(this == PART_TIME_CONTRACT){
return "PTC";
}else if(this == FULL_TIME_PERMANENT){
return "FTP";
}else if(this == PART_TIME_PERMANENT){
return "PTP";
}else if(this == RECRUIT){
return "REC";
}else{
return "SSA";
}}

/**
 * Gets the domain.
 *
 * @param domKey the dom key
 * @return the domain
 */
public static Contract getDomain(String domKey) {
if(domKey.equals( "FTC")){
return FULL_TIME_CONTRACT;
}else if(domKey.equals("PTC")){
return PART_TIME_CONTRACT;
}else if(domKey.equals("FTP")){
return FULL_TIME_PERMANENT;
}else if(domKey.equals("PTP")){
return PART_TIME_PERMANENT;
}else if(domKey.equals("REC")){
return RECRUIT;
}else{
return SPECIALSERVICEAGREEMENT;
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
