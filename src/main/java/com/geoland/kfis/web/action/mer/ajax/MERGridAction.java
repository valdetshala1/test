/**
 * 
 */
package com.geoland.kfis.web.action.mer.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.exception.BusinessException;
import com.geoland.kfis.model.MerFinanceDonor;
import com.geoland.kfis.model.MerIndicator;
import com.geoland.kfis.model.MerIndicatorTarget;
import com.geoland.kfis.model.MerPerfEvaluation;
import com.geoland.kfis.model.MerPlanPeriod;
import com.geoland.kfis.model.MerProject;
import com.geoland.kfis.model.MerRefSubProject;
import com.geoland.kfis.model.MerRespInstitution;
import com.geoland.kfis.model.MerStratEvaluation;
import com.geoland.kfis.model.MerStrategy;
import com.geoland.kfis.model.MerStrategyDoc;
import com.geoland.kfis.model.MerStrategyExecution;
import com.geoland.kfis.model.MerSubIndicator;
import com.geoland.kfis.model.MerSubProject;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.MerFinanceDonorDAO;
import com.geoland.kfis.persistence.dao.services.MerIndicatorDAO;
import com.geoland.kfis.persistence.dao.services.MerIndicatorTargetDAO;
import com.geoland.kfis.persistence.dao.services.MerPerfEvaluationDAO;
import com.geoland.kfis.persistence.dao.services.MerPlanPeriodDAO;
import com.geoland.kfis.persistence.dao.services.MerProjectDAO;
import com.geoland.kfis.persistence.dao.services.MerRefSubProjectDAO;
import com.geoland.kfis.persistence.dao.services.MerRespInstitutionDAO;
import com.geoland.kfis.persistence.dao.services.MerStratEvaluationDAO;
import com.geoland.kfis.persistence.dao.services.MerStrategyDAO;
import com.geoland.kfis.persistence.dao.services.MerStrategyDocDAO;
import com.geoland.kfis.persistence.dao.services.MerStrategyExecutionDAO;
import com.geoland.kfis.persistence.dao.services.MerSubIndicatorDAO;
import com.geoland.kfis.persistence.dao.services.MerSubProjectDAO;
import com.geoland.kfis.web.action.base.grid.GridBaseAction;

// TODO: Auto-generated Javadoc
/**
 * The Class MERGridAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 4:56:53 PM, Mar 25, 2015
 */
