package com.geoland.kfis.web.action.hrm.employee;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.geoland.framework.exception.ValidationException;
import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.framework.persistence.model.User;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.web.action.base.Constants;

// TODO: Auto-generated Javadoc
/**
 * The Class EmployeeSaveAction.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created April 19, 2014 12:31:15 PM
 * @Version 1.0
 */
public class EmployeeSaveAction extends EmployeeBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
    
    /** The file. */
    private File file;
    
    /** The content type. */
    private String contentType;
    
    /** The filename. */
    private String filename;
    
    /** The created by. */
    private Employee createdBy;
    
    /** The user id. */
    private Long userId;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		Long persId = getEmployeeBo().getPersistence().getId();
		if(userId!=null && persId!=null && persId.equals(userId)){
		}
		else{
			createdBy=getUser().getEmployee();
			if(createdBy==null)
				addActionError("");
		}
		if(employee.getActive()==null)
			employee.setActive(false);
		try {
			addValidationErrors(getEmployeeBo().validate());
			if(isCheckAddress()){
				addValidationErrors(getAddressBo().validate());
			}
			if(getEmployeeBo().getPersistence().getBirthdate()!=null){
				long differDays =calculateYearDifference(getEmployeeBo().getPersistence().getBirthdate());
				if(differDays<18)
					addFieldError("employee.birthdate.tolarge", getMessage("birthdate.to.large"));
			}
			Date to=getEmployeeBo().getPersistence().getDateTo();
			Date from=getEmployeeBo().getPersistence().getDateFrom();
			if(to!=null  && from!=null){
			if(getEmployeeBo().getPersistence().getDateTo().before(getEmployeeBo().getPersistence().getDateFrom())){
					addFieldError("employee.dateFrom", getMessage("employee.dateFrom.afterDateTo"));}
			}
			Person sup_person = getEmployeeBo().getPersistence().getPerson();
			if(sup_person==null ||(sup_person!=null && sup_person.getId()==null)){
				addFieldError("employee.person", getMessage("employee.person.empty"));
			}
		} catch (ValidationException e) {
			addActionError(e.getMessage());
			e.printStackTrace();
		}
		if (!getFieldErrors().isEmpty() || !getActionErrors().isEmpty()) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader(Constants.ERRORS_EXITS, "true");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		User user = getUser().getUser();
		Employee emp = getEmployeeBo().getPersistence();
		if(createdBy!=null)
			emp.setParty(createdBy);
		else emp.setParty(emp);
		
		emp.setCreatedDate(new Date());
		emp.setKeycode("343-124");
		emp.setPayroll("Done");
		emp.setPartyType("E");
		//emp.setPartyType(Partytype.PERSON);
//		emp.setPerson(emp);
		
		if(isCheckAddress()){
			getAddressBo().getPersistence().setCurrentUser(user);
			getAddressBo().save();
			emp.setAddress(getAddress());
		}
		
		if(file!=null){
			emp.setPhoto(getFileBytes(file));
		}else if(emp.getId()!=null){
			Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
			SQLQuery sqlQuery= session.createSQLQuery("select p.photo from tperson as p left join tparty as y on p.id = y.id where p.id="+emp.getId());
			sqlQuery.addScalar("photo");
			Object ob1 = sqlQuery.uniqueResult();
			emp.setPhoto((byte[])ob1);
		}
		getEmployeeBo().getPersistence().setCurrentUser(user);
		getEmployeeBo().save();
		return SUCCESS;
	}

	/**
	 * Gets the bytes from input stream.
	 *
	 * @param is the is
	 * @return the bytes from input stream
	 */
	public static byte[] getBytesFromInputStream(InputStream is){
	    try (ByteArrayOutputStream os = new ByteArrayOutputStream();){
	        byte[] buffer = new byte[0xFFFF];

	        for (int len; (len = is.read(buffer)) != -1;)
	            os.write(buffer, 0, len);

	        os.flush();

	        return os.toByteArray();
	    }
	    catch (IOException e)
	    {
	        return null;
	    }
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

	/**
	 * Gets the content type.
	 *
	 * @return the content type
	 */
	public String getContentType() {
		return contentType;
	}

	/**
	 * Sets the content type.
	 *
	 * @param contentType the new content type
	 */
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	/**
	 * Gets the filename.
	 *
	 * @return the filename
	 */
	public String getFilename() {
		return filename;
	}

	/**
	 * Sets the filename.
	 *
	 * @param filename the new filename
	 */
	public void setFilename(String filename) {
		this.filename = filename;
	}

	/**
	 * Gets the created by.
	 *
	 * @return the createdBy
	 */
	public Employee getCreatedBy() {
		return createdBy;
	}

	/**
	 * Sets the created by.
	 *
	 * @param createdBy the createdBy to set
	 */
	public void setCreatedBy(Employee createdBy) {
		this.createdBy = createdBy;
	}

	/**
	 * Gets the user id.
	 *
	 * @return the userId
	 */
	public Long getUserId() {
		return userId;
	}

	/**
	 * Sets the user id.
	 *
	 * @param userId the userId to set
	 */
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	
}
