package com.geoland.kfis.web.action.mer.execution.indicator.subindicator.indicatortarget;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.LongType;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.web.action.base.Constants;
// TODO: Auto-generated Javadoc

/**
 * The Class IndicatorTargetSaveAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created Mar 25, 2015 , 2:23:21 PM
 */
public class IndicatorTargetSaveAction extends IndicatorTargetBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	  /** The person. */
  	private Person person; 
		
		/* (non-Javadoc)
		 * @see com.opensymphony.xwork2.ActionSupport#validate()
		 */
		@Override
		public void validate() {
			person=getUser().getPerson();
				if(person==null)
					addActionError("");
				if(indicatorTarget!=null && indicatorTarget.getYear()==null){
					addFieldError("indicatorTarget.year", getMessage("indicatorTarget.year.empty"));
				}else {
//					Long spp=new Long(sPlanPer).longValue();
//					Long epp=new Long(ePlanPer).longValue();
//					if(indicatorTarget.getYear()<spp || indicatorTarget.getYear()>epp ){
//					 addFieldError("indicatorTarget.year", getMessage("indicatorTarget.is.not.in.plan.period.empty"));	
//					}else{
					if(indicatorTarget.getMerSubIndicator()!=null){
						Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
						
						String query="select count(*) from tmer_indicator_target where year="+indicatorTarget.getYear()+" and sub_indicator_id="+ indicatorTarget.getMerSubIndicator().getId();
						if(indicatorTarget.getId()!=null){
							query+=" and id!="+indicatorTarget.getId();
						}
						SQLQuery sql=session.createSQLQuery(query);
						sql.addScalar("count",LongType.INSTANCE);
						Object countRez=sql.uniqueResult();
						Long count=null;
						if(countRez!=null && !StringUtils.isEmpty(countRez.toString())){
							count=(Long)countRez;
						}
						if(count!=0 && count!=null){
							addFieldError("indicatorTarget.year", getMessage("indicatorTarget.year.exists"));
						}
					}else {
						addFieldError("", getMessage(""));
					}
					
//					}
				}
				if(indicatorTarget!=null && indicatorTarget.getTarget()==null){
					addFieldError("indicatorTarget.target", getMessage("indicatorTarget.target.empty"));
				}
				if (!getFieldErrors().isEmpty()) {
					HttpServletResponse response = ServletActionContext.getResponse();
					response.addHeader(Constants.ERRORS_EXITS, "true");
				}
			}
		
		   /* (non-Javadoc)
   		 * @see com.opensymphony.xwork2.ActionSupport#execute()
   		 */
   		@Override
			public String execute() throws Exception {
			   if(indicatorTarget.getId()==null){
				   indicatorTarget.setCreatedDate(new Date());
				   indicatorTarget.setPerson(person);
			   }
			   DAOFactory.getFactory().getMerIndicatorTargetDAO().save(indicatorTarget);
			   return SUCCESS;
			}
		   
	
	

}
