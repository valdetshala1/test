package com.geoland.kfis.model;

// Generated Feb 23, 2015 11:04:08 PM by Hibernate Tools 3.4.0.CR1

import com.geoland.framework.persistence.base.*;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.GenericGenerator;

// TODO: Auto-generated Javadoc
/**
 * FiskosData generated by hbm2java.
 */
@Entity
@Table(name = "tfrm_fiskos_data", schema = "public")
public class FiskosData extends AbstractPersistentObject implements
		java.io.Serializable {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The id. */
	private Long id;
	
	/** The management unit. */
	private ManagementUnit managementUnit;
	
	/** The cadastral municipality. */
	private CadastralMunicipality cadastralMunicipality;
	
	/** The fiskos import. */
	private FiskosImport fiskosImport;
	
	/** The person. */
	private Person person;
	
	/** The region id. */
	private Long regionId;
	
	/** The mngm class id. */
	private Long mngmClassId;
	
	/** The active. */
	private boolean active;
	
	/** The version nr. */
	private Long versionNr;
	
	/** The modyfied date. */
	private Date modyfiedDate;
	
	/** The imported date. */
	private Date importedDate;
	
	/** The notes. */
	private String notes;
	
	/** The region. */
	private String region;
	
	/** The managment unit. */
	private String managmentUnit;
	
	/** The municipality. */
	private String municipality;
	
	/** The comp. */
	private String comp;
	
	/** The stand. */
	private String stand;
	
	/** The standarea. */
	private Double standarea;
	
	/** The mngmnt class. */
	private Long mngmntClass;
	
	/** The alb short. */
	private String albShort;
	
	/** The plots nr. */
	private String plotsNr;
	
	/** The accessible. */
	private String accessible;
	
	/** The minehazard. */
	private String minehazard;
	
	/** The layers. */
	private String layers;
	
	/** The stand type. */
	private String standType;
	
	/** The crowncover. */
	private Double crowncover;
	
	/** The slope. */
	private Double slope;
	
	/** The littercov. */
	private Double littercov;
	
	/** The age. */
	private Long age;
	
	/** The origin. */
	private String origin;
	
	/** The conifer. */
	private String conifer;
	
	/** The conifer bon. */
	private Double coniferBon;
	
	/** The decidouse. */
	private String decidouse;
	
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
	
	/** The estemate volume. */
	private Long estemateVolume;
	
	/** The estimate trees per ha. */
	private Long estimateTreesPerHa;
	
	/** The height mean. */
	private Long heightMean;
	
	/** The tree species 1. */
	private String treeSpecies1;
	
	/** The tree species 2. */
	private String treeSpecies2;
	
	/** The tree species 3. */
	private String treeSpecies3;
	
	/** The tree 1. */
	private Long tree1;
	
	/** The tree 2. */
	private Long tree2;
	
	/** The tree 3. */
	private Long tree3;
	
	/** The terrain date. */
	private Date terrainDate;
	
	/** The survey date. */
	private Date surveyDate;
	
	/** The msgtext. */
	private String msgtext;

	/**
	 * Instantiates a new fiskos data.
	 */
	public FiskosData() {
	}

	/**
	 * Instantiates a new fiskos data.
	 *
	 * @param managementUnit the management unit
	 * @param fiskosImport the fiskos import
	 * @param person the person
	 * @param regionId the region id
	 * @param active the active
	 * @param versionNr the version nr
	 * @param importedDate the imported date
	 */
	public FiskosData(ManagementUnit managementUnit, FiskosImport fiskosImport,
			Person person, Long regionId, boolean active, Long versionNr,
			Date importedDate) {
		this.managementUnit = managementUnit;
		this.fiskosImport = fiskosImport;
		this.person = person;
		this.regionId = regionId;
		this.active = active;
		this.versionNr = versionNr;
		this.importedDate = importedDate;
	}

	/**
	 * Instantiates a new fiskos data.
	 *
	 * @param managementUnit the management unit
	 * @param cadastralMunicipality the cadastral municipality
	 * @param fiskosImport the fiskos import
	 * @param person the person
	 * @param regionId the region id
	 * @param mngmClassId the mngm class id
	 * @param active the active
	 * @param versionNr the version nr
	 * @param modyfiedDate the modyfied date
	 * @param importedDate the imported date
	 * @param notes the notes
	 * @param region the region
	 * @param managmentUnit the managment unit
	 * @param municipality the municipality
	 * @param comp the comp
	 * @param stand the stand
	 * @param standarea the standarea
	 * @param mngmntClass the mngmnt class
	 * @param albShort the alb short
	 * @param plotsNr the plots nr
	 * @param accessible the accessible
	 * @param minehazard the minehazard
	 * @param layers the layers
	 * @param standType the stand type
	 * @param crowncover the crowncover
	 * @param slope the slope
	 * @param littercov the littercov
	 * @param age the age
	 * @param origin the origin
	 * @param conifer the conifer
	 * @param coniferBon the conifer bon
	 * @param decidouse the decidouse
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
	 * @param estemateVolume the estemate volume
	 * @param estimateTreesPerHa the estimate trees per ha
	 * @param heightMean the height mean
	 * @param treeSpecies1 the tree species 1
	 * @param treeSpecies2 the tree species 2
	 * @param treeSpecies3 the tree species 3
	 * @param tree1 the tree 1
	 * @param tree2 the tree 2
	 * @param tree3 the tree 3
	 * @param terrainDate the terrain date
	 * @param surveyDate the survey date
	 * @param msgtext the msgtext
	 */
	public FiskosData(ManagementUnit managementUnit,
			CadastralMunicipality cadastralMunicipality,
			FiskosImport fiskosImport, Person person, Long regionId,
			Long mngmClassId, boolean active, Long versionNr,
			Date modyfiedDate, Date importedDate, String notes, String region,
			String managmentUnit, String municipality, String comp,
			String stand, Double standarea, Long mngmntClass, String albShort,
			String plotsNr, String accessible, String minehazard,
			String layers, String standType, Double crowncover, Double slope,
			Double littercov, Long age, String origin, String conifer,
			Double coniferBon, String decidouse, Double decidouseBon,
			Long trees, Double volumeM3ha, Double coniferPerc,
			Double decidousePerc, Double perc030, Double perc3050,
			Double perc5070, Double perc70100, Double incrPerc, Double m2Ha,
			Double dsCon, Double dsBro, Double cl1PercCon, Double cl2PercCon,
			Double cl3PercCon, Double cl4PercCon, Double cl1PercDec,
			Double cl2PercDec, Double cl3PercDec, Double cl4PercDec,
			Double damagePerc, Long estemateVolume, Long estimateTreesPerHa,
			Long heightMean, String treeSpecies1, String treeSpecies2,
			String treeSpecies3, Long tree1, Long tree2, Long tree3,
			Date terrainDate, Date surveyDate, String msgtext) {
		this.managementUnit = managementUnit;
		this.cadastralMunicipality = cadastralMunicipality;
		this.fiskosImport = fiskosImport;
		this.person = person;
		this.regionId = regionId;
		this.mngmClassId = mngmClassId;
		this.active = active;
		this.versionNr = versionNr;
		this.modyfiedDate = modyfiedDate;
		this.importedDate = importedDate;
		this.notes = notes;
		this.region = region;
		this.managmentUnit = managmentUnit;
		this.municipality = municipality;
		this.comp = comp;
		this.stand = stand;
		this.standarea = standarea;
		this.mngmntClass = mngmntClass;
		this.albShort = albShort;
		this.plotsNr = plotsNr;
		this.accessible = accessible;
		this.minehazard = minehazard;
		this.layers = layers;
		this.standType = standType;
		this.crowncover = crowncover;
		this.slope = slope;
		this.littercov = littercov;
		this.age = age;
		this.origin = origin;
		this.conifer = conifer;
		this.coniferBon = coniferBon;
		this.decidouse = decidouse;
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
		this.estemateVolume = estemateVolume;
		this.estimateTreesPerHa = estimateTreesPerHa;
		this.heightMean = heightMean;
		this.treeSpecies1 = treeSpecies1;
		this.treeSpecies2 = treeSpecies2;
		this.treeSpecies3 = treeSpecies3;
		this.tree1 = tree1;
		this.tree2 = tree2;
		this.tree3 = tree3;
		this.terrainDate = terrainDate;
		this.surveyDate = surveyDate;
		this.msgtext = msgtext;
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
	 * Gets the management unit.
	 *
	 * @return the management unit
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "mu_id", nullable = false)
	public ManagementUnit getManagementUnit() {
		return this.managementUnit;
	}

	/**
	 * Sets the management unit.
	 *
	 * @param managementUnit the new management unit
	 */
	public void setManagementUnit(ManagementUnit managementUnit) {
		this.managementUnit = managementUnit;
	}

	/**
	 * Gets the cadastral municipality.
	 *
	 * @return the cadastral municipality
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "mun_id")
	public CadastralMunicipality getCadastralMunicipality() {
		return this.cadastralMunicipality;
	}

	/**
	 * Sets the cadastral municipality.
	 *
	 * @param cadastralMunicipality the new cadastral municipality
	 */
	public void setCadastralMunicipality(
			CadastralMunicipality cadastralMunicipality) {
		this.cadastralMunicipality = cadastralMunicipality;
	}

	/**
	 * Gets the fiskos import.
	 *
	 * @return the fiskos import
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "import_id", nullable = false)
	public FiskosImport getFiskosImport() {
		return this.fiskosImport;
	}

	/**
	 * Sets the fiskos import.
	 *
	 * @param fiskosImport the new fiskos import
	 */
	public void setFiskosImport(FiskosImport fiskosImport) {
		this.fiskosImport = fiskosImport;
	}

	/**
	 * Gets the person.
	 *
	 * @return the person
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "imported_by", nullable = false)
	public Person getPerson() {
		return this.person;
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
	 * Gets the region id.
	 *
	 * @return the region id
	 */
	@Column(name = "region_id", nullable = false)
	public Long getRegionId() {
		return this.regionId;
	}

	/**
	 * Sets the region id.
	 *
	 * @param regionId the new region id
	 */
	public void setRegionId(Long regionId) {
		this.regionId = regionId;
	}

	/**
	 * Gets the mngm class id.
	 *
	 * @return the mngm class id
	 */
	@Column(name = "mngm_class_id")
	public Long getMngmClassId() {
		return this.mngmClassId;
	}

	/**
	 * Sets the mngm class id.
	 *
	 * @param mngmClassId the new mngm class id
	 */
	public void setMngmClassId(Long mngmClassId) {
		this.mngmClassId = mngmClassId;
	}

	/**
	 * Checks if is active.
	 *
	 * @return true, if is active
	 */
	@Column(name = "active", nullable = false)
	public boolean isActive() {
		return this.active;
	}

	/**
	 * Sets the active.
	 *
	 * @param active the new active
	 */
	public void setActive(boolean active) {
		this.active = active;
	}

	/**
	 * Gets the version nr.
	 *
	 * @return the version nr
	 */
	@Column(name = "version_nr", nullable = false)
	public Long getVersionNr() {
		return this.versionNr;
	}

	/**
	 * Sets the version nr.
	 *
	 * @param versionNr the new version nr
	 */
	public void setVersionNr(Long versionNr) {
		this.versionNr = versionNr;
	}

	/**
	 * Gets the modyfied date.
	 *
	 * @return the modyfied date
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "modyfied_date", length = 29)
	public Date getModyfiedDate() {
		return this.modyfiedDate;
	}

	/**
	 * Sets the modyfied date.
	 *
	 * @param modyfiedDate the new modyfied date
	 */
	public void setModyfiedDate(Date modyfiedDate) {
		this.modyfiedDate = modyfiedDate;
	}

	/**
	 * Gets the imported date.
	 *
	 * @return the imported date
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "imported_date", nullable = false, length = 29)
	public Date getImportedDate() {
		return this.importedDate;
	}

	/**
	 * Sets the imported date.
	 *
	 * @param importedDate the new imported date
	 */
	public void setImportedDate(Date importedDate) {
		this.importedDate = importedDate;
	}

	/**
	 * Gets the notes.
	 *
	 * @return the notes
	 */
	@Column(name = "notes")
	public String getNotes() {
		return this.notes;
	}

	/**
	 * Sets the notes.
	 *
	 * @param notes the new notes
	 */
	public void setNotes(String notes) {
		this.notes = notes;
	}

	/**
	 * Gets the region.
	 *
	 * @return the region
	 */
	@Column(name = "region", length = 150)
	public String getRegion() {
		return this.region;
	}

	/**
	 * Sets the region.
	 *
	 * @param region the new region
	 */
	public void setRegion(String region) {
		this.region = region;
	}

	/**
	 * Gets the managment unit.
	 *
	 * @return the managment unit
	 */
	@Column(name = "managment_unit", length = 150)
	public String getManagmentUnit() {
		return this.managmentUnit;
	}

	/**
	 * Sets the managment unit.
	 *
	 * @param managmentUnit the new managment unit
	 */
	public void setManagmentUnit(String managmentUnit) {
		this.managmentUnit = managmentUnit;
	}

	/**
	 * Gets the municipality.
	 *
	 * @return the municipality
	 */
	@Column(name = "municipality", length = 100)
	public String getMunicipality() {
		return this.municipality;
	}

	/**
	 * Sets the municipality.
	 *
	 * @param municipality the new municipality
	 */
	public void setMunicipality(String municipality) {
		this.municipality = municipality;
	}

	/**
	 * Gets the comp.
	 *
	 * @return the comp
	 */
	@Column(name = "comp", length = 20)
	public String getComp() {
		return this.comp;
	}

	/**
	 * Sets the comp.
	 *
	 * @param comp the new comp
	 */
	public void setComp(String comp) {
		this.comp = comp;
	}

	/**
	 * Gets the stand.
	 *
	 * @return the stand
	 */
	@Column(name = "stand", length = 20)
	public String getStand() {
		return this.stand;
	}

	/**
	 * Sets the stand.
	 *
	 * @param stand the new stand
	 */
	public void setStand(String stand) {
		this.stand = stand;
	}

	/**
	 * Gets the standarea.
	 *
	 * @return the standarea
	 */
	@Column(name = "standarea", precision = 17, scale = 17)
	public Double getStandarea() {
		return this.standarea;
	}

	/**
	 * Sets the standarea.
	 *
	 * @param standarea the new standarea
	 */
	public void setStandarea(Double standarea) {
		this.standarea = standarea;
	}

	/**
	 * Gets the mngmnt class.
	 *
	 * @return the mngmnt class
	 */
	@Column(name = "mngmnt_class")
	public Long getMngmntClass() {
		return this.mngmntClass;
	}

	/**
	 * Sets the mngmnt class.
	 *
	 * @param mngmntClass the new mngmnt class
	 */
	public void setMngmntClass(Long mngmntClass) {
		this.mngmntClass = mngmntClass;
	}

	/**
	 * Gets the alb short.
	 *
	 * @return the alb short
	 */
	@Column(name = "alb_short", length = 150)
	public String getAlbShort() {
		return this.albShort;
	}

	/**
	 * Sets the alb short.
	 *
	 * @param albShort the new alb short
	 */
	public void setAlbShort(String albShort) {
		this.albShort = albShort;
	}

	/**
	 * Gets the plots nr.
	 *
	 * @return the plots nr
	 */
	@Column(name = "plots_nr", length = 100)
	public String getPlotsNr() {
		return this.plotsNr;
	}

	/**
	 * Sets the plots nr.
	 *
	 * @param plotsNr the new plots nr
	 */
	public void setPlotsNr(String plotsNr) {
		this.plotsNr = plotsNr;
	}

	/**
	 * Gets the accessible.
	 *
	 * @return the accessible
	 */
	@Column(name = "accessible", length = 100)
	public String getAccessible() {
		return this.accessible;
	}

	/**
	 * Sets the accessible.
	 *
	 * @param accessible the new accessible
	 */
	public void setAccessible(String accessible) {
		this.accessible = accessible;
	}

	/**
	 * Gets the minehazard.
	 *
	 * @return the minehazard
	 */
	@Column(name = "minehazard", length = 100)
	public String getMinehazard() {
		return this.minehazard;
	}

	/**
	 * Sets the minehazard.
	 *
	 * @param minehazard the new minehazard
	 */
	public void setMinehazard(String minehazard) {
		this.minehazard = minehazard;
	}

	/**
	 * Gets the layers.
	 *
	 * @return the layers
	 */
	@Column(name = "layers", length = 50)
	public String getLayers() {
		return this.layers;
	}

	/**
	 * Sets the layers.
	 *
	 * @param layers the new layers
	 */
	public void setLayers(String layers) {
		this.layers = layers;
	}

	/**
	 * Gets the stand type.
	 *
	 * @return the stand type
	 */
	@Column(name = "stand_type", length = 50)
	public String getStandType() {
		return this.standType;
	}

	/**
	 * Sets the stand type.
	 *
	 * @param standType the new stand type
	 */
	public void setStandType(String standType) {
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
	@Column(name = "origin", length = 50)
	public String getOrigin() {
		return this.origin;
	}

	/**
	 * Sets the origin.
	 *
	 * @param origin the new origin
	 */
	public void setOrigin(String origin) {
		this.origin = origin;
	}

	/**
	 * Gets the conifer.
	 *
	 * @return the conifer
	 */
	@Column(name = "conifer", length = 50)
	public String getConifer() {
		return this.conifer;
	}

	/**
	 * Sets the conifer.
	 *
	 * @param conifer the new conifer
	 */
	public void setConifer(String conifer) {
		this.conifer = conifer;
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
	 * Gets the decidouse.
	 *
	 * @return the decidouse
	 */
	@Column(name = "decidouse", length = 50)
	public String getDecidouse() {
		return this.decidouse;
	}

	/**
	 * Sets the decidouse.
	 *
	 * @param decidouse the new decidouse
	 */
	public void setDecidouse(String decidouse) {
		this.decidouse = decidouse;
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
	 * Gets the estemate volume.
	 *
	 * @return the estemate volume
	 */
	@Column(name = "estemate_volume")
	public Long getEstemateVolume() {
		return this.estemateVolume;
	}

	/**
	 * Sets the estemate volume.
	 *
	 * @param estemateVolume the new estemate volume
	 */
	public void setEstemateVolume(Long estemateVolume) {
		this.estemateVolume = estemateVolume;
	}

	/**
	 * Gets the estimate trees per ha.
	 *
	 * @return the estimate trees per ha
	 */
	@Column(name = "estimate_trees_per_ha")
	public Long getEstimateTreesPerHa() {
		return this.estimateTreesPerHa;
	}

	/**
	 * Sets the estimate trees per ha.
	 *
	 * @param estimateTreesPerHa the new estimate trees per ha
	 */
	public void setEstimateTreesPerHa(Long estimateTreesPerHa) {
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
	 * Gets the tree species 1.
	 *
	 * @return the tree species 1
	 */
	@Column(name = "tree_species1", length = 50)
	public String getTreeSpecies1() {
		return this.treeSpecies1;
	}

	/**
	 * Sets the tree species 1.
	 *
	 * @param treeSpecies1 the new tree species 1
	 */
	public void setTreeSpecies1(String treeSpecies1) {
		this.treeSpecies1 = treeSpecies1;
	}

	/**
	 * Gets the tree species 2.
	 *
	 * @return the tree species 2
	 */
	@Column(name = "tree_species2", length = 50)
	public String getTreeSpecies2() {
		return this.treeSpecies2;
	}

	/**
	 * Sets the tree species 2.
	 *
	 * @param treeSpecies2 the new tree species 2
	 */
	public void setTreeSpecies2(String treeSpecies2) {
		this.treeSpecies2 = treeSpecies2;
	}

	/**
	 * Gets the tree species 3.
	 *
	 * @return the tree species 3
	 */
	@Column(name = "tree_species3", length = 50)
	public String getTreeSpecies3() {
		return this.treeSpecies3;
	}

	/**
	 * Sets the tree species 3.
	 *
	 * @param treeSpecies3 the new tree species 3
	 */
	public void setTreeSpecies3(String treeSpecies3) {
		this.treeSpecies3 = treeSpecies3;
	}

	/**
	 * Gets the tree 1.
	 *
	 * @return the tree 1
	 */
	@Column(name = "tree1")
	public Long getTree1() {
		return this.tree1;
	}

	/**
	 * Sets the tree 1.
	 *
	 * @param tree1 the new tree 1
	 */
	public void setTree1(Long tree1) {
		this.tree1 = tree1;
	}

	/**
	 * Gets the tree 2.
	 *
	 * @return the tree 2
	 */
	@Column(name = "tree2")
	public Long getTree2() {
		return this.tree2;
	}

	/**
	 * Sets the tree 2.
	 *
	 * @param tree2 the new tree 2
	 */
	public void setTree2(Long tree2) {
		this.tree2 = tree2;
	}

	/**
	 * Gets the tree 3.
	 *
	 * @return the tree 3
	 */
	@Column(name = "tree3")
	public Long getTree3() {
		return this.tree3;
	}

	/**
	 * Sets the tree 3.
	 *
	 * @param tree3 the new tree 3
	 */
	public void setTree3(Long tree3) {
		this.tree3 = tree3;
	}

	/**
	 * Gets the terrain date.
	 *
	 * @return the terrain date
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "terrain_date", length = 29)
	public Date getTerrainDate() {
		return this.terrainDate;
	}

	/**
	 * Sets the terrain date.
	 *
	 * @param terrainDate the new terrain date
	 */
	public void setTerrainDate(Date terrainDate) {
		this.terrainDate = terrainDate;
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
	 * Gets the msgtext.
	 *
	 * @return the msgtext
	 */
	@Column(name = "msgtext")
	public String getMsgtext() {
		return this.msgtext;
	}

	/**
	 * Sets the msgtext.
	 *
	 * @param msgtext the new msgtext
	 */
	public void setMsgtext(String msgtext) {
		this.msgtext = msgtext;
	}

}
