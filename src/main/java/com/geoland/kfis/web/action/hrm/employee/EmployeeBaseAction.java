package com.geoland.kfis.web.action.hrm.employee;

import java.util.List;

import com.geoland.kfis.logic.adm.address.BoAddress;
import com.geoland.kfis.logic.hr.employee.BoEmployee;
import com.geoland.kfis.model.Address;
import com.geoland.kfis.model.Decision;
import com.geoland.kfis.model.DecisionEmployee;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.EmployeeDocument;
import com.geoland.kfis.model.EmployeeLanguage;
import com.geoland.kfis.model.EmployeeSkill;
import com.geoland.kfis.model.EmployeeSosContact;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.persistence.hibernate.usertypes.Contract;
import com.geoland.kfis.persistence.hibernate.usertypes.Document;
import com.geoland.kfis.persistence.hibernate.usertypes.Education;
import com.geoland.kfis.persistence.hibernate.usertypes.Employeerole;
import com.geoland.kfis.persistence.hibernate.usertypes.Ethnicity;
import com.geoland.kfis.persistence.hibernate.usertypes.Jobtitle;
import com.geoland.kfis.persistence.hibernate.usertypes.Languagelevel;
import com.geoland.kfis.persistence.hibernate.usertypes.Skill;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class EmployeeBaseAction.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created April 19, 2014 12:30:41 PM
 * @Version 1.0
 */
public class EmployeeBaseAction extends BaseActionSupport {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The employee id. */
	private Long employeeId;
	
	/** The employee. */
	protected Employee employee;
	
	/** The employee bo. */
	private BoEmployee employeeBo;
	
	/** The person. */
	private Person person;
	
	/** The employee language list. */
	protected List<EmployeeLanguage> employeeLanguageList;
	
	/** The employee education list. */
	protected List<EmployeeSkill> employeeEducationList;
	
	/** The employee certification list. */
	protected List<EmployeeSkill> employeeCertificationList;
	
	/** The employee training list. */
	protected List<EmployeeSkill> employeeTrainingList;
	
	/** The employee decisions list. */
	protected List<Decision> employeeDecisionsList;
	
	/** The education list. */
	private Education[] educationList = Education.values();
	
	/** The skill list. */
	private Skill[] skillList=Skill.values();
	
	/** The language level list. */
	private Languagelevel[] languageLevelList=Languagelevel.values();
	
	/** The document type list. */
	protected Document[] documentTypeList=Document.values();
	
	/** The employee document list. */
	protected List<EmployeeDocument> employeeDocumentList;
	
	/** The employee sos contact list. */
	protected List<EmployeeSosContact> employeeSosContactList;
	
	/** The contract type list. */
	private Contract[] contractTypeList=Contract.values();
	
	/** The employee role list. */
	private Employeerole[] employeeRoleList=Employeerole.values();
	
	/** The jobtitle list. */
	private Jobtitle[] jobtitleList=Jobtitle.values();
	
	/** The ethnicitie list. */
	private Ethnicity[] ethnicitieList=Ethnicity.values();
	
	/** The photo. */
	protected String photo;
	
	/** The address. */
	protected Address address;
	
	/** The address bo. */
	protected BoAddress addressBo;
	
	/** The check address. */
	protected boolean checkAddress;
	
	/**
	 * Gets the employee id.
	 *
	 * @return the employeeId
	 */
	public Long getEmployeeId() {
		return employeeId;
	}
	
	/**
	 * Sets the employee id.
	 *
	 * @param employeeId the employeeId to set
	 */
	public void setEmployeeId(Long employeeId) {
		this.employeeId = employeeId;
	}
	
	/**
	 * Gets the employee.
	 *
	 * @return the employee
	 */
	public Employee getEmployee() {
		return employee;
	}
	
	/**
	 * Sets the employee.
	 *
	 * @param employee the employee to set
	 */
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
	/**
	 * Gets the employee bo.
	 *
	 * @return the employeeBo
	 */
	public BoEmployee getEmployeeBo() {
		if(employee!=null && employeeBo==null){
			employeeBo = new BoEmployee(employee, getLocale());
		}
		return employeeBo;
	}
	
