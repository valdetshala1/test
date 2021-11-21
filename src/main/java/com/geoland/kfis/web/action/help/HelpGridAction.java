/**
 * 
 */
package com.geoland.kfis.web.action.help;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.geoland.framework.exception.BusinessException;
import com.geoland.framework.persistence.dao.DAOFactoryRbac;
import com.geoland.framework.persistence.model.rbac.RbacUseRole;
import com.geoland.kfis.web.action.base.grid.GridBaseAction;

// TODO: Auto-generated Javadoc
/**
 * The Class HelpGridAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 4:32:36 PM, Mar 26, 2015
 */
public class HelpGridAction extends GridBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1158452796022167516L;

	/**
	 * grid help method.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void help() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();

		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
				String lang = getLocale().getLanguage();
				String sqlQuery = "select * from trbac_role r left join trbac_user_role rb on r.id=rb.role_id left join tuser u on u.id=rb.user_id  where rb.user_id="+getUser().getUser().getId();
				sqlQuery+=" LIMIT " + limit + " offset " + start;
//				List<RbacUseRole> list =new ArrayList<RbacUseRole>( getUser().getUser().getRbacUseRoles());// Failed to load lazily
				List<RbacUseRole> list =DAOFactoryRbac.getFactory().getRbacUserRoleDAO().executeSQLQuery(sqlQuery);
				
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
	
				JSONArray rows = new JSONArray();
				for (RbacUseRole o : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", o.getId());
					jsonObject.element("role", "al".equals(lang)?o.getRbacRole().getName():"en".equals(lang)?o.getRbacRole().getNameEn():o.getRbacRole().getNameSr());
					jsonObject.element("code", o.getRbacRole().getCode());
					jsonObject.element("html", o.getRbacRole().getCode()+"/index.html");
					jsonObject.element("pdf", o.getRbacRole().getCode()+"/"+o.getRbacRole().getCode()+".pdf");

					rows.add(jsonObject);
				}
				data.element("rows", rows);

				out.append(data.toString());
				out.flush();
		
		}catch (Exception e){
			log.error("HelpGridAction.help", e);
			throw new BusinessException("HelpGridAction.help", e);
		} finally {
			out.close();
		}		
	}	
}
