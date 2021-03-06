package com.geoland.kfis.model;

// Generated Apr 20, 2015 3:54:26 PM by Hibernate Tools 4.0.0

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
 * DocType generated by hbm2java.
 */
@Entity
@Table(name = "tdoctype", schema = "public")
public class DocType extends AbstractPersistentObject implements
		java.io.Serializable {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The id. */
	private Long id;
	
	/** The person by createdby. */
	private Person personByCreatedby;
	
	/** The person by updatedby. */
	private Person personByUpdatedby;
	
	/** The doc category. */
	private DocCategory docCategory;
	
	/** The isactive. */
	private String isactive;
	
	/** The created. */
	private Date created;
	
	/** The updated. */
	private Date updated;
	
	/** The name. */
	private String name;
	
	/** The name en. */
	private String nameEn;
	
	/** The name sr. */
	private String nameSr;
	
	/** The printname. */
	private String printname;
	
	/** The printname en. */
	private String printnameEn;
	
	/** The printname sr. */
	private String printnameSr;
	
	/** The description. */
	private String description;
	
	/** The docbasetype. */
	private String docbasetype;
	
	/** The issotrx. */
	private String issotrx;
	
	/** The isdocnocontrolled. */
	private String isdocnocontrolled;
	
	/** The documentnote. */
	private String documentnote;
	
	/** The dp mngmts. */
	private Set<DpMngmt> dpMngmts = new HashSet<DpMngmt>(0);

	/**
	 * Instantiates a new doc type.
	 */
	public DocType() {
	}

	/**
	 * Instantiates a new doc type.
	 *
	 * @param personByCreatedby the person by createdby
	 * @param personByUpdatedby the person by updatedby
	 * @param docCategory the doc category
	 * @param isactive the isactive
	 * @param created the created
	 * @param updated the updated
	 * @param name the name
	 * @param nameEn the name en
	 * @param printname the printname
	 * @param printnameEn the printname en
	 * @param docbasetype the docbasetype
	 * @param issotrx the issotrx
	 * @param isdocnocontrolled the isdocnocontrolled
	 */
	public DocType(Person personByCreatedby, Person personByUpdatedby,
			DocCategory docCategory, String isactive, Date created,
			Date updated, String name, String nameEn, String printname,
			String printnameEn, String docbasetype, String issotrx,
			String isdocnocontrolled) {
		this.personByCreatedby = personByCreatedby;
		this.personByUpdatedby = personByUpdatedby;
		this.docCategory = docCategory;
		this.isactive = isactive;
		this.created = created;
		this.updated = updated;
		this.name = name;
		this.nameEn = nameEn;
		this.printname = printname;
		this.printnameEn = printnameEn;
		this.docbasetype = docbasetype;
		this.issotrx = issotrx;
		this.isdocnocontrolled = isdocnocontrolled;
	}

	/**
	 * Instantiates a new doc type.
	 *
	 * @param personByCreatedby the person by createdby
	 * @param personByUpdatedby the person by updatedby
	 * @param docCategory the doc category
	 * @param isactive the isactive
	 * @param created the created
	 * @param updated the updated
	 * @param name the name
	 * @param nameEn the name en
	 * @param nameSr the name sr
	 * @param printname the printname
	 * @param printnameEn the printname en
	 * @param printnameSr the printname sr
	 * @param description the description
	 * @param docbasetype the docbasetype
	 * @param issotrx the issotrx
	 * @param isdocnocontrolled the isdocnocontrolled
	 * @param documentnote the documentnote
	 * @param dpMngmts the dp mngmts
	 */
	public DocType(Person personByCreatedby, Person personByUpdatedby,
			DocCategory docCategory, String isactive, Date created,
			Date updated, String name, String nameEn, String nameSr,
			String printname, String printnameEn, String printnameSr,
			String description, String docbasetype, String issotrx,
			String isdocnocontrolled, String documentnote, Set<DpMngmt> dpMngmts) {
		this.personByCreatedby = personByCreatedby;
		this.personByUpdatedby = personByUpdatedby;
		this.docCategory = docCategory;
		this.isactive = isactive;
		this.created = created;
		this.updated = updated;
		this.name = name;
		this.nameEn = nameEn;
		this.nameSr = nameSr;
		this.printname = printname;
		this.printnameEn = printnameEn;
		this.printnameSr = printnameSr;
		this.description = description;
		this.docbasetype = docbasetype;
		this.issotrx = issotrx;
		this.isdocnocontrolled = isdocnocontrolled;
		this.documentnote = documentnote;
		this.dpMngmts = dpMngmts;
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
	 * Gets the person by createdby.
	 *
	 * @return the person by createdby
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "createdby", nullable = false)
	public Person getPersonByCreatedby() {
		return this.personByCreatedby;
	}

	/**
	 * Sets the person by createdby.
	 *
	 * @param personByCreatedby the new person by createdby
	 */
	public void setPersonByCreatedby(Person personByCreatedby) {
		this.personByCreatedby = personByCreatedby;
	}

	/**
	 * Gets the person by updatedby.
	 *
	 * @return the person by updatedby
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "updatedby", nullable = false)
	public Person getPersonByUpdatedby() {
		return this.personByUpdatedby;
	}

	/**
	 * Sets the person by updatedby.
	 *
	 * @param personByUpdatedby the new person by updatedby
	 */
	public void setPersonByUpdatedby(Person personByUpdatedby) {
		this.personByUpdatedby = personByUpdatedby;
	}

	/**
	 * Gets the doc category.
	 *
	 * @return the doc category
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "category_id", nullable = false)
	public DocCategory getDocCategory() {
		return this.docCategory;
	}

	/**
	 * Sets the doc category.
	 *
	 * @param docCategory the new doc category
	 */
	public void setDocCategory(DocCategory docCategory) {
		this.docCategory = docCategory;
	}

	/**
	 * Gets the isactive.
	 *
	 * @return the isactive
	 */
	@Column(name = "isactive", nullable = false, length = 1)
	public String getIsactive() {
		return this.isactive;
	}

	/**
	 * Sets the isactive.
	 *
	 * @param isactive the new isactive
	 */
	public void setIsactive(String isactive) {
		this.isactive = isactive;
	}

	/**
	 * Gets the created.
	 *
	 * @return the created
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "created", nullable = false, length = 29)
	public Date getCreated() {
		return this.created;
	}

	/**
	 * Sets the created.
	 *
	 * @param created the new created
	 */
	public void setCreated(Date created) {
		this.created = created;
	}

	/**
	 * Gets the updated.
	 *
	 * @return the updated
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "updated", nullable = false, length = 29)
	public Date getUpdated() {
		return this.updated;
	}

	/**
	 * Sets the updated.
	 *
	 * @param updated the new updated
	 */
	public void setUpdated(Date updated) {
		this.updated = updated;
	}

	/**
	 * Gets the name.
	 *
	 * @return the name
	 */
	@Column(name = "name", nullable = false, length = 60)
	public String getName() {
		return this.name;
	}

	/**
	 * Sets the name.
	 *
	 * @param name the new name
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * Gets the name en.
	 *
	 * @return the name en
	 */
	@Column(name = "name_en", nullable = false, length = 60)
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
	 * Gets the name sr.
	 *
	 * @return the name sr
	 */
	@Column(name = "name_sr", length = 60)
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
	 * Gets the printname.
	 *
	 * @return the printname
	 */
	@Column(name = "printname", nullable = false, length = 60)
	public String getPrintname() {
		return this.printname;
	}

	/**
	 * Sets the printname.
	 *
	 * @param printname the new printname
	 */
	public void setPrintname(String printname) {
		this.printname = printname;
	}

	/**
	 * Gets the printname en.
	 *
	 * @return the printname en
	 */
	@Column(name = "printname_en", nullable = false, length = 60)
	public String getPrintnameEn() {
		return this.printnameEn;
	}

	/**
	 * Sets the printname en.
	 *
	 * @param printnameEn the new printname en
	 */
	public void setPrintnameEn(String printnameEn) {
		this.printnameEn = printnameEn;
	}

	/**
	 * Gets the printname sr.
	 *
	 * @return the printname sr
	 */
	@Column(name = "printname_sr", length = 60)
	public String getPrintnameSr() {
		return this.printnameSr;
	}

	/**
	 * Sets the printname sr.
	 *
	 * @param printnameSr the new printname sr
	 */
	public void setPrintnameSr(String printnameSr) {
		this.printnameSr = printnameSr;
	}

	/**
	 * Gets the description.
	 *
	 * @return the description
	 */
	@Column(name = "description")
	public String getDescription() {
		return this.description;
	}

	/**
	 * Sets the description.
	 *
	 * @param description the new description
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * Gets the docbasetype.
	 *
	 * @return the docbasetype
	 */
	@Column(name = "docbasetype", nullable = false, length = 60)
	public String getDocbasetype() {
		return this.docbasetype;
	}

	/**
	 * Sets the docbasetype.
	 *
	 * @param docbasetype the new docbasetype
	 */
	public void setDocbasetype(String docbasetype) {
		this.docbasetype = docbasetype;
	}

	/**
	 * Gets the issotrx.
	 *
	 * @return the issotrx
	 */
	@Column(name = "issotrx", nullable = false, length = 1)
	public String getIssotrx() {
		return this.issotrx;
	}

	/**
	 * Sets the issotrx.
	 *
	 * @param issotrx the new issotrx
	 */
	public void setIssotrx(String issotrx) {
		this.issotrx = issotrx;
	}

	/**
	 * Gets the isdocnocontrolled.
	 *
	 * @return the isdocnocontrolled
	 */
	@Column(name = "isdocnocontrolled", nullable = false, length = 1)
	public String getIsdocnocontrolled() {
		return this.isdocnocontrolled;
	}

	/**
	 * Sets the isdocnocontrolled.
	 *
	 * @param isdocnocontrolled the new isdocnocontrolled
	 */
	public void setIsdocnocontrolled(String isdocnocontrolled) {
		this.isdocnocontrolled = isdocnocontrolled;
	}

	/**
	 * Gets the documentnote.
	 *
	 * @return the documentnote
	 */
	@Column(name = "documentnote", length = 2000)
	public String getDocumentnote() {
		return this.documentnote;
	}

	/**
	 * Sets the documentnote.
	 *
	 * @param documentnote the new documentnote
	 */
	public void setDocumentnote(String documentnote) {
		this.documentnote = documentnote;
	}

	/**
	 * Gets the dp mngmts.
	 *
	 * @return the dp mngmts
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "docType")
	public Set<DpMngmt> getDpMngmts() {
		return this.dpMngmts;
	}

	/**
	 * Sets the dp mngmts.
	 *
	 * @param dpMngmts the new dp mngmts
	 */
	public void setDpMngmts(Set<DpMngmt> dpMngmts) {
		this.dpMngmts = dpMngmts;
	}

}
