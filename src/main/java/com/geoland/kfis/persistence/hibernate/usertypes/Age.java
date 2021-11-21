package com.geoland.kfis.persistence.hibernate.usertypes;
import javax.persistence.Entity;
import javax.persistence.Id;
import com.geoland.framework.persistence.hibernate.PersistentEnum;


// TODO: Auto-generated Javadoc
/**
 * 	Domain generated Mon Jun 15 15:49:28 CEST 2015.
 */

@Entity
public enum Age implements PersistentEnum{

/** The age5. */
AGE5("AGE","AGE5","5",1,"0-7","0-7","0-7"),

/** The age10. */
AGE10("AGE","AGE10","10",2,"8-12","8-12","8-12"),

/** The age15. */
AGE15("AGE","AGE15","15",3,"13-17","13-17","13-17"),

/** The age20. */
AGE20("AGE","AGE20","20",4,"18-25","18-25","18-25"),

/** The age30. */
AGE30("AGE","AGE30","30",5,"26-35","26-35","26-35"),

/** The age40. */
AGE40("AGE","AGE40","40",6,"36-45","36-45","36-45"),

/** The age50. */
AGE50("AGE","AGE50","50",7,"46-55","46-55","46-55"),

/** The age60. */
AGE60("AGE","AGE60","60",8,"56-65","56-65","56-65"),

/** The age70. */
AGE70("AGE","AGE70","70",9,"66-75","66-75","66-75"),

/** The age80. */
AGE80("AGE","AGE80","80",10,"76-85","76-85","76-85"),

/** The age90. */
AGE90("AGE","AGE90","90",11,"86-95","86-95","86-95"),

/** The age100. */
AGE100("AGE","AGE100","100",12,"96-112","96-112","96-112"),

/** The age125. */
AGE125("AGE","AGE125","125",13,"113-137","113-137","113-137"),

/** The age150. */
AGE150("AGE","AGE150","150",14,"138-162","138-162","138-162"),

/** The age175. */
AGE175("AGE","AGE175","175",15,"163-187","163-187","163-187"),

/** The age200. */
AGE200("AGE","AGE200","200",16,"188-225","188-225","188-225"),

/** The age250. */
AGE250("AGE","AGE250","250",17,"> 225","> 225","> 225");

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
 * Instantiates a new age.
 *
 * @param DOMNAME the domname
 * @param DOMVALUE the domvalue
 * @param DOMKEY the domkey
 * @param SORT the sort
 * @param DOMTEXT the domtext
 * @param DOMTEXT_EN the domtext en
 * @param DOMTEXT_SR the domtext sr
 */
Age(String DOMNAME, String DOMVALUE, String DOMKEY, Integer SORT, String DOMTEXT, String DOMTEXT_EN, String DOMTEXT_SR){
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
if(this == AGE5){
return "5";
}else if(this == AGE10){
return "10";
}else if(this == AGE15){
return "15";
}else if(this == AGE20){
return "20";
}else if(this == AGE30){
return "30";
}else if(this == AGE40){
return "40";
}else if(this == AGE50){
return "50";
}else if(this == AGE60){
return "60";
}else if(this == AGE70){
return "70";
}else if(this == AGE80){
return "80";
}else if(this == AGE90){
return "90";
}else if(this == AGE100){
return "100";
}else if(this == AGE125){
return "125";
}else if(this == AGE150){
return "150";
}else if(this == AGE175){
return "175";
}else if(this == AGE200){
return "200";
}else{
return "250";
}}

/**
 * Gets the domain.
 *
 * @param domKey the dom key
 * @return the domain
 */
public static Age getDomain(String domKey) {
if(domKey.equals( "5")){
return AGE5;
}else if(domKey.equals("10")){
return AGE10;
}else if(domKey.equals("15")){
return AGE15;
}else if(domKey.equals("20")){
return AGE20;
}else if(domKey.equals("30")){
return AGE30;
}else if(domKey.equals("40")){
return AGE40;
}else if(domKey.equals("50")){
return AGE50;
}else if(domKey.equals("60")){
return AGE60;
}else if(domKey.equals("70")){
return AGE70;
}else if(domKey.equals("80")){
return AGE80;
}else if(domKey.equals("90")){
return AGE90;
}else if(domKey.equals("100")){
return AGE100;
}else if(domKey.equals("125")){
return AGE125;
}else if(domKey.equals("150")){
return AGE150;
}else if(domKey.equals("175")){
return AGE175;
}else if(domKey.equals("200")){
return AGE200;
}else{
return AGE250;
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
