/**
 * 
 */
package com.geoland.kfis.web.action.dem.importshape.stand;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.jdbc.Work;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.model.ImportStatus;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class ImportStandAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Oct 2, 2015, 4:00:48 PM
 */
public class ImportStandAction extends ImportStandBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -6260171131847427561L;

	/**
	 * Page.
	 *
	 * @return the string
	 */
	public String page() {
		return "page";
	}

	/**
	 * Form.
	 *
	 * @return the string
	 */
	public String form() {
		return "form";
	}

	/**
	 * Grid.
	 *
	 * @return the string
	 */
	public String grid() {
		return "grid";
	}
	
	/**
	 * Form content.
	 *
	 * @return the string
	 */
	public String form_content() {
		return "form_content";
	}
	
	/**
	 * On fail import status.
	 *
	 * @return the string
	 */
	public String onFailImportStatus(){
		String query="select * from timport_status where is_active=true and import_type="+import_type;
		List<ImportStatus> isList = DAOFactory.getFactory().getImportStatusDAO().executeSQLQuery(query);
		if(isList!=null && isList.size()>0){
			ImportStatus is=isList.get(0);
			is.setEmployeeByEndUser(getUser().getEmployee());
			is.setEndDate(new Date());
			is.setIsActive(false);
			is.setStatus("Failure");
			
			DAOFactory.getFactory().getImportStatusDAO().save(is);
		}
		Session currentSession = HibSessionFactory.getSessionFactory().getCurrentSession();
		currentSession.doWork(new Work() {
			 @Override
            public void execute(Connection conn) throws SQLException {
				String delete = "delete from shape_stand";
				CallableStatement pc2 = conn.prepareCall(delete);
				pc2.execute();
			 }
		});
//		DAOFactory.getFactory().getShapeStandDAO().executeSQLQuery("delete from shape_stand");
		return "import_fail";
	}
}
