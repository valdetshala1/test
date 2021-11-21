/**
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created Apr 22, 2014 10:31:42 AM
 * @Version 1.0
 *
 */
package com.geoland.kfis.web.action.adm.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.apache.struts2.ServletActionContext;

import com.geoland.framework.exception.BusinessException;
import com.geoland.framework.persistence.dao.DAOFactoryRbac;
import com.geoland.framework.persistence.dao.services.RbacObjectDAO;
import com.geoland.framework.persistence.dao.services.RbacOperationDAO;
import com.geoland.framework.persistence.dao.services.RbacPermissionDAO;
import com.geoland.framework.persistence.dao.services.RbacRoleDAO;
import com.geoland.framework.persistence.dao.services.UserDAO;
import com.geoland.framework.persistence.model.User;
import com.geoland.framework.persistence.model.rbac.RbacObject;
import com.geoland.framework.persistence.model.rbac.RbacOperation;
import com.geoland.framework.persistence.model.rbac.RbacPermission;
import com.geoland.framework.persistence.model.rbac.RbacRole;
import com.geoland.framework.persistence.model.rbac.RbacUseRole;
import com.geoland.framework.security.rbac.tree.Node;
import com.geoland.framework.security.rbac.tree.RbacObjectTree;
import com.geoland.kfis.logic.tree.FinancialTypeNode;
import com.geoland.kfis.logic.tree.FinancialTypeTree;
import com.geoland.kfis.logic.tree.OrganisationNode;
import com.geoland.kfis.logic.tree.OrganisationTree;
import com.geoland.kfis.model.FinancialType;
import com.geoland.kfis.model.Organisation;
import com.geoland.kfis.model.PartyRole;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.FinancialTypeDAO;
import com.geoland.kfis.persistence.dao.services.OrganisationDAO;
import com.geoland.kfis.persistence.dao.services.PersonDAO;
import com.geoland.kfis.web.action.base.grid.GridBaseAction;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

// TODO: Auto-generated Javadoc
/**
 * The Class AdmGridAction.
 *
 * @author GEO&LAND
 * @created April 22, 2014 10:31:42 AM
 * @Version 1.0
 */
