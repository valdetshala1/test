/**
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created Apr 21, 2014 3:44:20 PM
 * @Version 1.0
 *
 */
package com.geoland.kfis.web.action.ajax;

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
import com.geoland.kfis.model.Person;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.PersonDAO;
import com.geoland.kfis.web.action.base.grid.GridBaseAction;

// TODO: Auto-generated Javadoc
/**
 * The Class GridAction.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created April 21, 2014 3:44:20 PM
 * @Version 1.0
 */
public class GridAction extends GridBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	
	/**
	 * grid persons method.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void persons() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();

		String filter = null;
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			String role = request.getParameter("role");
			if(StringUtils.isNotEmpty(role)){
				PersonDAO dao = DAOFactory.getFactory().getPersonDAO();
	    		
				String countQuery = "select count(*) from tperson as p left join tnatpers as n on p.id=n.id left join tperson_role as pr on p.id = pr.person_id where pr.role_code = '" + role + "'";
				if(StringUtils.isNotEmpty(filter)){
					countQuery += " " + filter;
				}
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				String sqlQuery = "select p.*,n.* from tperson as p left join tnatpers as n on p.id=n.id left join tperson_role as pr on p.id = pr.person_id where pr.role_code = '" + role + "'";
				List<Person> list = dao.executeSQLQuery(sqlQuery);
				
				JSONArray jsonArray = new JSONArray();
				JSONObject header = new JSONObject();
				header.element("TotalRows", count);
	
				jsonArray.add(header);
				JSONArray data = new JSONArray();
				for (Person o : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", o.getId());
					jsonObject.element("firstName", o.getFirstName());
					jsonObject.element("lastName", o.getLastName());
					jsonObject.element("birthdate", DATE_FORMAT.format(o.getBirthdate()));
					jsonObject.element("gender", o.getGender());
					jsonObject.element("personalId", o.getPersonalId());
					data.add(jsonObject);
				}
				JSONObject rows = new JSONObject();
				rows.element("Rows", data);
				jsonArray.add(rows);
				String str = jsonArray.toString();
				out.append(str);
				out.flush();
			}else{
				setEmtpyContent(out);
				out.flush();
			}
		
		}catch (Exception e){
			log.error("GridAction.wineRequestStatuses", e);
			throw new BusinessException("GridAction.wineRequestStatuses", e);
		} finally {
			out.close();
		}		
	}	
}
