package com.geoland.kfis.persistence.hibernate.usertypes;
import javax.persistence.Entity;
import javax.persistence.Id;
import com.geoland.framework.persistence.hibernate.PersistentEnum;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Thu Nov 02 10:55:03 CET 2017.
 */

@Entity
public enum Roadtype implements PersistentEnum{

/** The truckcarroad. */
TRUCKCARROAD("ROADTYPE","TRUCKCARROAD","7001",1,"Rruge kamioni/makine","With prove area","Rruge kamioni/makine"),

/** The tractorroad. */
TRACTORROAD("ROADTYPE","TRACTORROAD","7401",2,"Rruge traktori","Tractor road","Rruge traktori"),

/** The path. */
PATH("ROADTYPE","PATH","7414",3,"Shteg","Path","Shteg"),

/** The bridge. */
BRIDGE("ROADTYPE","BRIDGE","7531",4,"Ure","Bridge","Ure"),

/** The subdrain. */
SUBDRAIN("ROADTYPE","SUBDRAIN","7541",5,"Tub  shkarkimi","Subdrain","Tub  shkarkimi"),

/** The roadtype4012. */
ROADTYPE4012("ROADTYPE","ROADTYPE4012","4012",6,"4012-Ndarje","4012-Compartment","4012-Odeljak"),

/** The roadtype4023. */
ROADTYPE4023("ROADTYPE","ROADTYPE4023","4023",7,"4023-Rezerva natyrore / park","4023-Natural reserve-/park","4023-Prirodni rezervat / park"),

/** The roadtype4027. */
ROADTYPE4027("ROADTYPE","ROADTYPE4027","4027",8,"4027-Zona e ruajtjes","4027-Preservation area","4027-Prostor za zaÅ¡titu"),

/** The roadtype4029. */
ROADTYPE4029("ROADTYPE","ROADTYPE4029","4029",9,"4029-Kufiri i zonës së gjuetisë","4029-Hunting area border","4029-Granica loviÅ¡ta"),

/** The roadtype4101. */
ROADTYPE4101("ROADTYPE","ROADTYPE4101","4101",10,"4101-Gropa zhavorr","4101-Gravel pit","4101-Å ljunak"),

/** The roadtype4102. */
ROADTYPE4102("ROADTYPE","ROADTYPE4102","4102",11,"4102-Gurore guri","4102-Stone quarry","4102-Kameni kamenolom"),

/** The roadtype4103. */
ROADTYPE4103("ROADTYPE","ROADTYPE4103","4103",12,"4103-Gropë e thellë/minierë","4103-Pit/mine","4103-Pit/mine"),

/** The roadtype4224. */
ROADTYPE4224("ROADTYPE","ROADTYPE4224","4224",13,"4224-Kullotë","4224-Pasture","4224-PaÅ¡njak"),

/** The roadtype4300. */
ROADTYPE4300("ROADTYPE","ROADTYPE4300","4300",14,"4300-Ngastër","4300-Stand","4300-Stoj"),

/** The roadtype4301. */
ROADTYPE4301("ROADTYPE","ROADTYPE4301","4301",15,"4301-Utprikk","4301-Utprikk","4301-Utprikk"),

/** The roadtype4451. */
ROADTYPE4451("ROADTYPE","ROADTYPE4451","4451",16,"4451-Zona bujqësore","4451-Agricultural area","4451-Poljoprivredno podruÄje"),

/** The roadtype5001. */
ROADTYPE5001("ROADTYPE","ROADTYPE5001","5001",17,"5001-Ndërtesa / shtëpia","5001-Building/house","5001-Zgrada / kuÄ‡a"),

/** The roadtype6011. */
ROADTYPE6011("ROADTYPE","ROADTYPE6011","6011",18,"6011-Mur i gurit","6011-Stone wall","6011-Kameni zid"),

/** The roadtype6012. */
ROADTYPE6012("ROADTYPE","ROADTYPE6012","6012",19,"6012-Gardh","6012-Fence","6012-Ograda"),

/** The roadtype7002. */
ROADTYPE7002("ROADTYPE","ROADTYPE7002","7002",20,"7002-Kamion/rruga e makinave (buzë)","7002-Truck/car road (edge)","7002-Kamion/auto put (ivica)"),

/** The roadtype7100. */
ROADTYPE7100("ROADTYPE","ROADTYPE7100","7100",21,"7100-Hekurudhor","7100-Railroad","7100-Å½eleznica"),

/** The roadtype7402. */
ROADTYPE7402("ROADTYPE","ROADTYPE7402","7402",22,"7402-Rruga e traktorit (buzë)","7402-Tractor road (edge)","7402-Traktor cest (ivica)"),

/** The roadtype7421. */
ROADTYPE7421("ROADTYPE","ROADTYPE7421","7421",23,"7421-Rruga dimërore (qendra)","7421-Winter road (centre)","7421-Zimska cesta (centar)"),

/** The roadtype7430. */
ROADTYPE7430("ROADTYPE","ROADTYPE7430","7430",24,"7430-Vend parkimi","7430-Parking place","7430-Parkirno mjesto"),

/** The roadtype7604. */
ROADTYPE7604("ROADTYPE","ROADTYPE7604","7604",25,"7604-Shiriti i rrugës","7604-Road bar","7604-Putni bar"),

/** The roadtype8000. */
ROADTYPE8000("ROADTYPE","ROADTYPE8000","8000",26,"8000-Kufiri i shtetit","8000-Power line","8000-Power line"),

/** The roadtype9000. */
ROADTYPE9000("ROADTYPE","ROADTYPE9000","9000",27,"9000-Sistemi i rrjetit","9000-Grid system","9000-Grid sistem");

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
 * Instantiates a new roadtype.
 *
 * @param DOMNAME the domname
 * @param DOMVALUE the domvalue
 * @param DOMKEY the domkey
 * @param SORT the sort
 * @param DOMTEXT the domtext
 * @param DOMTEXT_EN the domtext en
 * @param DOMTEXT_SR the domtext sr
 */
Roadtype(String DOMNAME, String DOMVALUE, String DOMKEY, Integer SORT, String DOMTEXT, String DOMTEXT_EN, String DOMTEXT_SR){
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
if(this == TRUCKCARROAD){
return "7001";
}else if(this == TRACTORROAD){
return "7401";
}else if(this == PATH){
return "7414";
}else if(this == BRIDGE){
return "7531";
}else if(this == SUBDRAIN){
return "7541";
}else if(this == ROADTYPE4012){
return "4012";
}else if(this == ROADTYPE4023){
return "4023";
}else if(this == ROADTYPE4027){
return "4027";
}else if(this == ROADTYPE4029){
return "4029";
}else if(this == ROADTYPE4101){
return "4101";
}else if(this == ROADTYPE4102){
return "4102";
}else if(this == ROADTYPE4103){
return "4103";
}else if(this == ROADTYPE4224){
return "4224";
}else if(this == ROADTYPE4300){
return "4300";
}else if(this == ROADTYPE4301){
return "4301";
}else if(this == ROADTYPE4451){
return "4451";
}else if(this == ROADTYPE5001){
return "5001";
}else if(this == ROADTYPE6011){
return "6011";
}else if(this == ROADTYPE6012){
return "6012";
}else if(this == ROADTYPE7002){
return "7002";
}else if(this == ROADTYPE7100){
return "7100";
}else if(this == ROADTYPE7402){
return "7402";
}else if(this == ROADTYPE7421){
return "7421";
}else if(this == ROADTYPE7430){
return "7430";
}else if(this == ROADTYPE7604){
return "7604";
}else if(this == ROADTYPE8000){
return "8000";
}else{
return "9000";
}}

/**
 * Gets the domain.
 *
 * @param domKey the dom key
 * @return the domain
 */
public static Roadtype getDomain(String domKey) {
if(domKey.equals( "7001")){
return TRUCKCARROAD;
}else if(domKey.equals("7401")){
return TRACTORROAD;
}else if(domKey.equals("7414")){
return PATH;
}else if(domKey.equals("7531")){
return BRIDGE;
}else if(domKey.equals("7541")){
return SUBDRAIN;
}else if(domKey.equals("4012")){
return ROADTYPE4012;
}else if(domKey.equals("4023")){
return ROADTYPE4023;
}else if(domKey.equals("4027")){
return ROADTYPE4027;
}else if(domKey.equals("4029")){
return ROADTYPE4029;
}else if(domKey.equals("4101")){
return ROADTYPE4101;
}else if(domKey.equals("4102")){
return ROADTYPE4102;
}else if(domKey.equals("4103")){
return ROADTYPE4103;
}else if(domKey.equals("4224")){
return ROADTYPE4224;
}else if(domKey.equals("4300")){
return ROADTYPE4300;
}else if(domKey.equals("4301")){
return ROADTYPE4301;
}else if(domKey.equals("4451")){
return ROADTYPE4451;
}else if(domKey.equals("5001")){
return ROADTYPE5001;
}else if(domKey.equals("6011")){
return ROADTYPE6011;
}else if(domKey.equals("6012")){
return ROADTYPE6012;
}else if(domKey.equals("7002")){
return ROADTYPE7002;
}else if(domKey.equals("7100")){
return ROADTYPE7100;
}else if(domKey.equals("7402")){
return ROADTYPE7402;
}else if(domKey.equals("7421")){
return ROADTYPE7421;
}else if(domKey.equals("7430")){
return ROADTYPE7430;
}else if(domKey.equals("7604")){
return ROADTYPE7604;
}else if(domKey.equals("8000")){
return ROADTYPE8000;
}else{
return ROADTYPE9000;
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
