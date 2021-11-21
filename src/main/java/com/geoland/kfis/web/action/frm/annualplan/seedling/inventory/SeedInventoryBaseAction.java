package com.geoland.kfis.web.action.frm.annualplan.seedling.inventory;

import java.math.BigInteger;

import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.model.Organisation;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.model.SeedActivity;
import com.geoland.kfis.model.SeedlingInventory;
import com.geoland.kfis.persistence.hibernate.usertypes.Prodtype;
import com.geoland.kfis.web.action.base.BaseActionSupport;
// TODO: Auto-generated Javadoc

/**
 * The Class SeedInventoryBaseAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Feb 6, 2015 , 10:53:22 AM
 */
public class SeedInventoryBaseAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The seedling inventory. */
	protected SeedlingInventory seedlingInventory;
	
	/** The seedling inventory id. */
	protected Long seedlingInventoryId;
	
	/** The seed activity. */
	protected SeedActivity seedActivity;
	
	/** The seed activity id. */
	protected Long seedActivityId;
	
	/** The person. */
	protected Person person;
	
	/** The prod type list. */
	protected Prodtype[] prodTypeList=Prodtype.values();
	
	/** The seed from fr ins. */
	protected boolean seedFromFrIns;
	
	/** The seed from another. */
	protected boolean seedFromAnother;
	
	/**
	 * For a given SeedlingInventory only user of .
	 *
	 * @return true, if successful
	 */
	public boolean hasRightToEdit(){
		if(seedlingInventory!=null && seedlingInventory.getId()!=null){
			Organisation currentUserOrg=getUser().getOrganisation();
			Session s=HibSessionFactory.getSessionFactory().getCurrentSession();
			String query="select count(o) count from torganisation o " +
					"left join thrm_employee e on e.organisation_id=o.id " +
					"left join tperson p on p.id=e.id " +
					"left join tfrm_seedling_inventory inv on inv.created_by=p.id " +
					"where inv.id="+seedlingInventory.getId()+" and e.organisation_id="+currentUserOrg.getId();
			SQLQuery sql=s.createSQLQuery(query);
			sql.addScalar("count");
			Object obj=sql.uniqueResult();
			BigInteger count = (BigInteger)obj;
			if(obj!=null && count.longValue() >0)
				return true;
		}
		return false;
	}
	
	/**
	 * Gets the seedling inventory.
	 *
	 * @return the seedling inventory
	 */
	public SeedlingInventory getSeedlingInventory() {
		return seedlingInventory;
	}
	
	/**
	 * Sets the seedling inventory.
	 *
	 * @param seedlingInventory the new seedling inventory
	 */
	public void setSeedlingInventory(SeedlingInventory seedlingInventory) {
		this.seedlingInventory = seedlingInventory;
	}
	
	/**
	 * Gets the seedling inventory id.
	 *
	 * @return the seedling inventory id
	 */
	public Long getSeedlingInventoryId() {
		return seedlingInventoryId;
	}
	
	/**
	 * Sets the seedling inventory id.
	 *
	 * @param seedlingInventoryId the new seedling inventory id
	 */
	public void setSeedlingInventoryId(Long seedlingInventoryId) {
		this.seedlingInventoryId = seedlingInventoryId;
	}
	
	/**
	 * Gets the seed activity.
	 *
	 * @return the seed activity
	 */
	public SeedActivity getSeedActivity() {
		return seedActivity;
	}
	
	/**
	 * Sets the seed activity.
	 *
	 * @param seedActivity the new seed activity
	 */
	public void setSeedActivity(SeedActivity seedActivity) {
		this.seedActivity = seedActivity;
	}
	
	/**
	 * Gets the seed activity id.
	 *
	 * @return the seed activity id
	 */
	public Long getSeedActivityId() {
		return seedActivityId;
	}
	
	/**
	 * Sets the seed activity id.
	 *
	 * @param seedActivityId the new seed activity id
	 */
	public void setSeedActivityId(Long seedActivityId) {
		this.seedActivityId = seedActivityId;
	}
	
	/**
	 * Gets the person.
	 *
	 * @return the person
	 */
	public Person getPerson() {
		return person;
	}
	
	/**
	 * Sets the person.
	 *
	 * @param person the new person
	 */
	public void setPerson(Person person) {
		this.person = person;
	}
	
	/**
	 * Gets the prod type list.
	 *
	 * @return the prod type list
	 */
	public Prodtype[] getProdTypeList() {
		return prodTypeList;
	}
	
	/**
	 * Sets the prod type list.
	 *
	 * @param prodTypeList the new prod type list
	 */
	public void setProdTypeList(Prodtype[] prodTypeList) {
		this.prodTypeList = prodTypeList;
	}
	
	/**
	 * Checks if is seed from fr ins.
	 *
	 * @return true, if is seed from fr ins
	 */
	public boolean isSeedFromFrIns() {
		return seedFromFrIns;
	}
	
	/**
	 * Sets the seed from fr ins.
	 *
	 * @param seedFromFrIns the new seed from fr ins
	 */
	public void setSeedFromFrIns(boolean seedFromFrIns) {
		this.seedFromFrIns = seedFromFrIns;
	}
	
	/**
	 * Checks if is seed from another.
	 *
	 * @return true, if is seed from another
	 */
	public boolean isSeedFromAnother() {
		return seedFromAnother;
	}
	
	/**
	 * Sets the seed from another.
	 *
	 * @param seedFromAnother the new seed from another
	 */
	public void setSeedFromAnother(boolean seedFromAnother) {
		this.seedFromAnother = seedFromAnother;
	}
	

}
