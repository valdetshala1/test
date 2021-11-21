package com.geoland.kfis.web.action.ads.legalsector.lawsuit;

import java.util.List;

import com.geoland.kfis.logic.ads.legalsector.BoLawSuit;
import com.geoland.kfis.model.LawSuit;
import com.geoland.kfis.model.LawSuitDamage;
import com.geoland.kfis.persistence.hibernate.usertypes.Damagetype;
import com.geoland.kfis.persistence.hibernate.usertypes.Origin;
import com.geoland.kfis.persistence.hibernate.usertypes.Suittype;
import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class LawSuitBaseAction.
 *
 * @author ADELINA GASHI, GEO&LAND
 * @created May 30, 2014 9:23:46 AM
 * @Version 1.0
 */
public class LawSuitBaseAction extends BaseActionSupport {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The lawsuit id. */
	protected Long lawsuitId;
	
	/** The lawsuit. */
	protected LawSuit lawsuit;
	
	/** The law suit bo. */
	private BoLawSuit lawSuitBo;
	
	/** The suittype list. */
	protected Suittype[] suittypeList=Suittype.values();
	
	/** The damage type list. */
	protected Damagetype[] damageTypeList=Damagetype.values();
	
	/** The origin list. */
	protected Origin[] originList=Origin.values();
	
	/** The json damage detail. */
	protected String jsonDamageDetail;
	
	/**
	 * Check damages.
	 *
	 * @param existing the existing
	 * @param newDamage the new damage
	 * @return true, if successful
	 */
	public boolean checkDamages(LawSuitDamage existing,List<LawSuitDamage> newDamage){
		for(LawSuitDamage damage:newDamage){
			if(!existing.equals(damage))
				return true;
		}
		return false;
	}
	
	/**
	 * Gets the lawsuit id.
	 *
	 * @return the lawsuit id
	 */
	public Long getLawsuitId() {
		return lawsuitId;
	}
	
	/**
	 * Sets the lawsuit id.
	 *
	 * @param lawsuitId the new lawsuit id
	 */
	public void setLawsuitId(Long lawsuitId) {
		this.lawsuitId = lawsuitId;
	}
	
	/**
	 * Gets the lawsuit.
	 *
	 * @return the lawsuit
	 */
	public LawSuit getLawsuit() {
		return lawsuit;
	}
	
	/**
	 * Sets the lawsuit.
	 *
	 * @param lawsuit the new lawsuit
	 */
	public void setLawsuit(LawSuit lawsuit) {
		this.lawsuit = lawsuit;
	}
	
	/**
	 * Gets the suittype list.
	 *
	 * @return the suittype list
	 */
	public Suittype[] getSuittypeList() {
		return suittypeList;
	}
	
	/**
	 * Sets the suittype list.
	 *
	 * @param suittypeList the new suittype list
	 */
	public void setSuittypeList(Suittype[] suittypeList) {
		this.suittypeList = suittypeList;
	}
	
	/**
	 * Gets the damage type list.
	 *
	 * @return the damage type list
	 */
	public Damagetype[] getDamageTypeList() {
		return damageTypeList;
	}
	
	/**
	 * Sets the damage type list.
	 *
	 * @param damageTypeList the new damage type list
	 */
	public void setDamageTypeList(Damagetype[] damageTypeList) {
		this.damageTypeList = damageTypeList;
	}
	
	/**
	 * Gets the origin list.
	 *
	 * @return the origin list
	 */
	public Origin[] getOriginList() {
		return originList;
	}
	
	/**
	 * Sets the origin list.
	 *
	 * @param originList the new origin list
	 */
	public void setOriginList(Origin[] originList) {
		this.originList = originList;
	}
	
	/**
	 * Gets the law suit bo.
	 *
	 * @return the law suit bo
	 */
	public BoLawSuit getLawSuitBo() {
		if(lawsuit!=null && lawSuitBo==null){
			lawSuitBo = new BoLawSuit(lawsuit, getLocale());
		}
		return lawSuitBo;
	}
	
	/**
	 * Sets the law suit bo.
	 *
	 * @param lawSuitBo the new law suit bo
	 */
	public void setLawSuitBo(BoLawSuit lawSuitBo) {
		this.lawSuitBo = lawSuitBo;
	}
	
	/**
	 * Gets the json damage detail.
	 *
	 * @return the json damage detail
	 */
	public String getJsonDamageDetail() {
		return jsonDamageDetail;
	}
	
	/**
	 * Sets the json damage detail.
	 *
	 * @param jsonDamageDetail the new json damage detail
	 */
	public void setJsonDamageDetail(String jsonDamageDetail) {
		this.jsonDamageDetail = jsonDamageDetail;
	}


	
	
}
