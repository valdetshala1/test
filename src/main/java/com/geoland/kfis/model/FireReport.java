package com.geoland.kfis.model;

// Generated May 20, 2015 1:11:04 PM by Hibernate Tools 4.0.0

import com.geoland.framework.persistence.base.*;
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
 * FireReport generated by hbm2java.
 */
@Entity
@Table(name = "tfrm_fire_report", schema = "public")
public class FireReport extends AbstractPersistentObject implements
		java.io.Serializable {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The id. */
	private Long id;
	
	/** The region. */
	private Region region;
	
	/** The person. */
	private Person person;
	
	/** The cadastral municipality. */
	private CadastralMunicipality cadastralMunicipality;
	
	/** The management unit. */
	private ManagementUnit managementUnit;
	
	/** The fire type. */
	private String fireType;
	
	/** The fire cause. */
	private String fireCause;
	
	/** The occurrence date. */
	private Date occurrenceDate;
	
	/** The extinguish date. */
	private Date extinguishDate;
	
	/** The extinguished by. */
	private String extinguishedBy;
	
	/** The pub damage M 3. */
	private Double pubDamageM3;
	
	/** The pub damage euro. */
	private Double pubDamageEuro;
	
	/** The pub damage M 2. */
	private Double pubDamageM2;
	
	/** The pvt damage M 3. */
	private Double pvtDamageM3;
	
	/** The pvt damage euro. */
	private Double pvtDamageEuro;
	
	/** The pvt damage M 2. */
	private Double pvtDamageM2;
	
	/** The proposed action. */
	private String proposedAction;
	
	/** The doc type. */
	private String docType;
	
	/** The doc name. */
	private String docName;
	
	/** The doc. */
	private byte[] doc;
	
	/** The comment. */
	private String comment;
	
	/** The created date. */
	private Date createdDate;
	
	/** The fire detailses. */
	private Set<FireDetails> fireDetailses = new HashSet<FireDetails>(0);

	/**
	 * Instantiates a new fire report.
	 */
	public FireReport() {
	}

	/**
	 * Instantiates a new fire report.
	 *
	 * @param region the region
	 * @param person the person
	 * @param cadastralMunicipality the cadastral municipality
	 * @param managementUnit the management unit
	 * @param occurrenceDate the occurrence date
	 * @param extinguishDate the extinguish date
	 * @param createdDate the created date
	 */
	public FireReport(Region region, Person person,
			CadastralMunicipality cadastralMunicipality,
			ManagementUnit managementUnit, Date occurrenceDate,
			Date extinguishDate, Date createdDate) {
		this.region = region;
		this.person = person;
		this.cadastralMunicipality = cadastralMunicipality;
		this.managementUnit = managementUnit;
		this.occurrenceDate = occurrenceDate;
		this.extinguishDate = extinguishDate;
		this.createdDate = createdDate;
	}

	/**
	 * Instantiates a new fire report.
	 *
	 * @param region the region
	 * @param person the person
	 * @param cadastralMunicipality the cadastral municipality
	 * @param managementUnit the management unit
	 * @param fireType the fire type
	 * @param fireCause the fire cause
	 * @param occurrenceDate the occurrence date
	 * @param extinguishDate the extinguish date
	 * @param extinguishedBy the extinguished by
	 * @param pubDamageM3 the pub damage M 3
	 * @param pubDamageEuro the pub damage euro
	 * @param pubDamageM2 the pub damage M 2
	 * @param pvtDamageM3 the pvt damage M 3
	 * @param pvtDamageEuro the pvt damage euro
	 * @param pvtDamageM2 the pvt damage M 2
	 * @param proposedAction the proposed action
	 * @param docType the doc type
	 * @param docName the doc name
	 * @param doc the doc
	 * @param comment the comment
	 * @param createdDate the created date
	 * @param fireDetailses the fire detailses
	 */
	public FireReport(Region region, Person person,
			CadastralMunicipality cadastralMunicipality,
			ManagementUnit managementUnit, String fireType, String fireCause,
			Date occurrenceDate, Date extinguishDate, String extinguishedBy,
			Double pubDamageM3, Double pubDamageEuro, Double pubDamageM2,
			Double pvtDamageM3, Double pvtDamageEuro, Double pvtDamageM2,
			String proposedAction, String docType, String docName, byte[] doc,
			String comment, Date createdDate, Set<FireDetails> fireDetailses) {
		this.region = region;
		this.person = person;
		this.cadastralMunicipality = cadastralMunicipality;
		this.managementUnit = managementUnit;
		this.fireType = fireType;
		this.fireCause = fireCause;
		this.occurrenceDate = occurrenceDate;
		this.extinguishDate = extinguishDate;
		this.extinguishedBy = extinguishedBy;
		this.pubDamageM3 = pubDamageM3;
		this.pubDamageEuro = pubDamageEuro;
		this.pubDamageM2 = pubDamageM2;
		this.pvtDamageM3 = pvtDamageM3;
		this.pvtDamageEuro = pvtDamageEuro;
		this.pvtDamageM2 = pvtDamageM2;
		this.proposedAction = proposedAction;
		this.docType = docType;
		this.docName = docName;
		this.doc = doc;
		this.comment = comment;
		this.createdDate = createdDate;
		this.fireDetailses = fireDetailses;
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
	 * Gets the region.
	 *
	 * @return the region
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "region_id", nullable = false)
	public Region getRegion() {
		return this.region;
	}

	/**
	 * Sets the region.
	 *
	 * @param region the new region
	 */
	public void setRegion(Region region) {
		this.region = region;
	}

	/**
	 * Gets the person.
	 *
	 * @return the person
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "created_by", nullable = false)
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
	 * Gets the cadastral municipality.
	 *
	 * @return the cadastral municipality
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "mun_id", nullable = false)
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
	 * Gets the fire type.
	 *
	 * @return the fire type
	 */
	@Column(name = "fire_type")
	public String getFireType() {
		return this.fireType;
	}

	/**
	 * Sets the fire type.
	 *
	 * @param fireType the new fire type
	 */
	public void setFireType(String fireType) {
		this.fireType = fireType;
	}

	/**
	 * Gets the fire cause.
	 *
	 * @return the fire cause
	 */
	@Column(name = "fire_cause")
	public String getFireCause() {
		return this.fireCause;
	}

	/**
	 * Sets the fire cause.
	 *
	 * @param fireCause the new fire cause
	 */
	public void setFireCause(String fireCause) {
		this.fireCause = fireCause;
	}

	/**
	 * Gets the occurrence date.
	 *
	 * @return the occurrence date
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "occurrence_date", nullable = false, length = 29)
	public Date getOccurrenceDate() {
		return this.occurrenceDate;
	}

	/**
	 * Sets the occurrence date.
	 *
	 * @param occurrenceDate the new occurrence date
	 */
	public void setOccurrenceDate(Date occurrenceDate) {
		this.occurrenceDate = occurrenceDate;
	}

	/**
	 * Gets the extinguish date.
	 *
	 * @return the extinguish date
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "extinguish_date", nullable = false, length = 29)
	public Date getExtinguishDate() {
		return this.extinguishDate;
	}

	/**
	 * Sets the extinguish date.
	 *
	 * @param extinguishDate the new extinguish date
	 */
	public void setExtinguishDate(Date extinguishDate) {
		this.extinguishDate = extinguishDate;
	}

	/**
	 * Gets the extinguished by.
	 *
	 * @return the extinguished by
	 */
	@Column(name = "extinguished_by", length = 100)
	public String getExtinguishedBy() {
		return this.extinguishedBy;
	}

	/**
	 * Sets the extinguished by.
	 *
	 * @param extinguishedBy the new extinguished by
	 */
	public void setExtinguishedBy(String extinguishedBy) {
		this.extinguishedBy = extinguishedBy;
	}

	/**
	 * Gets the pub damage M 3.
	 *
	 * @return the pub damage M 3
	 */
	@Column(name = "pub_damage_m3", precision = 17, scale = 17)
	public Double getPubDamageM3() {
		return this.pubDamageM3;
	}

	/**
	 * Sets the pub damage M 3.
	 *
	 * @param pubDamageM3 the new pub damage M 3
	 */
	public void setPubDamageM3(Double pubDamageM3) {
		this.pubDamageM3 = pubDamageM3;
	}

	/**
	 * Gets the pub damage euro.
	 *
	 * @return the pub damage euro
	 */
	@Column(name = "pub_damage_euro", precision = 17, scale = 17)
	public Double getPubDamageEuro() {
		return this.pubDamageEuro;
	}

	/**
	 * Sets the pub damage euro.
	 *
	 * @param pubDamageEuro the new pub damage euro
	 */
	public void setPubDamageEuro(Double pubDamageEuro) {
		this.pubDamageEuro = pubDamageEuro;
	}

	/**
	 * Gets the pub damage M 2.
	 *
	 * @return the pub damage M 2
	 */
	@Column(name = "pub_damage_m2", precision = 17, scale = 17)
	public Double getPubDamageM2() {
		return this.pubDamageM2;
	}

	/**
	 * Sets the pub damage M 2.
	 *
	 * @param pubDamageM2 the new pub damage M 2
	 */
	public void setPubDamageM2(Double pubDamageM2) {
		this.pubDamageM2 = pubDamageM2;
	}

	/**
	 * Gets the pvt damage M 3.
	 *
	 * @return the pvt damage M 3
	 */
	@Column(name = "pvt_damage_m3", precision = 17, scale = 17)
	public Double getPvtDamageM3() {
		return this.pvtDamageM3;
	}

	/**
	 * Sets the pvt damage M 3.
	 *
	 * @param pvtDamageM3 the new pvt damage M 3
	 */
	public void setPvtDamageM3(Double pvtDamageM3) {
		this.pvtDamageM3 = pvtDamageM3;
	}

	/**
	 * Gets the pvt damage euro.
	 *
	 * @return the pvt damage euro
	 */
	@Column(name = "pvt_damage_euro", precision = 17, scale = 17)
	public Double getPvtDamageEuro() {
		return this.pvtDamageEuro;
	}

	/**
	 * Sets the pvt damage euro.
	 *
	 * @param pvtDamageEuro the new pvt damage euro
	 */
	public void setPvtDamageEuro(Double pvtDamageEuro) {
		this.pvtDamageEuro = pvtDamageEuro;
	}

	/**
	 * Gets the pvt damage M 2.
	 *
	 * @return the pvt damage M 2
	 */
	@Column(name = "pvt_damage_m2", precision = 17, scale = 17)
	public Double getPvtDamageM2() {
		return this.pvtDamageM2;
	}

	/**
	 * Sets the pvt damage M 2.
	 *
	 * @param pvtDamageM2 the new pvt damage M 2
	 */
	public void setPvtDamageM2(Double pvtDamageM2) {
		this.pvtDamageM2 = pvtDamageM2;
	}

	/**
	 * Gets the proposed action.
	 *
	 * @return the proposed action
	 */
	@Column(name = "proposed_action")
	public String getProposedAction() {
		return this.proposedAction;
	}

	/**
	 * Sets the proposed action.
	 *
	 * @param proposedAction the new proposed action
	 */
	public void setProposedAction(String proposedAction) {
		this.proposedAction = proposedAction;
	}

	/**
	 * Gets the doc type.
	 *
	 * @return the doc type
	 */
	@Column(name = "doc_type", length = 100)
	public String getDocType() {
		return this.docType;
	}

	/**
	 * Sets the doc type.
	 *
	 * @param docType the new doc type
	 */
	public void setDocType(String docType) {
		this.docType = docType;
	}

	/**
	 * Gets the doc name.
	 *
	 * @return the doc name
	 */
	@Column(name = "doc_name", length = 100)
	public String getDocName() {
		return this.docName;
	}

	/**
	 * Sets the doc name.
	 *
	 * @param docName the new doc name
	 */
	public void setDocName(String docName) {
		this.docName = docName;
	}

	/**
	 * Gets the doc.
	 *
	 * @return the doc
	 */
	@Column(name = "doc")
	public byte[] getDoc() {
		return this.doc;
	}

	/**
	 * Sets the doc.
	 *
	 * @param doc the new doc
	 */
	public void setDoc(byte[] doc) {
		this.doc = doc;
	}

	/**
	 * Gets the comment.
	 *
	 * @return the comment
	 */
	@Column(name = "comment")
	public String getComment() {
		return this.comment;
	}

	/**
	 * Sets the comment.
	 *
	 * @param comment the new comment
	 */
	public void setComment(String comment) {
		this.comment = comment;
	}

	/**
	 * Gets the created date.
	 *
	 * @return the created date
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "created_date", nullable = false, length = 29)
	public Date getCreatedDate() {
		return this.createdDate;
	}

	/**
	 * Sets the created date.
	 *
	 * @param createdDate the new created date
	 */
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	/**
	 * Gets the fire detailses.
	 *
	 * @return the fire detailses
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "fireReport")
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

}