public class MERGridAction extends GridBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -1927468629202651621L;

	/**
	 * planPeriod JSON.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void planPeriod() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			MerPlanPeriodDAO dao=DAOFactory.getFactory().getMerPlanPeriodDAO();
			String countQuery = "select count(*) from tmer_plan_period";
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			String sqlQuery = "select * from tmer_plan_period";
			sqlQuery += " LIMIT " + limit + " offset " + start;
			
			List<MerPlanPeriod> list = dao.executeSQLQuery(sqlQuery);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for (MerPlanPeriod o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("start_year", o.getStartYear());
				jsonObject.element("end_year", o.getEndYear());
				jsonObject.element("note", o.getNote());
				jsonObject.element("created_by", getPersonData(o.getPerson()));
				jsonObject.element("created", fdate(o.getCreatedDate()));
				
				rows.add(jsonObject);
			}
			
			data.element("rows", rows);

			out.append(data.toString());
			out.flush();			
			
		}catch (Exception e){
			log.error("MERGridAction.planPeriod", e);
			throw new BusinessException("MERGridAction.planPeriod", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * Project.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void project() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String lang = getLocale().getLanguage();
			MerProjectDAO dao=DAOFactory.getFactory().getMerProjectDAO();
			String countQuery = "select count(*) from tmer_project";
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			String sqlQuery = "select * from tmer_project";
			sqlQuery += " LIMIT " + limit + " offset " + start;
			
			List<MerProject> list = dao.executeSQLQuery(sqlQuery);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for (MerProject o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("name", o.getName());
				jsonObject.element("name_en", o.getNameEn());
				jsonObject.element("name_sr", o.getNameSr());
				jsonObject.element("code", o.getCode());
				jsonObject.element("pillar", "en".equals(lang)?o.getPillar().getDOMTEXT_EN():"al".equals(lang)?o.getPillar().getDOMTEXT():o.getPillar().getDOMTEXT_SR());
				jsonObject.element("description", o.getDescription());
				jsonObject.element("created_by", getPersonData(o.getPerson()));
				jsonObject.element("created", fdate(o.getCreatedDate()));
				rows.add(jsonObject);
			}
			
			data.element("rows", rows);

			out.append(data.toString());
			out.flush();			
			
		}catch (Exception e){
			log.error("MERGridAction.project", e);
			throw new BusinessException("MERGridAction.project", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * Subproject.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void subproject() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request=ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			MerSubProjectDAO dao=DAOFactory.getFactory().getMerSubProjectDAO();
			String project_id=request.getParameter("project_id");
			
			
			
			String countQuery = "select count(*) from tmer_sub_project";
			String sqlQuery = "select * from tmer_sub_project ";
			
			if(StringUtils.isNotEmpty(project_id)){
				countQuery+=" where project_id="+project_id;
				sqlQuery+=" where project_id="+project_id;
			}

			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			sqlQuery += " LIMIT " + limit + " offset " + start;
			
			List<MerSubProject> list = dao.executeSQLQuery(sqlQuery);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for (MerSubProject o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("name", o.getName());
				jsonObject.element("name_en", o.getNameEn());
				jsonObject.element("name_sr", o.getNameSr());
				jsonObject.element("code", o.getCode());
				jsonObject.element("priority", o.getPriority());
				jsonObject.element("description", o.getDescription());
				jsonObject.element("created_by", getPersonData(o.getPerson()));
				jsonObject.element("created", fdate(o.getCreatedDate()));
				rows.add(jsonObject);
			}
			
			data.element("rows", rows);

			out.append(data.toString());
			out.flush();			
			
		}catch (Exception e){
			log.error("MERGridAction.subproject", e);
			throw new BusinessException("MERGridAction.subproject", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * strategy JSON.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void strategy() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			MerStrategyDAO dao=DAOFactory.getFactory().getMerStrategyDAO();
			String lang = getLocale().getLanguage();
			String countQuery = "select count(*) from tmer_strategy";
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			String sqlQuery = "select * from tmer_strategy s left join tmer_plan_period p on p.id=s.plan_period_id order by p.start_year";
			sqlQuery += " LIMIT " + limit + " offset " + start;
			
			List<MerStrategy> list = dao.executeSQLQuery(sqlQuery);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for (MerStrategy o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("sub_project_id", o.getMerSubProject().getId());
				jsonObject.element("sub_project", "en".equals(lang)?o.getMerSubProject().getNameEn():"sr".equals(lang)?o.getMerSubProject().getNameSr():o.getMerSubProject().getName());
				jsonObject.element("plan_period_id", o.getMerPlanPeriod().getId());
				jsonObject.element("plan_period", o.getMerPlanPeriod().getStartYear()+"-"+o.getMerPlanPeriod().getEndYear());
				jsonObject.element("results", o.getResults());
				jsonObject.element("start_year", o.getStartYear());
				jsonObject.element("end_year", o.getEndYear());
				jsonObject.element("pip_code", o.getPipCode());
				jsonObject.element("review_time", fdate(o.getReviewTime()));
				jsonObject.element("cost", o.getCost());
				jsonObject.element("fully_financed", o.getFullyFinanced().booleanValue());
				jsonObject.element("in_negotiations_finance", o.getInNegotiationsFinance().booleanValue());
				
				jsonObject.element("created_by", getPersonData(o.getPerson()));
				jsonObject.element("created", fdate(o.getCreatedDate()));
				
				rows.add(jsonObject);
			}
			
			data.element("rows", rows);

			out.append(data.toString());
			out.flush();			
			
		}catch (Exception e){
			log.error("MERGridAction.strategy", e);
			throw new BusinessException("MERGridAction.strategy", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * respInstitution JSON.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void respInstitution() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String strategy_id = request.getParameter("strategy_id");
			String lang = getLocale().getLanguage();
			if(StringUtils.isNotEmpty(strategy_id) && StringUtils.isNumeric(strategy_id)){
				MerRespInstitutionDAO dao=DAOFactory.getFactory().getMerRespInstitutionDAO();
				String countQuery = "select count(i.*) from tmer_resp_institutions i left join tmer_strategy s on i.strategy_id=s.id where i.strategy_id="+strategy_id;
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				String sqlQuery = "select i.* from tmer_resp_institutions i left join tmer_strategy s on i.strategy_id=s.id where i.strategy_id="+strategy_id;
				sqlQuery += " LIMIT " + limit + " offset " + start;
				
				List<MerRespInstitution> list = dao.executeSQLQuery(sqlQuery);
				
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
				
				JSONArray rows = new JSONArray();
				for (MerRespInstitution o : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", o.getId());
					jsonObject.element("strategy_id", o.getMerStrategy().getId());
					jsonObject.element("organisation_id", o.getOrganisation().getId());
					jsonObject.element("organisation", getOganisationData(o.getOrganisation(),lang));
					jsonObject.element("note", o.getNote());
					
					jsonObject.element("created_by", getPersonData(o.getPerson()));
					jsonObject.element("created", fdate(o.getCreatedDate()));
					
					rows.add(jsonObject);
				}
				
				data.element("rows", rows);
	
				out.append(data.toString());
			}
			out.flush();			
			
		}catch (Exception e){
			log.error("MERGridAction.respInstitution", e);
			throw new BusinessException("MERGridAction.respInstitution", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * execution JSON.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void execution() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request=ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			MerStrategyExecutionDAO dao=DAOFactory.getFactory().getMerStrategyExecutionDAO();
			String strategy_id=request.getParameter("strategy_id");
			String lang = getLocale().getLanguage();
			String countQuery = "select count(*) from tmer_strategy_execution";
			String sqlQuery = "select * from tmer_strategy_execution";
			if(StringUtils.isNotEmpty(strategy_id)){
				countQuery+=" where strategy_id="+strategy_id;
				sqlQuery+=" where strategy_id="+strategy_id;
			}
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			sqlQuery += " LIMIT " + limit + " offset " + start;
			List<MerStrategyExecution> list = dao.executeSQLQuery(sqlQuery);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for (MerStrategyExecution o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("status", "en".equals(lang)?o.getStatus().getDOMTEXT_EN():"sr".equals(lang)?o.getStatus().getDOMTEXT_SR():o.getStatus().getDOMTEXT());
				jsonObject.element("execution_date",fdate(o.getExecutionDate()));
				jsonObject.element("created_by", getPersonData(o.getPerson()));
				jsonObject.element("note", o.getNote());
				jsonObject.element("created", fdate(o.getCreatedDate()));
				rows.add(jsonObject);
			}
			
			data.element("rows", rows);

			out.append(data.toString());
			out.flush();			
			
		}catch (Exception e){
			log.error("MERGridAction.execution", e);
			throw new BusinessException("MERGridAction.execution", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * indicator JSON.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void indicator() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request=ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			MerIndicatorDAO dao=DAOFactory.getFactory().getMerIndicatorDAO();
			String indicatorType=request.getParameter("indicatorType");
			String strategy_id=request.getParameter("strategy_id");
			String countQuery = "select count(*) from tmer_indicator";
			String sqlQuery = "select * from tmer_indicator";
			String cond=" WHERE ";
			if(StringUtils.isNotEmpty(indicatorType)){
				countQuery+=" where type='"+indicatorType+"'";
				sqlQuery+=" where type='"+indicatorType+"'";
				cond=" AND ";
			}
			if(StringUtils.isNotEmpty(strategy_id)){
				countQuery+=cond+" strategy_id='"+strategy_id+"'";
				sqlQuery+=cond+" strategy_id='"+strategy_id+"'";
				cond=" AND ";
			}
			
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			sqlQuery += " LIMIT " + limit + " offset " + start;
			List<MerIndicator> list = dao.executeSQLQuery(sqlQuery);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for (MerIndicator o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("name", o.getName());
				jsonObject.element("name_en", o.getNameEn());
				jsonObject.element("name_sr", o.getNameSr());
				jsonObject.element("type", o.getType());
				jsonObject.element("note", o.getNote());
				jsonObject.element("created_by", getPersonData(o.getPerson()));
				jsonObject.element("created", fdate(o.getCreatedDate()));
				rows.add(jsonObject);
			}
			
			data.element("rows", rows);
			out.append(data.toString());
			out.flush();			
			
		}catch (Exception e){
			log.error("MERGridAction.indicator", e);
			throw new BusinessException("MERGridAction.indicator", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * subindicator JSON.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void subIndicator() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request=ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			MerSubIndicatorDAO dao=DAOFactory.getFactory().getMerSubIndicatorDAO();
			String indicatorId=request.getParameter("indicatorId");
			
			
			String countQuery = "select count(*) from tmer_sub_indicator";
			String sqlQuery = "select * from tmer_sub_indicator";
			
			if(StringUtils.isNotEmpty(indicatorId)){
				countQuery+=" where indicator_id="+indicatorId;
				sqlQuery+=" where indicator_id="+indicatorId;
			}
			
			
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			sqlQuery += " LIMIT " + limit + " offset " + start;
			List<MerSubIndicator> list = dao.executeSQLQuery(sqlQuery);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for (MerSubIndicator o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("name", o.getName());
				jsonObject.element("name_en", o.getNameEn());
				jsonObject.element("name_sr", o.getNameSr());
				jsonObject.element("uom", o.getUom().getName());
				jsonObject.element("note", o.getNote());
				jsonObject.element("created_by", getPersonData(o.getPerson()));
				jsonObject.element("created", fdate(o.getCreatedDate()));
				rows.add(jsonObject);
			}
			
			data.element("rows", rows);
			out.append(data.toString());
			out.flush();			
			
		}catch (Exception e){
			log.error("MERGridAction.subIndicator", e);
			throw new BusinessException("MERGridAction.subIndicator", e);
		} finally {
			out.close();
		}		
	}
	
	
	
	/**
	 * refSubProject JSON.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void refSubProject() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String strategy_id = request.getParameter("strategy_id");
			if(StringUtils.isNotEmpty(strategy_id) && StringUtils.isNumeric(strategy_id)){
				MerRefSubProjectDAO dao=DAOFactory.getFactory().getMerRefSubProjectDAO();
				String countQuery = "select count(i.*) from tmer_ref_sub_projects i left join tmer_strategy s on i.strategy_id=s.id where i.strategy_id="+strategy_id;
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				String sqlQuery = "select i.* from tmer_ref_sub_projects i left join tmer_strategy s on i.strategy_id=s.id where i.strategy_id="+strategy_id;
				sqlQuery += " LIMIT " + limit + " offset " + start;
				
				List<MerRefSubProject> list = dao.executeSQLQuery(sqlQuery);
				
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
				
				JSONArray rows = new JSONArray();
				for (MerRefSubProject o : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", o.getId());
					jsonObject.element("strategy_id", o.getMerStrategyByStrategyId().getId());
					jsonObject.element("strategy", o.getMerStrategyByStrategyId().getMerSubProject().getName());
					jsonObject.element("ref_strategy_id", o.getMerStrategyByRefStrategyId().getId());
					jsonObject.element("ref_strategy", o.getMerStrategyByRefStrategyId().getMerSubProject().getName());
					jsonObject.element("note", o.getNote());
					
					jsonObject.element("created_by", getPersonData(o.getPerson()));
					jsonObject.element("created", fdate(o.getCreatedDate()));
					
					rows.add(jsonObject);
				}
				
				data.element("rows", rows);
	
				out.append(data.toString());
			}
			out.flush();			
			
		}catch (Exception e){
			log.error("MERGridAction.refSubProject", e);
			throw new BusinessException("MERGridAction.refSubProject", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * strategyDoc JSON.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void strategyDoc() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String strategy_id = request.getParameter("strategy_id");
			if(StringUtils.isNotEmpty(strategy_id) && StringUtils.isNumeric(strategy_id)){
				MerStrategyDocDAO dao=DAOFactory.getFactory().getMerStrategyDocDAO();
				String countQuery = "select count(*) from tmer_strategy_doc d left join tmer_strategy s on s.id=d.strategy_id where d.strategy_id="+strategy_id;
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				String sqlQuery = "select * from tmer_strategy_doc d left join tmer_strategy s on s.id=d.strategy_id where d.strategy_id="+strategy_id;
				sqlQuery += " LIMIT " + limit + " offset " + start;
				
				List<MerStrategyDoc> list = dao.executeSQLQuery(sqlQuery);
				
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
				
				JSONArray rows = new JSONArray();
				for (MerStrategyDoc o : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", o.getId());
					jsonObject.element("strategy_id", o.getMerStrategy().getId());
					jsonObject.element("strategy", o.getMerStrategy().getMerSubProject().getName());
					jsonObject.element("doc_name", o.getDocName());
					jsonObject.element("doc_type", o.getDocType());
					jsonObject.element("note", o.getNote());
					jsonObject.element("doc_size", o.getDocSize());
					
					jsonObject.element("created_by", getPersonData(o.getPerson()));
					jsonObject.element("created_date", fdate(o.getCreatedDate()));
					
					rows.add(jsonObject);
				}
				
				data.element("rows", rows);
	
				out.append(data.toString());
			}
			out.flush();			
			
		}catch (Exception e){
			log.error("MERGridAction.strategyDoc", e);
			throw new BusinessException("MERGridAction.strategyDoc", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * stratEvaluation JSON.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void stratEvaluation() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String indicator_id = request.getParameter("indicator_id");
			if(StringUtils.isNotEmpty(indicator_id) && StringUtils.isNumeric(indicator_id)){
				MerStratEvaluationDAO dao=DAOFactory.getFactory().getMerStratEvaluationDAO();
				String countQuery = "select count(*) from tmer_evaluation_strat s left join tmer_indicator i on i.id=s.indicator_id where s.indicator_id="+indicator_id;
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				String sqlQuery = "select * from tmer_evaluation_strat s left join tmer_indicator i on i.id=s.indicator_id where s.indicator_id="+indicator_id;
				sqlQuery += " LIMIT " + limit + " offset " + start;
				
				List<MerStratEvaluation> list = dao.executeSQLQuery(sqlQuery);
				
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());

				JSONArray rows = new JSONArray();
				for (MerStratEvaluation o : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", o.getId());
					jsonObject.element("inidcator_id", o.getMerIndicator().getId());
					jsonObject.element("eval_date", fdate(o.getEvalDate()));
					jsonObject.element("program_results", o.getProgramResults());
					jsonObject.element("note", o.getNote());
					
					jsonObject.element("created_by", getPersonData(o.getPerson()));
					jsonObject.element("created_date", fdate(o.getCreatedDate()));
					
					rows.add(jsonObject);
				}
				
				data.element("rows", rows);
	
				out.append(data.toString());
			}
			out.flush();			
			
		}catch (Exception e){
			log.error("MERGridAction.stratEvaluation", e);
			throw new BusinessException("MERGridAction.stratEvaluation", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * perfEvaluation JSON.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void perfEvaluation() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String subindicator_id = request.getParameter("subindicator_id");
			if(StringUtils.isNotEmpty(subindicator_id) && StringUtils.isNumeric(subindicator_id)){
				MerPerfEvaluationDAO dao=DAOFactory.getFactory().getMerPerfEvaluationDAO();
				String countQuery = "select count(*) from tmer_evaluation_perf as ep where ep.sub_indicator_id="+subindicator_id;
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				String sqlQuery = "select * from tmer_evaluation_perf as ep where ep.sub_indicator_id="+subindicator_id;
				sqlQuery += " LIMIT " + limit + " offset " + start;
				
				List<MerPerfEvaluation> list = dao.executeSQLQuery(sqlQuery);
				
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());

				JSONArray rows = new JSONArray();
				for (MerPerfEvaluation o : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", o.getId());
					jsonObject.element("eval_date", fdate(o.getEvalDate()));
					jsonObject.element("target", o.getTarget());
					jsonObject.element("actual", o.getActual());
					jsonObject.element("note", o.getNote());
					jsonObject.element("created_by", getPersonData(o.getPerson()));
					jsonObject.element("created_date", fdate(o.getCreatedDate()));
					rows.add(jsonObject);
				}
				
				data.element("rows", rows);
				out.append(data.toString());
			}
			out.flush();			
			
		}catch (Exception e){
			log.error("MERGridAction.perfEvaluation", e);
			throw new BusinessException("MERGridAction.perfEvaluation", e);
		} finally {
			out.close();
		}		
	}

	/**
	 * financeDonor JSON.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void financeDonor() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String strategy_id = request.getParameter("strategy_id");
			String lang = getLocale().getLanguage();
			if(StringUtils.isNotEmpty(strategy_id) && StringUtils.isNumeric(strategy_id)){
				MerFinanceDonorDAO dao=DAOFactory.getFactory().getMerFinanceDonorDAO();
				String countQuery = "select count(fd.*) from tmer_finance_donor fd left join tmer_strategy s on fd.strategy_id=s.id where fd.strategy_id="+strategy_id;
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				String sqlQuery = "select fd.* from tmer_finance_donor fd left join tmer_strategy s on fd.strategy_id=s.id where fd.strategy_id="+strategy_id;
				sqlQuery += " LIMIT " + limit + " offset " + start;
				
				List<MerFinanceDonor> list = dao.executeSQLQuery(sqlQuery);
				
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());

				JSONArray rows = new JSONArray();
				for (MerFinanceDonor o : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", o.getId());
					jsonObject.element("strategy_id", o.getMerStrategy().getId());
					jsonObject.element("strategy", "sr".equals(lang)?o.getMerStrategy().getMerSubProject().getNameSr():"en".equals(lang)?o.getMerStrategy().getMerSubProject().getNameEn():o.getMerStrategy().getMerSubProject().getName());
					jsonObject.element("donor_id", o.getOrganisation().getId());
					jsonObject.element("donor", getOganisationData(o.getOrganisation(),lang));
					jsonObject.element("donation_year", o.getDonationYear());
					jsonObject.element("amount", o.getAmount());
					jsonObject.element("note", o.getNote());
					
					jsonObject.element("created_by", getPersonData(o.getPerson()));
					jsonObject.element("created_date", fdate(o.getCreatedDate()));
					
					rows.add(jsonObject);
				}
				
				data.element("rows", rows);
	
				out.append(data.toString());
			}
			out.flush();			
			
		}catch (Exception e){
			log.error("MERGridAction.financeDonor", e);
			throw new BusinessException("MERGridAction.financeDonor", e);
		} finally {
			out.close();
		}		
	}
	

	/**
	 * indicatorTarget JSON.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void indicatorTarget() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String sub_indicator_id = request.getParameter("sub_indicator_id");
			String lang = getLocale().getLanguage();
			if(StringUtils.isNotEmpty(sub_indicator_id) && StringUtils.isNumeric(sub_indicator_id)){
				MerIndicatorTargetDAO dao=DAOFactory.getFactory().getMerIndicatorTargetDAO();
				String countQuery = "select count(it.*) from tmer_indicator_target as it left  join tmer_sub_indicator as si on si.id=it.sub_indicator_id where it.sub_indicator_id="+sub_indicator_id;
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				String sqlQuery = "select it.* from tmer_indicator_target as it left  join tmer_sub_indicator as si on si.id=it.sub_indicator_id where it.sub_indicator_id="+sub_indicator_id;
				sqlQuery += " LIMIT " + limit + " offset " + start;
				
				List<MerIndicatorTarget> list = dao.executeSQLQuery(sqlQuery);
				
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());

				JSONArray rows = new JSONArray();
				for (MerIndicatorTarget o : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", o.getId());
					jsonObject.element("subIndicatorId", o.getMerSubIndicator().getId());
					jsonObject.element("target", o.getTarget());
					jsonObject.element("note", o.getNote());
					jsonObject.element("year", o.getYear());
					jsonObject.element("created_by", getPersonData(o.getPerson()));
					jsonObject.element("created_date", fdate(o.getCreatedDate()));
					
					rows.add(jsonObject);
				}
				
				data.element("rows", rows);
	
				out.append(data.toString());
			}
			out.flush();			
			
		}catch (Exception e){
			log.error("MERGridAction.indicatorTarget", e);
			throw new BusinessException("MERGridAction.indicatorTarget", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * strategy JSON.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void strategyExecution() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			MerStrategyDAO dao=DAOFactory.getFactory().getMerStrategyDAO();
			String lang = getLocale().getLanguage();
			Long org_id = getUser().getOrganisationId();
			boolean isMerAdmin=getUser().checkAccess("strat", "_read");
			String countQuery = "select count(*) from tmer_strategy s " +
					"left join tmer_plan_period p on p.id=s.plan_period_id " +
					"left join tmer_resp_institutions r on r.strategy_id=s.id ";
			
			String sqlQuery = "select distinct(s.*) from tmer_strategy s " +
					"left join tmer_plan_period p on p.id=s.plan_period_id " +
					"left join tmer_resp_institutions r on r.strategy_id=s.id ";
			if(!isMerAdmin){
				countQuery+=" where r.organisation_id="+org_id;
				sqlQuery+=" where r.organisation_id="+org_id;
			}
			
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			sqlQuery += " LIMIT " + limit + " offset " + start;
			
			List<MerStrategy> list = dao.executeSQLQuery(sqlQuery);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for (MerStrategy o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("sub_project_id", o.getMerSubProject().getId());
				jsonObject.element("sub_project", "en".equals(lang)?o.getMerSubProject().getNameEn():"sr".equals(lang)?o.getMerSubProject().getNameSr():o.getMerSubProject().getName());
				jsonObject.element("plan_period_id", o.getMerPlanPeriod().getId());
				jsonObject.element("start_plan_period", o.getMerPlanPeriod().getStartYear());
				jsonObject.element("end_plan_period", o.getMerPlanPeriod().getEndYear());
				jsonObject.element("plan_period", o.getMerPlanPeriod().getStartYear()+"-"+o.getMerPlanPeriod().getEndYear());
				jsonObject.element("results", o.getResults());
				jsonObject.element("start_year", o.getStartYear());
				jsonObject.element("end_year", o.getEndYear());
				jsonObject.element("pip_code", o.getPipCode());
				jsonObject.element("review_time", fdate(o.getReviewTime()));
				jsonObject.element("fully_financed", o.getFullyFinanced().booleanValue());
				jsonObject.element("in_negotiations_finance", o.getInNegotiationsFinance().booleanValue());
				
				jsonObject.element("created_by", getPersonData(o.getPerson()));
				jsonObject.element("created", fdate(o.getCreatedDate()));
				
				rows.add(jsonObject);
			}
			
			data.element("rows", rows);

			out.append(data.toString());
			out.flush();			
			
		}catch (Exception e){
			log.error("MERGridAction.strategyExecution", e);
			throw new BusinessException("MERGridAction.strategyExecution", e);
		} finally {
			out.close();
		}		
	}
}