public class AdmGridAction extends GridBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/**
	 * persons JSON.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void persons() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			PersonDAO dao=DAOFactory.getFactory().getPersonDAO();
			String countQuery = "select count(*) from tperson p left join tparty as y on p.id = y.id where y.party_type = 'P'";
			
			String sqlQuery = "select p.*, y.*, 1 as clazz_ from tperson as p left join tparty as y on p.id = y.id where y.party_type = 'P'";
			/*
			String first_name=request.getParameter("first_name");
			String last_name=request.getParameter("last_name");
			if(StringUtils.isNotEmpty(first_name)){
				sqlQuery+=" AND p.first_name ilike '"+first_name+"%' ";
				countQuery+=" AND p.first_name ilike '%"+first_name+"%' ";
			}
			if(StringUtils.isNotEmpty(last_name)){
				sqlQuery+=" AND p.last_name ilike '"+last_name+"%' ";
				countQuery+=" AND p.last_name ilike '%"+last_name+"%' ";
			}
			*/
			
			String condition = getCondition();
			if(StringUtils.isNotEmpty(condition)){
				sqlQuery+= " where " + condition;
				countQuery+= " where " + condition;
			}
			
			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
				sqlQuery += " order by " + getSidx() + " " + getSord();
			}
			
			sqlQuery += " LIMIT " + limit + " offset " + start;
			
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			List<Person> list = dao.executeSQLQuery(sqlQuery);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for (Person o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("first_name", o.getFirstName());
				jsonObject.element("last_name", o.getLastName());
				jsonObject.element("birthdate", DATE_FORMAT.format(o.getBirthdate()));
				jsonObject.element("gender", o.getGender());
				jsonObject.element("party_type", o.getPartyType());
				jsonObject.element("degree", o.getDegree());
				jsonObject.element("notes", o.getNotes());
				jsonObject.element("active", o.getActive());
				String roles="";
				for(PartyRole pr:o.getPartyRoles()){
					if(getLocale().equals("al"))
					roles+=pr.getRoleCode().getDOMTEXT()+",";
					else if(getLocale().equals("en"))
						roles+=pr.getRoleCode().getDOMTEXT_EN()+",";
					else roles+=pr.getRoleCode().getDOMTEXT_SR()+",";
				}
				jsonObject.element("party_role", roles);
				jsonObject.element("personal_id", o.getPersonalId());
				if(o.getParty()!=null)
				jsonObject.element("party_id", o.getParty().getId());
				
				rows.add(jsonObject);
			}
			
			data.element("rows", rows);

			out.append(data.toString());
			out.flush();			
			
		}catch (Exception e){
			log.error("AdmGridAction.persons", e);
			throw new BusinessException("AdmGridAction.persons", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * user JSON.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void user() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			UserDAO dao = DAOFactoryRbac.getFactory().getUserDAO();
			String lang = getLocale().getLanguage();
			String countQuery = "select count(*) from tuser as u";
			String sqlQuery = "select u.* from tuser as u ";
			
			String condition = getCondition();
			if(StringUtils.isNotEmpty(condition)){
				sqlQuery+= " where " + condition;
				countQuery+= " where " + condition;
			}
			
			/*
			if(filterParams!=null) {
				Iterator it=filterParams.entrySet().iterator();
				  while (it.hasNext()) {
					  Map.Entry pair = (Map.Entry)it.next();
					  if(pair.getKey().toString().equalsIgnoreCase("username")) {
						  username=pair.getValue().toString();
					  }
				  }
			}
			
			if(StringUtils.isNotEmpty(username)){
				sqlQuery+=" where u.username ilike '"+username+"%' ";
				countQuery+=" where u.username ilike '"+username+"%' ";
			}
			*/
			
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			sqlQuery += " LIMIT " + limit + " offset " + start;
			
			List<User> list=dao.executeSQLQuery(sqlQuery);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());		
			data.element("total", getTotal_pages());			
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for (User user : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", user.getId());
				List<RbacUseRole> userRoles=new ArrayList<>(user.getRbacUseRoles()); 
				StringBuffer role=new StringBuffer();
				for(Iterator<RbacUseRole> iterator = userRoles.iterator(); iterator.hasNext();){
					RbacRole r = iterator.next().getRbacRole();
					role.append("al".equals(lang)?r.getName():"en".equals(lang)?r.getNameEn():r.getNameSr());
					if(iterator.hasNext()){
						role.append(", ");
					}
				}
				jsonObject.element("role", role.toString());
				jsonObject.element("username", user.getUsername());
				//jsonObject.element("password", user.getUserPassword().getPassword());
				jsonObject.element("birthdate", DATE_FORMAT.format(user.getBirthdate()));
				jsonObject.element("gender", user.getGender());
				jsonObject.element("personal_id", user.getPersonalId());
				jsonObject.element("email", user.getEmail());
				jsonObject.element("phone", user.getPhone());
				jsonObject.element("mobile", user.getMobile());
				jsonObject.element("created", fdate(user.getCreatedDate()));
				jsonObject.element("active", user.isActive());
				
				rows.add(jsonObject);
			}
			
			data.element("rows", rows);

			out.append(data.toString());
			out.flush();			
			
		}catch (Exception e){
			log.error("AdmGridAction.user", e);
			throw new BusinessException("AdmGridAction.user", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * organisation JSON.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void organisation() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			OrganisationDAO dao=DAOFactory.getFactory().getOrganisationDAO();
			String countQuery = "select count(*) from torganisation";
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			String sqlQuery = "select o.*, p.* from torganisation as o left join tparty as p on o.id = p.id";
			
			sqlQuery += " LIMIT " + limit + " offset " + start;
			List<Organisation> list = dao.executeSQLQuery(sqlQuery);
			
			List<Organisation> parent = dao.executeSQLQuery("select o.*,p.* from torganisation as o left join tparty as p on o.parent_id = p.id");
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());			
			
			JSONArray rows = new JSONArray();
			for (Organisation o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("orgaName", o.getOrgaName());
				if(o.getParty()!=null){
					for(Organisation p:parent){
						if(o.getParty().getId()==p.getId())
						jsonObject.element("party",p.getOrgaName());
					}
				}
				jsonObject.element("orgaType", o.getOrgaType());
				jsonObject.element("operationLevel", o.getOperLevelVal());
				jsonObject.element("orgaCategory", o.getOrgaCategory());
				jsonObject.element("code", o.getCode());
				if(o.getStartDate()!=null){
					jsonObject.element("startDate", DATE_FORMAT.format(o.getStartDate()));
				}else{
					jsonObject.element("startDate", "");
				}
				if(o.getEndDate()!=null){
					jsonObject.element("endDate", DATE_FORMAT.format(o.getEndDate()));
				}else{
					jsonObject.element("endDate","");
				}
				
				rows.add(jsonObject);
			}
			
			data.element("rows", rows);

			out.append(data.toString());
			out.flush();			
			
		}catch (Exception e){
			log.error("AdmGridAction.organisation", e);
			throw new BusinessException("AdmGridAction.organisation", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Organisation tree.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void organisationTree() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
//			print(request);
//			System.out.println("Filters: " + getFilters());
			String condtion = getCondition();
//			System.out.println("Condition: " + condtion);
			
			
			OrganisationDAO dao = DAOFactory.getFactory().getOrganisationDAO();
			
			/*
			String countQuery ="select count(o.*) from torganisation as o left join tparty as p on o.id = p.id";
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			*/
			
			String query = "select distinct o.*, p.*  from torganisation as o left join tparty as p on o.id = p.id order by o.id";
			if(StringUtils.isNotEmpty(condtion)){
				condtion = condtion.replaceAll("orga_name", "o.orga_name");
				query += " where " + condtion;
			}
			List<Organisation> list = dao.executeSQLQuery(query);
			
			Integer count = list.size();
			calcPages(count);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", count);
			
			OrganisationTree tree = new OrganisationTree();
			List<Organisation> parentList = dao.executeSQLQuery("select distinct o.*, p.*  from torganisation as o left join tparty as p on o.id = p.id where o.parent_id is null");
			OrganisationNode pnode = new OrganisationNode();
			pnode.setData(parentList.get(0));
			tree.setRootElement(pnode);
			
			
			for (Organisation org : list) {
				if(org.getParty() != null){
					OrganisationNode node = new OrganisationNode();
					node.setData(org);
					Node<Organisation> parent = tree.findParent(tree.getRootElement(), org.getParty().getId());
					if(parent == null) {
						loadOrgaParents(dao, tree, node, org.getParty().getId());
					}else{
					parent.addChild(node);
					node.setParent(parent);
					}
				}
				
			}	
			
			data.element("rows", tree.getJSONArray());
			out.append(data.toString());
//			System.out.println(tree.getJSONArray().toString());
//			System.out.println(tree.print());
			out.flush();			
			
		}catch (Exception e){
			log.error("AdmGridAction.organisationTree", e);
			throw new BusinessException("AdmGridAction.organisationTree", e);
		} finally {
			out.close();
		}
	}	
	
	
	
	/**
	 * Load orga parents.
	 *
	 * @param dao the dao
	 * @param tree the tree
	 * @param node the node
	 * @param parentId the parent id
	 */
	private void loadOrgaParents(OrganisationDAO dao, OrganisationTree tree, OrganisationNode node, Long parentId){
		List<Organisation> orgaList = dao.executeSQLQuery("select o.*, p.*  from torganisation as o left join tparty as p on o.id = p.id where o.id = " + parentId);
		Organisation organisation = orgaList.get(0);
		
		OrganisationNode parent = new OrganisationNode();
		parent.setData(organisation);		
		parent.addChild(node);
		node.setParent(parent);
		
		if(organisation.getParty() != null && organisation.getParty().getId()!=null){
			Node<Organisation> nextParent = tree.findParent(tree.getRootElement(), organisation.getParty().getId());
			if(nextParent==null){
				loadOrgaParents(dao, tree, parent, organisation.getParty().getId());
			}else{
				nextParent.addChild(node);
				node.setParent(nextParent);		
			}
		}
	}
	
	
	/**
	 * Economic Code Tree.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void financialTypeTree() throws IOException, BusinessException {
		
//		String lang = getLocale().getLanguage();
//		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			FinancialTypeDAO dao = DAOFactory.getFactory().getFinancialTypeDAO();

			String query = "SELECT * FROM tfin_type_tree";
//			List<Object[]> view = dao.getEonomicCodeTreeView(query);
			List<FinancialType> list = dao.executeSQLQuery(query);
			Integer count = list.size();
			calcPages(count);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", count);
			
			
			
			FinancialTypeTree tree = new FinancialTypeTree();
			for (FinancialType ec : list) {
				FinancialTypeNode node = new FinancialTypeNode(getLocale());
				node.setData(ec);
				
				if(ec.getParent() != null){
//					System.out.println("Node: " + ec.getCode() + ", Parent: " + ec.getParent().getCode());
					Node<FinancialType> parent = tree.findParent(tree.getRootElement(), ec.getParent().getId());
					parent.addChild(node);
					node.setParent(parent);
				}else {
//					System.out.println("Node: " + ec.getCode() + ", Parent: " + ec.getParent());
					tree.setRootElement(node);
				}
			}			
			
			data.element("rows", tree.getJSONArray());
			out.append(data.toString());
			
//			System.out.println(tree.getJSONArray().toString());
//			System.out.println(tree.print());
			
			out.flush();			
			
		}catch (Exception e){
			log.error("AdmGridAction.financialTypeTree", e);
			throw new BusinessException("AdmGridAction.financialTypeTree", e);
		} finally {
			out.close();
		}
	}	
	
	
	/**
	 * Rbac roles.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void rbacRoles() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			RbacRoleDAO rbaroleDAO = DAOFactoryRbac.getFactory().getRbacRoleDAO();
			String countQuery ="select count(r.*) from trbac_role as r";
			Integer count = rbaroleDAO.countQuery(countQuery);
			calcPages(count);
			
			String sqlQuery = "select r.* from trbac_role as r";
			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
				sqlQuery += " order by " + getSidx() + " " + getSord();
			}
			sqlQuery += " LIMIT " + limit + " offset " + start;

			List<RbacRole> rbacRoleList = rbaroleDAO.executeSQLQuery(sqlQuery);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for(RbacRole role:rbacRoleList){
				JSONObject jo = new JSONObject();
				jo.element("id", role.getId());
				jo.element("name", role.getName());
				jo.element("name_en", role.getNameEn());
				jo.element("name_sr", role.getNameSr());
				jo.element("code", role.getCode());
				rows.add(jo);
			}
			
			data.element("rows", rows);
			out.append(data.toString());
			out.flush();			
			
		}catch (Exception e){
			log.error("AdmGridAction.rbacRoles", e);
			throw new BusinessException("AdmGridAction.rbacRoles", e);
		} finally {
			out.close();
		}
	}	

	/**
	 * TREEROLE JSON.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void treerole() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			RbacRoleDAO rbaroleDAO = DAOFactoryRbac.getFactory().getRbacRoleDAO();
			String roleQuery="select * from trbac_role ";
			String countQuery="select count(*) from trbac_role";
			Integer count = rbaroleDAO.countQuery(countQuery);
			calcPages(count);
			
			List<RbacRole> rbacRoleList = rbaroleDAO.executeSQLQuery(roleQuery);
			JSONObject data = new JSONObject();
			
			data.element("page", getPage());		
			data.element("total", getTotal_pages());	
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			int orderrowId=1;
			int roleParent=0;
			for(RbacRole role:rbacRoleList){
				JSONObject jo = new JSONObject();
				Set<RbacPermission> permission = role.getRbacPermissions();
				
				roleParent=orderrowId;
				jo.element("id", orderrowId);
				jo.element("rbac_id", role.getId());
				jo.element("name", role.getName());
				jo.element("code", role.getCode());
				jo.element("type", "rbacrole");
				jo.element("detail", "");
				jo.element("parent", "");
				jo.element("level", "0");
				
				if(permission.size()<=0){
					jo.element("isLeaf", true);
				}
				else {
					jo.element("isLeaf", false);
				}
				rows.add(jo);	
				orderrowId++;
				
				
				for(RbacPermission per: permission){
					JSONObject jp =new JSONObject();
					jp.element("id", orderrowId);
					jo.element("rbac_id", per.getId());
					jp.element("detail", "");
					jp.element("parent", roleParent);
					jp.element("level", "1");
					jp.element("isLeaf", true);
					rows.add(jp);	
					orderrowId++;
				}
						
				
				
				}
			data.element("rows", rows);
			out.append(data.toString());
			out.flush();			
			
		}catch (Exception e){
			log.error("AdmGridAction.treerole", e);
			throw new BusinessException("AdmGridAction.treerole", e);
		} finally {
			out.close();
		}
	}
	

	/**
	 * Rbac domains.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void rbacDomains() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			RbacObjectDAO dao = DAOFactoryRbac.getFactory().getRbacObjectDAO();
			
			String countQuery = "select count(*) from trbac_domain";
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			String sqlQuery = "select u.* from trbac_domain as u order by u.name";
			sqlQuery += " LIMIT " + limit + " offset " + start;
			List<RbacObject> list = dao.executeSQLQuery(sqlQuery);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for (RbacObject o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("name", o.getName());
				jsonObject.element("parent_id", o.getParentId());
				
				rows.add(jsonObject);
			}
			
			data.element("rows", rows);

			out.append(data.toString());
			out.flush();			
			
		}catch (Exception e){
			log.error("AdmGridAction.rbacDomains", e);
			throw new BusinessException("AdmGridAction.rbacDomains", e);
		} finally {
			out.close();
		}		
	}
	
	
	/**
	 * Rbac permission.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void rbacPermission() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			RbacPermissionDAO dao = DAOFactoryRbac.getFactory().getRbacPermissionDAO();
			
			String countQuery = "select count(*) from trbac_permission";
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			String sqlQuery = "select u.* from trbac_permission as u order by u.id";
			sqlQuery += " LIMIT " + limit + " offset " + start;
			List<RbacPermission> list = dao.executeSQLQuery(sqlQuery);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for (RbacPermission o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("name", o.getRbacRole().getName());
				jsonObject.element("code", o.getRbacRole().getCode());
//				
				rows.add(jsonObject);
			}
			
			data.element("rows", rows);

			out.append(data.toString());
			out.flush();			
			
		}catch (Exception e){
			log.error("AdmGridAction.rbacPermission", e);
			throw new BusinessException("AdmGridAction.rbacPermission", e);
		} finally {
			out.close();
		}		
	}

	/**
	 * Rbac object.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void rbacObject() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			List<RbacObject> list = null;
			RbacObjectDAO dao=DAOFactoryRbac.getFactory().getRbacObjectDAO();
			String permissionId = request.getParameter("permissionId");	
			if(permissionId!=null){
				String countQuery = "select count(o.*) from trbac_object as o left join trbac_permission_object as po on o.id=po.object_id and po.permission_id="+permissionId;
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				String sqlQuery = "select o.* from trbac_object as o left join trbac_permission_object as po on o.id=po.object_id and po.permission_id=" +permissionId+ " order by o.name asc=";
				sqlQuery += " LIMIT " + limit + " offset " + start;
				list = dao.executeSQLQuery(sqlQuery);
			}else {
				String countQuery = "select count(*) from trbac_object";
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
				String sqlQuery = "select obj.* from trbac_object as obj order by obj.name";
				sqlQuery += " LIMIT " + limit + " offset " + start;
				list = dao.executeSQLQuery(sqlQuery);
			}
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for (RbacObject o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("name", o.getName());
				jsonObject.element("code", o.getCode());
				jsonObject.element("locked", o.getLocked());
				jsonObject.element("parent", o.getParentId());
				
				rows.add(jsonObject);
			}
			
			data.element("rows", rows);

			out.append(data.toString());
			out.flush();			
			
		}catch (Exception e){
			log.error("AdmGridAction.rbacObject", e);
			throw new BusinessException("AdmGridAction.rbacObject", e);
		} finally {
			out.close();
		}		
	}

	/**
	 * Rbac object xml tree.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void rbacObjectXmlTree() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");

		StringBuilder headxml = new StringBuilder();
		StringBuilder bufxml = new StringBuilder();
		PrintWriter out = response.getWriter();
		try{

			
			RbacObjectDAO dao=DAOFactoryRbac.getFactory().getRbacObjectDAO();
			
			String countQuery = "select count(*) from trbac_object";
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			headxml.append("<?xml version='1.0' encoding='utf-8'?>\n");
			headxml.append("<rows>");
			headxml.append("<page>" + getPage() + "</page>");
			headxml.append("<total>" + getTotal_pages()+ "</total>");
			headxml.append("<records>" + getRows() + "</records>");
			
			List<Object[]> view = dao.getView(null, "select * from rbac_object_view");

			/*
			bufxml.append("<?xml version='1.0' encoding='utf-8'?>\n");
			bufxml.append("<rows>");
			bufxml.append("<page>" + getPage() + "</page>");
			bufxml.append("<total>" + getTotal_pages() + "</total>");
			bufxml.append("<records>" + getRows() + "</records>");
			*/
			
			for (Object object[] : view) {
				Long id = (Long) object[0];
				Long parent_id = (Long) object[1];
				String object_name = (String) object[2];
				String code = (String) object[3];
				String path = (String) object[4];
				Long depth = (Long) object[5];
				depth = depth -1;

				bufxml.append("<row id=\"" + id + "\">");
				bufxml.append("<id>" + id + "</id>");
				bufxml.append("<name>" + object_name + "</name>");
				bufxml.append("<code>" + code + "</code>");
				bufxml.append("<locked>false</locked>");
				
				
				bufxml.append("<level>" + depth + "</level>"); /*node level 0*/
				if(parent_id==1){
					bufxml.append("<parent>NULL</parent>");/*parent row id*/
				}else{
					bufxml.append("<parent>" + parent_id + "</parent>");/*parent row id*/	
				}
				boolean hasChildren = hasChildren(view, Long.toString(id));
				if(hasChildren){
					bufxml.append("<isLeaf>false</isLeaf>"); /*is this a leaf?*/
				}else{
					bufxml.append("<isLeaf>true</isLeaf>"); /*is this a leaf?*/						
				}					
				bufxml.append("<expanded>true</expanded>"); /*expand?*/
				bufxml.append("<loaded>true</loaded>"); /* is loaded */
				

				bufxml.append("</row>");

				
			}
			

			headxml.append(bufxml);
			headxml.append("</rows>");
			out.append(headxml.toString());
			
		}catch (Exception e){
			log.error("AdmGridAction.rbacObjectXmlTree", e);
			throw new BusinessException("AdmGridAction.rbacObjectXmlTree", e);
		} finally {
			out.close();
		}		
	}
	
	
	/**
	 * Rbac object xml tree 2.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void rbacObjectXmlTree2() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");

		StringBuilder headxml = new StringBuilder();
		StringBuilder bufxml = new StringBuilder();
		PrintWriter out = response.getWriter();
		try{

			
			RbacObjectDAO dao=DAOFactoryRbac.getFactory().getRbacObjectDAO();
			
			String countQuery = "select count(*) from trbac_object";
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			headxml.append("<?xml version='1.0' encoding='utf-8'?>\n");
			headxml.append("<rows>");
			headxml.append("<page>" + getPage() + "</page>");
			headxml.append("<total>" + getTotal_pages()+ "</total>");
			headxml.append("<records>" + getRows() + "</records>");
			

			RbacObjectTree tree = DAOFactoryRbac.getFactory().getRbacObjectDAO().getTree(new Long(1));
			List<Node<RbacObject>> list = tree.toList();
			for (Node<RbacObject> node : list) {

				bufxml.append("<row id=\"" + node.getData().getId() + "\">");
				bufxml.append("<id>" + node.getData().getId() + "</id>");
				bufxml.append("<name>" + node.getData().getName() + "</name>");
				bufxml.append("<code>" + node.getData().getCode() + "</code>");
				bufxml.append("<locked>" + node.getData().getLocked() + "</locked>");
				
				bufxml.append("<level>" + node.getLevel() + "</level>"); /*node level 0*/
				if(node.getParent()==null){
					bufxml.append("<parent>NULL</parent>");/*parent row id*/
				}else{
					bufxml.append("<parent>" + node.getData().getParentId() + "</parent>");/*parent row id*/	
				}
				bufxml.append("<isLeaf>" + node.isLeaf() + "</isLeaf>"); /*is this a leaf?*/
				bufxml.append("<expanded>true</expanded>"); /*expand?*/
				bufxml.append("<loaded>true</loaded>"); /* is loaded */
				

				bufxml.append("</row>");
			}
			
			headxml.append(bufxml);
			headxml.append("</rows>");
			out.append(headxml.toString());
			
		}catch (Exception e){
			log.error("AdmGridAction.rbacObjectXmlTree2", e);
			throw new BusinessException("AdmGridAction.rbacObjectXmlTree2", e);
		} finally {
			out.close();
		}		
	}	

	/**
	 * Rbac object tree.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void rbacObjectTree() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			RbacObjectDAO dao=DAOFactoryRbac.getFactory().getRbacObjectDAO();
			
			String countQuery = "select count(*) from trbac_object";
			Integer count = dao.countQuery(countQuery);
			calcPages(count);

			List<Object[]> view = dao.getView(null, "select * from rbac_object_view");

			
			//String sqlQuery = "select obj.* from trbac_object as obj order by obj.name";
			//List<RbacObject> list = dao.executeSQLQuery(sqlQuery);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			
			// ********************************************************************************************            
			// when selecting rows, you need to specify some or all of the following reserved fields            
			// tree_level - the level of the row in the tree hierarchy. 0 is for root row.            
			// tree_leaf - if the row is leaf (no child rows). This will make it non-expandable and will have an alternative icon            
			// tree_expanded - if the row is expanded by default or not            
			// tree_parent - the primary key (ID) of the parent row (only applicable for child rows)            
			// tree_loaded - true/false - if the tree nodes are already loaded. Can be used to show several levels expanded by default.    

			// { id:"1", name:"Cash",  num:"100", debit:"400.00",credit:"250.00", balance:"150.00", enbl:"1", level:"0", parent:"",  isLeaf:false, expanded:false },
            // { id:"2", name:"Cash 1", num:"1",   debit:"300.00",credit:"200.00", balance:"100.00", enbl:"0", level:"1", parent:"1", isLeaf:false, expanded:false },			
			// ********************************************************************************************

			for (Object object[] : view) {
				Long id = (Long) object[0];
				Long parent_id = (Long) object[1];
				String object_name = (String) object[2];
				String code = (String) object[3];
				String path = (String) object[4];
				Long depth = (Long) object[5];
				depth = depth -1;
				
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", id);
				jsonObject.element("name", object_name);
				jsonObject.element("code", code);
				jsonObject.element("locked", false);
				
				jsonObject.element("level", depth);
				
				if(parent_id==1){
					jsonObject.element("parent", "");
				}else{
					jsonObject.element("parent", parent_id);
				}
				
				boolean hasChildren = hasChildren(view, Long.toString(id));
				if(hasChildren){
					jsonObject.element("isLeaf", false);
				}else{
					jsonObject.element("isLeaf", true);
				}
				jsonObject.element("expanded", false);
				jsonObject.element("loaded", true);
				
				//level:"0", parent:"", isLeaf:false, expanded:true, loaded:true
				rows.add(jsonObject);				
				
			}
			
			data.element("rows", rows);

			out.append(data.toString());
			out.flush();			
			
		}catch (Exception e){
			log.error("AdmGridAction.rbacObject", e);
			throw new BusinessException("AdmGridAction.rbacObject", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * Rbac object tree 2.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void rbacObjectTree2() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			RbacObjectDAO dao = DAOFactoryRbac.getFactory().getRbacObjectDAO();
			
			String countQuery = "select count(*) from trbac_object";
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
		
			RbacObjectTree tree = DAOFactoryRbac.getFactory().getRbacObjectDAO().getTree(new Long(1));
			List<Node<RbacObject>> list = tree.toList();
			for (Node<RbacObject> node : list) {

				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", "\"" + node.getData().getId() + "\"");
				jsonObject.element("name", node.getData().getName());
				jsonObject.element("code", node.getData().getCode());
				jsonObject.element("locked", node.getData().getLocked());
				jsonObject.element("level", node.getLevel());
				if(node.getData().getParentId()!=null){
					jsonObject.element("parent", "\"" + node.getData().getParentId() + "\"");
				}else{
					jsonObject.element("parent", "");
				}
				jsonObject.element("isLeaf", node.isLeaf());
				jsonObject.element("expanded", true);
				jsonObject.element("loaded", true);
				
				rows.add(jsonObject);
			}			
			
			data.element("rows", rows);

			out.append(data.toString());
			out.flush();			
			
		}catch (Exception e){
			log.error("AdmGridAction.rbacObjectTree2", e);
			throw new BusinessException("AdmGridAction.rbacObjectTree2", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * Rbac permission tree.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void rbacPermissionTree() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		List<RbacPermission> permissions = null;

		try{
			RbacObjectDAO dao = DAOFactoryRbac.getFactory().getRbacObjectDAO();
			
			String parameter = request.getParameter("roleId");
			if(StringUtils.isNotEmpty(parameter) && NumberUtils.isNumber(parameter)){
				String query = "select * from trbac_permission where role_id = " + parameter;
				permissions = DAOFactoryRbac.getFactory().getRbacPermissionDAO().executeSQLQuery(query);
			}
			
			String countQuery = "select count(*) from trbac_object";
			Integer count = dao.countQuery(countQuery);
			calcPages(count);
			
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", count);
			//data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
		
			RbacObjectTree tree = DAOFactoryRbac.getFactory().getRbacObjectDAO().getTree(new Long(1));
			List<Node<RbacObject>> list = tree.toList();
			
			for (Node<RbacObject> node : list) {

				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", "\"" + node.getData().getId() + "\"");
				jsonObject.element("name", node.getData().getName());

				jsonObject.element("code", node.getData().getCode());
				jsonObject.element("locked", false);
				
				//'read', 'create', 'update', 'delete', 'execute', 'print'
				if(permissions != null && permissions.size() > 0){
					if(hasPermission(permissions, "_read", node.getData().getId())){
						jsonObject.element("read", true);
					}else{
						jsonObject.element("read", false);
					}
					
					if(hasPermission(permissions, "_create", node.getData().getId())){
						jsonObject.element("create", true);
					}else{
						jsonObject.element("create", false);
					}
					
					if(hasPermission(permissions, "_update", node.getData().getId())){
						jsonObject.element("update", true);
					}else{
						jsonObject.element("update", false);
					}
					
					if(hasPermission(permissions, "_delete", node.getData().getId())){
						jsonObject.element("delete", true);
					}else{
						jsonObject.element("delete", false);
					}
					
					if(hasPermission(permissions, "_execute", node.getData().getId())){
						jsonObject.element("execute", true);
					}else{
						jsonObject.element("execute", false);
					}		
					
					if(hasPermission(permissions, "_print", node.getData().getId())){
						jsonObject.element("print", true);
					}else{
						jsonObject.element("print", false);
					}
				}
				
				jsonObject.element("level", node.getLevel());
				if(node.getData().getParentId()!=null){
					jsonObject.element("parent", "\"" + node.getData().getParentId() + "\"");
				}else{
					jsonObject.element("parent", "");
				}
				jsonObject.element("isLeaf", node.isLeaf());
				jsonObject.element("expanded", true);
				jsonObject.element("loaded", true);
				
				rows.add(jsonObject);
			}			
			
			data.element("rows", rows);

//			System.out.println(data.toString());
			out.append(data.toString());
			out.flush();			
			
		}catch (Exception e){
			log.error("AdmGridAction.rbacPermissionTree", e);
			throw new BusinessException("AdmGridAction.rbacPermissionTree", e);
		} finally {
			out.close();
		}		
	}
	
	/**
	 * Checks for permission.
	 *
	 * @param permissions the permissions
	 * @param oper the oper
	 * @param objectId the object id
	 * @return true, if successful
	 */
	protected boolean hasPermission(List<RbacPermission> permissions, String oper, Long objectId){
		for (RbacPermission p : permissions) {
			if(p.getRbacOperation().getName().equals(oper) && p.getRbacObject().getId() == objectId){
				return true;
			}
		}
		return false;
	}
	
	/**
	 * Checks for children.
	 *
	 * @param view the view
	 * @param id the id
	 * @return true, if successful
	 */
	protected boolean hasChildren(List<Object[]> view, String id){
		for (Object object[] : view) {
			String path = (String) object[4];
			int ind1 = path.indexOf("{");
			int ind2 = path.indexOf("}");
			String substring = path.substring(ind1+1, ind2);
			String[] split = substring.split(",");
			for(int i=0; i<split.length;i++){
				if(id.equals(split[i])){
					return true;
				}
			}
		}
		return false;
	}
	
	/**
	 * Gets the all object for permission.
	 *
	 * @param objectPermission the object permission
	 * @return the all object for permission
	 */
	public String getAllObjectForPermission(List<RbacObject> objectPermission){
		String sqlviewQuery ="select * from rbac_object_view  as ow where ow.id in(";
		for(int i=0;i<objectPermission.size();i++){
			if(i<objectPermission.size()-1){
				sqlviewQuery=sqlviewQuery+objectPermission.get(i).getId()+",";
			}else{
				sqlviewQuery=sqlviewQuery+objectPermission.get(i).getId()+")";
			}
		}
		return sqlviewQuery;
	}
	

	
	/**
	 * Rbac operation.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void rbacOperation() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			
			String permissionId = request.getParameter("permissionId");
			RbacOperationDAO dao=DAOFactoryRbac.getFactory().getRbacOperationDAO();
			String countQuery;
			String sqlQuery ;
			Integer count;
			if(permissionId!=null){
				countQuery = "select count(o.*) from trbac_operation as o , trbac_permission_operation as po where o.id=po.operation_id and po.permission_id="+permissionId;
				count = dao.countQuery(countQuery);
				sqlQuery = "select o.* from trbac_operation as o , trbac_permission_operation as po where o.id=po.operation_id and po.permission_id="+permissionId;
			}else {
				 countQuery = "select count(*) from trbac_operation";
				 count = dao.countQuery(countQuery);
				 sqlQuery = "select o.* from trbac_operation as o order by o.name";
				
			}
			
			calcPages(count);
			sqlQuery += " LIMIT " + limit + " offset " + start;
			List<RbacOperation> list = dao.executeSQLQuery(sqlQuery);
			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());
			
			JSONArray rows = new JSONArray();
			for (RbacOperation o : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", o.getId());
				jsonObject.element("name", o.getName());
				rows.add(jsonObject);
			}
			
			data.element("rows", rows);

			out.append(data.toString());
			out.flush();			
			
		}catch (Exception e){
			log.error("AdmGridAction.rbacOperation", e);
			throw new BusinessException("AdmGridAction.rbacOperation", e);
		} finally {
			out.close();
		}		
	}

	
}
