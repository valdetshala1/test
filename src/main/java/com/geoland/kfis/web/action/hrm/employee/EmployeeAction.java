package com.geoland.kfis.web.action.hrm.employee;

import java.io.IOException;
import java.util.List;

import org.apache.commons.codec.binary.Base64;

import com.geoland.kfis.model.Address;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.persistence.dao.DAOFactory;


// TODO: Auto-generated Javadoc
/**
 * The Class EmployeeAction.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created April 19, 2014 12:32:36 PM
 * @Version 1.0
 */
public class EmployeeAction extends EmployeeBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/**
	 * Form.
	 *
	 * @return the string
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public String form() throws IOException{
		if(getEmployeeId()!=null){
			Employee emp = DAOFactory.getFactory().getEmployeeDAO().get(getEmployeeId());
			setEmployee(emp);	
			if(employee.getAddress()!=null){
				List<Address> add=DAOFactory.getFactory().getAddressDAO().executeSQLQuery("select * from taddress as ad where ad.id="+employee.getAddress().getId());
				address=add.get(0);
			}
		}
		
		
		return "form";
	}
	
	/**
	 * Profile.
	 *
	 * @return the string
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public String profile() throws IOException{
		if(getEmployeeId()!=null){
			Employee emp = DAOFactory.getFactory().getEmployeeDAO().get(getEmployeeId());
			String query="select * from thrm_employee_language where employee_id="+getEmployeeId();
			employeeLanguageList=DAOFactory.getFactory().getEmployeeLanguageDAO().executeSQLQuery(query);
//			String educationQuery="select * from thrm_employee_skill where employee_id="+getEmployeeId()+" and skill_type='E'";
//			employeeEducationList=DAOFactory.getFactory().getEmployeeSkillDAO().executeSQLQuery(educationQuery);
//			String certificationQuery="select * from thrm_employee_skill where employee_id="+getEmployeeId()+" and skill_type='C'";
//			employeeCertificationList=DAOFactory.getFactory().getEmployeeSkillDAO().executeSQLQuery(certificationQuery);
//			String trainingQuery="select * from thrm_employee_skill where employee_id="+getEmployeeId()+" and skill_type='T'";
//			employeeTrainingList=DAOFactory.getFactory().getEmployeeSkillDAO().executeSQLQuery(trainingQuery);
//			String documentQuery="select * from thrm_employee_doc where employee_id="+getEmployeeId();
//			employeeDocumentList=DAOFactory.getFactory().getEmployeeDocumentDAO().executeSQLQuery(documentQuery);
//			String sosContact="select * from thrm_employee_sos_contact where employee_id="+getEmployeeId();
//			employeeSosContactList=DAOFactory.getFactory().getEmployeeSosContactDAO().executeSQLQuery(sosContact);
//			String dec = "select * from thrm_decision d left join thrm_decision_employee de on d.id=de.decision_id where de.employee_id="+getEmployeeId();
//			employeeDecisionsList=DAOFactory.getFactory().getDecisionDAO().executeSQLQuery(dec);
			setEmployee(emp);
			if(emp.getPhoto()!=null) {
				photo=new String(Base64.encodeBase64(emp.getPhoto()));
			}
		}
		return "profile";
	}
	
	/**
	 * List.
	 *
	 * @return the string
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public String list() throws IOException{
		return "list";
	}

	/**
	 * Grid.
	 *
	 * @return the string
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public String grid() throws IOException{
		return "grid";
	}

	/**
	 * Page.
	 *
	 * @return the string
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public String page() throws IOException{
		return "page";
	}
	
	/**
	 * Certification.
	 *
	 * @return the string
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public String certification() throws IOException{
		if(getEmployeeId()!=null){
		String certificationQuery="select * from thrm_employee_skill where employee_id="+getEmployeeId()+" and skill_type='C'";
		employeeCertificationList=DAOFactory.getFactory().getEmployeeSkillDAO().executeSQLQuery(certificationQuery);
		}
		return "certification";
	}
	
	/**
	 * Training.
	 *
	 * @return the string
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public String training() throws IOException{
		if(getEmployeeId()!=null){
			String trainingQuery="select * from thrm_employee_skill where employee_id="+getEmployeeId()+" and skill_type='T'";
			employeeTrainingList=DAOFactory.getFactory().getEmployeeSkillDAO().executeSQLQuery(trainingQuery);
		}
		return "training";
	}
	
	/**
	 * Education.
	 *
	 * @return the string
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public String education() throws IOException{
		if(getEmployeeId()!=null){
			String educationQuery="select * from thrm_employee_skill where employee_id="+getEmployeeId()+" and skill_type='E'";
			employeeEducationList=DAOFactory.getFactory().getEmployeeSkillDAO().executeSQLQuery(educationQuery);
		}
		return "education";
	}
	
	/**
	 * Document.
	 *
	 * @return the string
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public String document() throws IOException{
		if(getEmployeeId()!=null){
			String documentQuery="select * from thrm_employee_doc where employee_id="+getEmployeeId();
			employeeDocumentList=DAOFactory.getFactory().getEmployeeDocumentDAO().executeSQLQuery(documentQuery);
		}
		return "document";
	}
	
	/**
	 * Soscontact.
	 *
	 * @return the string
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public String soscontact() throws IOException{
		if(getEmployeeId()!=null){
			String sosContact="select * from thrm_employee_sos_contact where employee_id="+getEmployeeId();
			employeeSosContactList=DAOFactory.getFactory().getEmployeeSosContactDAO().executeSQLQuery(sosContact);
		}
		return "soscontact";
	}
	
	/**
	 * Language.
	 *
	 * @return the string
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public String language() throws IOException{
		if(getEmployeeId()!=null){
			String sosContact="select * from thrm_employee_language where employee_id="+getEmployeeId();
			employeeLanguageList=DAOFactory.getFactory().getEmployeeLanguageDAO().executeSQLQuery(sosContact);
		}
		return "language";
	}
	
	/**
	 * Employee list report.
	 *
	 * @return the string
	 */
	public String employeeListReport(){
		return "employee_list_report";
	}
	
	/**
	 * Decisions.
	 *
	 * @return the string
	 */
	public String decisions(){
		if(getEmployeeId()!=null){
			String dec = "select * from thrm_decision d left join thrm_decision_employee de on d.id=de.decision_id where de.employee_id="+getEmployeeId();
			employeeDecisionsList=DAOFactory.getFactory().getDecisionDAO().executeSQLQuery(dec);
		}
		
		return "decisions";
	}

}
