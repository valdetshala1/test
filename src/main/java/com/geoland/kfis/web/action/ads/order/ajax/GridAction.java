package com.geoland.kfis.web.action.ads.order.ajax;

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
import com.geoland.kfis.model.PurchaseOrder;
import com.geoland.kfis.model.PurchaseOrderItem;
import com.geoland.kfis.model.PurchaseOrderStatus;
import com.geoland.kfis.model.Requisition;
import com.geoland.kfis.model.RequisitionItem;
import com.geoland.kfis.model.RequisitionStatus;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.dao.services.PurchaseOrderDAO;
import com.geoland.kfis.persistence.dao.services.PurchaseOrderItemDAO;
import com.geoland.kfis.persistence.dao.services.PurchaseOrderStatusDAO;
import com.geoland.kfis.persistence.dao.services.RequisitionDAO;
import com.geoland.kfis.persistence.dao.services.RequisitionItemDAO;
import com.geoland.kfis.persistence.dao.services.RequisitionStatusDAO;
import com.geoland.kfis.web.action.base.grid.GridBaseAction;

// TODO: Auto-generated Javadoc
/**
 * The Class GridAction.
 *
 * @author GEO&LAND
 * @created February 11, 2015 10:22:36 PM
 * @Version 1.0
 */
public class GridAction extends GridBaseAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 752229284091022916L;
	
	
	/**
	 * Requisition.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void requisition() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		try {
			
			RequisitionDAO dao = DAOFactory.getFactory().getRequisitionDAO();
			String countQuery = "select count(*) from trequisition dp left join tbpartner b on dp.bpartner_id=b.id";
			Integer count = dao.countQuery(countQuery);
			calcPages(count);

			String sqlQuery = "select distinct dp.*,b.* from trequisition as dp left join trequisition_status as s on dp.id = s.requisition_id left join tbpartner b on dp.bpartner_id=b.id";
			
			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
				String ob_field = getSidx();
				if(ob_field.equals("bpartner"))
					ob_field="b.name";
				else if(ob_field.equals("status"))
					ob_field="dp.status_id";
				else if(ob_field.equals("documentno"))
					ob_field="dp.document_id";
				else if(ob_field.equals("organisation_name"))
					ob_field="dp.organisation_id";
				sqlQuery += " order by " + ob_field + " " + getSord();
			}else{
				sqlQuery += " order by dp.updated asc, s.status_code asc";
			}
			sqlQuery += " LIMIT " + limit + " offset " + start;
			List<Requisition> list = dao.executeSQLQuery(sqlQuery);

			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());

			JSONArray rows = new JSONArray();
			for (Requisition a : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", a.getId());
				jsonObject.element("isactive", "Y".equals(a.getIsactive())?true:false);
				jsonObject.element("requisition_nr", a.getRequisitionNr());
				jsonObject.element("status_code", a.getRequisitionStatus().getStatusCode());
				jsonObject.element("status", a.getRequisitionStatus().getStatusCode());
				jsonObject.element("status_id", a.getRequisitionStatus().getId());
				jsonObject.element("document_id", a.getDpMngmt().getId());
				jsonObject.element("documentno", a.getDpMngmt().getDocumentno());
				
				jsonObject.element("organisation_id", a.getOrganisation()!=null?a.getOrganisation().getId():"");
				jsonObject.element("organisation_name", a.getOrganisation()!=null?a.getOrganisation().getOrgaName():"");
				
				jsonObject.element("requester_name", a.getRequesterName());
				jsonObject.element("requester_phone", a.getRequesterPhone());
				jsonObject.element("destination_type", a.getDestinationType());
				
				jsonObject.element("is_bpartner", "Y".equals(a.getIsBpartner())?true:false);
				jsonObject.element("bpartner_id", a.getBpartner()!=null?a.getBpartner().getId():"");
				jsonObject.element("bpartner", a.getBpartner()!=null?a.getBpartner().getName():"");
				
				jsonObject.element("supplier_name", a.getSupplierName());
				jsonObject.element("supplier_contact", a.getSupplierContact());
				jsonObject.element("supplier_phone", a.getSupplierPhone());
				jsonObject.element("supplier_address", a.getSupplierAddress());
				jsonObject.element("supplier_fax", a.getSupplierFax());
				jsonObject.element("supplier_email", a.getSupplierEmail());
				jsonObject.element("supplier_site", a.getSupplierSite());
				
				jsonObject.element("total_amount", a.getTotalAmount());
				jsonObject.element("currency_id", a.getCurrency().getId());
				jsonObject.element("currency_symbol", a.getCurrency().getCursymbol()+" - "+a.getCurrency().getDescription());
				jsonObject.element("desired_date", fdate(a.getDesiredDate()));
				jsonObject.element("is_po", a.getIsPo());
				jsonObject.element("textmsg", a.getTextmsg());
				
				jsonObject.element("created", fdate(a.getCreated()));
				jsonObject.element("createdby", getPersonData(a.getPersonByCreatedby()));
				jsonObject.element("updated", fdate(a.getUpdated()));
				
				rows.add(jsonObject);
			}

			data.element("rows", rows);
			out.append(data.toString());
			out.flush();

		} catch (Exception e) {
			log.error("com.geoland.kfis.web.action.ads.order.ajax.requisition", e);
			throw new BusinessException("com.geoland.kfis.web.action.ads.order.ajax.requisition", e);
		} finally {
			out.close();
		}
	}	
	
	/**
	 * Requisition status.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void requisitionStatus() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		try {
			String rqId = request.getParameter("requisition_id");
			if(StringUtils.isNotEmpty(rqId)){
				RequisitionStatusDAO dao = DAOFactory.getFactory().getRequisitionStatusDAO();
				String countQuery = "select count(dp.*) from trequisition_status as dp where dp.requisition_id=" + rqId;
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
	
				String sqlQuery = "select dp.* from trequisition_status as dp where dp.requisition_id=" + rqId;
				
				if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
					String ob_field = getSidx();
					sqlQuery += " order by " + ob_field + " " + getSord();
				}else{
					sqlQuery += " order by dp.updated asc, s.status_code asc";
				}
				sqlQuery += " LIMIT " + limit + " offset " + start;
				List<RequisitionStatus> list = dao.executeSQLQuery(sqlQuery);
	
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
		    		          
				JSONArray rows = new JSONArray();
				for (RequisitionStatus a : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", a.getId());
					jsonObject.element("status_code", a.getStatusCode());
					jsonObject.element("requisition_id", a.getRequisition().getId());
					jsonObject.element("textmsg", a.getTextmsg());
					jsonObject.element("created", fdate(a.getCreated()));
					jsonObject.element("createdby", getPersonData(a.getPersonByCreatedby()));
					jsonObject.element("updated", fdate(a.getUpdated()));
					jsonObject.element("updatedby", getPersonData(a.getPersonByUpdatedby()));
					
					rows.add(jsonObject);
				}
	
				data.element("rows", rows);
				out.append(data.toString());
				out.flush();
			}else{
				setEmtpyContent(out);
				out.flush();
			}

		} catch (Exception e) {
			log.error("com.geoland.kfis.web.action.ads.order.ajax.requisitionStatus", e);
			throw new BusinessException("com.geoland.kfis.web.action.ads.order.ajax.requisitionStatus", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Requisition item.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void requisitionItem() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		try {
			String rqId = request.getParameter("requisition_id");
			if(StringUtils.isNotEmpty(rqId)){
				RequisitionItemDAO dao = DAOFactory.getFactory().getRequisitionItemDAO();
				String countQuery = "select count(dp.*) from trequisition_item as dp where dp.requisition_id=" + rqId;
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
	
				String sqlQuery = "select dp.* from trequisition_item as dp left join tuom as u on dp.uom_id=u.id where dp.requisition_id=" + rqId;
				
				if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
					String ob_field = getSidx();
					if("uom".equals(ob_field)){
						sqlQuery += " order by u.name " + getSord();
					}else{
						sqlQuery += " order by " + ob_field + " " + getSord();
					}
				}else{
					sqlQuery += " order by dp.updated asc, s.item_name asc";
				}
				sqlQuery += " LIMIT " + limit + " offset " + start;
				List<RequisitionItem> list = dao.executeSQLQuery(sqlQuery);
	
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
		    		          
				JSONArray rows = new JSONArray();
				for (RequisitionItem a : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", a.getId());
					jsonObject.element("isactive", "Y".equals(a.getIsactive())?true:false);
					jsonObject.element("status_code", a.getStatusCode());
					jsonObject.element("status", a.getStatusCode());
					jsonObject.element("requisition_id", a.getRequisition().getId());
					jsonObject.element("item_name", a.getItemName());
					jsonObject.element("item_number", a.getItemNumber());
					jsonObject.element("itemNumber", a.getItemNumber());//don't delete
					jsonObject.element("quantity", a.getQuantity());
					jsonObject.element("unit_of_issue_code", a.getUnitOfIssueCode());
					
					jsonObject.element("unit_price", a.getUnitPrice());
					jsonObject.element("unit_price_amount", a.getUnitPriceAmount());
					jsonObject.element("uom_id", a.getUom().getId());
					jsonObject.element("uom", a.getUom().getUomsymbol());
					
					jsonObject.element("item_desc", a.getItemDesc());
					jsonObject.element("need_by_date", fdate(a.getNeedByDate()));
					jsonObject.element("received_date", fdate(a.getReceivedDate()));
					jsonObject.element("accept_date", fdate(a.getAcceptDate()));
					
					jsonObject.element("created", fdate(a.getCreated()));
					jsonObject.element("createdby", getPersonData(a.getPersonByCreatedby()));
					jsonObject.element("updated", fdate(a.getUpdated()));
					jsonObject.element("updatedby", getPersonData(a.getPersonByUpdatedby()));
					
					jsonObject.element("textmsg", a.getTextmsg());
					
					rows.add(jsonObject);
				}
	
				data.element("rows", rows);
				out.append(data.toString());
				out.flush();
			}else{
				setEmtpyContent(out);
				out.flush();
			}

		} catch (Exception e) {
			log.error("com.geoland.kfis.web.action.ads.order.ajax.requisitionItem", e);
			throw new BusinessException("com.geoland.kfis.web.action.ads.order.ajax.requisitionItem", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Order.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void order() throws IOException, BusinessException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		try {
			
			PurchaseOrderDAO dao = DAOFactory.getFactory().getPurchaseOrderDAO();
			String countQuery = "select distinct count(*) from tpurchase_order o left join tbpartner b on o.bpartner_id=b.id";
			Integer count = dao.countQuery(countQuery);
			calcPages(count);

			String sqlQuery = "select distinct o.*,b.* from tpurchase_order o left join tbpartner b on o.bpartner_id=b.id";
			
			if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
				String ob_field = getSidx();
				if(ob_field.equals("bpartner")){
					ob_field="b.name";
				}else if(ob_field.equals("created")){
					ob_field="o.created";
				}else if(ob_field.equals("createdby")){
					ob_field="o.createdby";
				}else if(ob_field.equals("updated")){
					ob_field="o.updated";
				}else if(ob_field.equals("updatedby")){
					ob_field="o.updatedby";
				}
				sqlQuery += " order by " + ob_field + " " + getSord();
			}else{
				sqlQuery += " order by o.updated asc";
			}
			sqlQuery += " LIMIT " + limit + " offset " + start;
			List<PurchaseOrder> list = dao.executeSQLQuery(sqlQuery);

			JSONObject data = new JSONObject();
			data.element("page", getPage());
			data.element("total", getTotal_pages());
			data.element("records", getRows());

			JSONArray rows = new JSONArray();
			for (PurchaseOrder a : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.element("id", a.getId());
				jsonObject.element("isactive", "Y".equals(a.getIsactive())?true:false);
				jsonObject.element("requisition_id", a.getRequisition()!=null?a.getRequisition().getRequisitionNr():"");
				jsonObject.element("status_code", a.getPurchaseOrderStatus()!=null?a.getPurchaseOrderStatus().getStatusCode():"");
				jsonObject.element("status", a.getPurchaseOrderStatus()!=null?a.getPurchaseOrderStatus().getStatusCode():"");
				jsonObject.element("status_id", a.getPurchaseOrderStatus().getId());
				jsonObject.element("document_id", a.getDpMngmt()!=null?a.getDpMngmt().getId():"");
				jsonObject.element("document", a.getDpMngmt()!=null?a.getDpMngmt().getDocumentno():"");
				jsonObject.element("po_number", a.getPoNumber());
				jsonObject.element("order_date", a.getOrderDate()!=null?fdate(a.getOrderDate()):"");
				jsonObject.element("order_completation", a.getOrderCompletation()!=null?fdate(a.getOrderCompletation()):"");
				
				jsonObject.element("is_bpartner", "Y".equals(a.getIsBpartner())?true:false);
				jsonObject.element("bpartner_id", a.getBpartner()!=null?a.getBpartner().getId():"");
				jsonObject.element("bpartner", a.getBpartner()!=null?a.getBpartner().getName():"");
				
				jsonObject.element("supplier_name", a.getSupplierName());
				jsonObject.element("supplier_contact", a.getSupplierContact());
				jsonObject.element("supplier_phone", a.getSupplierPhone());
				jsonObject.element("supplier_address", a.getSupplierAddress());
				jsonObject.element("supplier_fax", a.getSupplierFax());
				jsonObject.element("supplier_email", a.getSupplierEmail());
				jsonObject.element("supplier_site", a.getSupplierSite());
				
				jsonObject.element("taxamount", a.getTaxamount());
				jsonObject.element("freight", a.getFreight());
				jsonObject.element("totallines", a.getTotallines());
				jsonObject.element("grandtotal", a.getGrandtotal());
				
//				jsonObject.element("currency_id", a.getCurrency().getId());
//				jsonObject.element("currency_symbol", a.getCurrency().getCursymbol());
//				
//				jsonObject.element("payment_terms_code", a.getPaymentTermsCode());
//				jsonObject.element("payment_terms_name", a.getPaymentTermsName());
//				jsonObject.element("acquisition_type_code", a.getAcquisitionTypeCode());
//				
//				jsonObject.element("dept_contact_name", a.getDeptContactName());
//				jsonObject.element("dept_contact_phone", a.getDeptContactPhone());
//				jsonObject.element("dept_contact_email", a.getDeptContactEmail());
//				
//				jsonObject.element("equipment_approver_name", a.getEquipmentApproverName());
//				jsonObject.element("equipment_printed", a.getEquipmentPrinted());
//				jsonObject.element("equipment_print_date", a.getEquipmentPrintDate()!=null?fdate(a.getEquipmentPrintDate()):"");
//				
//				jsonObject.element("change_orders_count", a.getChangeOrdersCount());
//				jsonObject.element("change_orders_date", a.getChangeOrdersDate()!=null?fdate(a.getChangeOrdersDate()):"");
//				
//				jsonObject.element("order_original_amount", a.getOrderOriginalAmount());
//				jsonObject.element("order_initial_amount", a.getOrderInitialAmount());
//				
//				jsonObject.element("dateordered", a.getDateordered()!=null?fdate(a.getDateordered()):"");
//				jsonObject.element("datepromised", a.getDatepromised()!=null?fdate(a.getDatepromised()):"");
//				jsonObject.element("dateprinted", a.getDateprinted()!=null?fdate(a.getDateprinted()):"");
//				
//				jsonObject.element("isdelivered", a.getIsdelivered());
//				jsonObject.element("isinvoiced", a.getIsinvoiced());
//				jsonObject.element("isprinted", a.getIsprinted());
//				jsonObject.element("isselected", a.getIsselected());
//				jsonObject.element("isselfservice", a.getIsselfservice());
//				jsonObject.element("sendemail", a.getSendemail());
//				
//				jsonObject.element("bill_location_id", a.getBillLocationId());
//				jsonObject.element("bill_user_id", a.getBillUserId());
//				jsonObject.element("pay_bpartner_id", a.getPayBpartnerId());
//				jsonObject.element("pay_location_id", a.getPayLocationId());
//				
//				jsonObject.element("amounttendered", a.getAmounttendered());
//				jsonObject.element("amountrefunded", a.getAmountrefunded());
//				jsonObject.element("promotioncode", a.getPromotioncode());
//				jsonObject.element("paymentrule", a.getPaymentrule());
//				jsonObject.element("invoicerule", a.getInvoicerule());
//				jsonObject.element("deliveryrule", a.getDeliveryrule());
//				jsonObject.element("deliveryviarule", a.getDeliveryviarule());
//				jsonObject.element("totallines", a.getTotallines());
//				jsonObject.element("grandtotal", a.getGrandtotal());
//				
//				jsonObject.element("deliverynotes", a.getDeliverynotes());
//				jsonObject.element("asset_id", a.getAssetId());
//				jsonObject.element("quotation_id", a.getQuotationId());
				
				jsonObject.element("textmsg", a.getTextmsg());
				jsonObject.element("created", fdate(a.getCreated()));
				jsonObject.element("createdby", getPersonData(a.getPersonByCreatedby()));
				jsonObject.element("updated", fdate(a.getUpdated()));
				jsonObject.element("updatedby", getPersonData(a.getPersonByUpdatedby()));
				rows.add(jsonObject);
			}

			data.element("rows", rows);
			out.append(data.toString());
			out.flush();

		} catch (Exception e) {
			log.error("com.geoland.kfis.web.action.ads.order.ajax.order", e);
			throw new BusinessException("com.geoland.kfis.web.action.ads.order.ajax.order", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Order status.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void orderStatus() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		try {
			String orderId = request.getParameter("order_id");
			if(StringUtils.isNotEmpty(orderId)){
				PurchaseOrderStatusDAO dao = DAOFactory.getFactory().getPurchaseOrderStatusDAO();
				String countQuery = "select count(os.*) from tpurchase_order_status as os where os.order_id=" + orderId;
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
	
				String sqlQuery = "select os.* from tpurchase_order_status as os where os.order_id=" + orderId;
				
				if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
					String ob_field = getSidx();
					sqlQuery += " order by " + ob_field + " " + getSord();
				}else{
					sqlQuery += " order by os.updated asc";
				}
				sqlQuery += " LIMIT " + limit + " offset " + start;
				List<PurchaseOrderStatus> list = dao.executeSQLQuery(sqlQuery);
	
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
		    		          
				JSONArray rows = new JSONArray();
				for (PurchaseOrderStatus a : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", a.getId());
					jsonObject.element("status_code", a.getStatusCode());
					jsonObject.element("order_id", a.getPurchaseOrder().getId());
					jsonObject.element("textmsg", a.getTextmsg());
					jsonObject.element("created", fdate(a.getCreated()));
					jsonObject.element("createdby", getPersonData(a.getPersonByCreatedby()));
					jsonObject.element("updated", fdate(a.getUpdated()));
					jsonObject.element("updatedby", getPersonData(a.getPersonByUpdatedby()));
					
					rows.add(jsonObject);
				}
	
				data.element("rows", rows);
				out.append(data.toString());
				out.flush();
			}else{
				setEmtpyContent(out);
				out.flush();
			}

		} catch (Exception e) {
			log.error("com.geoland.kfis.web.action.ads.order.ajax.orderStatus", e);
			throw new BusinessException("com.geoland.kfis.web.action.ads.order.ajax.orderStatus", e);
		} finally {
			out.close();
		}
	}
	
	/**
	 * Order item.
	 *
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws BusinessException the business exception
	 */
	public void orderItem() throws IOException, BusinessException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		try {
			String orderId = request.getParameter("order_id");
			if(StringUtils.isNotEmpty(orderId)){
				PurchaseOrderItemDAO dao = DAOFactory.getFactory().getPurchaseOrderItemDAO();
				String countQuery = "select count(i.*) from tpurchase_order_item as i where i.order_id=" + orderId;
				Integer count = dao.countQuery(countQuery);
				calcPages(count);
	
				String sqlQuery = "select distinct i.*,b.* from tpurchase_order_item as i left join tbpartner b on i.bpartner_id=b.id where i.order_id=" + orderId;
				
				if(StringUtils.isNotEmpty(getSidx()) && StringUtils.isNotEmpty(getSord())){
					String ob_field = getSidx();
					if(ob_field.equals("bpartner")){
						ob_field="b.name";
					}else if(ob_field.equals("itemNumber")){
						ob_field="i.item_number";
					}else if(ob_field.equals("tax")){
						ob_field="i.tax_id";
					}else if(ob_field.equals("currency")){
						ob_field="i.currency_id";
					}else if(ob_field.equals("created")){
						ob_field="i.created";
					}else if(ob_field.equals("createdby")){
						ob_field="i.createdby";
					}else if(ob_field.equals("updated")){
						ob_field="i.updated";
					}else if(ob_field.equals("updatedby")){
						ob_field="i.updatedby";
					}else if(ob_field.equals("uom")){
						ob_field="i.uom_id";
					}
					sqlQuery += " order by " + ob_field + " " + getSord();
				}else{
					sqlQuery += " order by i.updated asc, i.item_name asc";
				}
				sqlQuery += " LIMIT " + limit + " offset " + start;
				List<PurchaseOrderItem> list = dao.executeSQLQuery(sqlQuery);
	
				JSONObject data = new JSONObject();
				data.element("page", getPage());
				data.element("total", getTotal_pages());
				data.element("records", getRows());
		    		          
				JSONArray rows = new JSONArray();
				for (PurchaseOrderItem a : list) {
					JSONObject jsonObject = new JSONObject();
					jsonObject.element("id", a.getId());
					jsonObject.element("isactive", "Y".equals(a.getIsactive())?true:false);
					jsonObject.element("status_code", a.getStatusCode());
					jsonObject.element("status", a.getStatusCode());
					jsonObject.element("order_id", a.getPurchaseOrder().getId());

					jsonObject.element("bpartner_id", a.getBpartner()!=null?a.getBpartner().getId():"");
					jsonObject.element("bpartner", a.getBpartner()!=null?a.getBpartner().getName():"");
					jsonObject.element("bpartner_location_id", a.getBpartnerLocation()!=null?a.getBpartnerLocation().getId():"");
					jsonObject.element("bpartner_location", a.getBpartnerLocation()!=null?a.getBpartnerLocation().getName():"");
					jsonObject.element("item_name", a.getItemName());
					jsonObject.element("item_number", a.getItemNumber());
					jsonObject.element("itemNumber", a.getItemNumber());//don't delete
					jsonObject.element("item_desc", a.getItemDesc());
					jsonObject.element("unit_price", a.getUnitPrice());
					jsonObject.element("uom", a.getUom()!=null?a.getUom().getName()+" ("+a.getUom().getDescription()+")":"");
					jsonObject.element("uom_id", a.getUom()!=null?a.getUom().getId():"");
					jsonObject.element("tax", a.getTax()!=null?a.getTax().getName():"");
					jsonObject.element("tax_id", a.getTax()!=null?a.getTax().getId():"");
					
					jsonObject.element("currency", a.getCurrency()!=null?a.getCurrency().getDescription()+" ("+a.getCurrency().getCursymbol()+")":"");
					jsonObject.element("currency_id", a.getCurrency()!=null?a.getCurrency().getId():"");
					
					jsonObject.element("dateordered", fdate(a.getDateordered()));
					jsonObject.element("datepromised", fdate(a.getDatepromised()));
					jsonObject.element("datedelivered", fdate(a.getDatedelivered()));
					jsonObject.element("dateinvoiced", fdate(a.getDateinvoiced()));
					jsonObject.element("description", a.getDescription());
					
					jsonObject.element("qtyordered", a.getQtyordered());
					jsonObject.element("qtyreserved", a.getQtyreserved());
					jsonObject.element("qtydelivered", a.getQtydelivered());
					jsonObject.element("qtyrejected", a.getQtyrejected());
					jsonObject.element("qtystocked", a.getQtystocked());
					jsonObject.element("qtyinvoiced", a.getQtyinvoiced());
					
					jsonObject.element("shipper", a.getShipper());
					jsonObject.element("pricelist", a.getPricelist());
					jsonObject.element("priceactual", a.getPriceactual());
					jsonObject.element("pricelimit", a.getPricelimit());
					jsonObject.element("linenetamt", a.getLinenetamt());
					jsonObject.element("discount", a.getDiscount());
					jsonObject.element("freightamt", a.getFreightamt());
					jsonObject.element("gross_unit_price", a.getGrossUnitPrice());
					jsonObject.element("line_gross_amount", a.getLineGrossAmount());
					jsonObject.element("line_total", a.getLineTotal());
					jsonObject.element("grosspricelist", a.getGrosspricelist());
					
					jsonObject.element("created", fdate(a.getCreated()));
					jsonObject.element("createdby", getPersonData(a.getPersonByCreatedby()));
					jsonObject.element("updated", fdate(a.getUpdated()));
					jsonObject.element("updatedby", getPersonData(a.getPersonByUpdatedby()));
					
					
					rows.add(jsonObject);
				}
	
				data.element("rows", rows);
				out.append(data.toString());
				out.flush();
			}else{
				setEmtpyContent(out);
				out.flush();
			}

		} catch (Exception e) {
			log.error("com.geoland.kfis.web.action.ads.order.ajax.orderItem", e);
			throw new BusinessException("com.geoland.kfis.web.action.ads.order.ajax.orderItem", e);
		} finally {
			out.close();
		}
	}
}