package com.geoland.kfis.model;

// Generated Feb 23, 2015 9:43:57 PM by Hibernate Tools 3.4.0.CR1

import com.geoland.framework.persistence.base.*;
import org.hibernate.annotations.Type;
import com.geoland.kfis.persistence.hibernate.usertypes.Treespeciesgroup;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

// TODO: Auto-generated Javadoc
/**
 * TreeSpecies generated by hbm2java.
 */
@Entity
@Table(name = "tfrm_tree_species", schema = "public")
public class TreeSpecies extends AbstractPersistentObject implements
		java.io.Serializable {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The id. */
	private Long id;
	
	/** The code. */
	private Long code;
	
	/** The name en. */
	private String nameEn;
	
	/** The name al. */
	private String nameAl;
	
	/** The name sr. */
	private String nameSr;
	
	/** The name la. */
	private String nameLa;
	
	/** The species group. */
	private Treespeciesgroup speciesGroup;
	
	/** The species bonitet. */
	private Double speciesBonitet;
	
	/** The max diameter. */
	private Double maxDiameter;
	
	/** The seedling inventories. */
	private Set<SeedlingInventory> seedlingInventories = new HashSet<SeedlingInventory>(
			0);
	
	/** The stands for tree 3. */
	private Set<Stand> standsForTree3 = new HashSet<Stand>(0);
	
	/** The stands for tree 1. */
	private Set<Stand> standsForTree1 = new HashSet<Stand>(0);
	
	/** The stand planting activities. */
	private Set<StandPlantingActivity> standPlantingActivities = new HashSet<StandPlantingActivity>(
			0);
	
	/** The private request impls. */
	private Set<PrivateRequestImpl> privateRequestImpls = new HashSet<PrivateRequestImpl>(
			0);
	
	/** The seed activities. */
	private Set<SeedActivity> seedActivities = new HashSet<SeedActivity>(0);
	
	/** The stand harvest activities. */
	private Set<StandHarvestActivity> standHarvestActivities = new HashSet<StandHarvestActivity>(
			0);
	
	/** The seedling inventory PO ss. */
	private Set<SeedlingInventoryPOS> seedlingInventoryPOSs = new HashSet<SeedlingInventoryPOS>(
			0);
	
	/** The stands for tree 2. */
	private Set<Stand> standsForTree2 = new HashSet<Stand>(0);

	/**
	 * Instantiates a new tree species.
	 */
	public TreeSpecies() {
	}

	/**
	 * Instantiates a new tree species.
	 *
	 * @param code the code
	 * @param nameEn the name en
	 * @param nameAl the name al
	 * @param nameSr the name sr
	 * @param nameLa the name la
	 * @param speciesBonitet the species bonitet
	 * @param maxDiameter the max diameter
	 */
	public TreeSpecies(Long code, String nameEn, String nameAl, String nameSr,
			String nameLa, Double speciesBonitet, Double maxDiameter) {
		this.code = code;
		this.nameEn = nameEn;
		this.nameAl = nameAl;
		this.nameSr = nameSr;
		this.nameLa = nameLa;
		this.speciesBonitet = speciesBonitet;
		this.maxDiameter = maxDiameter;
	}

	/**
	 * Instantiates a new tree species.
	 *
	 * @param code the code
	 * @param nameEn the name en
	 * @param nameAl the name al
	 * @param nameSr the name sr
	 * @param nameLa the name la
	 * @param speciesGroup the species group
	 * @param speciesBonitet the species bonitet
	 * @param maxDiameter the max diameter
	 * @param seedlingInventories the seedling inventories
	 * @param standsForTree3 the stands for tree 3
	 * @param standsForTree1 the stands for tree 1
	 * @param standPlantingActivities the stand planting activities
	 * @param privateRequestImpls the private request impls
	 * @param seedActivities the seed activities
	 * @param standHarvestActivities the stand harvest activities
	 * @param seedlingInventoryPOSs the seedling inventory PO ss
	 * @param standsForTree2 the stands for tree 2
	 */
	public TreeSpecies(Long code, String nameEn, String nameAl, String nameSr,
			String nameLa, Treespeciesgroup speciesGroup,
			Double speciesBonitet, Double maxDiameter,
			Set<SeedlingInventory> seedlingInventories,
			Set<Stand> standsForTree3, Set<Stand> standsForTree1,
			Set<StandPlantingActivity> standPlantingActivities,
			Set<PrivateRequestImpl> privateRequestImpls,
			Set<SeedActivity> seedActivities,
			Set<StandHarvestActivity> standHarvestActivities,
			Set<SeedlingInventoryPOS> seedlingInventoryPOSs,
			Set<Stand> standsForTree2) {
		this.code = code;
		this.nameEn = nameEn;
		this.nameAl = nameAl;
		this.nameSr = nameSr;
		this.nameLa = nameLa;
		this.speciesGroup = speciesGroup;
		this.speciesBonitet = speciesBonitet;
		this.maxDiameter = maxDiameter;
		this.seedlingInventories = seedlingInventories;
		this.standsForTree3 = standsForTree3;
		this.standsForTree1 = standsForTree1;
		this.standPlantingActivities = standPlantingActivities;
		this.privateRequestImpls = privateRequestImpls;
		this.seedActivities = seedActivities;
		this.standHarvestActivities = standHarvestActivities;
		this.seedlingInventoryPOSs = seedlingInventoryPOSs;
		this.standsForTree2 = standsForTree2;
	}

	/* (non-Javadoc)
	 * @see com.geoland.framework.persistence.base.AbstractPersistentObject#getId()
	 */
	@GenericGenerator(name = "generator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "id", unique = true, nullable = false)
	public Long getId() {
		return this.id;
	}

	/* (non-Javadoc)
	 * @see com.geoland.framework.persistence.base.AbstractPersistentObject#setId(java.lang.Long)
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * Gets the code.
	 *
	 * @return the code
	 */
	@Column(name = "code", nullable = false)
	public Long getCode() {
		return this.code;
	}

	/**
	 * Sets the code.
	 *
	 * @param code the new code
	 */
	public void setCode(Long code) {
		this.code = code;
	}

	/**
	 * Gets the name en.
	 *
	 * @return the name en
	 */
	@Column(name = "name_en", nullable = false, length = 100)
	public String getNameEn() {
		return this.nameEn;
	}

	/**
	 * Sets the name en.
	 *
	 * @param nameEn the new name en
	 */
	public void setNameEn(String nameEn) {
		this.nameEn = nameEn;
	}

	/**
	 * Gets the name al.
	 *
	 * @return the name al
	 */
	@Column(name = "name_al", nullable = false, length = 100)
	public String getNameAl() {
		return this.nameAl;
	}

	/**
	 * Sets the name al.
	 *
	 * @param nameAl the new name al
	 */
	public void setNameAl(String nameAl) {
		this.nameAl = nameAl;
	}

	/**
	 * Gets the name sr.
	 *
	 * @return the name sr
	 */
	@Column(name = "name_sr", nullable = false, length = 100)
	public String getNameSr() {
		return this.nameSr;
	}

	/**
	 * Sets the name sr.
	 *
	 * @param nameSr the new name sr
	 */
	public void setNameSr(String nameSr) {
		this.nameSr = nameSr;
	}

	/**
	 * Gets the name la.
	 *
	 * @return the name la
	 */
	@Column(name = "name_la", nullable = false, length = 100)
	public String getNameLa() {
		return this.nameLa;
	}

	/**
	 * Sets the name la.
	 *
	 * @param nameLa the new name la
	 */
	public void setNameLa(String nameLa) {
		this.nameLa = nameLa;
	}

	/**
	 * Gets the species group.
	 *
	 * @return the species group
	 */
	@Column(name = "species_group", length = 100)
	@Type(type = "com.geoland.kfis.persistence.hibernate.usertypes.TreespeciesgroupUserType")
	public Treespeciesgroup getSpeciesGroup() {
		return this.speciesGroup;
	}

	/**
	 * Sets the species group.
	 *
	 * @param speciesGroup the new species group
	 */
	public void setSpeciesGroup(Treespeciesgroup speciesGroup) {
		this.speciesGroup = speciesGroup;
	}

	/**
	 * Gets the species bonitet.
	 *
	 * @return the species bonitet
	 */
	@Column(name = "species_bonitet", nullable = false, precision = 17, scale = 17)
	public Double getSpeciesBonitet() {
		return this.speciesBonitet;
	}

	/**
	 * Sets the species bonitet.
	 *
	 * @param speciesBonitet the new species bonitet
	 */
	public void setSpeciesBonitet(Double speciesBonitet) {
		this.speciesBonitet = speciesBonitet;
	}

	/**
	 * Gets the max diameter.
	 *
	 * @return the max diameter
	 */
	@Column(name = "max_diameter", nullable = false, precision = 17, scale = 17)
	public Double getMaxDiameter() {
		return this.maxDiameter;
	}

	/**
	 * Sets the max diameter.
	 *
	 * @param maxDiameter the new max diameter
	 */
	public void setMaxDiameter(Double maxDiameter) {
		this.maxDiameter = maxDiameter;
	}

	/**
	 * Gets the seedling inventories.
	 *
	 * @return the seedling inventories
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "treeSpecies")
	public Set<SeedlingInventory> getSeedlingInventories() {
		return this.seedlingInventories;
	}

	/**
	 * Sets the seedling inventories.
	 *
	 * @param seedlingInventories the new seedling inventories
	 */
	public void setSeedlingInventories(
			Set<SeedlingInventory> seedlingInventories) {
		this.seedlingInventories = seedlingInventories;
	}

	/**
	 * Gets the stands for tree 3.
	 *
	 * @return the stands for tree 3
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "treeSpeciesByTree3")
	public Set<Stand> getStandsForTree3() {
		return this.standsForTree3;
	}

	/**
	 * Sets the stands for tree 3.
	 *
	 * @param standsForTree3 the new stands for tree 3
	 */
	public void setStandsForTree3(Set<Stand> standsForTree3) {
		this.standsForTree3 = standsForTree3;
	}

	/**
	 * Gets the stands for tree 1.
	 *
	 * @return the stands for tree 1
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "treeSpeciesByTree1")
	public Set<Stand> getStandsForTree1() {
		return this.standsForTree1;
	}

	/**
	 * Sets the stands for tree 1.
	 *
	 * @param standsForTree1 the new stands for tree 1
	 */
	public void setStandsForTree1(Set<Stand> standsForTree1) {
		this.standsForTree1 = standsForTree1;
	}

	/**
	 * Gets the stand planting activities.
	 *
	 * @return the stand planting activities
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "treeSpecies")
	public Set<StandPlantingActivity> getStandPlantingActivities() {
		return this.standPlantingActivities;
	}

	/**
	 * Sets the stand planting activities.
	 *
	 * @param standPlantingActivities the new stand planting activities
	 */
	public void setStandPlantingActivities(
			Set<StandPlantingActivity> standPlantingActivities) {
		this.standPlantingActivities = standPlantingActivities;
	}

	/**
	 * Gets the private request impls.
	 *
	 * @return the private request impls
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "treeSpecies")
	public Set<PrivateRequestImpl> getPrivateRequestImpls() {
		return this.privateRequestImpls;
	}

	/**
	 * Sets the private request impls.
	 *
	 * @param privateRequestImpls the new private request impls
	 */
	public void setPrivateRequestImpls(
			Set<PrivateRequestImpl> privateRequestImpls) {
		this.privateRequestImpls = privateRequestImpls;
	}

	/**
	 * Gets the seed activities.
	 *
	 * @return the seed activities
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "treeSpecies")
	public Set<SeedActivity> getSeedActivities() {
		return this.seedActivities;
	}

	/**
	 * Sets the seed activities.
	 *
	 * @param seedActivities the new seed activities
	 */
	public void setSeedActivities(Set<SeedActivity> seedActivities) {
		this.seedActivities = seedActivities;
	}

	/**
	 * Gets the stand harvest activities.
	 *
	 * @return the stand harvest activities
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "treeSpecies")
	public Set<StandHarvestActivity> getStandHarvestActivities() {
		return this.standHarvestActivities;
	}

	/**
	 * Sets the stand harvest activities.
	 *
	 * @param standHarvestActivities the new stand harvest activities
	 */
	public void setStandHarvestActivities(
			Set<StandHarvestActivity> standHarvestActivities) {
		this.standHarvestActivities = standHarvestActivities;
	}

	/**
	 * Gets the seedling inventory PO ss.
	 *
	 * @return the seedling inventory PO ss
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "treeSpecies")
	public Set<SeedlingInventoryPOS> getSeedlingInventoryPOSs() {
		return this.seedlingInventoryPOSs;
	}

	/**
	 * Sets the seedling inventory PO ss.
	 *
	 * @param seedlingInventoryPOSs the new seedling inventory PO ss
	 */
	public void setSeedlingInventoryPOSs(
			Set<SeedlingInventoryPOS> seedlingInventoryPOSs) {
		this.seedlingInventoryPOSs = seedlingInventoryPOSs;
	}

	/**
	 * Gets the stands for tree 2.
	 *
	 * @return the stands for tree 2
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "treeSpeciesByTree2")
	public Set<Stand> getStandsForTree2() {
		return this.standsForTree2;
	}

	/**
	 * Sets the stands for tree 2.
	 *
	 * @param standsForTree2 the new stands for tree 2
	 */
	public void setStandsForTree2(Set<Stand> standsForTree2) {
		this.standsForTree2 = standsForTree2;
	}

}
