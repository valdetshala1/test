package com.geoland.kfis.persistence.hibernate.usertypes;
import javax.persistence.Entity;
import javax.persistence.Id;
import com.geoland.framework.persistence.hibernate.PersistentEnum;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Mon Jun 15 15:49:29 CEST 2015.
 */

@Entity
public enum Merstrategystatus implements PersistentEnum{

/** The notstarted. */
NOTSTARTED("MERSTRATEGYSTATUS","NOTSTARTED","NOS",1,"Nuk kane filluar","Not started","Nisu počeli"),

/** The inpreparation. */
INPREPARATION("MERSTRATEGYSTATUS","INPREPARATION","INP",2,"Ne pergatitje","In preparation","U pripremi"),

/** The ongoing. */
ONGOING("MERSTRATEGYSTATUS","ONGOING","ONG",3,"Ne zhvillim e siper","On going","Idalje u razvoju"),

/** The completed. */
COMPLETED("MERSTRATEGYSTATUS","COMPLETED","COM",4,"Kompletuar","Completed","Kompletirano"),

/** The canceled. */
CANCELED("MERSTRATEGYSTATUS","CANCELED","CAN",5,"Anuluar","Canceled","Anulirano"),

/** The newsubproject. */
NEWSUBPROJECT("MERSTRATEGYSTATUS","NEWSUBPROJECT","NSP",6,"Nen projekt i ri","New sub project","Novi podprojekat"),

/** The newproject. */
NEWPROJECT("MERSTRATEGYSTATUS","NEWPROJECT","NPR",7,"Projekt i ri","New project","Novi projekat"),

/** The stopped. */
STOPPED("MERSTRATEGYSTATUS","STOPPED","STP",8,"Nderprere","Stopped","Isprekidano");

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
 * Instantiates a new merstrategystatus.
 *
 * @param DOMNAME the domname
 * @param DOMVALUE the domvalue
 * @param DOMKEY the domkey
 * @param SORT the sort
 * @param DOMTEXT the domtext
 * @param DOMTEXT_EN the domtext en
 * @param DOMTEXT_SR the domtext sr
 */
Merstrategystatus(String DOMNAME, String DOMVALUE, String DOMKEY, Integer SORT, String DOMTEXT, String DOMTEXT_EN, String DOMTEXT_SR){
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
if(this == NOTSTARTED){
return "NOS";
}else if(this == INPREPARATION){
return "INP";
}else if(this == ONGOING){
return "ONG";
}else if(this == COMPLETED){
return "COM";
}else if(this == CANCELED){
return "CAN";
}else if(this == NEWSUBPROJECT){
return "NSP";
}else if(this == NEWPROJECT){
return "NPR";
}else{
return "STP";
}}

/**
 * Gets the domain.
 *
 * @param domKey the dom key
 * @return the domain
 */
public static Merstrategystatus getDomain(String domKey) {
if(domKey.equals( "NOS")){
return NOTSTARTED;
}else if(domKey.equals("INP")){
return INPREPARATION;
}else if(domKey.equals("ONG")){
return ONGOING;
}else if(domKey.equals("COM")){
return COMPLETED;
}else if(domKey.equals("CAN")){
return CANCELED;
}else if(domKey.equals("NSP")){
return NEWSUBPROJECT;
}else if(domKey.equals("NPR")){
return NEWPROJECT;
}else{
return STOPPED;
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
