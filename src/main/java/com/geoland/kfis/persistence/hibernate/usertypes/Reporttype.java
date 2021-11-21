package com.geoland.kfis.persistence.hibernate.usertypes;
import javax.persistence.Entity;
import javax.persistence.Id;
import com.geoland.framework.persistence.hibernate.PersistentEnum;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Tue Nov 24 13:22:40 CET 2015.
 */

@Entity
public enum Reporttype implements PersistentEnum{

/** The detailed. */
DETAILED("REPORTTYPE","DETAILED","DET",1,"Detajuar","Detailed","Detailed"),

/** The table. */
TABLE("REPORTTYPE","TABLE","TAB",2,"Tabela","Table","Table"),

/** The volumebydiameterclass. */
VOLUMEBYDIAMETERCLASS("REPORTTYPE","VOLUMEBYDIAMETERCLASS","VDC",3,"Vellimi sipas Klases Diametrike","Volume by Diameter Class","Volume by Diameter Class"),

/** The volumebyqualityclass. */
VOLUMEBYQUALITYCLASS("REPORTTYPE","VOLUMEBYQUALITYCLASS","VQC",4,"Vellimi sipas Klases se Kualitetit","Volume by Quality Class","Volume by Quality Class");

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
 * Instantiates a new reporttype.
 *
 * @param DOMNAME the domname
 * @param DOMVALUE the domvalue
 * @param DOMKEY the domkey
 * @param SORT the sort
 * @param DOMTEXT the domtext
 * @param DOMTEXT_EN the domtext en
 * @param DOMTEXT_SR the domtext sr
 */
Reporttype(String DOMNAME, String DOMVALUE, String DOMKEY, Integer SORT, String DOMTEXT, String DOMTEXT_EN, String DOMTEXT_SR){
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
if(this == DETAILED){
return "DET";
}else if(this == TABLE){
return "TAB";
}else if(this == VOLUMEBYDIAMETERCLASS){
return "VDC";
}else if(this == VOLUMEBYQUALITYCLASS){
return "VQC";
}else{
return "TTT";
}}

/**
 * Gets the domain.
 *
 * @param domKey the dom key
 * @return the domain
 */
public static Reporttype getDomain(String domKey) {
if(domKey.equals( "DET")){
return DETAILED;
}else if(domKey.equals("TAB")){
return TABLE;
}else if(domKey.equals("VDC")){
return VOLUMEBYDIAMETERCLASS;
}else{
return VOLUMEBYQUALITYCLASS;
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
