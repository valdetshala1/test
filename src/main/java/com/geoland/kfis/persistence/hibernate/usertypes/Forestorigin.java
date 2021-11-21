package com.geoland.kfis.persistence.hibernate.usertypes;
import javax.persistence.Entity;
import javax.persistence.Id;
import com.geoland.framework.persistence.hibernate.PersistentEnum;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Tue Oct 06 13:58:08 CEST 2015.
 */

@Entity
public enum Forestorigin implements PersistentEnum{

/** The forestorigin1. */
FORESTORIGIN1("FORESTORIGIN","FORESTORIGIN1","1",1,"Cungishte","Coppice","PanjaÄ�a"),

/** The forestorigin2. */
FORESTORIGIN2("FORESTORIGIN","FORESTORIGIN2","2",2,"Cungishte me standarde","Coppice with standards","PanjaÄ�a sa stadardima"),

/** The forestorigin3. */
FORESTORIGIN3("FORESTORIGIN","FORESTORIGIN3","3",3,"Farim natyral","Natural seedlings","Prirodno seme"),

/** The forestorigin4. */
FORESTORIGIN4("FORESTORIGIN","FORESTORIGIN4","4",4,"PyllÃ«zim ose farim artificial","Plant or artificial seedling","PoÅ¡umljavanje ili Prirodno osemenjeno"),

/** The forestorigin9. */
FORESTORIGIN9("FORESTORIGIN","FORESTORIGIN9","5",5,"Pa drunje","No stand","Bez drveÄ‡a"),

/** The forestorigin0. */
FORESTORIGIN0("FORESTORIGIN","FORESTORIGIN0","0",6,"E panjohur","Unknown","Nepoznato");

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
 * Instantiates a new forestorigin.
 *
 * @param DOMNAME the domname
 * @param DOMVALUE the domvalue
 * @param DOMKEY the domkey
 * @param SORT the sort
 * @param DOMTEXT the domtext
 * @param DOMTEXT_EN the domtext en
 * @param DOMTEXT_SR the domtext sr
 */
Forestorigin(String DOMNAME, String DOMVALUE, String DOMKEY, Integer SORT, String DOMTEXT, String DOMTEXT_EN, String DOMTEXT_SR){
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
if(this == FORESTORIGIN1){
return "1";
}else if(this == FORESTORIGIN2){
return "2";
}else if(this == FORESTORIGIN3){
return "3";
}else if(this == FORESTORIGIN4){
return "4";
}else if(this == FORESTORIGIN9){
return "5";
}else{
return "0";
}}

/**
 * Gets the domain.
 *
 * @param domKey the dom key
 * @return the domain
 */
public static Forestorigin getDomain(String domKey) {
if(domKey.equals( "1")){
return FORESTORIGIN1;
}else if(domKey.equals("2")){
return FORESTORIGIN2;
}else if(domKey.equals("3")){
return FORESTORIGIN3;
}else if(domKey.equals("4")){
return FORESTORIGIN4;
}else if(domKey.equals("5")){
return FORESTORIGIN9;
}else{
return FORESTORIGIN0;
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
