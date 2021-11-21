package com.geoland.kfis.web.action.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.exception.BusinessException;
import com.geoland.kfis.model.CadastralMunicipality;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.CadastralMunicipalityDAO;
import com.geoland.kfis.web.action.base.BaseActionSupport;

// TODO: Auto-generated Javadoc
/**
 * The Class InputAdminAction.
 */
public class InputAdminAction extends BaseActionSupport {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The log. */
	protected Logger log = Logger.getLogger(InputAdminAction.class);
	

	/**
	 * municipality.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void municipality() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		print(request);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			CadastralMunicipalityDAO dao = DAOFactory.getFactory().getCadastralMunicipalityDAO();
			String nameStartsWith = request.getParameter("name_startsWith");
			String sqlQuery = null;
			
			String lang = getLocale().getLanguage().toLowerCase();
			
			if("en".equals(lang)){
				sqlQuery = "select cm.* from tgis_cadastral_municipality as cm where lower(cm.name_en) like '" + nameStartsWith.toLowerCase() + "%'" ;
			}else if("sr".equals(lang)){
				sqlQuery = "select cm.* from tgis_cadastral_municipality as cm where lower(cm.name_sr) like '" + nameStartsWith.toLowerCase() + "%'" ;
			}else{
				sqlQuery = "select cm.* from tgis_cadastral_municipality as cm where lower(cm.name) like '" + nameStartsWith.toLowerCase() + "%'" ;
			}

			List<CadastralMunicipality> list = dao.executeSQLQuery(sqlQuery);
			JSONArray jsonArray = new JSONArray();
			for (CadastralMunicipality o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("name", o.getName());
				if("en".equals(lang)){
					jsonObject.element("name", o.getNameEn());
				}else if("sr".equals(lang)){
					jsonObject.element("name", o.getNameSr());						
				}else{
					jsonObject.element("name", o.getName());
				}				
				jsonArray.add(jsonObject);
			}
			
			
			String str = jsonArray.toString();
			out.append(str);
			System.out.println(str);
			out.flush();
		}catch (Exception e){
			log.error("InputAction.municipality", e);
			throw new BusinessException("InputAction.municipality", e);
		} finally {
			out.close();
		}		
	}	
}
