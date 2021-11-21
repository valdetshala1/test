package com.geoland.kfis.web.action.ads.asset.ajax;

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
import com.geoland.kfis.model.Assets;
import com.geoland.kfis.model.AssetsDevaluation;
import com.geoland.kfis.model.AssetsStaffAssign;
import com.geoland.kfis.model.VehicleServiceMaintenance;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.AssetsDAO;
import com.geoland.kfis.persistence.dao.services.AssetsDevaluationDAO;
import com.geoland.kfis.persistence.dao.services.AssetsStaffAssignDAO;
import com.geoland.kfis.persistence.dao.services.VehicleServiceMaintenanceDAO;
import com.geoland.kfis.web.action.base.grid.GridBaseAction;

// TODO: Auto-generated Javadoc
/**
 * The Class AssetsGridAction.
 *
 * @author Festim Krasniqi,GEO&LAND
 * @created May 21, 2014 3:54:16 PM
 * @Version 1.0
 */
public class AssetsGridAction extends GridBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -6359911559113949406L;

	/**
	 * GIRD JSON - assets method.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void assets() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			AssetsDAO dao = DAOFactory.getFactory().getAssetsDAO();
			String countQuery = "select count(*) from tassets";
			String language = getLocale().getLanguage();
			Integer count = dao.countQuery(countQuery);
			calcPages(count);

			String sqlQuery = "select distinct a.*,o.* from tassets as a left join torganisation o on a.department_id=o.id";
			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
				String order=getSidx();
				if(order.equals("organisation")){
					order=("en".equals(language)?"o.orga_name_en":"sr".equals(language)?"o.orga_name_sr":"o.orga_name");
				}
				sqlQuery += " order by " + order + " " + getSord();
			}
			sqlQuery += " LIMIT " + limit + " offset " + start;
			List<Assets> list = dao.executeSQLQuery(sqlQuery);

			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());

			JSONArray rows = new JSONArray();
			for (Assets a : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", a.getId());
				jsonObject.element("barcode", a.getBarcode());
				jsonObject.element("name", a.getName());
				jsonObject.element("organisation", getOganisationData(a.getOrganisation(), language));
				jsonObject.element("location", a.getLocation());
				jsonObject.element("date_of_purchase", DATE_FORMAT.format(a.getDateOfPurchase()));
				jsonObject.element("quantity", a.getQuantity());
				jsonObject.element("purchase_value", a.getPurchaseValue());
				jsonObject.element("purchase_total",a.getPurchaseTotal());
				jsonObject.element("amortization_grade", a.getAmortizationGrade());
				jsonObject.element("net_after_deval_year", a.getNetAfterDevalYear());
				jsonObject.element("serial_no", a.getSerialNo());
				jsonObject.element("in_function", a.isInFunction());
				jsonObject.element("comments", a.getComments());
				if(a.getDamaged()!=null)
					jsonObject.element("damaged", a.getDamaged());
				else jsonObject.element("damaged", "");
				jsonObject.element("employee", a.getEmployee().getFirstName()+" "+ a.getEmployee().getLastName());

				rows.add(jsonObject);
			}

			data.element("rows", rows);
			out.append(data.toString());
			out.flush();

		} catch (Exception e) {
			log.error("AssetsGridAction.assets", e);
			throw new BusinessException("AssetsGridAction.assets", e);
		} finally {
			out.close();
		}

	}

	/**
	 * GIRD JSON - assetsStaffAssign method.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void assetsStaffAssign() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String assetId = request.getParameter("assetId");
			if (StringUtils.isNotEmpty(assetId)) {
				AssetsStaffAssignDAO dao = DAOFactory.getFactory().getAssetsStaffAssignDAO();
				String countQuery = "select count(*) from tassets_staff_assign as asa where asa.assets_id="
						+ assetId;
				Integer count = dao.countQuery(countQuery);
				calcPages(count);

				String sqlQuery = "select distinct asa.*,a.*,e.* from tassets_staff_assign as asa left join tassets a on a.id=asa.assets_id " +
						"left join tperson e on e.id=asa.employee_id where asa.assets_id="
						+ assetId;
				if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
					String order = getSidx();
					if(order.equals("assets"))
						order="a.barcode";
					else if(order.equals("employee_id"))
						order="e.first_name";
					sqlQuery += " order by " + order + " " + getSord();
				}
				sqlQuery += " LIMIT " + limit + " offset " + start;
				List<AssetsStaffAssign> list = dao.executeSQLQuery(sqlQuery);

				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());

				JSONArray rows = new JSONArray();
				for (AssetsStaffAssign asa : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", asa.getId());
					jsonObject.element("assets", asa.getAssets().getBarcode());
					jsonObject.element("employee_id", asa.getEmployeeByEmployeeId().getFirstName()+" "+asa.getEmployeeByEmployeeId().getLastName());
					jsonObject.element("date_of_autorization", DATE_FORMAT.format(asa.getDateOfAutorization()));
					jsonObject.element("created_by", asa.getEmployeeByCreatedBy().getFirstName()+" "+asa.getEmployeeByCreatedBy().getLastName());
					jsonObject.element("created_time", DATE_FORMAT.format(asa.getCreatedTime()));

					rows.add(jsonObject);
				}

				data.element("rows", rows);
				out.append(data.toString());
				out.flush();

			} else {
				JSONArray jsonArray = new JSONArray();
				JSONObject header = new JSONObject();
				header.element("TotalRows", 0);
				String str = jsonArray.toString();
				out.append(str);
				out.flush();
			}
		} catch (Exception e) {
			log.error("AssetsGridAction.assetsStaffAssign", e);
			throw new BusinessException("AssetsGridAction.assetsStaffAssign",
					e);
		} finally {
			out.close();
		}

	}

	/**
	 * GIRD JSON - logVehiclesServiceMaintenance method.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void logVehiclesServiceMaintenance() throws IOException,
			BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String vehicleId = request.getParameter("logVehiclesId");
			if (StringUtils.isNotEmpty(vehicleId)) {
				VehicleServiceMaintenanceDAO dao = DAOFactory.getFactory()
						.getVehicleServiceMaintenanceDAO();
				String countQuery = "select count(*) from tlog_vehicles_service_maintenance as l where l.vehicles_id="
						+ vehicleId;
				Integer count = dao.countQuery(countQuery);
				calcPages(count);

				String sqlQuery = "select l.* from tlog_vehicles_service_maintenance as l where l.vehicles_id="
						+ vehicleId;
				sqlQuery += " LIMIT " + limit + " offset " + start;
				List<VehicleServiceMaintenance> list = dao
						.executeSQLQuery(sqlQuery);

				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());

				JSONArray rows = new JSONArray();
				for (VehicleServiceMaintenance lvsm : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", lvsm.getId());
					jsonObject.element("vehicles", lvsm.getVehicle()
							.getPlateNumber());
					jsonObject.element("expenditureType",
							lvsm.getExpenditureType());
					jsonObject.element("value", lvsm.getValue());
					jsonObject.element("dateService",
							DATE_FORMAT.format(lvsm.getDateService()));
					jsonObject.element("dateValid",
							DATE_FORMAT.format(lvsm.getDateValid()));
					jsonObject.element("createdBy", lvsm.getEmployee()
							.getFirstName()
							+ " "
							+ lvsm.getEmployee().getLastName());
					jsonObject.element("createdTime",
							DATE_FORMAT.format(lvsm.getCreatedTime()));

					rows.add(jsonObject);
				}

				data.element("rows", rows);
				out.append(data.toString());
				out.flush();

			} else {
				JSONArray jsonArray = new JSONArray();
				JSONObject header = new JSONObject();
				header.element("TotalRows", 0);
				String str = jsonArray.toString();
				out.append(str);
				out.flush();
			}
		} catch (Exception e) {
			log.error("AssetsGridAction.logVehiclesServiceMaintenance", e);
			throw new BusinessException(
					"AssetsGridAction.logVehiclesServiceMaintenance", e);
		} finally {
			out.close();
		}

	}
	
	/**
	 * GRID JSON - devaluation method.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void devaluation() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest req=ServletActionContext.getRequest();
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String asset_id=req.getParameter("asset_id");
			AssetsDevaluationDAO dao = DAOFactory.getFactory().getAssetsDevaluationDAO();
			String countQuery = "select count(*) from tassets_devaluation d where d.asset_id="+asset_id;
			Integer count = dao.countQuery(countQuery);
			calcPages(count);

			String sqlQuery = "select * from tassets_devaluation d where d.asset_id="+asset_id;
			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
				sqlQuery += " order by " + getSidx() + " " + getSord();
			}
			sqlQuery += " LIMIT " + limit + " offset " + start;
			List<AssetsDevaluation> list = dao.executeSQLQuery(sqlQuery);

			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());

			JSONArray rows = new JSONArray();
			for (AssetsDevaluation a : list) {
				JSONObject jo = new JSONObject();
				jo.element("idDev", a.getId());
				jo.element("asset_id", a.getAssets().getId());
				jo.element("year_of_deval", a.getYearOfDeval());
				jo.element("net_after_deval_year", a.getNetAfterDevalYear());
				jo.element("created_by", a.getEmployee().getFirstName()+" "+ a.getEmployee().getLastName());
				jo.element("created_date", DATE_FORMAT.format(a.getCreatedDate()));
				
				rows.add(jo);
			}

			data.element("rows", rows);
			out.append(data.toString());
			out.flush();

		} catch (Exception e) {
			log.error("AssetsGridAction.devaluation", e);
			throw new BusinessException("AssetsGridAction.devaluation", e);
		} finally {
			out.close();
		}

	}
}
