package com.geoland.kfis.persistence.hibernate.usertypes;
import javax.persistence.Entity;
import javax.persistence.Id;
import com.geoland.framework.persistence.hibernate.PersistentEnum;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Mon Jun 15 15:49:28 CEST 2015.
 */

@Entity
public enum Month implements PersistentEnum{

/** The january. */
JANUARY("MONTH","JANUARY","JA",1,"Janar","January","Januar"),

/** The february. */
FEBRUARY("MONTH","FEBRUARY","FE",2,"Shkurt","February","Februar"),

/** The march. */
MARCH("MONTH","MARCH","MR",3,"Mars","March","Mart"),

/** The april. */
APRIL("MONTH","APRIL","AP",4,"Prill","April","April"),

/** The may. */
MAY("MONTH","MAY","MJ",5,"Maj","May","Maj"),

/** The june. */
JUNE("MONTH","JUNE","JN",6,"Qershor","June","Jun"),

/** The july. */
JULY("MONTH","JULY","JL",7,"Korrik","July","Jul"),

/** The august. */
AUGUST("MONTH","AUGUST","AG",8,"Gusht","August","Avgust"),

/** The september. */
SEPTEMBER("MONTH","SEPTEMBER","SE",9,"Shtator","September","Septembar"),

/** The october. */
OCTOBER("MONTH","OCTOBER","OC",10,"Tetor","October","Oktobar"),

/** The november. */
NOVEMBER("MONTH","NOVEMBER","NO",11,"Nentor","November","Novembar"),

/** The december. */
DECEMBER("MONTH","DECEMBER","DE",12,"Dhjetor","December","Decembar");

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
 * Instantiates a new month.
 *
 * @param DOMNAME the domname
 * @param DOMVALUE the domvalue
 * @param DOMKEY the domkey
 * @param SORT the sort
 * @param DOMTEXT the domtext
 * @param DOMTEXT_EN the domtext en
 * @param DOMTEXT_SR the domtext sr
 */
Month(String DOMNAME, String DOMVALUE, String DOMKEY, Integer SORT, String DOMTEXT, String DOMTEXT_EN, String DOMTEXT_SR){
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
if(this == JANUARY){
return "JA";
}else if(this == FEBRUARY){
return "FE";
}else if(this == MARCH){
return "MR";
}else if(this == APRIL){
return "AP";
}else if(this == MAY){
return "MJ";
}else if(this == JUNE){
return "JN";
}else if(this == JULY){
return "JL";
}else if(this == AUGUST){
return "AG";
}else if(this == SEPTEMBER){
return "SE";
}else if(this == OCTOBER){
return "OC";
}else if(this == NOVEMBER){
return "NO";
}else{
return "DE";
}}

/**
 * Gets the domain.
 *
 * @param domKey the dom key
 * @return the domain
 */
public static Month getDomain(String domKey) {
if(domKey.equals( "JA")){
return JANUARY;
}else if(domKey.equals("FE")){
return FEBRUARY;
}else if(domKey.equals("MR")){
return MARCH;
}else if(domKey.equals("AP")){
return APRIL;
}else if(domKey.equals("MJ")){
return MAY;
}else if(domKey.equals("JN")){
return JUNE;
}else if(domKey.equals("JL")){
return JULY;
}else if(domKey.equals("AG")){
return AUGUST;
}else if(domKey.equals("SE")){
return SEPTEMBER;
}else if(domKey.equals("OC")){
return OCTOBER;
}else if(domKey.equals("NO")){
return NOVEMBER;
}else{
return DECEMBER;
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
