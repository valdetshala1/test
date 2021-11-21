package com.geoland.kfis.web.action.jobschedul;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.type.IntegerType;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class TrackingImportDataJob.
 */
public class TrackingImportDataJob extends BaseActionSupport implements Job   {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/* (non-Javadoc)
	 * @see org.quartz.Job#execute(org.quartz.JobExecutionContext)
	 */
	@Override
	public void execute(JobExecutionContext arg0  ) throws JobExecutionException {
		Session session = null;
		Transaction tx = null;
		try{ 
			String query="select insert_trip_delete_positions()";
			session=HibSessionFactory.getSessionFactory().getCurrentSession();
			tx = session.beginTransaction();
			SQLQuery sqlQuery=session.createSQLQuery(query);
			sqlQuery.addScalar("insert_trip_delete_positions",IntegerType.INSTANCE);
			Integer list = (Integer) sqlQuery.uniqueResult();
			tx.commit();
		}catch(Exception ex){ 
			try {
				tx.rollback();
			} catch (RuntimeException re) {
				System.err.println("Rollack was not successfull"
						+ re.getMessage());
			}
			ex.printStackTrace();
		  System.out.println(ex);}  
		}
	

}
