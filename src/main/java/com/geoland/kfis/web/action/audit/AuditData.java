package com.geoland.kfis.web.action.audit;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.DateType;
import org.hibernate.type.LongType;
import org.hibernate.type.StringType;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.exception.BusinessException;
import com.geoland.kfis.web.action.base.grid.GridBaseAction;
import com.vividsolutions.jts.geom.Geometry;
import com.vividsolutions.jts.geom.GeometryFactory;
import com.vividsolutions.jts.geom.PrecisionModel;
import com.vividsolutions.jts.io.ParseException;
import com.vividsolutions.jts.io.WKTReader;
// TODO: Auto-generated Javadoc

/**
 * The Class AuditData.
 *
 * @author Ardiana Demolli, Geo&Land
 * Jan 13, 2016, 9:47:35 AM
 * v2.0
 */
public class AuditData extends GridBaseAction{

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/**
	 * Audit data.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public void auditData() throws IOException  {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		//String filter = filter();
		String filter = null;
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			
			String entity_name = request.getParameter("entity_name");
			String entity_id = request.getParameter("entity_id");
			if(StringUtils.isNotEmpty(entity_name) && StringUtils.isNotEmpty(entity_id)){
				Session session = HibSessionFactory.getSessionFactory().getCurrentSession();
	    		
				String countQuery = "select count(*) from tables_aud where entity_id="+entity_id+" and entity_name='"+entity_name+"'";
				if(StringUtils.isNotEmpty(filter)){
					countQuery += " " + filter;
				}
				SQLQuery sqlQ = session.createSQLQuery(countQuery);
				Integer count = Integer.valueOf(sqlQ.uniqueResult().toString());
				calcPages(count);
				
				String sqlQuery = "select * from tables_aud where entity_id="+entity_id+" and entity_name='"+entity_name+"'";
				sqlQ = session.createSQLQuery(sqlQuery);
				sqlQ.addScalar("id", LongType.INSTANCE);
				sqlQ.addScalar("action", StringType.INSTANCE);
				sqlQ.addScalar("created_date", DateType.INSTANCE);
				sqlQ.addScalar("cerated_by", StringType.INSTANCE);
				
				List list = sqlQ.list();
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", list.size());
				data.element("records", getRecords());	
				JSONArray rows = new JSONArray();
				for (Iterator iterator = list.iterator(); iterator.hasNext();) {
					Object obj[] = (Object[]) iterator.next();
					Long id = (Long) obj[0];
					String action = (String) obj[1];
					Date createdDate = (Date) obj[2];
					String created_by = (String) obj[3];
					
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", id);
					jsonObject.element("action", action);
					jsonObject.element("createdDate", createdDate.toString());
					jsonObject.element("created_by", created_by);
					
					rows.add(jsonObject);
				}
				data.element("rows", rows);
				out.append(data.toString());
				out.flush();
			}else{
				setEmtpyContent(out);
				out.flush();
			}
		
		}catch (Exception e){
			log.error("AuditData.auditData", e);
			throw new BusinessException("AuditData.auditData", e);
		} finally {
			out.close();
		}	
	}	
	
	/**
	 * Diff data.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void diffData() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		//String filter = filter();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			
			String id = request.getParameter("id");
			if(StringUtils.isNotEmpty(id) ){
				Session session = HibSessionFactory.getSessionFactory().getCurrentSession();
	    		
				String sqlQuery = "select * from tables_aud where id="+id;
				SQLQuery sqlQ = session.createSQLQuery(sqlQuery);
				sqlQ.addScalar("detail", StringType.INSTANCE);
				sqlQ.addScalar("diff", StringType.INSTANCE);
				
				List list = sqlQ.list();
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", list.size());
				data.element("records", getRecords());	
				JSONArray rows = new JSONArray();
				for (Iterator iterator = list.iterator(); iterator.hasNext();) {
					Object obj[] = (Object[]) iterator.next();
					String detail = (String) obj[0];
					String diff = (String) obj[1];
					
					String detailcompose="";
					JSONObject jsonObject = new JSONObject();
					String detailSplit[] = detail.split("\\|\\|\\|");
					for (String item : detailSplit) {
						String itemSplit[] = item.split("\\=\\>\\>");
						if(itemSplit.length==2){
							detailcompose += "<b>"+getMessage(("audit."+itemSplit[0]).trim())+"</b>: "+itemSplit[1]+"\n";
						}
					}
					
					String diffCompose = "";
					String diffSplit[] = diff.split("\\|\\|\\|");
					for (String item : diffSplit) {
						String itemSplit[] = item.split("\\=\\>\\>");
						if(itemSplit.length==2){
							diffCompose += "<b>"+getMessage(("audit."+itemSplit[0]).trim())+"</b>: "+itemSplit[1]+"\n";
						}
					}
					
					jsonObject.element("id", id);
					jsonObject.element("detail", detailcompose);
					jsonObject.element("diff", diffCompose);
					
					rows.add(jsonObject);
				}
				data.element("rows", rows);
				out.append(data.toString());
				out.flush();
			}else{
				setEmtpyContent(out);
				out.flush();
			}
		
		}catch (Exception e){
			log.error("AuditData.auditData", e);
			throw new BusinessException("AuditData.auditData", e);
		} finally {
			out.close();
		}	
	}	
	
	/**
	 * Diff data geom.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void diffDataGeom() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		//String filter = filter();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			
			String id = request.getParameter("id");
			if(StringUtils.isNotEmpty(id) ){
				Session session = HibSessionFactory.getSessionFactory().getCurrentSession();
	    		
				String sqlQuery = "select * from tables_aud where id="+id;
				SQLQuery sqlQ = session.createSQLQuery(sqlQuery);
				sqlQ.addScalar("detail", StringType.INSTANCE);
				sqlQ.addScalar("diff", StringType.INSTANCE);
				sqlQ.addScalar("entity_id", LongType.INSTANCE);
				
				List list = sqlQ.list();
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", list.size());
				data.element("records", getRecords());	
				JSONArray rows = new JSONArray();
				for (Iterator iterator = list.iterator(); iterator.hasNext();) {
					Object obj[] = (Object[]) iterator.next();
					String detail = (String) obj[0];
					String diff = (String) obj[1];
					Long entity_id= (Long) obj[2];
					
					String detailcompose="";
					String bbox="";
					JSONObject jsonObject = new JSONObject();
					String detailSplit[] = detail.split("\\|\\|\\|");
					Geometry geo1=null;
					Geometry geo2=null;
					for (String item : detailSplit) {
						String itemSplit[] = item.split("\\=\\>\\>");
						if(itemSplit.length==2){
							detailcompose += "<b>"+getMessage(("audit."+itemSplit[0]).trim())+"</b>: "+itemSplit[1]+"\n";
							if(itemSplit[1].startsWith("POLYGON") ||itemSplit[1].startsWith("MULTIPOLYGON ")){
								String polygon = itemSplit[1];
								 WKTReader wktReader = new WKTReader(new GeometryFactory(new PrecisionModel(), 900916)); 
									try {
										geo1 = wktReader.read(polygon);
									    geo1.setSRID(900916);
									} catch (ParseException e) {
										e.printStackTrace();
									}
							}
						}
					}
					
					String diffCompose = "";
					String diffSplit[] = diff.split("\\|\\|\\|");
					for (String item : diffSplit) {
						String itemSplit[] = item.split("\\=\\>\\>");
						if(itemSplit.length==2){
							diffCompose += "<b>"+getMessage(("audit."+itemSplit[0]).trim())+"</b>: "+itemSplit[1]+"\n";
							if(itemSplit[1].startsWith("POLYGON") || itemSplit[1].startsWith("MULTIPOLYGON ") ){
								String polygon = itemSplit[1];
								 WKTReader wktReader = new WKTReader(new GeometryFactory(new PrecisionModel(), 900916)); 
									try {
										geo2 = wktReader.read(polygon);
										geo2.setSRID(900916);
									} catch (ParseException e) {
										e.printStackTrace();
									}
							}
						}
					}
					
					if(geo1!=null && geo2!=null){
						Geometry union = geo1.union(geo2);
						Geometry geombuffer = union.buffer(5).getEnvelope();
					    double minx = geombuffer.getCentroid().getX() - geombuffer.getEnvelopeInternal().maxExtent()/2;
					    double miny = geombuffer.getCentroid().getY() - geombuffer.getEnvelopeInternal().maxExtent()/2;
					    double maxx = geombuffer.getCentroid().getX() + geombuffer.getEnvelopeInternal().maxExtent()/2;
					    double maxy = geombuffer.getCentroid().getY() + geombuffer.getEnvelopeInternal().maxExtent()/2;
					    bbox = minx + "," + miny + "," +  maxx + "," +  maxy;
					}
					jsonObject.element("id", id);
					jsonObject.element("detail", detailcompose);
					jsonObject.element("diff", diffCompose);
					jsonObject.element("bbox", bbox);
					jsonObject.element("entity_id", entity_id);
					
					
					rows.add(jsonObject);
				}
				data.element("rows", rows);
				out.append(data.toString());
				out.flush();
			}else{
				setEmtpyContent(out);
				out.flush();
			}
		
		}catch (Exception e){
			log.error("AuditData.auditData", e);
			throw new BusinessException("AuditData.auditData", e);
		} finally {
			out.close();
		}	
	}	
	
	
	
}
