/**
 * 
 */
package com.geoland.kfis.web.action.dem.importshape.plot;

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
 * The Class ImportPlotAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created Oct 19, 2015, 10:15:42 AM
 */
public class ImportPlotAction extends ImportPlotBaseAction {

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
				String deletePlots = "delete from shape_plots";
				CallableStatement pc1 = conn.prepareCall(deletePlots);
				pc1.execute();
				
				String deletePlotTrees = "delete from shape_plot_trees";
				CallableStatement pc2 = conn.prepareCall(deletePlotTrees);
				pc2.execute();
			 }
		});
		return "import_fail";
	}
}
