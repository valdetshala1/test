package com.geoland.kfis.persistence.hibernate.usertypes;
import javax.persistence.Entity;
import javax.persistence.Id;
import com.geoland.framework.persistence.hibernate.PersistentEnum;


/**
*	Domain generated Wed Mar 18 15:02:46 CET 2020
*/

@Entity
public enum Fincategory implements PersistentEnum{

Goods("FINCATEGORY","Goods","GOD",1,"Mallera","Goods",""),
Tax("FINCATEGORY","Tax","TAX",2,"Taxa","Tax",""),
Capital("FINCATEGORY","Capital","CAP",3,"Kapital","Capital","");

private final String DOMNAME;
private final String DOMVALUE;
private final String DOMKEY;
private final Integer SORT;
private final String DOMTEXT;
private final String DOMTEXT_EN;
private final String DOMTEXT_SR;

@Id
public String name = toString();

Fincategory(String DOMNAME, String DOMVALUE, String DOMKEY, Integer SORT, String DOMTEXT, String DOMTEXT_EN, String DOMTEXT_SR){
this.DOMNAME = DOMNAME;
this.DOMVALUE = DOMVALUE;
this.DOMKEY = DOMKEY;
this.SORT = SORT;
this.DOMTEXT = DOMTEXT;
this.DOMTEXT_EN = DOMTEXT_EN;
this.DOMTEXT_SR = DOMTEXT_SR;
}

@Override
public String toString() {
if(this == Goods){
return "GOD";
}else if(this == Tax){
return "TAX";
}else{
return "CAP";
}}

public static Fincategory getDomain(String domKey) {
if(domKey.equals( "GOD")){
return Goods;
}else if(domKey.equals("TAX")){
return Tax;
}else{
return Capital;
}}

@Override
public String getId() {return this.DOMKEY;}
public String getDOMNAME() {return DOMNAME;}
public String getDOMVALUE() {return DOMVALUE;}
public String getDOMKEY() {return DOMKEY;}
public Integer getSORT() {return SORT;}
public String getDOMTEXT() {return DOMTEXT;}
public String getDOMTEXT_EN() {return DOMTEXT_EN;}
public String getDOMTEXT_SR() {return DOMTEXT_SR;}
}
