package com.geoland.kfis.web.action.ads.finance.allocation;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.DoubleType;
import org.hibernate.type.IntegerType;
import org.hibernate.type.LongType;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.model.AnnualBudgetAllocation;
import com.geoland.kfis.model.FinancialInput;
import com.geoland.kfis.model.Organisation;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Month;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class AnnuBudgetAllocationBaseAction.
 *
 * @author ADELINA GASHI, GEO&LAND
 * @created Sep 8, 2014 10:05:06 AM
 * @Version 1.0
 */
public class AnnuBudgetAllocationBaseAction extends BaseActionSupport {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -8525438745820483913L;
	
	/** The annu budget allocation. */
	protected AnnualBudgetAllocation annuBudgetAllocation;
	
	/** The annu budget allocation id. */
	protected Long annuBudgetAllocationId;
	
	/** The month list. */
	protected Month[] monthList=Month.values();
	
	
	/**
	 * Financial filter input.
	 *
	 * @param mun the mun
	 * @param year the year
	 * @param month the month
	 * @return the list
	 */
	protected List<Long> financialFilterInput(Organisation mun,Long year,Month month){
		List<Long> finputids=new ArrayList<>();
		String query="select fi.id from tfin_input as fi where fi.municipality_id="+mun.getId()+" and fi.year="+year+" and fi.month='"+month.getDOMKEY()+"'";
		Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
		SQLQuery sqlQuery=session.createSQLQuery(query);
		sqlQuery.addScalar("id",LongType.INSTANCE);
		List list = sqlQuery.list();
		for (Iterator iterator = list.iterator(); iterator.hasNext();) {
			     Long id = (Long) iterator.next();
			     finputids.add(id);
		}
		return finputids;
	}
	
	/**
	 * All fin inputs to allocate.
	 *
	 * @param mun the mun
	 * @param year the year
	 * @param month the month
	 * @return number of financial inputs that have to be allocated
	 */
	protected int allFinInputsToAllocate(Organisation mun,Long year,Month month){
		int rez=0;
		String query="select count(*) from tfin_input as fi left join tfin_input_status as ist on fi.current_status=ist.id " +
				"where fi.municipality_id="+mun.getId()+" and fi.year="+year+" and fi.month='"+month.getDOMKEY()+"' and ist.status!='RE'";
		Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
		SQLQuery sqlQuery=session.createSQLQuery(query);
		sqlQuery.addScalar("count",IntegerType.INSTANCE);
		Integer i=(Integer)sqlQuery.list().get(0);
		rez=i.intValue();
		return rez ;
	}
	
	/**
	 * Allocation is done.
	 *
	 * @param mun the mun
	 * @param year the year
	 * @param month the month
	 * @return true, if successful
	 */
	protected boolean allocationIsDone(Organisation mun,Long year,Month month){
		boolean allocationIsDone=false;
		String query="select count(*)as allocation_num from tfin_annu_budget_alloc as fi where fi.municipality_id="+mun.getId()+"  and fi.year="+year+"   and fi.month='"+month.getDOMKEY()+"'";
		Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
		SQLQuery sqlQuery=session.createSQLQuery(query);
		sqlQuery.addScalar("allocation_num",LongType.INSTANCE);
		List list = sqlQuery.list();
		if(list!=null && list.size()>0){
			Long allocation_num = (Long) list.get(0);
			if(allocation_num>0){
				allocationIsDone=true;
			}
		}	
		return allocationIsDone;
		
	}
	
	/**
	 * Sum wood sale.
	 *
	 * @param mun the mun
	 * @param year the year
	 * @param month the month
	 * @return the double
	 */
	protected double sumWoodSale(Organisation mun,Long year,Month month){
		double woodSale=0.0;
		String query="select sum(fi.cumulative_value) as cumulative_value ,fi.month,fi.municipality_id,fi.year,fi.input_type_id from " +
				" tfin_input as fi left join tfin_type as ft " +
				" on fi.input_type_id=ft.id where fi.municipality_id="+mun.getId()+" and fi.year="+year+" and fi.month='"+month.getDOMKEY()+"'" +
				" and ft.allocation='true' group by fi.month,fi.municipality_id,fi.year,fi.input_type_id ";
		Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
		SQLQuery sqlQuery=session.createSQLQuery(query);
		sqlQuery.addScalar("cumulative_value",DoubleType.INSTANCE);
		List list = sqlQuery.list();
		if(list!=null && list.size()>0){
			Double cumulative_value = (Double) list.get(0);
			woodSale=cumulative_value.doubleValue();
		}	
		return woodSale;
	}
	
	/**
	 * Sum other income.
	 *
	 * @param mun the mun
	 * @param year the year
	 * @param month the month
	 * @return the double
	 */
	protected double sumOtherIncome(Organisation mun,Long year,Month month){
		double otherIncome=0.0;
		String query="select sum(fi.cumulative_value) as cumulative_value ,fi.month,fi.municipality_id,fi.year,fi.input_type_id from " +
				" tfin_input as fi left join tfin_type as ft " +
				" on fi.input_type_id=ft.id where fi.municipality_id="+mun.getId()+" and fi.year="+year+" and fi.month='"+month.getDOMKEY()+"'" +
				" and (ft.allocation != 'true' OR ft.code is NULL) group by fi.month,fi.municipality_id,fi.year,fi.input_type_id ";
		Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
		SQLQuery sqlQuery=session.createSQLQuery(query);
		sqlQuery.addScalar("cumulative_value",DoubleType.INSTANCE);
		List list = sqlQuery.list();
		if(list!=null && list.size()>0){
			Double cumulative_value = (Double) list.get(0);
			otherIncome=cumulative_value.doubleValue();
		}	
		return otherIncome;
	}
	
	/**
	 * Update fin input.
	 *
	 * @param financialInputIds the financial input ids
	 */
	public void updateFinInput(List<Long> financialInputIds){
		
		for(Long id:financialInputIds){
			FinancialInput fi=DAOFactory.getFactory().getFinancialInputDAO().get(id);
			fi.setAllocated(true);
			fi.setAllocatedDate(new Date());
			DAOFactory.getFactory().getFinancialInputDAO().save(fi);
		}
	}
	
	
	/**
	 * Gets the annu budget allocation.
	 *
	 * @return the annu budget allocation
	 */
	public AnnualBudgetAllocation getAnnuBudgetAllocation() {
		return annuBudgetAllocation;
	}
	
	/**
	 * Sets the annu budget allocation.
	 *
	 * @param annuBudgetAllocation the new annu budget allocation
	 */
	public void setAnnuBudgetAllocation(AnnualBudgetAllocation annuBudgetAllocation) {
		this.annuBudgetAllocation = annuBudgetAllocation;
	}
	
	/**
	 * Gets the annu budget allocation id.
	 *
	 * @return the annu budget allocation id
	 */
	public Long getAnnuBudgetAllocationId() {
		return annuBudgetAllocationId;
	}
	
	/**
	 * Sets the annu budget allocation id.
	 *
	 * @param annuBudgetAllocationId the new annu budget allocation id
	 */
	public void setAnnuBudgetAllocationId(Long annuBudgetAllocationId) {
		this.annuBudgetAllocationId = annuBudgetAllocationId;
	}
	
	/**
	 * Gets the month list.
	 *
	 * @return the month list
	 */
	public Month[] getMonthList() {
		return monthList;
	}
	
	/**
	 * Sets the month list.
	 *
	 * @param monthList the new month list
	 */
	public void setMonthList(Month[] monthList) {
		this.monthList = monthList;
	}
	
	
	
}