	/**
	 * Sets the employee bo.
	 *
	 * @param employeeBo the employeeBo to set
	 */
	public void setEmployeeBo(BoEmployee employeeBo) {
		this.employeeBo = employeeBo;
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
	 * @param person the person to set
	 */
	public void setPerson(Person person) {
		this.person = person;
	}

	/**
	 * Gets the employee language list.
	 *
	 * @return the employee language list
	 */
	public List<EmployeeLanguage> getEmployeeLanguageList() {
		return employeeLanguageList;
	}

	/**
	 * Sets the employee language list.
	 *
	 * @param employeeLanguageList the new employee language list
	 */
	public void setEmployeeLanguageList(List<EmployeeLanguage> employeeLanguageList) {
		this.employeeLanguageList = employeeLanguageList;
	}

	/**
	 * Gets the skill list.
	 *
	 * @return the skill list
	 */
	public Skill[] getSkillList() {
		return skillList;
	}

	/**
	 * Sets the skill list.
	 *
	 * @param skillList the new skill list
	 */
	public void setSkillList(Skill[] skillList) {
		this.skillList = skillList;
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
	 * Gets the employee education list.
	 *
	 * @return the employee education list
	 */
	public List<EmployeeSkill> getEmployeeEducationList() {
		return employeeEducationList;
	}

	/**
	 * Sets the employee education list.
	 *
	 * @param employeeEducationList the new employee education list
	 */
	public void setEmployeeEducationList(List<EmployeeSkill> employeeEducationList) {
		this.employeeEducationList = employeeEducationList;
	}

	/**
	 * Gets the employee certification list.
	 *
	 * @return the employee certification list
	 */
	public List<EmployeeSkill> getEmployeeCertificationList() {
		return employeeCertificationList;
	}

	/**
	 * Sets the employee certification list.
	 *
	 * @param employeeCertificationList the new employee certification list
	 */
	public void setEmployeeCertificationList(
			List<EmployeeSkill> employeeCertificationList) {
		this.employeeCertificationList = employeeCertificationList;
	}

	/**
	 * Gets the employee training list.
	 *
	 * @return the employee training list
	 */
	public List<EmployeeSkill> getEmployeeTrainingList() {
		return employeeTrainingList;
	}

	/**
	 * Sets the employee training list.
	 *
	 * @param employeeTrainingList the new employee training list
	 */
	public void setEmployeeTrainingList(List<EmployeeSkill> employeeTrainingList) {
		this.employeeTrainingList = employeeTrainingList;
	}

	/**
	 * Gets the language level list.
	 *
	 * @return the language level list
	 */
	public Languagelevel[] getLanguageLevelList() {
		return languageLevelList;
	}

	/**
	 * Sets the language level list.
	 *
	 * @param languageLevelList the new language level list
	 */
	public void setLanguageLevelList(Languagelevel[] languageLevelList) {
		this.languageLevelList = languageLevelList;
	}

	/**
	 * Gets the document type list.
	 *
	 * @return the documentTypeList
	 */
	public Document[] getDocumentTypeList() {
		return documentTypeList;
	}

	/**
	 * Sets the document type list.
	 *
	 * @param documentTypeList the documentTypeList to set
	 */
	public void setDocumentTypeList(Document[] documentTypeList) {
		this.documentTypeList = documentTypeList;
	}
	
	/**
	 * Gets the employee document list.
	 *
	 * @return the employee document list
	 */
	public List<EmployeeDocument> getEmployeeDocumentList() {
		return employeeDocumentList;
	}

	/**
	 * Sets the employee document list.
	 *
	 * @param employeeDocumentList the new employee document list
	 */
	public void setEmployeeDocumentList(List<EmployeeDocument> employeeDocumentList) {
		this.employeeDocumentList = employeeDocumentList;
	}

	/**
	 * Gets the employee sos contact list.
	 *
	 * @return the employee sos contact list
	 */
	public List<EmployeeSosContact> getEmployeeSosContactList() {
		return employeeSosContactList;
	}

	/**
	 * Sets the employee sos contact list.
	 *
	 * @param employeeSosContactList the new employee sos contact list
	 */
	public void setEmployeeSosContactList(
			List<EmployeeSosContact> employeeSosContactList) {
		this.employeeSosContactList = employeeSosContactList;
	}

	/**
	 * Gets the contract type list.
	 *
	 * @return the contractTypeList
	 */
	public Contract[] getContractTypeList() {
		return contractTypeList;
	}

	/**
	 * Sets the contract type list.
	 *
	 * @param contractTypeList the contractTypeList to set
	 */
	public void setContractTypeList(Contract[] contractTypeList) {
		this.contractTypeList = contractTypeList;
	}

	/**
	 * Gets the employee role list.
	 *
	 * @return the employeeRoleList
	 */
	public Employeerole[] getEmployeeRoleList() {
		return employeeRoleList;
	}

	/**
	 * Sets the employee role list.
	 *
	 * @param employeeRoleList the employeeRoleList to set
	 */
	public void setEmployeeRoleList(Employeerole[] employeeRoleList) {
		this.employeeRoleList = employeeRoleList;
	}

	/**
	 * Gets the address.
	 *
	 * @return the address
	 */
	public Address getAddress() {
		return address;
	}

	/**
	 * Sets the address.
	 *
	 * @param address the new address
	 */
	public void setAddress(Address address) {
		this.address = address;
	}

	/**
	 * Gets the address bo.
	 *
	 * @return the address bo
	 */
	public BoAddress getAddressBo() {
		if(address!=null && addressBo==null)
			addressBo=new BoAddress(address, getLocale());
		return addressBo;
	}

	/**
	 * Sets the address bo.
	 *
	 * @param addressBo the new address bo
	 */
	public void setAddressBo(BoAddress addressBo) {
		this.addressBo = addressBo;
	}

	/**
	 * Checks if is check address.
	 *
	 * @return true, if is check address
	 */
	public boolean isCheckAddress() {
		return checkAddress;
	}

	/**
	 * Sets the check address.
	 *
	 * @param checkAddress the new check address
	 */
	public void setCheckAddress(boolean checkAddress) {
		this.checkAddress = checkAddress;
	}

	/**
	 * Gets the jobtitle list.
	 *
	 * @return the jobtitle list
	 */
	public Jobtitle[] getJobtitleList() {
		return jobtitleList;
	}

	/**
	 * Sets the jobtitle list.
	 *
	 * @param jobtitleList the new jobtitle list
	 */
	public void setJobtitleList(Jobtitle[] jobtitleList) {
		this.jobtitleList = jobtitleList;
	}

	/**
	 * Gets the ethnicitie list.
	 *
	 * @return the ethnicitie list
	 */
	public Ethnicity[] getEthnicitieList() {
		return ethnicitieList;
	}

	/**
	 * Sets the ethnicitie list.
	 *
	 * @param ethnicitieList the new ethnicitie list
	 */
	public void setEthnicitieList(Ethnicity[] ethnicitieList) {
		this.ethnicitieList = ethnicitieList;
	}

	/**
	 * Gets the employee decisions list.
	 *
	 * @return the employeeDecisionsList
	 */
	public List<Decision> getEmployeeDecisionsList() {
		return employeeDecisionsList;
	}

	/**
	 * Sets the employee decisions list.
	 *
	 * @param employeeDecisionsList the employeeDecisionsList to set
	 */
	public void setEmployeeDecisionsList(List<Decision> employeeDecisionsList) {
		this.employeeDecisionsList = employeeDecisionsList;
	}

	/**
	 * Gets the photo.
	 *
	 * @return the photo
	 */
	public String getPhoto() {
		return photo;
	}

	/**
	 * Sets the photo.
	 *
	 * @param photo the photo to set
	 */
	public void setPhoto(String photo) {
		this.photo = photo;
	}
}
