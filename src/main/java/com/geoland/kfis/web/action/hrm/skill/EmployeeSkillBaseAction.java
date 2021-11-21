package com.geoland.kfis.web.action.hrm.skill;

import java.io.File;

import com.geoland.kfis.model.EmployeeSkill;
import com.geoland.kfis.persistence.hibernate.usertypes.Education;
import com.geoland.kfis.persistence.hibernate.usertypes.Skill;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class EmployeeSkillBaseAction.
 *
 * @author ADELINA GASHI, GEO&LAND
 * @created May 14, 2014 11:43:22 AM
 * @Version 1.0
 */
public class EmployeeSkillBaseAction extends BaseActionSupport {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The skill id. */
	protected Long skillId;
	
	/** The employee skill. */
	protected EmployeeSkill employeeSkill;
	
	/** The education list. */
	protected Education[] educationList = Education.values();
	
	/** The skilltype. */
	protected Skill[] skilltype=Skill.values();
	
	/** The file. */
	protected File file;
	
	/**
	 * Gets the skilltype.
	 *
	 * @return the skilltype
	 */
	public Skill[] getSkilltype() {
		return skilltype;
	}
	
	/**
	 * Sets the skilltype.
	 *
	 * @param skilltype the new skilltype
	 */
	public void setSkilltype(Skill[] skilltype) {
		this.skilltype = skilltype;
	}
	
	/**
	 * Gets the skill id.
	 *
	 * @return the skill id
	 */
	public Long getSkillId() {
		return skillId;
	}
	
	/**
	 * Sets the skill id.
	 *
	 * @param skillId the new skill id
	 */
	public void setSkillId(Long skillId) {
		this.skillId = skillId;
	}
	
	/**
	 * Gets the employee skill.
	 *
	 * @return the employee skill
	 */
	public EmployeeSkill getEmployeeSkill() {
		return employeeSkill;
	}
	
	/**
	 * Sets the employee skill.
	 *
	 * @param employeeSkill the new employee skill
	 */
	public void setEmployeeSkill(EmployeeSkill employeeSkill) {
		this.employeeSkill = employeeSkill;
	}
	
	/**
	 * Gets the education list.
	 *
	 * @return the education list
	 */
	public Education[] getEducationList() {
		return educationList;
	}
	
	/**
	 * Sets the education list.
	 *
	 * @param educationList the new education list
	 */
	public void setEducationList(Education[] educationList) {
		this.educationList = educationList;
	}
	
	/**
	 * Gets the file.
	 *
	 * @return the file
	 */
	public File getFile() {
		return file;
	}
	
	/**
	 * Sets the file.
	 *
	 * @param file the new file
	 */
	public void setFile(File file) {
		this.file = file;
	}
	
	
}