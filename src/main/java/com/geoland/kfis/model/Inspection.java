package com.geoland.kfis.model;

// Generated Apr 14, 2015 9:57:13 AM by Hibernate Tools 4.0.0

import com.geoland.framework.persistence.base.*;
import org.hibernate.annotations.Type;
import com.geoland.kfis.persistence.hibernate.usertypes.Inspectioncharge;
import com.geoland.kfis.persistence.hibernate.usertypes.Inspectiontype;
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
 * Inspection generated by hbm2java.
 */
@Entity
@Table(name = "tfrm_inspection", schema = "public")
public class Inspection extends AbstractPersistentObject implements
		java.io.Serializable {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The id. */
	private Long id;
	
	/** The region. */
	private Region region;
	
	/** The employee. */
	private Employee employee;
	
	/** The cadastral municipality. */
	private CadastralMunicipality cadastralMunicipality;
	
	/** The insp action type. */
	private InspActionType inspActionType;
	
	/** The inspection. */
	private Inspection inspection;
	
	/** The inspection no. */
	private String inspectionNo;
	
	/** The inspection type. */
	private Inspectiontype inspectionType;
	
	/** The notes. */
	private String notes;
	
	/** The date. */
	private Date date;
	
	/** The procesverbal. */
	private Boolean procesverbal;
	
	/** The procesverbal no. */
	private Long procesverbalNo;
	
	/** The contact person. */
	private String contactPerson;
	
	/** The procesverbal note. */
	private String procesverbalNote;
	
	/** The sequestration. */
	private Boolean sequestration;
	
	/** The seq teach volume. */
	private Double seqTeachVolume;
	
	/** The seq fire volume. */
	private Double seqFireVolume;
	
	/** The seq note. */
	private String seqNote;
	
	/** The charges. */
	private Boolean charges;
	
	/** The charges type. */
	private Inspectioncharge chargesType;
	
	/** The charges ref no. */
	private String chargesRefNo;
	
	/** The charges note. */
	private String chargesNote;
	
	/** The created date. */
	private Date createdDate;
	
	/** The inspectors. */
	private Set<Inspector> inspectors = new HashSet<Inspector>(0);
	
	/** The inspections. */
	private Set<Inspection> inspections = new HashSet<Inspection>(0);
	
	/** The inspection docs. */
	private Set<InspectionDoc> inspectionDocs = new HashSet<InspectionDoc>(0);

	/**
	 * Instantiates a new inspection.
	 */
	public Inspection() {
	}

	/**
	 * Instantiates a new inspection.
	 *
	 * @param employee the employee
	 * @param inspectionNo the inspection no
	 * @param date the date
	 * @param createdDate the created date
	 */
	public Inspection(Employee employee, String inspectionNo, Date date,
			Date createdDate) {
		this.employee = employee;
		this.inspectionNo = inspectionNo;
		this.date = date;
		this.createdDate = createdDate;
	}

	/**
	 * Instantiates a new inspection.
	 *
	 * @param region the region
	 * @param employee the employee
	 * @param cadastralMunicipality the cadastral municipality
	 * @param inspActionType the insp action type
	 * @param inspection the inspection
	 * @param inspectionNo the inspection no
	 * @param inspectionType the inspection type
	 * @param notes the notes
	 * @param date the date
	 * @param procesverbal the procesverbal
	 * @param procesverbalNo the procesverbal no
	 * @param contactPerson the contact person
	 * @param procesverbalNote the procesverbal note
	 * @param sequestration the sequestration
	 * @param seqTeachVolume the seq teach volume
	 * @param seqFireVolume the seq fire volume
	 * @param seqNote the seq note
	 * @param charges the charges
	 * @param chargesType the charges type
	 * @param chargesRefNo the charges ref no
	 * @param chargesNote the charges note
	 * @param createdDate the created date
	 * @param inspectors the inspectors
	 * @param inspections the inspections
	 * @param inspectionDocs the inspection docs
	 */
	public Inspection(Region region, Employee employee,
			CadastralMunicipality cadastralMunicipality,
			InspActionType inspActionType, Inspection inspection,
			String inspectionNo, Inspectiontype inspectionType, String notes,
			Date date, Boolean procesverbal, Long procesverbalNo,
			String contactPerson, String procesverbalNote,
			Boolean sequestration, Double seqTeachVolume, Double seqFireVolume,
			String seqNote, Boolean charges, Inspectioncharge chargesType,
			String chargesRefNo, String chargesNote, Date createdDate,
			Set<Inspector> inspectors, Set<Inspection> inspections,
			Set<InspectionDoc> inspectionDocs) {
		this.region = region;
		this.employee = employee;
		this.cadastralMunicipality = cadastralMunicipality;
		this.inspActionType = inspActionType;
		this.inspection = inspection;
		this.inspectionNo = inspectionNo;
		this.inspectionType = inspectionType;
		this.notes = notes;
		this.date = date;
		this.procesverbal = procesverbal;
		this.procesverbalNo = procesverbalNo;
		this.contactPerson = contactPerson;
		this.procesverbalNote = procesverbalNote;
		this.sequestration = sequestration;
		this.seqTeachVolume = seqTeachVolume;
		this.seqFireVolume = seqFireVolume;
		this.seqNote = seqNote;
		this.charges = charges;
		this.chargesType = chargesType;
		this.chargesRefNo = chargesRefNo;
		this.chargesNote = chargesNote;
		this.createdDate = createdDate;
		this.inspectors = inspectors;
		this.inspections = inspections;
		this.inspectionDocs = inspectionDocs;
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
	@JoinColumn(name = "region_id")
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
	 * Gets the employee.
	 *
	 * @return the employee
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "created_by", nullable = false)
	public Employee getEmployee() {
		return this.employee;
	}

	/**
	 * Sets the employee.
	 *
	 * @param employee the new employee
	 */
	public void setEmployee(Employee employee) {
		this.employee = employee;
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
	 * Gets the insp action type.
	 *
	 * @return the insp action type
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "type_action")
	public InspActionType getInspActionType() {
		return this.inspActionType;
	}

	/**
	 * Sets the insp action type.
	 *
	 * @param inspActionType the new insp action type
	 */
	public void setInspActionType(InspActionType inspActionType) {
		this.inspActionType = inspActionType;
	}

	/**
	 * Gets the inspection.
	 *
	 * @return the inspection
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "parent_id")
	public Inspection getInspection() {
		return this.inspection;
	}

	/**
	 * Sets the inspection.
	 *
	 * @param inspection the new inspection
	 */
	public void setInspection(Inspection inspection) {
		this.inspection = inspection;
	}

	/**
	 * Gets the inspection no.
	 *
	 * @return the inspection no
	 */
	@Column(name = "inspection_no", nullable = false, length = 20)
	public String getInspectionNo() {
		return this.inspectionNo;
	}

	/**
	 * Sets the inspection no.
	 *
	 * @param inspectionNo the new inspection no
	 */
	public void setInspectionNo(String inspectionNo) {
		this.inspectionNo = inspectionNo;
	}

	/**
	 * Gets the inspection type.
	 *
	 * @return the inspection type
	 */
	@Column(name = "inspection_type", length = 3)
	@Type(type = "com.geoland.kfis.persistence.hibernate.usertypes.InspectiontypeUserType")
	public Inspectiontype getInspectionType() {
		return this.inspectionType;
	}

	/**
	 * Sets the inspection type.
	 *
	 * @param inspectionType the new inspection type
	 */
	public void setInspectionType(Inspectiontype inspectionType) {
		this.inspectionType = inspectionType;
	}

	/**
	 * Gets the notes.
	 *
	 * @return the notes
	 */
	@Column(name = "notes", length = 500)
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
	 * Gets the date.
	 *
	 * @return the date
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "date", nullable = false, length = 29)
	public Date getDate() {
		return this.date;
	}

	/**
	 * Sets the date.
	 *
	 * @param date the new date
	 */
	public void setDate(Date date) {
		this.date = date;
	}

	/**
	 * Gets the procesverbal.
	 *
	 * @return the procesverbal
	 */
	@Column(name = "procesverbal")
	public Boolean getProcesverbal() {
		return this.procesverbal;
	}

	/**
	 * Sets the procesverbal.
	 *
	 * @param procesverbal the new procesverbal
	 */
	public void setProcesverbal(Boolean procesverbal) {
		this.procesverbal = procesverbal;
	}

	/**
	 * Gets the procesverbal no.
	 *
	 * @return the procesverbal no
	 */
	@Column(name = "procesverbal_no")
	public Long getProcesverbalNo() {
		return this.procesverbalNo;
	}

	/**
	 * Sets the procesverbal no.
	 *
	 * @param procesverbalNo the new procesverbal no
	 */
	public void setProcesverbalNo(Long procesverbalNo) {
		this.procesverbalNo = procesverbalNo;
	}

	/**
	 * Gets the contact person.
	 *
	 * @return the contact person
	 */
	@Column(name = "contact_person", length = 150)
	public String getContactPerson() {
		return this.contactPerson;
	}

	/**
	 * Sets the contact person.
	 *
	 * @param contactPerson the new contact person
	 */
	public void setContactPerson(String contactPerson) {
		this.contactPerson = contactPerson;
	}

	/**
	 * Gets the procesverbal note.
	 *
	 * @return the procesverbal note
	 */
	@Column(name = "procesverbal_note")
	public String getProcesverbalNote() {
		return this.procesverbalNote;
	}

	/**
	 * Sets the procesverbal note.
	 *
	 * @param procesverbalNote the new procesverbal note
	 */
	public void setProcesverbalNote(String procesverbalNote) {
		this.procesverbalNote = procesverbalNote;
	}

	/**
	 * Gets the sequestration.
	 *
	 * @return the sequestration
	 */
	@Column(name = "sequestration")
	public Boolean getSequestration() {
		return this.sequestration;
	}

	/**
	 * Sets the sequestration.
	 *
	 * @param sequestration the new sequestration
	 */
	public void setSequestration(Boolean sequestration) {
		this.sequestration = sequestration;
	}

	/**
	 * Gets the seq teach volume.
	 *
	 * @return the seq teach volume
	 */
	@Column(name = "seq_teach_volume", precision = 17, scale = 17)
	public Double getSeqTeachVolume() {
		return this.seqTeachVolume;
	}

	/**
	 * Sets the seq teach volume.
	 *
	 * @param seqTeachVolume the new seq teach volume
	 */
	public void setSeqTeachVolume(Double seqTeachVolume) {
		this.seqTeachVolume = seqTeachVolume;
	}

	/**
	 * Gets the seq fire volume.
	 *
	 * @return the seq fire volume
	 */
	@Column(name = "seq_fire_volume", precision = 17, scale = 17)
	public Double getSeqFireVolume() {
		return this.seqFireVolume;
	}

	/**
	 * Sets the seq fire volume.
	 *
	 * @param seqFireVolume the new seq fire volume
	 */
	public void setSeqFireVolume(Double seqFireVolume) {
		this.seqFireVolume = seqFireVolume;
	}

	/**
	 * Gets the seq note.
	 *
	 * @return the seq note
	 */
	@Column(name = "seq_note")
	public String getSeqNote() {
		return this.seqNote;
	}

	/**
	 * Sets the seq note.
	 *
	 * @param seqNote the new seq note
	 */
	public void setSeqNote(String seqNote) {
		this.seqNote = seqNote;
	}

	/**
	 * Gets the charges.
	 *
	 * @return the charges
	 */
	@Column(name = "charges")
	public Boolean getCharges() {
		return this.charges;
	}

	/**
	 * Sets the charges.
	 *
	 * @param charges the new charges
	 */
	public void setCharges(Boolean charges) {
		this.charges = charges;
	}

	/**
	 * Gets the charges type.
	 *
	 * @return the charges type
	 */
	@Column(name = "charges_type", length = 2)
	@Type(type = "com.geoland.kfis.persistence.hibernate.usertypes.InspectionchargeUserType")
	public Inspectioncharge getChargesType() {
		return this.chargesType;
	}

	/**
	 * Sets the charges type.
	 *
	 * @param chargesType the new charges type
	 */
	public void setChargesType(Inspectioncharge chargesType) {
		this.chargesType = chargesType;
	}

	/**
	 * Gets the charges ref no.
	 *
	 * @return the charges ref no
	 */
	@Column(name = "charges_ref_no", length = 30)
	public String getChargesRefNo() {
		return this.chargesRefNo;
	}

	/**
	 * Sets the charges ref no.
	 *
	 * @param chargesRefNo the new charges ref no
	 */
	public void setChargesRefNo(String chargesRefNo) {
		this.chargesRefNo = chargesRefNo;
	}

	/**
	 * Gets the charges note.
	 *
	 * @return the charges note
	 */
	@Column(name = "charges_note")
	public String getChargesNote() {
		return this.chargesNote;
	}

	/**
	 * Sets the charges note.
	 *
	 * @param chargesNote the new charges note
	 */
	public void setChargesNote(String chargesNote) {
		this.chargesNote = chargesNote;
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
	 * Gets the inspectors.
	 *
	 * @return the inspectors
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "inspection")
	public Set<Inspector> getInspectors() {
		return this.inspectors;
	}

	/**
	 * Sets the inspectors.
	 *
	 * @param inspectors the new inspectors
	 */
	public void setInspectors(Set<Inspector> inspectors) {
		this.inspectors = inspectors;
	}

	/**
	 * Gets the inspections.
	 *
	 * @return the inspections
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "inspection")
	public Set<Inspection> getInspections() {
		return this.inspections;
	}

	/**
	 * Sets the inspections.
	 *
	 * @param inspections the new inspections
	 */
	public void setInspections(Set<Inspection> inspections) {
		this.inspections = inspections;
	}

	/**
	 * Gets the inspection docs.
	 *
	 * @return the inspection docs
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "inspection")
	public Set<InspectionDoc> getInspectionDocs() {
		return this.inspectionDocs;
	}

	/**
	 * Sets the inspection docs.
	 *
	 * @param inspectionDocs the new inspection docs
	 */
	public void setInspectionDocs(Set<InspectionDoc> inspectionDocs) {
		this.inspectionDocs = inspectionDocs;
	}

}
