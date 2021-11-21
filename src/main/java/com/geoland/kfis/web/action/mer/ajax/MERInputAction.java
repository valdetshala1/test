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
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.exception.BusinessException;
import com.geoland.kfis.model.MerPlanPeriod;
import com.geoland.kfis.model.MerStrategy;
import com.geoland.kfis.model.MerSubProject;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.MerPlanPeriodDAO;
import com.geoland.kfis.persistence.dao.services.MerStrategyDAO;
import com.geoland.kfis.persistence.dao.services.MerSubProjectDAO;
import com.geoland.kfis.web.action.ajax.InputAction;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class MERInputAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 10:03:42 AM, Mar 26, 2015
 */
public class MERInputAction extends BaseActionSupport {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -6783059013773175623L;

	/** The log. */
	protected Logger log = Logger.getLogger(InputAction.class);
	
	/**
	 * AJAX Method - planPeriod.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void planPeriod() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String nameStartsWith = request.getParameter("name_startsWith");
			if(StringUtils.isNotEmpty(nameStartsWith)){
				MerPlanPeriodDAO dao = DAOFactory.getFactory().getMerPlanPeriodDAO();
				String sqlQuery = null;
				sqlQuery="select * from tmer_plan_period p where CAST(p.start_year AS varchar) like '%"+nameStartsWith+"%' or CAST(p.end_year AS varchar) like '%"+nameStartsWith+"%'";
				List<MerPlanPeriod> list = dao.executeSQLQuery(sqlQuery);
				JSONArray jsonArray = new JSONArray();
				for (MerPlanPeriod o : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", o.getId());
					jsonObject.element("start_year", o.getStartYear());
					jsonObject.element("end_year", o.getEndYear());
					
					jsonArray.add(jsonObject);
				}
				String str = jsonArray.toString();
				out.append(str);
			}
			out.flush();
		}catch (Exception e){
			log.error("MERInputAction.planPeriod", e);
			throw new BusinessException("MERInputAction.planPeriod", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * AJAX Method - subProject.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void subProject() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String nameStartsWith = request.getParameter("name_startsWith");
			String lang=getLocale().getLanguage();
			if(StringUtils.isNotEmpty(nameStartsWith)){
				MerSubProjectDAO dao = DAOFactory.getFactory().getMerSubProjectDAO();
				String sqlQuery = null;
				String name="en".equals(lang)?"name_en":"sr".equals(lang)?"name_sr":"name";
				sqlQuery="select * from tmer_sub_project where "+name+" ilike '"+nameStartsWith+"%'";
				List<MerSubProject> list = dao.executeSQLQuery(sqlQuery);
				JSONArray jsonArray = new JSONArray();
				for (MerSubProject o : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", o.getId());
					jsonObject.element("name", "en".equals(lang)?o.getNameEn():"sr".equals(lang)?o.getNameSr():o.getName());
					jsonObject.element("code", o.getCode());
					
					jsonArray.add(jsonObject);
				}
				String str = jsonArray.toString();
				out.append(str);
			}
			out.flush();
		}catch (Exception e){
			log.error("MERInputAction.subProject", e);
			throw new BusinessException("MERInputAction.subProject", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * AJAX Method - strategy.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void strategy() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String nameStartsWith = request.getParameter("name_startsWith");
			String strategy_id = request.getParameter("strategy_id");
			String lang=getLocale().getLanguage();
			if(StringUtils.isNotEmpty(nameStartsWith)){
				MerStrategyDAO dao = DAOFactory.getFactory().getMerStrategyDAO();
				String sqlQuery = null;
				String name="en".equals(lang)?"name_en":"sr".equals(lang)?"name_sr":"name";
				sqlQuery="select * from tmer_strategy s left join tmer_sub_project p on s.sub_project_id=p.id where p."+name+" ilike '"+nameStartsWith+"%'";
				if(StringUtils.isNotEmpty(strategy_id))
					sqlQuery+=" and s.id!="+strategy_id;
				
				List<MerStrategy> list = dao.executeSQLQuery(sqlQuery);
				JSONArray jsonArray = new JSONArray();
				for (MerStrategy o : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", o.getId());
					jsonObject.element("sub_project_id", o.getMerSubProject().getId());
					jsonObject.element("name", "en".equals(lang)?o.getMerSubProject().getNameEn():"sr".equals(lang)?o.getMerSubProject().getNameSr():o.getMerSubProject().getName());
					jsonObject.element("code", o.getMerSubProject().getCode());
					
					jsonArray.add(jsonObject);
				}
				String str = jsonArray.toString();
				out.append(str);
			}
			out.flush();
		}catch (Exception e){
			log.error("MERInputAction.strategy", e);
			throw new BusinessException("MERInputAction.strategy", e);
		} finally {
			out.close();
		}
	}
}
