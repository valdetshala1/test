package com.geoland.kfis.persistence.hibernate.usertypes;
import javax.persistence.Entity;
import javax.persistence.Id;
import com.geoland.framework.persistence.hibernate.PersistentEnum;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Mon Jun 15 15:49:28 CEST 2015.
 */

@Entity
public enum Employeerole implements PersistentEnum{

/** The team leader. */
TEAM_LEADER("EMPLOYEEROLE","TEAM_LEADER","TL",1,"Udheheqes grupi","Team leader","Vodja grupe"),

/** The director. */
DIRECTOR("EMPLOYEEROLE","DIRECTOR","DI",2,"Drejtor","Director","Direktor"),

/** The chief. */
CHIEF("EMPLOYEEROLE","CHIEF","CH",3,"Kryetar","Chief","Predsednik"),

/** The manager. */
MANAGER("EMPLOYEEROLE","MANAGER","MA",4,"Menagjer","Manager","Menadžer"),

/** The inspector. */
INSPECTOR("EMPLOYEEROLE","INSPECTOR","IN",5,"Inspektor","Inspector","Inspektor"),

/** The employee. */
EMPLOYEE("EMPLOYEEROLE","EMPLOYEE","EM",6,"Nenpunes","Employee","Službenik"),

/** The inspectiondirector. */
INSPECTIONDIRECTOR("EMPLOYEEROLE","INSPECTIONDIRECTOR","ID",7,"Drejtor i inspektimit","Inspection director","Direktor inspekcije");

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
 * Instantiates a new employeerole.
 *
 * @param DOMNAME the domname
 * @param DOMVALUE the domvalue
 * @param DOMKEY the domkey
 * @param SORT the sort
 * @param DOMTEXT the domtext
 * @param DOMTEXT_EN the domtext en
 * @param DOMTEXT_SR the domtext sr
 */
Employeerole(String DOMNAME, String DOMVALUE, String DOMKEY, Integer SORT, String DOMTEXT, String DOMTEXT_EN, String DOMTEXT_SR){
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
if(this == TEAM_LEADER){
return "TL";
}else if(this == DIRECTOR){
return "DI";
}else if(this == CHIEF){
return "CH";
}else if(this == MANAGER){
return "MA";
}else if(this == INSPECTOR){
return "IN";
}else if(this == EMPLOYEE){
return "EM";
}else{
return "ID";
}}

/**
 * Gets the domain.
 *
 * @param domKey the dom key
 * @return the domain
 */
public static Employeerole getDomain(String domKey) {
if(domKey.equals( "TL")){
return TEAM_LEADER;
}else if(domKey.equals("DI")){
return DIRECTOR;
}else if(domKey.equals("CH")){
return CHIEF;
}else if(domKey.equals("MA")){
return MANAGER;
}else if(domKey.equals("IN")){
return INSPECTOR;
}else if(domKey.equals("EM")){
return EMPLOYEE;
}else{
return INSPECTIONDIRECTOR;
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
