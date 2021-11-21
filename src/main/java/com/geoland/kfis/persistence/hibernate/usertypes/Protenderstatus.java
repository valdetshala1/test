package com.geoland.kfis.persistence.hibernate.usertypes;
import javax.persistence.Entity;
import javax.persistence.Id;
import com.geoland.framework.persistence.hibernate.PersistentEnum;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Mon Jun 15 15:49:28 CEST 2015.
 */

@Entity
public enum Protenderstatus implements PersistentEnum{

/** The new. */
NEW("PROTENDERSTATUS","NEW","NEW",1,"E re","New","Novo"),

/** The analyse. */
ANALYSE("PROTENDERSTATUS","ANALYSE","ANA",2,"Ne analize","Analyse","Na analizi"),

/** The approved. */
APPROVED("PROTENDERSTATUS","APPROVED","APR",3,"E aprovuar","Approved","Usvojeno"),

/** The rejected. */
REJECTED("PROTENDERSTATUS","REJECTED","REJ",4,"E refuzuar","Rejected","Odbijeno"),

/** The tenderdone. */
TENDERDONE("PROTENDERSTATUS","TENDERDONE","TDO",5,"Tenderi i pergatitur","Tender done","Pripremljena javna nabavka"),

/** The publish. */
PUBLISH("PROTENDERSTATUS","PUBLISH","PUB",6,"I publikuar","Published","Objavljeno"),

/** The pending. */
PENDING("PROTENDERSTATUS","PENDING","PEN",7,"Ne pritje","Pending","Na čekanje"),

/** The canceled. */
CANCELED("PROTENDERSTATUS","CANCELED","CAN",8,"I anuluar","Canceled","Anulirano"),

/** The contracted. */
CONTRACTED("PROTENDERSTATUS","CONTRACTED","CON",9,"I kontraktuar","Contracted","Ugovoreno"),

/** The selected. */
SELECTED("PROTENDERSTATUS","SELECTED","SEL",10,"I zgjedhur","Selected","Odabran"),

/** The republish. */
REPUBLISH("PROTENDERSTATUS","REPUBLISH","REP",11,"Ri-publikim","Re-publish","Novo objavljivanje");

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
 * Instantiates a new protenderstatus.
 *
 * @param DOMNAME the domname
 * @param DOMVALUE the domvalue
 * @param DOMKEY the domkey
 * @param SORT the sort
 * @param DOMTEXT the domtext
 * @param DOMTEXT_EN the domtext en
 * @param DOMTEXT_SR the domtext sr
 */
Protenderstatus(String DOMNAME, String DOMVALUE, String DOMKEY, Integer SORT, String DOMTEXT, String DOMTEXT_EN, String DOMTEXT_SR){
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
if(this == NEW){
return "NEW";
}else if(this == ANALYSE){
return "ANA";
}else if(this == APPROVED){
return "APR";
}else if(this == REJECTED){
return "REJ";
}else if(this == TENDERDONE){
return "TDO";
}else if(this == PUBLISH){
return "PUB";
}else if(this == PENDING){
return "PEN";
}else if(this == CANCELED){
return "CAN";
}else if(this == CONTRACTED){
return "CON";
}else if(this == SELECTED){
return "SEL";
}else{
return "REP";
}}

/**
 * Gets the domain.
 *
 * @param domKey the dom key
 * @return the domain
 */
public static Protenderstatus getDomain(String domKey) {
if(domKey.equals( "NEW")){
return NEW;
}else if(domKey.equals("ANA")){
return ANALYSE;
}else if(domKey.equals("APR")){
return APPROVED;
}else if(domKey.equals("REJ")){
return REJECTED;
}else if(domKey.equals("TDO")){
return TENDERDONE;
}else if(domKey.equals("PUB")){
return PUBLISH;
}else if(domKey.equals("PEN")){
return PENDING;
}else if(domKey.equals("CAN")){
return CANCELED;
}else if(domKey.equals("CON")){
return CONTRACTED;
}else if(domKey.equals("SEL")){
return SELECTED;
}else{
return REPUBLISH;
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
