/**
 * 
 */
package com.geoland.kfis.web.action.pub;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.LongType;
import org.hibernate.type.StringType;
import org.hibernate.type.Type;

import com.geoland.framework.exception.BusinessException;
import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.model.Publishing;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.PublishingDAO;
import com.geoland.kfis.persistence.hibernate.usertypes.Activitystatus;
import com.geoland.kfis.web.action.base.grid.GridBaseAction;
// TODO: Auto-generated Javadoc

/**
 * The Class PublishGridAction.
 *
 * @author Adelina Gashi , GEO&LAND
 * @version 1.0
 * @created May 5, 2015 , 11:42:54 AM
 */
public class PublishGridAction extends GridBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1158452796022167516L;
	
	/**
	 * Publishing.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void publishing() throws IOException, BusinessException{
		printHttpServletRequest();
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		try {
			String countQuery="";
			String sqlQuery="";
			String inspection_id=request.getParameter("inspection_id");
			String lang = getLocale().getLanguage();
			PublishingDAO dao=DAOFactory.getFactory().getPublishingDAO();
			
			countQuery+="select count(p.*) from tpublishing as p ";
					
			sqlQuery+="select p.* from tpublishing as p ";
			
			if(StringUtils.isNotEmpty(inspection_id)){
				countQuery+=" where d.inspection_id="+inspection_id;
				sqlQuery+=" where d.inspection_id="+inspection_id;
			}
			
			Integer count=dao.countQuery(countQuery);
			calcPages(count);
			
			sqlQuery += " LIMIT " + limit + " offset " + start;
			List<Publishing> list=dao.executeSQLQuery(sqlQuery);
			
			JSONObject data=new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows=new JSONArray();
			for(Publishing d:list){
				JSONObject o=new JSONObject();
				o.element("id", d.getId());
				o.element("important", d.getImportant());
				o.element("published", d.isPublished());
				o.element("title", d.getTitle());
				o.element("titleEn", d.getTitleEn());
				o.element("titleSr", d.getTitleSr());
				if(d.getPublishedDate()!=null)
				o.element("published_date", DATE_FORMAT.format(d.getPublishedDate()));
				if(d.getPerson()!=null)
					o.element("created_by",getPersonData(d.getPerson()));
				
				o.element("created_date", fdate(d.getCreatedDate()));
				
				rows.add(o);
			}
			data.element("rows", rows);
			
			out.append(data.toString());
			out.flush();
		} catch (Exception e) {
			log.error("PublishGridAction.publishing", e);
			throw new BusinessException("PublishGridAction.publishing",e);
		}finally{
			out.close();
		}
	}
	
	/**
	 * News content.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void newsContent() throws IOException, BusinessException{
		printHttpServletRequest();
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		try {
			List<Publishing> list = null;
//			printRequest(request);
//			print(request);
			
			String lang = getLocale().getLanguage();
			String pub_id = request.getParameter("pub_id");
			if(pub_id==null || StringUtils.isEmpty(pub_id)){
				if(request.getParameterMap().get("pub_id")!=null) {
					pub_id = request.getParameterMap().get("pub_id").toString();
				}
			}
			
			String sql = "select * from tpublishing where published=true ";
			
			
			if(pub_id!=null && !pub_id.equalsIgnoreCase("null") && StringUtils.isNotEmpty(pub_id)){
				Long valueOf = Long.valueOf(pub_id);
				sql+=" and id=:pub_id";
				sql+=" order by important,published_date desc,id limit 1";
				
				String[] paramNames = {"pub_id"};
				String[] paramTypes = {"LONG"};
				Object[] paramValues = {valueOf};
				
				list = DAOFactory.getFactory().getPublishingDAO().executeSQLQuery(sql, paramNames, paramTypes, paramValues);
			}else {
				sql+=" order by important, published_date desc, id limit 1";
				list = DAOFactory.getFactory().getPublishingDAO().executeSQLQuery(sql);
			}
			

			
			/**
			 * Query spSQLQuery = session.createSQLQuery("SELECT * FROM user_master WHERE user_name = :param1");
			spSQLQuery.setString("param1","vicky.thakor");
			 */
			
			//
			JSONObject o=new JSONObject();
			if(list!=null && list.size()>0){
				Publishing p=list.get(0);
				String nc = ("en".equals(lang)?p.getHtmlCodeEn():"sr".equals(lang)?p.getHtmlCodeSr():p.getHtmlCode());
				if(StringUtils.isEmpty(nc) || StringUtils.isBlank(nc))
					nc=p.getHtmlCode();
				String nt = ("en".equals(lang)?p.getTitleEn():"sr".equals(lang)?p.getTitleSr():p.getTitle());
				if(StringUtils.isEmpty(nt) || StringUtils.isBlank(nt))
					nt=p.getTitle();
				o.element("news_content", nc);
				o.element("title", nt);
				o.element("img",p.getPhoto()!=null?new String(Base64.encodeBase64(p.getPhoto())):"");
				o.element("published_date", fdate(p.getPublishedDate()));
				
			}
			String str = o.toString();
			out.append(str);
			out.flush();
		} catch (Exception e) {
			log.error("PublishGridAction.newsContent", e);
			response.sendError(HttpStatus.SC_BAD_REQUEST, e.getMessage());
			throw new BusinessException("PublishGridAction.newsContent",e);
		}finally{
			out.close();
		}
	}
	
	/**
	 * News title.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void newsTitle() throws IOException, BusinessException{
		printHttpServletRequest();
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		try {
			String lang = getLocale().getLanguage();
			String limit = request.getParameter("limit");
			boolean hasMore=true;
			Integer offset=0;
			Integer lim=0;
			if(StringUtils.isEmpty(limit))
				lim=5;
			else {
				lim=new Integer(limit)+5;
				offset=lim -5;
			}
			String sql="select * from tpublishing where published=true order by important,published_date desc,id limit "+lim+" offset "+offset;
			
			List<Publishing> list=DAOFactory.getFactory().getPublishingDAO().executeSQLQuery(sql);
			String countQuery="select count(*) from tpublishing as pub";
			Integer c=DAOFactory.getFactory().getPublishingDAO().countQuery(countQuery);
			
			if(c<lim)//if limit has reached end
				hasMore=false;
			
			JSONArray rows=new JSONArray();
			for(Publishing p:list){
				JSONObject o=new JSONObject();
				String no_translation="";
				String title = ("en".equals(lang)?p.getTitleEn():"sr".equals(lang)?p.getTitleSr():p.getTitle());;
				if(StringUtils.isEmpty(title) || StringUtils.isBlank(title)){
					title=p.getTitle();
					no_translation="true";
				}
				o.element("id", p.getId());
				o.element("title", title);
				o.element("published_date", fdate(p.getPublishedDate()));
				o.element("count", c.toString());
				o.element("limit", lim);
				o.element("hasMore", hasMore);
				o.element("no_translation", no_translation);
				rows.add(o);
				
			}
			out.append(rows.toString());

			out.flush();
		} catch (Exception e) {
			log.error("PublishGridAction.newsTitle", e);
			throw new BusinessException("PublishGridAction.newsTitle",e);
		}finally{
			out.close();
		}
	}
	
	/**
	 * AJAX Method- pvtRequestStatisitc.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void pvtRequestStatisitc() throws IOException, BusinessException {
		printHttpServletRequest();
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String year = request.getParameter("year");
			String pvtStatus = request.getParameter("pvtStatus");
			String lang=getLocale().getLanguage();
			if(StringUtils.isNotEmpty(year)){
				String query=" select reg.id as reg_id,reg.name as reg_name, reg.name_sr as reg_name_sr , " +
						" reg.name_en as reg_name_en ,num_req.number_of_requests from tgis_region as reg left join " +
						" (select count(*) as number_of_requests ,mun.region_id from tfrm_private_request as pr " +
						" left join tfrm_activity as a  on pr.activity_id=a.id" +
						" left join tfrm_annual_planning as anpl  on a.annual_planning_id=anpl.id " +
						" left join tgis_cadastral_municipality as mun on mun.id=anpl.mun_id " +
						" left join tfrm_activity_status as  act_stat on  pr.status_id=act_stat.id "+
						" where  anpl.year="+year;
						
				if(StringUtils.isNotEmpty(pvtStatus)){
					
					if(pvtStatus.equals(Activitystatus.APPROVED.getDOMKEY())){
						query+="and (act_stat.status='"+pvtStatus+"' or act_stat.status='TRN')";
					}else {
						query+=" and act_stat.status='"+pvtStatus+"'";	
					}
				}
					query+=" group by mun.region_id) as num_req  on reg.id=num_req.region_id ";
				Session session = HibSessionFactory.getSessionFactory().getCurrentSession();
				SQLQuery sqlQuery = session.createSQLQuery(query);
				sqlQuery.addScalar("reg_id", LongType.INSTANCE);
				sqlQuery.addScalar("reg_name", StringType.INSTANCE);
				sqlQuery.addScalar("reg_name_sr", StringType.INSTANCE);
				sqlQuery.addScalar("reg_name_en", StringType.INSTANCE);
				sqlQuery.addScalar("number_of_requests", LongType.INSTANCE);
				
				List list = sqlQuery.list();
				 
				JSONArray jsonArray = new JSONArray();
				for (Iterator iterator = list.iterator(); iterator.hasNext();) {
				     Object obj[] = (Object[]) iterator.next();
				     Long reg_id = (Long) obj[0];
				     String reg_name = (String) obj[1];
				     String reg_name_sr = (String) obj[2];
				     String reg_name_en = (String) obj[3];
				     Long number_of_requests = (Long) obj[4];
					JSONObject jsonObject = new JSONObject();
					
					jsonObject.element("reg_id", reg_id);
					if(number_of_requests!=null)
					jsonObject.element("number_of_requests", number_of_requests);
					else
						jsonObject.element("number_of_requests", 0);
						
					if("en".equals(lang)){
						jsonObject.element("reg_name", reg_name_en);
					}else if("sr".equals(lang)){
						jsonObject.element("reg_name", reg_name_sr);						
					}else{
						jsonObject.element("reg_name", reg_name);
					}
					
					jsonArray.add(jsonObject);
				}
				String str = jsonArray.toString();
				out.append(str);
			}
			out.flush();
		}catch (Exception e){
			log.error("InputAction.pvtRequestStatisitc", e);
			throw new BusinessException("InputAction.pvtRequestStatisitc", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * AJAX Method- harvestStatisitc.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void harvestStatisitc() throws IOException, BusinessException {
		printHttpServletRequest();
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String year = request.getParameter("year");
			String pvtStatus = request.getParameter("pvtStatus");
			String lang=getLocale().getLanguage();
			if(StringUtils.isNotEmpty(year)){
				String query="select reg.id as reg_id,reg.name as reg_name, reg.name_sr as reg_name_sr ," +
						" reg.name_en as reg_name_en , harv.pl_tech_volume, harv.pl_fire_volume, " +
						" harv.pl_pulp_volume,harv.im_tech_volume,harv.im_fire_volume ,harv.im_pulp_volume from tgis_region as reg left join " +
						" (select  sum(harv_act.pl_tech_volume) as pl_tech_volume ,sum(harv_act.pl_fire_volume) as pl_fire_volume, " +
						" sum(harv_act.pl_pulp_volume) as pl_pulp_volume, sum(harv_act.im_tech_volume) as im_tech_volume," +
						" sum(harv_act.im_fire_volume) as im_fire_volume ,sum(harv_act.im_pulp_volume) as im_pulp_volume,mun.region_id " +
						" from tfrm_stand_harvest_activity as harv_act left join tfrm_activity as act on harv_act.activity_id=act.id " +
						" left join tfrm_annual_planning as annu_paln on act.annual_planning_id=annu_paln.id   " +
						" left join tfrm_activity_status as act_stat on harv_act.status_id=act_stat.id " +
						" left join tgis_cadastral_municipality as mun  on annu_paln.mun_id=mun.id where annu_paln.year="+year+
						" and act_stat.status='APR'group by mun.region_id) as harv on reg.id=harv.region_id";
				
				Session session = HibSessionFactory.getSessionFactory().getCurrentSession();
				SQLQuery sqlQuery = session.createSQLQuery(query);
				sqlQuery.addScalar("reg_id", LongType.INSTANCE);
				sqlQuery.addScalar("reg_name", StringType.INSTANCE);
				sqlQuery.addScalar("reg_name_sr", StringType.INSTANCE);
				sqlQuery.addScalar("reg_name_en", StringType.INSTANCE);
				sqlQuery.addScalar("pl_tech_volume", LongType.INSTANCE);
				sqlQuery.addScalar("pl_fire_volume", LongType.INSTANCE);
				sqlQuery.addScalar("pl_pulp_volume", LongType.INSTANCE);
				sqlQuery.addScalar("im_tech_volume", LongType.INSTANCE);
				sqlQuery.addScalar("im_fire_volume", LongType.INSTANCE);
				sqlQuery.addScalar("im_pulp_volume", LongType.INSTANCE);
				
				
				List list = sqlQuery.list();
				 
				JSONArray jsonArray = new JSONArray();
				for (Iterator iterator = list.iterator(); iterator.hasNext();) {
				     Object obj[] = (Object[]) iterator.next();
				     Long reg_id = (Long) obj[0];
				     String reg_name = (String) obj[1];
				     String reg_name_sr = (String) obj[2];
				     String reg_name_en = (String) obj[3];
				     Long pl_tech_volume = (Long) obj[4];
				     Long pl_fire_volume = (Long) obj[5];
				     Long pl_pulp_volume = (Long) obj[6];
				     Long im_tech_volume = (Long) obj[7];
				     Long im_fire_volume = (Long) obj[8];
				     Long im_pulp_volume = (Long) obj[9];
				     
				     
				     
				     
					JSONObject jsonObject = new JSONObject();
					
					jsonObject.element("reg_id", reg_id);
					if(pl_tech_volume!=null)
					jsonObject.element("pl_tech_volume", pl_tech_volume);
					else
						jsonObject.element("pl_tech_volume", 0);
					
					if(pl_fire_volume!=null)
						jsonObject.element("pl_fire_volume", pl_fire_volume);
						else
							jsonObject.element("pl_fire_volume", 0);
				
					if(pl_pulp_volume!=null)
						jsonObject.element("pl_pulp_volume", pl_pulp_volume);
						else
							jsonObject.element("pl_pulp_volume", 0);
					
					if(im_tech_volume!=null)
						jsonObject.element("im_tech_volume", im_tech_volume);
						else
							jsonObject.element("im_tech_volume", 0);
					
					if(im_fire_volume!=null)
						jsonObject.element("im_fire_volume", im_fire_volume);
						else
							jsonObject.element("im_fire_volume", 0);
					
					if(im_pulp_volume!=null)
						jsonObject.element("im_pulp_volume", im_pulp_volume);
						else
							jsonObject.element("im_pulp_volume", 0);
					
						
					if("en".equals(lang)){
						jsonObject.element("reg_name", reg_name_en);
					}else if("sr".equals(lang)){
						jsonObject.element("reg_name", reg_name_sr);						
					}else{
						jsonObject.element("reg_name", reg_name);
					}
					
					jsonArray.add(jsonObject);
				}
				String str = jsonArray.toString();
				out.append(str);
			}
			out.flush();
		}catch (Exception e){
			log.error("InputAction.harvestStatisitc", e);
			throw new BusinessException("InputAction.harvestStatisitc", e);
		} finally {
			out.close();
		}		
	}
}
