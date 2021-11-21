package com.geoland.kfis.web.action.dem.fiskos;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.jdbc.Work;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.logic.dem.fiskos.ImportData;
import com.geoland.kfis.model.FiskosData;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.persistence.dao.DAOFactory;


// TODO: Auto-generated Javadoc
/**
 * The Class ImportAction.
 *
 * @author GEO&LAND
 * @created October 2, 2014 10:11:06 AM
 * @Version 1.0
 */
public class ImportAction extends FiskosBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The log. */
	private static Logger log = Logger.getLogger(ImportAction.class);
	
	/** The person. */
	protected Person person;
	
	/** The runner. */
	protected ImportData runner;
	

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		person = DAOFactory.getFactory().getPartyUserDAO().getPerson(getUser().getUser().getId());
		
		if(person == null){
			addFieldError("user.person", "user.person.not.valid");
			addActionError("dem.fiskos.import.user.person.empty");
		}		
		
		if(getRegionId() == null){
			addFieldError("regionName", getMessage("dem.fiskos.import.regionName.empty"));
		}

		if(getManagementUnitId() == null){
			addFieldError("managementUnitName", getMessage("compartment.management.unit.id.empty"));
		}
		
		if(StringUtils.isEmpty(getDatefrom())){
			addFieldError("datefrom", getMessage("leave.from.date.empty"));
		}	

		if(StringUtils.isEmpty(getDateto())){
			addFieldError("dateto", getMessage("leave.to.date.empty"));
		}	
		
		if(getFileUpload() == null){
			addFieldError("fileUpload", getMessage("tender.request.file.empty"));
		}else if(StringUtils.isEmpty(getFileUploadFileName())){
			addFieldError("fileUpload", getMessage("dem.fiskos.import.fileUpload"));
		}else if(!getFileUploadFileName().endsWith(".xlsx")){
			addFieldError("fileUpload", getMessage("dem.fiskos.import.fileUpload.not.xlsx"));
		}
		
		if(!getFieldErrors().isEmpty() || !getActionErrors().isEmpty()){
			HttpServletResponse response = ServletActionContext.getResponse();
			response.addHeader("errors_exits", "true");					
		}else{
			runner = new ImportData(person, getRegionId(), getManagementUnitId(), datefrom, dateto, getNote(), getFileUpload());
			boolean bRun = runner.run();
			if(bRun){
				addActionError(runner.getErrorMsg());
				HttpServletResponse response = ServletActionContext.getResponse();
				response.addHeader("errors_exits", "true");					
			}
		}
	}
	
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {

		// update previous management unit period data set and setting to inactive
		if(runner.getPrevMUP()!=null)
			DAOFactory.getFactory().getManagementUnitPeriodDAO().save(runner.getPrevMUP());
		
		// update previous FISKOS import data set and setting to inactive
		if(runner.getPrevFiskosImport()!=null)
			DAOFactory.getFactory().getFiskosImportDAO().save(runner.getPrevFiskosImport());
		
		// save current FISKOS import
		DAOFactory.getFactory().getFiskosImportDAO().save(runner.getFiskosImport());

		// save current management unit period data set
		DAOFactory.getFactory().getManagementUnitPeriodDAO().save(runner.getMup());

		
		// save current FISKOS data		
		for (FiskosData fd : runner.getFiskosDataList()) {
			DAOFactory.getFactory().getFiskosDataDAO().save(fd);		
		} 
		
		/** FLUSH in order to call functions in database **/
		HibSessionFactory.getSessionFactory().getCurrentSession().flush();
		
		final Long fid = runner.getFiskosImport().getId();
		final String trx = runner.getFiskosImport().getTrnxId();

		Session currentSession = HibSessionFactory.getSessionFactory().getCurrentSession();
		currentSession.doWork(new Work() {
			 @Override
             public void execute(Connection conn) throws SQLException {
					String query1 = "SELECT f_frm_fiskos_mig_comp(" + fid + ", '" + trx + "')";
					CallableStatement pc1 = conn.prepareCall(query1);
					boolean b1 = pc1.execute();
					log.info(query1 + " was executed = " + b1);
					
					String query2 = "SELECT f_frm_fiskos_mig_stand(" + fid + ", '" + trx + "')";
					CallableStatement pc2 = conn.prepareCall(query2);
					boolean b2 = pc2.execute();					
					log.info(query2 + " was executed = " + b2);
			 }
				
		});
		
		return SUCCESS;
	}
	
}
