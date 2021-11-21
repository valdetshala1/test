package com.geoland.kfis.model;

// Generated Nov 18, 2015 11:56:28 AM by Hibernate Tools 4.0.0

import com.geoland.framework.persistence.base.*;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.TypeDef;
import org.hibernate.spatial.GeometryType;
import com.geoland.kfis.persistence.hibernate.usertypes.Accessible;
import com.geoland.kfis.persistence.hibernate.usertypes.Estimatetrees;
import com.geoland.kfis.persistence.hibernate.usertypes.Forestorigin;
import com.geoland.kfis.persistence.hibernate.usertypes.Minehazard;
import com.geoland.kfis.persistence.hibernate.usertypes.Mngmclass;
import com.geoland.kfis.persistence.hibernate.usertypes.Standtype;
import com.vividsolutions.jts.geom.Geometry;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.GenericGenerator;

// TODO: Auto-generated Javadoc
/**
 * Stand generated by hbm2java.
 */
@Entity
@Table(name = "tgis_stand", schema = "public")
@TypeDef(name = "geometry", typeClass = GeometryType.class)
public class Stand extends AbstractPersistentObject implements
		java.io.Serializable {

	/** The id. */
	private Long id;
	
	/** The compartment. */
	private Compartment compartment;
	
	/** The tree species by decidouse. */
	private TreeSpecies treeSpeciesByDecidouse;
	
	/** The tree species by tree 1. */
	private TreeSpecies treeSpeciesByTree1;
	
	/** The tree species by tree 2. */
	private TreeSpecies treeSpeciesByTree2;
	
	/** The tree species by tree 3. */
	private TreeSpecies treeSpeciesByTree3;
	
	/** The tree species by conifer. */
	private TreeSpecies treeSpeciesByConifer;
	
	/** The estimate volume. */
	private EstimateVolume estimateVolume;
	
	/** The stand id. */
	private String standId;
	
	/** The stand nr. */
	private String standNr;
	
	/** The mngm class. */
	private Mngmclass mngmClass;
	
	/** The no plots. */
	private Long noPlots;
	
	/** The minehazard. */
	private Minehazard minehazard;
	
	/** The layers. */
	private Long layers;
	
	/** The access type. */
	private Accessible accessType;
	
	/** The basal area. */
	private Double basalArea;
	
	/** The stand type. */
	private Standtype standType;
	
	/** The crowncover. */
	private Double crowncover;
	
	/** The slope. */
	private Double slope;
	
	/** The littercov. */
	private Double littercov;
	
	/** The age. */
	private Long age;
	
	/** The origin. */
	private Forestorigin origin;
	
	/** The conifer bon. */
	private Double coniferBon;
	
	/** The decidouse bon. */
	private Double decidouseBon;
	
	/** The trees. */
	private Long trees;
	
	/** The volume M 3 ha. */
	private Double volumeM3ha;
	
	/** The conifer perc. */
	private Double coniferPerc;
	
	/** The decidouse perc. */
	private Double decidousePerc;
	
	/** The perc 030. */
	private Double perc030;
	
	/** The perc 3050. */
	private Double perc3050;
	
	/** The perc 5070. */
	private Double perc5070;
	
	/** The perc 70100. */
	private Double perc70100;
	
	/** The incr perc. */
	private Double incrPerc;
	
	/** The m 2 ha. */
	private Double m2Ha;
	
	/** The ds con. */
	private Double dsCon;
	
	/** The ds bro. */
	private Double dsBro;
	
	/** The cl 1 perc con. */
	private Double cl1PercCon;
	
	/** The cl 2 perc con. */
	private Double cl2PercCon;
	
	/** The cl 3 perc con. */
	private Double cl3PercCon;
	
	/** The cl 4 perc con. */
	private Double cl4PercCon;
	
	/** The cl 1 perc dec. */
	private Double cl1PercDec;
	
	/** The cl 2 perc dec. */
	private Double cl2PercDec;
	
	/** The cl 3 perc dec. */
	private Double cl3PercDec;
	
	/** The cl 4 perc dec. */
	private Double cl4PercDec;
	
	/** The damage perc. */
	private Double damagePerc;
	
	/** The estimate trees per ha. */
	private Estimatetrees estimateTreesPerHa;
	
	/** The height mean. */
	private Long heightMean;
	
	/** The survey date. */
	private Date surveyDate;
	
	/** The remarks. */
	private String remarks;
	
	/** The status. */
	private String status;
	
	/** The geom. */
	private Geometry theGeom;
	
	/** The biodiversities. */
	private Set<Biodiversity> biodiversities = new HashSet<Biodiversity>(0);
	
	/** The stand growths. */
	private Set<StandGrowth> standGrowths = new HashSet<StandGrowth>(0);
	
	/** The plots. */
	private Set<Plot> plots = new HashSet<Plot>(0);
	
	/** The stand harvest activities. */
	private Set<StandHarvestActivity> standHarvestActivities = new HashSet<StandHarvestActivity>(
			0);
	
	/** The stand planting activities. */
	private Set<StandPlantingActivity> standPlantingActivities = new HashSet<StandPlantingActivity>(
			0);
	
	/** The stand silviculture activities. */
	private Set<StandSilvicultureActivity> standSilvicultureActivities = new HashSet<StandSilvicultureActivity>(
			0);
	
	/** The fire detailses. */
	private Set<FireDetails> fireDetailses = new HashSet<FireDetails>(0);
	
	/** The shape stand treatments. */
	private Set<ShapeStandTreatment> shapeStandTreatments = new HashSet<ShapeStandTreatment>(
			0);

	/**
	 * Instantiates a new stand.
	 */
	public Stand() {
	}

	/**
	 * Instantiates a new stand.
	 *
	 * @param compartment the compartment
	 * @param standId the stand id
	 * @param standNr the stand nr
	 * @param mngmClass the mngm class
	 * @param accessType the access type
	 * @param basalArea the basal area
	 */
	public Stand(Compartment compartment, String standId, String standNr,
			Mngmclass mngmClass, Accessible accessType, Double basalArea) {
		this.compartment = compartment;
		this.standId = standId;
		this.standNr = standNr;
		this.mngmClass = mngmClass;
		this.accessType = accessType;
		this.basalArea = basalArea;
	}

	/**
	 * Instantiates a new stand.
	 *
	 * @param compartment the compartment
	 * @param treeSpeciesByDecidouse the tree species by decidouse
	 * @param treeSpeciesByTree1 the tree species by tree 1
	 * @param treeSpeciesByTree2 the tree species by tree 2
	 * @param treeSpeciesByTree3 the tree species by tree 3
	 * @param treeSpeciesByConifer the tree species by conifer
	 * @param estimateVolume the estimate volume
	 * @param standId the stand id
	 * @param standNr the stand nr
	 * @param mngmClass the mngm class
	 * @param noPlots the no plots
	 * @param minehazard the minehazard
	 * @param layers the layers
	 * @param accessType the access type
	 * @param basalArea the basal area
	 * @param standType the stand type
	 * @param crowncover the crowncover
	 * @param slope the slope
	 * @param littercov the littercov
	 * @param age the age
	 * @param origin the origin
	 * @param coniferBon the conifer bon
	 * @param decidouseBon the decidouse bon
	 * @param trees the trees
	 * @param volumeM3ha the volume M 3 ha
	 * @param coniferPerc the conifer perc
	 * @param decidousePerc the decidouse perc
	 * @param perc030 the perc 030
	 * @param perc3050 the perc 3050
	 * @param perc5070 the perc 5070
	 * @param perc70100 the perc 70100
	 * @param incrPerc the incr perc
	 * @param m2Ha the m 2 ha
	 * @param dsCon the ds con
	 * @param dsBro the ds bro
	 * @param cl1PercCon the cl 1 perc con
	 * @param cl2PercCon the cl 2 perc con
	 * @param cl3PercCon the cl 3 perc con
	 * @param cl4PercCon the cl 4 perc con
	 * @param cl1PercDec the cl 1 perc dec
	 * @param cl2PercDec the cl 2 perc dec
	 * @param cl3PercDec the cl 3 perc dec
	 * @param cl4PercDec the cl 4 perc dec
	 * @param damagePerc the damage perc
	 * @param estimateTreesPerHa the estimate trees per ha
	 * @param heightMean the height mean
	 * @param surveyDate the survey date
	 * @param remarks the remarks
	 * @param status the status
	 * @param theGeom the the geom
	 * @param biodiversities the biodiversities
	 * @param standGrowths the stand growths
	 * @param plots the plots
	 * @param standHarvestActivities the stand harvest activities
	 * @param standPlantingActivities the stand planting activities
	 * @param standSilvicultureActivities the stand silviculture activities
	 * @param fireDetailses the fire detailses
	 * @param shapeStandTreatments the shape stand treatments
	 */
	public Stand(Compartment compartment, TreeSpecies treeSpeciesByDecidouse,
			TreeSpecies treeSpeciesByTree1, TreeSpecies treeSpeciesByTree2,
			TreeSpecies treeSpeciesByTree3, TreeSpecies treeSpeciesByConifer,
			EstimateVolume estimateVolume, String standId, String standNr,
			Mngmclass mngmClass, Long noPlots, Minehazard minehazard,
			Long layers, Accessible accessType, Double basalArea,
			Standtype standType, Double crowncover, Double slope,
			Double littercov, Long age, Forestorigin origin, Double coniferBon,
			Double decidouseBon, Long trees, Double volumeM3ha,
			Double coniferPerc, Double decidousePerc, Double perc030,
			Double perc3050, Double perc5070, Double perc70100,
			Double incrPerc, Double m2Ha, Double dsCon, Double dsBro,
			Double cl1PercCon, Double cl2PercCon, Double cl3PercCon,
			Double cl4PercCon, Double cl1PercDec, Double cl2PercDec,
			Double cl3PercDec, Double cl4PercDec, Double damagePerc,
			Estimatetrees estimateTreesPerHa, Long heightMean, Date surveyDate,
			String remarks, String status, Geometry theGeom,
			Set<Biodiversity> biodiversities, Set<StandGrowth> standGrowths,
			Set<Plot> plots, Set<StandHarvestActivity> standHarvestActivities,
			Set<StandPlantingActivity> standPlantingActivities,
			Set<StandSilvicultureActivity> standSilvicultureActivities,
			Set<FireDetails> fireDetailses,
			Set<ShapeStandTreatment> shapeStandTreatments) {
		this.compartment = compartment;
		this.treeSpeciesByDecidouse = treeSpeciesByDecidouse;
		this.treeSpeciesByTree1 = treeSpeciesByTree1;
		this.treeSpeciesByTree2 = treeSpeciesByTree2;
		this.treeSpeciesByTree3 = treeSpeciesByTree3;
		this.treeSpeciesByConifer = treeSpeciesByConifer;
		this.estimateVolume = estimateVolume;
		this.standId = standId;
		this.standNr = standNr;
		this.mngmClass = mngmClass;
		this.noPlots = noPlots;
		this.minehazard = minehazard;
		this.layers = layers;
		this.accessType = accessType;
		this.basalArea = basalArea;
		this.standType = standType;
		this.crowncover = crowncover;
		this.slope = slope;
		this.littercov = littercov;
		this.age = age;
		this.origin = origin;
		this.coniferBon = coniferBon;
		this.decidouseBon = decidouseBon;
		this.trees = trees;
		this.volumeM3ha = volumeM3ha;
		this.coniferPerc = coniferPerc;
		this.decidousePerc = decidousePerc;
		this.perc030 = perc030;
		this.perc3050 = perc3050;
		this.perc5070 = perc5070;
		this.perc70100 = perc70100;
		this.incrPerc = incrPerc;
		this.m2Ha = m2Ha;
		this.dsCon = dsCon;
		this.dsBro = dsBro;
		this.cl1PercCon = cl1PercCon;
		this.cl2PercCon = cl2PercCon;
		this.cl3PercCon = cl3PercCon;
		this.cl4PercCon = cl4PercCon;
		this.cl1PercDec = cl1PercDec;
		this.cl2PercDec = cl2PercDec;
		this.cl3PercDec = cl3PercDec;
		this.cl4PercDec = cl4PercDec;
		this.damagePerc = damagePerc;
		this.estimateTreesPerHa = estimateTreesPerHa;
		this.heightMean = heightMean;
		this.surveyDate = surveyDate;
		this.remarks = remarks;
		this.status = status;
		this.theGeom = theGeom;
		this.biodiversities = biodiversities;
		this.standGrowths = standGrowths;
		this.plots = plots;
		this.standHarvestActivities = standHarvestActivities;
		this.standPlantingActivities = standPlantingActivities;
		this.standSilvicultureActivities = standSilvicultureActivities;
		this.fireDetailses = fireDetailses;
		this.shapeStandTreatments = shapeStandTreatments;
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
	 * Gets the compartment.
	 *
	 * @return the compartment
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "compartment_id", nullable = false)
	public Compartment getCompartment() {
		return this.compartment;
	}

	/**
	 * Sets the compartment.
	 *
	 * @param compartment the new compartment
	 */
	public void setCompartment(Compartment compartment) {
		this.compartment = compartment;
	}

	/**
	 * Gets the tree species by decidouse.
	 *
	 * @return the tree species by decidouse
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "decidouse")
	public TreeSpecies getTreeSpeciesByDecidouse() {
		return this.treeSpeciesByDecidouse;
	}

	/**
	 * Sets the tree species by decidouse.
	 *
	 * @param treeSpeciesByDecidouse the new tree species by decidouse
	 */
	public void setTreeSpeciesByDecidouse(TreeSpecies treeSpeciesByDecidouse) {
		this.treeSpeciesByDecidouse = treeSpeciesByDecidouse;
	}

	/**
	 * Gets the tree species by tree 1.
	 *
	 * @return the tree species by tree 1
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "tree1")
	public TreeSpecies getTreeSpeciesByTree1() {
		return this.treeSpeciesByTree1;
	}

	/**
	 * Sets the tree species by tree 1.
	 *
	 * @param treeSpeciesByTree1 the new tree species by tree 1
	 */
	public void setTreeSpeciesByTree1(TreeSpecies treeSpeciesByTree1) {
		this.treeSpeciesByTree1 = treeSpeciesByTree1;
	}

	/**
	 * Gets the tree species by tree 2.
	 *
	 * @return the tree species by tree 2
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "tree2")
	public TreeSpecies getTreeSpeciesByTree2() {
		return this.treeSpeciesByTree2;
	}

	/**
	 * Sets the tree species by tree 2.
	 *
	 * @param treeSpeciesByTree2 the new tree species by tree 2
	 */
	public void setTreeSpeciesByTree2(TreeSpecies treeSpeciesByTree2) {
		this.treeSpeciesByTree2 = treeSpeciesByTree2;
	}

	/**
	 * Gets the tree species by tree 3.
	 *
	 * @return the tree species by tree 3
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "tree3")
	public TreeSpecies getTreeSpeciesByTree3() {
		return this.treeSpeciesByTree3;
	}

	/**
	 * Sets the tree species by tree 3.
	 *
	 * @param treeSpeciesByTree3 the new tree species by tree 3
	 */
	public void setTreeSpeciesByTree3(TreeSpecies treeSpeciesByTree3) {
		this.treeSpeciesByTree3 = treeSpeciesByTree3;
	}

	/**
	 * Gets the tree species by conifer.
	 *
	 * @return the tree species by conifer
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "conifer")
	public TreeSpecies getTreeSpeciesByConifer() {
		return this.treeSpeciesByConifer;
	}

	/**
	 * Sets the tree species by conifer.
	 *
	 * @param treeSpeciesByConifer the new tree species by conifer
	 */
	public void setTreeSpeciesByConifer(TreeSpecies treeSpeciesByConifer) {
		this.treeSpeciesByConifer = treeSpeciesByConifer;
	}

	/**
	 * Gets the estimate volume.
	 *
	 * @return the estimate volume
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "estemate_volume")
	public EstimateVolume getEstimateVolume() {
		return this.estimateVolume;
	}

	/**
	 * Sets the estimate volume.
	 *
	 * @param estimateVolume the new estimate volume
	 */
	public void setEstimateVolume(EstimateVolume estimateVolume) {
		this.estimateVolume = estimateVolume;
	}

	/**
	 * Gets the stand id.
	 *
	 * @return the stand id
	 */
	@Column(name = "stand_id", nullable = false, length = 9)
	public String getStandId() {
		return this.standId;
	}

	/**
	 * Sets the stand id.
	 *
	 * @param standId the new stand id
	 */
	public void setStandId(String standId) {
		this.standId = standId;
	}

	/**
	 * Gets the stand nr.
	 *
	 * @return the stand nr
	 */
	@Column(name = "stand_nr", nullable = false, length = 2)
	public String getStandNr() {
		return this.standNr;
	}

	/**
	 * Sets the stand nr.
	 *
	 * @param standNr the new stand nr
	 */
	public void setStandNr(String standNr) {
		this.standNr = standNr;
	}

	/**
	 * Gets the mngm class.
	 *
	 * @return the mngm class
	 */
	@Column(name = "mngm_class", nullable = false, length = 4)
	@Type(type = "com.geoland.kfis.persistence.hibernate.usertypes.MngmclassUserType")
	public Mngmclass getMngmClass() {
		return this.mngmClass;
	}

	/**
	 * Sets the mngm class.
	 *
	 * @param mngmClass the new mngm class
	 */
	public void setMngmClass(Mngmclass mngmClass) {
		this.mngmClass = mngmClass;
	}

	/**
	 * Gets the no plots.
	 *
	 * @return the no plots
	 */
	@Column(name = "no_plots")
	public Long getNoPlots() {
		return this.noPlots;
	}

	/**
	 * Sets the no plots.
	 *
	 * @param noPlots the new no plots
	 */
	public void setNoPlots(Long noPlots) {
		this.noPlots = noPlots;
	}

	/**
	 * Gets the minehazard.
	 *
	 * @return the minehazard
	 */
	@Column(name = "minehazard", length = 3)
	@Type(type = "com.geoland.kfis.persistence.hibernate.usertypes.MinehazardUserType")
	public Minehazard getMinehazard() {
		return this.minehazard;
	}

	/**
	 * Sets the minehazard.
	 *
	 * @param minehazard the new minehazard
	 */
	public void setMinehazard(Minehazard minehazard) {
		this.minehazard = minehazard;
	}

	/**
	 * Gets the layers.
	 *
	 * @return the layers
	 */
	@Column(name = "layers")
	public Long getLayers() {
		return this.layers;
	}

	/**
	 * Sets the layers.
	 *
	 * @param layers the new layers
	 */
	public void setLayers(Long layers) {
		this.layers = layers;
	}

	/**
	 * Gets the access type.
	 *
	 * @return the access type
	 */
	@Column(name = "access_type", nullable = false, length = 20)
	@Type(type = "com.geoland.kfis.persistence.hibernate.usertypes.AccessibleUserType")
	public Accessible getAccessType() {
		return this.accessType;
	}

	/**
	 * Sets the access type.
	 *
	 * @param accessType the new access type
	 */
	public void setAccessType(Accessible accessType) {
		this.accessType = accessType;
	}

	/**
	 * Gets the basal area.
	 *
	 * @return the basal area
	 */
	@Column(name = "basal_area", nullable = false, precision = 17, scale = 17)
	public Double getBasalArea() {
		return this.basalArea;
	}

	/**
	 * Sets the basal area.
	 *
	 * @param basalArea the new basal area
	 */
	public void setBasalArea(Double basalArea) {
		this.basalArea = basalArea;
	}

	/**
	 * Gets the stand type.
	 *
	 * @return the stand type
	 */
	@Column(name = "stand_type", length = 1)
	@Type(type = "com.geoland.kfis.persistence.hibernate.usertypes.StandtypeUserType")
	public Standtype getStandType() {
		return this.standType;
	}

	/**
	 * Sets the stand type.
	 *
	 * @param standType the new stand type
	 */
	public void setStandType(Standtype standType) {
		this.standType = standType;
	}

	/**
	 * Gets the crowncover.
	 *
	 * @return the crowncover
	 */
	@Column(name = "crowncover", precision = 17, scale = 17)
	public Double getCrowncover() {
		return this.crowncover;
	}

	/**
	 * Sets the crowncover.
	 *
	 * @param crowncover the new crowncover
	 */
	public void setCrowncover(Double crowncover) {
		this.crowncover = crowncover;
	}

	/**
	 * Gets the slope.
	 *
	 * @return the slope
	 */
	@Column(name = "slope", precision = 17, scale = 17)
	public Double getSlope() {
		return this.slope;
	}

	/**
	 * Sets the slope.
	 *
	 * @param slope the new slope
	 */
	public void setSlope(Double slope) {
		this.slope = slope;
	}

	/**
	 * Gets the littercov.
	 *
	 * @return the littercov
	 */
	@Column(name = "littercov", precision = 17, scale = 17)
	public Double getLittercov() {
		return this.littercov;
	}

	/**
	 * Sets the littercov.
	 *
	 * @param littercov the new littercov
	 */
	public void setLittercov(Double littercov) {
		this.littercov = littercov;
	}

	/**
	 * Gets the age.
	 *
	 * @return the age
	 */
	@Column(name = "age")
	public Long getAge() {
		return this.age;
	}

	/**
	 * Sets the age.
	 *
	 * @param age the new age
	 */
	public void setAge(Long age) {
		this.age = age;
	}

	/**
	 * Gets the origin.
	 *
	 * @return the origin
	 */
	@Column(name = "origin", length = 1)
	@Type(type = "com.geoland.kfis.persistence.hibernate.usertypes.ForestoriginUserType")
	public Forestorigin getOrigin() {
		return this.origin;
	}

	/**
	 * Sets the origin.
	 *
	 * @param origin the new origin
	 */
	public void setOrigin(Forestorigin origin) {
		this.origin = origin;
	}

	/**
	 * Gets the conifer bon.
	 *
	 * @return the conifer bon
	 */
	@Column(name = "conifer_bon", precision = 17, scale = 17)
	public Double getConiferBon() {
		return this.coniferBon;
	}

	/**
	 * Sets the conifer bon.
	 *
	 * @param coniferBon the new conifer bon
	 */
	public void setConiferBon(Double coniferBon) {
		this.coniferBon = coniferBon;
	}

	/**
	 * Gets the decidouse bon.
	 *
	 * @return the decidouse bon
	 */
	@Column(name = "decidouse_bon", precision = 17, scale = 17)
	public Double getDecidouseBon() {
		return this.decidouseBon;
	}

	/**
	 * Sets the decidouse bon.
	 *
	 * @param decidouseBon the new decidouse bon
	 */
	public void setDecidouseBon(Double decidouseBon) {
		this.decidouseBon = decidouseBon;
	}

	/**
	 * Gets the trees.
	 *
	 * @return the trees
	 */
	@Column(name = "trees")
	public Long getTrees() {
		return this.trees;
	}

	/**
	 * Sets the trees.
	 *
	 * @param trees the new trees
	 */
	public void setTrees(Long trees) {
		this.trees = trees;
	}

	/**
	 * Gets the volume M 3 ha.
	 *
	 * @return the volume M 3 ha
	 */
	@Column(name = "volume_m3ha", precision = 17, scale = 17)
	public Double getVolumeM3ha() {
		return this.volumeM3ha;
	}

	/**
	 * Sets the volume M 3 ha.
	 *
	 * @param volumeM3ha the new volume M 3 ha
	 */
	public void setVolumeM3ha(Double volumeM3ha) {
		this.volumeM3ha = volumeM3ha;
	}

	/**
	 * Gets the conifer perc.
	 *
	 * @return the conifer perc
	 */
	@Column(name = "conifer_perc", precision = 17, scale = 17)
	public Double getConiferPerc() {
		return this.coniferPerc;
	}

	/**
	 * Sets the conifer perc.
	 *
	 * @param coniferPerc the new conifer perc
	 */
	public void setConiferPerc(Double coniferPerc) {
		this.coniferPerc = coniferPerc;
	}

	/**
	 * Gets the decidouse perc.
	 *
	 * @return the decidouse perc
	 */
	@Column(name = "decidouse_perc", precision = 17, scale = 17)
	public Double getDecidousePerc() {
		return this.decidousePerc;
	}

	/**
	 * Sets the decidouse perc.
	 *
	 * @param decidousePerc the new decidouse perc
	 */
	public void setDecidousePerc(Double decidousePerc) {
		this.decidousePerc = decidousePerc;
	}

	/**
	 * Gets the perc 030.
	 *
	 * @return the perc 030
	 */
	@Column(name = "perc_0_30", precision = 17, scale = 17)
	public Double getPerc030() {
		return this.perc030;
	}

	/**
	 * Sets the perc 030.
	 *
	 * @param perc030 the new perc 030
	 */
	public void setPerc030(Double perc030) {
		this.perc030 = perc030;
	}

	/**
	 * Gets the perc 3050.
	 *
	 * @return the perc 3050
	 */
	@Column(name = "perc_30_50", precision = 17, scale = 17)
	public Double getPerc3050() {
		return this.perc3050;
	}

	/**
	 * Sets the perc 3050.
	 *
	 * @param perc3050 the new perc 3050
	 */
	public void setPerc3050(Double perc3050) {
		this.perc3050 = perc3050;
	}

	/**
	 * Gets the perc 5070.
	 *
	 * @return the perc 5070
	 */
	@Column(name = "perc_50_70", precision = 17, scale = 17)
	public Double getPerc5070() {
		return this.perc5070;
	}

	/**
	 * Sets the perc 5070.
	 *
	 * @param perc5070 the new perc 5070
	 */
	public void setPerc5070(Double perc5070) {
		this.perc5070 = perc5070;
	}

	/**
	 * Gets the perc 70100.
	 *
	 * @return the perc 70100
	 */
	@Column(name = "perc_70_100", precision = 17, scale = 17)
	public Double getPerc70100() {
		return this.perc70100;
	}

	/**
	 * Sets the perc 70100.
	 *
	 * @param perc70100 the new perc 70100
	 */
	public void setPerc70100(Double perc70100) {
		this.perc70100 = perc70100;
	}

	/**
	 * Gets the incr perc.
	 *
	 * @return the incr perc
	 */
	@Column(name = "incr_perc", precision = 17, scale = 17)
	public Double getIncrPerc() {
		return this.incrPerc;
	}

	/**
	 * Sets the incr perc.
	 *
	 * @param incrPerc the new incr perc
	 */
	public void setIncrPerc(Double incrPerc) {
		this.incrPerc = incrPerc;
	}

	/**
	 * Gets the m 2 ha.
	 *
	 * @return the m 2 ha
	 */
	@Column(name = "m2_ha", precision = 17, scale = 17)
	public Double getM2Ha() {
		return this.m2Ha;
	}

	/**
	 * Sets the m 2 ha.
	 *
	 * @param m2Ha the new m 2 ha
	 */
	public void setM2Ha(Double m2Ha) {
		this.m2Ha = m2Ha;
	}

	/**
	 * Gets the ds con.
	 *
	 * @return the ds con
	 */
	@Column(name = "ds_con", precision = 17, scale = 17)
	public Double getDsCon() {
		return this.dsCon;
	}

	/**
	 * Sets the ds con.
	 *
	 * @param dsCon the new ds con
	 */
	public void setDsCon(Double dsCon) {
		this.dsCon = dsCon;
	}

	/**
	 * Gets the ds bro.
	 *
	 * @return the ds bro
	 */
	@Column(name = "ds_bro", precision = 17, scale = 17)
	public Double getDsBro() {
		return this.dsBro;
	}

	/**
	 * Sets the ds bro.
	 *
	 * @param dsBro the new ds bro
	 */
	public void setDsBro(Double dsBro) {
		this.dsBro = dsBro;
	}

	/**
	 * Gets the cl 1 perc con.
	 *
	 * @return the cl 1 perc con
	 */
	@Column(name = "cl1_perc_con", precision = 17, scale = 17)
	public Double getCl1PercCon() {
		return this.cl1PercCon;
	}

	/**
	 * Sets the cl 1 perc con.
	 *
	 * @param cl1PercCon the new cl 1 perc con
	 */
	public void setCl1PercCon(Double cl1PercCon) {
		this.cl1PercCon = cl1PercCon;
	}

	/**
	 * Gets the cl 2 perc con.
	 *
	 * @return the cl 2 perc con
	 */
	@Column(name = "cl2_perc_con", precision = 17, scale = 17)
	public Double getCl2PercCon() {
		return this.cl2PercCon;
	}

	/**
	 * Sets the cl 2 perc con.
	 *
	 * @param cl2PercCon the new cl 2 perc con
	 */
	public void setCl2PercCon(Double cl2PercCon) {
		this.cl2PercCon = cl2PercCon;
	}

	/**
	 * Gets the cl 3 perc con.
	 *
	 * @return the cl 3 perc con
	 */
	@Column(name = "cl3_perc_con", precision = 17, scale = 17)
	public Double getCl3PercCon() {
		return this.cl3PercCon;
	}

	/**
	 * Sets the cl 3 perc con.
	 *
	 * @param cl3PercCon the new cl 3 perc con
	 */
	public void setCl3PercCon(Double cl3PercCon) {
		this.cl3PercCon = cl3PercCon;
	}

	/**
	 * Gets the cl 4 perc con.
	 *
	 * @return the cl 4 perc con
	 */
	@Column(name = "cl4_perc_con", precision = 17, scale = 17)
	public Double getCl4PercCon() {
		return this.cl4PercCon;
	}

	/**
	 * Sets the cl 4 perc con.
	 *
	 * @param cl4PercCon the new cl 4 perc con
	 */
	public void setCl4PercCon(Double cl4PercCon) {
		this.cl4PercCon = cl4PercCon;
	}

	/**
	 * Gets the cl 1 perc dec.
	 *
	 * @return the cl 1 perc dec
	 */
	@Column(name = "cl1_perc_dec", precision = 17, scale = 17)
	public Double getCl1PercDec() {
		return this.cl1PercDec;
	}

	/**
	 * Sets the cl 1 perc dec.
	 *
	 * @param cl1PercDec the new cl 1 perc dec
	 */
	public void setCl1PercDec(Double cl1PercDec) {
		this.cl1PercDec = cl1PercDec;
	}

	/**
	 * Gets the cl 2 perc dec.
	 *
	 * @return the cl 2 perc dec
	 */
	@Column(name = "cl2_perc_dec", precision = 17, scale = 17)
	public Double getCl2PercDec() {
		return this.cl2PercDec;
	}

	/**
	 * Sets the cl 2 perc dec.
	 *
	 * @param cl2PercDec the new cl 2 perc dec
	 */
	public void setCl2PercDec(Double cl2PercDec) {
		this.cl2PercDec = cl2PercDec;
	}

	/**
	 * Gets the cl 3 perc dec.
	 *
	 * @return the cl 3 perc dec
	 */
	@Column(name = "cl3_perc_dec", precision = 17, scale = 17)
	public Double getCl3PercDec() {
		return this.cl3PercDec;
	}

	/**
	 * Sets the cl 3 perc dec.
	 *
	 * @param cl3PercDec the new cl 3 perc dec
	 */
	public void setCl3PercDec(Double cl3PercDec) {
		this.cl3PercDec = cl3PercDec;
	}

	/**
	 * Gets the cl 4 perc dec.
	 *
	 * @return the cl 4 perc dec
	 */
	@Column(name = "cl4_perc_dec", precision = 17, scale = 17)
	public Double getCl4PercDec() {
		return this.cl4PercDec;
	}

	/**
	 * Sets the cl 4 perc dec.
	 *
	 * @param cl4PercDec the new cl 4 perc dec
	 */
	public void setCl4PercDec(Double cl4PercDec) {
		this.cl4PercDec = cl4PercDec;
	}

	/**
	 * Gets the damage perc.
	 *
	 * @return the damage perc
	 */
	@Column(name = "damage_perc", precision = 17, scale = 17)
	public Double getDamagePerc() {
		return this.damagePerc;
	}

	/**
	 * Sets the damage perc.
	 *
	 * @param damagePerc the new damage perc
	 */
	public void setDamagePerc(Double damagePerc) {
		this.damagePerc = damagePerc;
	}

	/**
	 * Gets the estimate trees per ha.
	 *
	 * @return the estimate trees per ha
	 */
	@Column(name = "estimate_trees_per_ha", length = 10)
	@Type(type = "com.geoland.kfis.persistence.hibernate.usertypes.EstimatetreesUserType")
	public Estimatetrees getEstimateTreesPerHa() {
		return this.estimateTreesPerHa;
	}

	/**
	 * Sets the estimate trees per ha.
	 *
	 * @param estimateTreesPerHa the new estimate trees per ha
	 */
	public void setEstimateTreesPerHa(Estimatetrees estimateTreesPerHa) {
		this.estimateTreesPerHa = estimateTreesPerHa;
	}

	/**
	 * Gets the height mean.
	 *
	 * @return the height mean
	 */
	@Column(name = "height_mean")
	public Long getHeightMean() {
		return this.heightMean;
	}

	/**
	 * Sets the height mean.
	 *
	 * @param heightMean the new height mean
	 */
	public void setHeightMean(Long heightMean) {
		this.heightMean = heightMean;
	}

	/**
	 * Gets the survey date.
	 *
	 * @return the survey date
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "survey_date", length = 29)
	public Date getSurveyDate() {
		return this.surveyDate;
	}

	/**
	 * Sets the survey date.
	 *
	 * @param surveyDate the new survey date
	 */
	public void setSurveyDate(Date surveyDate) {
		this.surveyDate = surveyDate;
	}

	/**
	 * Gets the remarks.
	 *
	 * @return the remarks
	 */
	@Column(name = "remarks")
	public String getRemarks() {
		return this.remarks;
	}

	/**
	 * Sets the remarks.
	 *
	 * @param remarks the new remarks
	 */
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	/**
	 * Gets the status.
	 *
	 * @return the status
	 */
	@Column(name = "status", length = 3)
	public String getStatus() {
		return this.status;
	}

	/**
	 * Sets the status.
	 *
	 * @param status the new status
	 */
	public void setStatus(String status) {
		this.status = status;
	}

	/**
	 * Gets the the geom.
	 *
	 * @return the the geom
	 */
	@Column(name = "the_geom")
	@Type(type = "org.hibernate.spatial.GeometryType")
	public Geometry getTheGeom() {
		return this.theGeom;
	}

	/**
	 * Sets the the geom.
	 *
	 * @param theGeom the new the geom
	 */
	public void setTheGeom(Geometry theGeom) {
		this.theGeom = theGeom;
	}

	/**
	 * Gets the biodiversities.
	 *
	 * @return the biodiversities
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "stand")
	public Set<Biodiversity> getBiodiversities() {
		return this.biodiversities;
	}

	/**
	 * Sets the biodiversities.
	 *
	 * @param biodiversities the new biodiversities
	 */
	public void setBiodiversities(Set<Biodiversity> biodiversities) {
		this.biodiversities = biodiversities;
	}

	/**
	 * Gets the stand growths.
	 *
	 * @return the stand growths
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "stand")
	public Set<StandGrowth> getStandGrowths() {
		return this.standGrowths;
	}

	/**
	 * Sets the stand growths.
	 *
	 * @param standGrowths the new stand growths
	 */
	public void setStandGrowths(Set<StandGrowth> standGrowths) {
		this.standGrowths = standGrowths;
	}

	/**
	 * Gets the plots.
	 *
	 * @return the plots
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "stand")
	public Set<Plot> getPlots() {
		return this.plots;
	}

	/**
	 * Sets the plots.
	 *
	 * @param plots the new plots
	 */
	public void setPlots(Set<Plot> plots) {
		this.plots = plots;
	}

	/**
	 * Gets the stand harvest activities.
	 *
	 * @return the stand harvest activities
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "stand")
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
	 * Gets the stand planting activities.
	 *
	 * @return the stand planting activities
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "stand")
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
	 * Gets the stand silviculture activities.
	 *
	 * @return the stand silviculture activities
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "stand")
	public Set<StandSilvicultureActivity> getStandSilvicultureActivities() {
		return this.standSilvicultureActivities;
	}

	/**
	 * Sets the stand silviculture activities.
	 *
	 * @param standSilvicultureActivities the new stand silviculture activities
	 */
	public void setStandSilvicultureActivities(
			Set<StandSilvicultureActivity> standSilvicultureActivities) {
		this.standSilvicultureActivities = standSilvicultureActivities;
	}

	/**
	 * Gets the fire detailses.
	 *
	 * @return the fire detailses
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "stand")
	public Set<FireDetails> getFireDetailses() {
		return this.fireDetailses;
	}

	/**
	 * Sets the fire detailses.
	 *
	 * @param fireDetailses the new fire detailses
	 */
	public void setFireDetailses(Set<FireDetails> fireDetailses) {
		this.fireDetailses = fireDetailses;
	}

	/**
	 * Gets the shape stand treatments.
	 *
	 * @return the shape stand treatments
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "stand")
	public Set<ShapeStandTreatment> getShapeStandTreatments() {
		return this.shapeStandTreatments;
	}

	/**
	 * Sets the shape stand treatments.
	 *
	 * @param shapeStandTreatments the new shape stand treatments
	 */
	public void setShapeStandTreatments(
			Set<ShapeStandTreatment> shapeStandTreatments) {
		this.shapeStandTreatments = shapeStandTreatments;
	}

}
