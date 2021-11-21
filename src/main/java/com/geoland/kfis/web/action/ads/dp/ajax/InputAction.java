package com.geoland.kfis.web.action.ads.dp.ajax;

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
import com.geoland.kfis.model.DocCategory;
import com.geoland.kfis.model.DocType;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.DocCategoryDAO;
import com.geoland.kfis.persistence.dao.services.DocTypeDAO;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class InputAction.
 */
public class InputAction extends BaseActionSupport {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -3777684415097270959L;
	
	/** The log. */
	protected Logger log = Logger.getLogger(InputAction.class);

	
	/**
	 * Doc type.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void docType() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String nameStartsWith = request.getParameter("name_startsWith");
			
				DocTypeDAO dao = DAOFactory.getFactory().getDocTypeDAO();
				String sqlQuery = "select * from tdoctype ";
				if(StringUtils.isNotEmpty(nameStartsWith)){
					sqlQuery += "WHERE name ILIKE '%" + nameStartsWith + "%'";
				}
				List<DocType> list = dao.executeSQLQuery(sqlQuery);
				JSONArray jsonArray = new JSONArray();
				for (DocType o : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", o.getId());
					jsonObject.element("name", o.getName());
					jsonObject.element("category", o.getDocCategory().getName());
					jsonArray.add(jsonObject);
				}
				String str = jsonArray.toString();
				out.append(str);
			
			out.flush();
		}catch (Exception e){
			log.error("com.geoland.kfis.web.action.ads.dp.ajax.InputAction.doctype", e);
			throw new BusinessException("com.geoland.kfis.web.action.ads.dp.ajax.InputAction.doctype", e);
		} finally {
			out.close();
		}		
	}	
	
	
	/**
	 * Doc category.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void docCategory() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String nameStartsWith = request.getParameter("name_startsWith");
			
				DocCategoryDAO dao = DAOFactory.getFactory().getDocCategoryDAO();
				String sqlQuery = "select * from tdoc_category ";
				if(StringUtils.isNotEmpty(nameStartsWith)){
					sqlQuery += " WHERE name ILIKE '%" + nameStartsWith + "%'";
				}
				List<DocCategory> list = dao.executeSQLQuery(sqlQuery);
				JSONArray jsonArray = new JSONArray();
				for (DocCategory o : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", o.getId());
					jsonObject.element("name", o.getName());
					jsonArray.add(jsonObject);
				}
				String str = jsonArray.toString();
				out.append(str);
			
			out.flush();
		}catch (Exception e){
			log.error("com.geoland.kfis.web.action.ads.dp.ajax.InputAction.docCategory", e);
			throw new BusinessException("com.geoland.kfis.web.action.ads.dp.ajax.InputAction.docCategory", e);
		} finally {
			out.close();
		}		
	}	
}
