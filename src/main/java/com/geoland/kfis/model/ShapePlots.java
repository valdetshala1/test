package com.geoland.kfis.model;

// Generated Oct 20, 2015 9:26:48 AM by Hibernate Tools 4.0.0

import com.geoland.framework.persistence.base.*;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.TypeDef;
import org.hibernate.spatial.GeometryType;
import com.vividsolutions.jts.geom.Geometry;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;

// TODO: Auto-generated Javadoc
/**
 * ShapePlots generated by hbm2java.
 */
@Entity
@Table(name = "shape_plots", schema = "public")
@TypeDef(name = "geometry", typeClass = GeometryType.class)
public class ShapePlots extends AbstractPersistentObject implements
		java.io.Serializable {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The ogc fid. */
	private Long ogcFid;
	
	/** The wkb geometry. */
	private Geometry wkbGeometry;
	
	/** The plot nr. */
	private BigDecimal plotNr;
	
	/** The comp nr. */
	private BigDecimal compNr;
	
	/** The stand nr. */
	private String standNr;
	
	/** The visited. */
	private BigDecimal visited;
	
	/** The plottype. */
	private BigDecimal plottype;
	
	/** The slope. */
	private BigDecimal slope;
	
	/** The littercov. */
	private BigDecimal littercov;
	
	/** The age. */
	private BigDecimal age;
	
	/** The crowncov. */
	private BigDecimal crowncov;
	
	/** The C stems 1. */
	private BigDecimal CStems1;
	
	/** The C stems 2. */
	private BigDecimal CStems2;
	
	/** The C damage. */
	private BigDecimal CDamage;
	
	/** The C supress. */
	private BigDecimal CSupress;
	
	/** The C distrib. */
	private BigDecimal CDistrib;
	
	/** The B stems 1. */
	private BigDecimal BStems1;
	
	/** The B stems 2. */
	private BigDecimal BStems2;
	
	/** The B damage. */
	private BigDecimal BDamage;
	
	/** The B supress. */
	private BigDecimal BSupress;
	
	/** The B distrib. */
	private BigDecimal BDistrib;
	
	/** The time. */
	private String time;
	
	/** The date. */
	private Date date;
	
	/** The taksator. */
	private String taksator;

	/**
	 * Instantiates a new shape plots.
	 */
	public ShapePlots() {
	}

	/**
	 * Instantiates a new shape plots.
	 *
	 * @param wkbGeometry the wkb geometry
	 * @param plotNr the plot nr
	 * @param compNr the comp nr
	 * @param standNr the stand nr
	 * @param visited the visited
	 * @param plottype the plottype
	 * @param slope the slope
	 * @param littercov the littercov
	 * @param age the age
	 * @param crowncov the crowncov
	 * @param CStems1 the c stems 1
	 * @param CStems2 the c stems 2
	 * @param CDamage the c damage
	 * @param CSupress the c supress
	 * @param CDistrib the c distrib
	 * @param BStems1 the b stems 1
	 * @param BStems2 the b stems 2
	 * @param BDamage the b damage
	 * @param BSupress the b supress
	 * @param BDistrib the b distrib
	 * @param time the time
	 * @param date the date
	 * @param taksator the taksator
	 */
	public ShapePlots(Geometry wkbGeometry, BigDecimal plotNr,
			BigDecimal compNr, String standNr, BigDecimal visited,
			BigDecimal plottype, BigDecimal slope, BigDecimal littercov,
			BigDecimal age, BigDecimal crowncov, BigDecimal CStems1,
			BigDecimal CStems2, BigDecimal CDamage, BigDecimal CSupress,
			BigDecimal CDistrib, BigDecimal BStems1, BigDecimal BStems2,
			BigDecimal BDamage, BigDecimal BSupress, BigDecimal BDistrib,
			String time, Date date, String taksator) {
		this.wkbGeometry = wkbGeometry;
		this.plotNr = plotNr;
		this.compNr = compNr;
		this.standNr = standNr;
		this.visited = visited;
		this.plottype = plottype;
		this.slope = slope;
		this.littercov = littercov;
		this.age = age;
		this.crowncov = crowncov;
		this.CStems1 = CStems1;
		this.CStems2 = CStems2;
		this.CDamage = CDamage;
		this.CSupress = CSupress;
		this.CDistrib = CDistrib;
		this.BStems1 = BStems1;
		this.BStems2 = BStems2;
		this.BDamage = BDamage;
		this.BSupress = BSupress;
		this.BDistrib = BDistrib;
		this.time = time;
		this.date = date;
		this.taksator = taksator;
	}

	/**
	 * Gets the ogc fid.
	 *
	 * @return the ogc fid
	 */
	@GenericGenerator(name = "generator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "ogc_fid", unique = true, nullable = false)
	public Long getOgcFid() {
		return this.ogcFid;
	}

	/**
	 * Sets the ogc fid.
	 *
	 * @param ogcFid the new ogc fid
	 */
	public void setOgcFid(Long ogcFid) {
		this.ogcFid = ogcFid;
	}

	/**
	 * Gets the wkb geometry.
	 *
	 * @return the wkb geometry
	 */
	@Column(name = "wkb_geometry")
	@Type(type = "org.hibernate.spatial.GeometryType")
	public Geometry getWkbGeometry() {
		return this.wkbGeometry;
	}

	/**
	 * Sets the wkb geometry.
	 *
	 * @param wkbGeometry the new wkb geometry
	 */
	public void setWkbGeometry(Geometry wkbGeometry) {
		this.wkbGeometry = wkbGeometry;
	}

	/**
	 * Gets the plot nr.
	 *
	 * @return the plot nr
	 */
	@Column(name = "plot_nr", precision = 9, scale = 0)
	public BigDecimal getPlotNr() {
		return this.plotNr;
	}

	/**
	 * Sets the plot nr.
	 *
	 * @param plotNr the new plot nr
	 */
	public void setPlotNr(BigDecimal plotNr) {
		this.plotNr = plotNr;
	}

	/**
	 * Gets the comp nr.
	 *
	 * @return the comp nr
	 */
	@Column(name = "comp_nr", precision = 9, scale = 0)
	public BigDecimal getCompNr() {
		return this.compNr;
	}

	/**
	 * Sets the comp nr.
	 *
	 * @param compNr the new comp nr
	 */
	public void setCompNr(BigDecimal compNr) {
		this.compNr = compNr;
	}

	/**
	 * Gets the stand nr.
	 *
	 * @return the stand nr
	 */
	@Column(name = "stand_nr", length = 3)
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
	 * Gets the visited.
	 *
	 * @return the visited
	 */
	@Column(name = "visited", precision = 4, scale = 0)
	public BigDecimal getVisited() {
		return this.visited;
	}

	/**
	 * Sets the visited.
	 *
	 * @param visited the new visited
	 */
	public void setVisited(BigDecimal visited) {
		this.visited = visited;
	}

	/**
	 * Gets the plottype.
	 *
	 * @return the plottype
	 */
	@Column(name = "plottype", precision = 4, scale = 0)
	public BigDecimal getPlottype() {
		return this.plottype;
	}

	/**
	 * Sets the plottype.
	 *
	 * @param plottype the new plottype
	 */
	public void setPlottype(BigDecimal plottype) {
		this.plottype = plottype;
	}

	/**
	 * Gets the slope.
	 *
	 * @return the slope
	 */
	@Column(name = "slope", precision = 4, scale = 0)
	public BigDecimal getSlope() {
		return this.slope;
	}

	/**
	 * Sets the slope.
	 *
	 * @param slope the new slope
	 */
	public void setSlope(BigDecimal slope) {
		this.slope = slope;
	}

	/**
	 * Gets the littercov.
	 *
	 * @return the littercov
	 */
	@Column(name = "littercov", precision = 4, scale = 0)
	public BigDecimal getLittercov() {
		return this.littercov;
	}

	/**
	 * Sets the littercov.
	 *
	 * @param littercov the new littercov
	 */
	public void setLittercov(BigDecimal littercov) {
		this.littercov = littercov;
	}

	/**
	 * Gets the age.
	 *
	 * @return the age
	 */
	@Column(name = "age", precision = 4, scale = 0)
	public BigDecimal getAge() {
		return this.age;
	}

	/**
	 * Sets the age.
	 *
	 * @param age the new age
	 */
	public void setAge(BigDecimal age) {
		this.age = age;
	}

	/**
	 * Gets the crowncov.
	 *
	 * @return the crowncov
	 */
	@Column(name = "crowncov", precision = 4, scale = 0)
	public BigDecimal getCrowncov() {
		return this.crowncov;
	}

	/**
	 * Sets the crowncov.
	 *
	 * @param crowncov the new crowncov
	 */
	public void setCrowncov(BigDecimal crowncov) {
		this.crowncov = crowncov;
	}

	/**
	 * Gets the c stems 1.
	 *
	 * @return the c stems 1
	 */
	@Column(name = "c_stems1", precision = 4, scale = 0)
	public BigDecimal getCStems1() {
		return this.CStems1;
	}

	/**
	 * Sets the c stems 1.
	 *
	 * @param CStems1 the new c stems 1
	 */
	public void setCStems1(BigDecimal CStems1) {
		this.CStems1 = CStems1;
	}

	/**
	 * Gets the c stems 2.
	 *
	 * @return the c stems 2
	 */
	@Column(name = "c_stems2", precision = 4, scale = 0)
	public BigDecimal getCStems2() {
		return this.CStems2;
	}

	/**
	 * Sets the c stems 2.
	 *
	 * @param CStems2 the new c stems 2
	 */
	public void setCStems2(BigDecimal CStems2) {
		this.CStems2 = CStems2;
	}

	/**
	 * Gets the c damage.
	 *
	 * @return the c damage
	 */
	@Column(name = "c_damage", precision = 4, scale = 0)
	public BigDecimal getCDamage() {
		return this.CDamage;
	}

	/**
	 * Sets the c damage.
	 *
	 * @param CDamage the new c damage
	 */
	public void setCDamage(BigDecimal CDamage) {
		this.CDamage = CDamage;
	}

	/**
	 * Gets the c supress.
	 *
	 * @return the c supress
	 */
	@Column(name = "c_supress", precision = 4, scale = 0)
	public BigDecimal getCSupress() {
		return this.CSupress;
	}

	/**
	 * Sets the c supress.
	 *
	 * @param CSupress the new c supress
	 */
	public void setCSupress(BigDecimal CSupress) {
		this.CSupress = CSupress;
	}

	/**
	 * Gets the c distrib.
	 *
	 * @return the c distrib
	 */
	@Column(name = "c_distrib", precision = 4, scale = 0)
	public BigDecimal getCDistrib() {
		return this.CDistrib;
	}

	/**
	 * Sets the c distrib.
	 *
	 * @param CDistrib the new c distrib
	 */
	public void setCDistrib(BigDecimal CDistrib) {
		this.CDistrib = CDistrib;
	}

	/**
	 * Gets the b stems 1.
	 *
	 * @return the b stems 1
	 */
	@Column(name = "b_stems1", precision = 4, scale = 0)
	public BigDecimal getBStems1() {
		return this.BStems1;
	}

	/**
	 * Sets the b stems 1.
	 *
	 * @param BStems1 the new b stems 1
	 */
	public void setBStems1(BigDecimal BStems1) {
		this.BStems1 = BStems1;
	}

	/**
	 * Gets the b stems 2.
	 *
	 * @return the b stems 2
	 */
	@Column(name = "b_stems2", precision = 4, scale = 0)
	public BigDecimal getBStems2() {
		return this.BStems2;
	}

	/**
	 * Sets the b stems 2.
	 *
	 * @param BStems2 the new b stems 2
	 */
	public void setBStems2(BigDecimal BStems2) {
		this.BStems2 = BStems2;
	}

	/**
	 * Gets the b damage.
	 *
	 * @return the b damage
	 */
	@Column(name = "b_damage", precision = 4, scale = 0)
	public BigDecimal getBDamage() {
		return this.BDamage;
	}

	/**
	 * Sets the b damage.
	 *
	 * @param BDamage the new b damage
	 */
	public void setBDamage(BigDecimal BDamage) {
		this.BDamage = BDamage;
	}

	/**
	 * Gets the b supress.
	 *
	 * @return the b supress
	 */
	@Column(name = "b_supress", precision = 4, scale = 0)
	public BigDecimal getBSupress() {
		return this.BSupress;
	}

	/**
	 * Sets the b supress.
	 *
	 * @param BSupress the new b supress
	 */
	public void setBSupress(BigDecimal BSupress) {
		this.BSupress = BSupress;
	}

	/**
	 * Gets the b distrib.
	 *
	 * @return the b distrib
	 */
	@Column(name = "b_distrib", precision = 4, scale = 0)
	public BigDecimal getBDistrib() {
		return this.BDistrib;
	}

	/**
	 * Sets the b distrib.
	 *
	 * @param BDistrib the new b distrib
	 */
	public void setBDistrib(BigDecimal BDistrib) {
		this.BDistrib = BDistrib;
	}

	/**
	 * Gets the time.
	 *
	 * @return the time
	 */
	@Column(name = "time_", length = 12)
	public String getTime() {
		return this.time;
	}

	/**
	 * Sets the time.
	 *
	 * @param time the new time
	 */
	public void setTime(String time) {
		this.time = time;
	}

	/**
	 * Gets the date.
	 *
	 * @return the date
	 */
	@Temporal(TemporalType.DATE)
	@Column(name = "date_", length = 13)
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
	 * Gets the taksator.
	 *
	 * @return the taksator
	 */
	@Column(name = "taksator", length = 20)
	public String getTaksator() {
		return this.taksator;
	}

	/**
	 * Sets the taksator.
	 *
	 * @param taksator the new taksator
	 */
	public void setTaksator(String taksator) {
		this.taksator = taksator;
	}

}
