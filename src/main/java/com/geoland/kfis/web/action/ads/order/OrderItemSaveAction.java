/**
 * 
 */
package com.geoland.kfis.web.action.ads.order;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.LongType;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.model.Bpartner;
import com.geoland.kfis.model.BpartnerLocation;
import com.geoland.kfis.model.Currency;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.model.PurchaseOrder;
import com.geoland.kfis.model.PurchaseOrderItem;
import com.geoland.kfis.model.Tax;
import com.geoland.kfis.model.Uom;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class OrderItemSaveAction.
 *
 * @author Festim Krasniqi, GEO&LAND
 * @version 1.0
 * @created 3:41:09 PM, Feb 26, 2015
 */
public class OrderItemSaveAction extends OrderBaseAction {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -6761894914078953680L;
	
	/** The json data. */
	private String jsonData;
	
	/** The items. */
	private List<PurchaseOrderItem> items = new ArrayList<PurchaseOrderItem>();
	
	/** The item. */
	private PurchaseOrderItem item;
	
	/** The po item array. */
	private String poItemArray;
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#validate()
	 */
	@Override
	public void validate() {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		item = new PurchaseOrderItem();
		
		if(request.getParameter("order_id")!=null && StringUtils.isNotEmpty(request.getParameter("order_id").toString())){
			Long reqId = Long.valueOf(request.getParameter("order_id").toString());
			PurchaseOrder poFake=DAOFactory.getFactory().getPurchaseOrderDAO().get(reqId);
			poFake.setId(reqId);
			item.setPurchaseOrder(poFake);
		}else{
			addFieldError("Order", getMessage("order.item.order.id.empty"));
		}
		
		if(request.getParameter("id")!=null && StringUtils.isNotEmpty(request.getParameter("id").toString())){
			item.setId(Long.valueOf(request.getParameter("id").toString()));
		}
		
		if(request.getParameter("status_code")!=null && StringUtils.isNotEmpty(request.getParameter("status_code").toString().trim())){
			String status = request.getParameter("status_code").toString().trim();
			item.setStatusCode(status.substring(0,2).toUpperCase());
		}else{
//			addFieldError("Status code", getMessage("requisition.status.code.empty"));
		}
		
		if(request.getParameter("bpartner_id")!=null && StringUtils.isNotEmpty(request.getParameter("bpartner_id").toString().trim())){
			Bpartner bp = new Bpartner();
			bp.setId(new Long(request.getParameter("bpartner_id").toString()));
			item.setBpartner(bp);
		}
		
		if(request.getParameter("bpartner_location_id")!=null && StringUtils.isNotEmpty(request.getParameter("bpartner_location_id").toString().trim())){
			BpartnerLocation bpl = new BpartnerLocation();
			bpl.setId(new Long(request.getParameter("bpartner_location_id").toString().trim()));
			item.setBpartnerLocation(bpl);
		}
		
		if(request.getParameter("item_name")!=null && StringUtils.isNotEmpty(request.getParameter("item_name").toString().trim()))
			item.setItemName(request.getParameter("item_name").toString());
		else addFieldError("Item name", getMessage("order.item.name.empty"));
		
		if(request.getParameter("item_number")!=null && StringUtils.isNotEmpty(request.getParameter("item_number").toString().trim()))
			item.setItemNumber(request.getParameter("item_number").toString());
		
		if(request.getParameter("item_desc")!=null && StringUtils.isNotEmpty(request.getParameter("item_desc").toString().trim()))
			item.setItemDesc(request.getParameter("item_desc").toString());
		
		if(request.getParameter("unit_price")!=null && StringUtils.isNotEmpty(request.getParameter("unit_price").toString().trim()))
			item.setUnitPrice(new BigDecimal(request.getParameter("unit_price").toString().trim()));
		else addFieldError("Unit price", getMessage("order.item.unit.price.empty"));
		
		if(request.getParameter("uom_id")!=null && StringUtils.isNotEmpty(request.getParameter("uom_id").toString().trim())){
			Uom u = new Uom();
			u.setId(new Long(request.getParameter("uom_id").toString().trim()));
			item.setUom(u);
		}else addFieldError("UOM", getMessage("order.item.uom.empty"));
		
		if(request.getParameter("tax_id")!=null && StringUtils.isNotEmpty(request.getParameter("tax_id").toString().trim())){
			Tax t = new Tax();
			t.setId(new Long(request.getParameter("tax_id").toString().trim()));
			item.setTax(t);
		}else addFieldError("Tax", getMessage("order.item.tax.empty"));
		
		if(request.getParameter("currency_id")!=null && StringUtils.isNotEmpty(request.getParameter("currency_id").toString().trim())){
			Currency c = new Currency();
			c.setId(new Long(request.getParameter("currency_id").toString().trim()));
			item.setCurrency(c);
		}else addFieldError("Currency", getMessage("order.item.currency.empty"));
		
		if(request.getParameter("dateordered")!=null && StringUtils.isNotEmpty(request.getParameter("dateordered").toString().trim())){
			try {
				item.setDateordered(DATE_FORMAT.parse(request.getParameter("dateordered").toString().trim()));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else addFieldError("Date ordered", getMessage("orderItem.dateordered.empty"));
		
		if(request.getParameter("datepromised")!=null && StringUtils.isNotEmpty(request.getParameter("datepromised").toString().trim())){
			try {
				item.setDatepromised(DATE_FORMAT.parse(request.getParameter("datepromised").toString().trim()));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}	
		
		if(request.getParameter("description")!=null && StringUtils.isNotEmpty(request.getParameter("description").toString().trim()))
			item.setDescription(request.getParameter("description").toString());
		
		if(request.getParameter("directship")!=null && StringUtils.isNotEmpty(request.getParameter("directship").toString().trim()))
			item.setDirectship(request.getParameter("directship").toString());
		else item.setDirectship("N");
		
		if(request.getParameter("qtyordered")!=null && StringUtils.isNotEmpty(request.getParameter("qtyordered").toString().trim()))
			item.setQtyordered(new BigDecimal(request.getParameter("qtyordered").toString().trim()));
		else addFieldError("Qty ordered", getMessage("orderItem.qtyordered.empty"));
		if(request.getParameter("shipper")!=null && StringUtils.isNotEmpty(request.getParameter("shipper").toString().trim()))
			item.setShipper(request.getParameter("shipper").toString().trim());
		
		if(request.getParameter("pricelist")!=null && StringUtils.isNotEmpty(request.getParameter("pricelist").toString().trim()))
			item.setPricelist(new BigDecimal(request.getParameter("pricelist").toString().trim()));
		
		if(request.getParameter("priceactual")!=null && StringUtils.isNotEmpty(request.getParameter("priceactual").toString().trim()))
			item.setPriceactual(new BigDecimal(request.getParameter("priceactual").toString().trim()));
		
		if(request.getParameter("pricelimit")!=null && StringUtils.isNotEmpty(request.getParameter("pricelimit").toString().trim()))
			item.setPricelimit(new BigDecimal(request.getParameter("pricelimit").toString().trim()));
		
		if(request.getParameter("linenetamt")!=null && StringUtils.isNotEmpty(request.getParameter("linenetamt").toString().trim()))
			item.setLinenetamt(new BigDecimal(request.getParameter("linenetamt").toString().trim()));
		
		if(request.getParameter("discount")!=null && StringUtils.isNotEmpty(request.getParameter("discount").toString().trim()))
			item.setDiscount(new BigDecimal(request.getParameter("discount").toString().trim()));
		
		if(request.getParameter("freightamt")!=null && StringUtils.isNotEmpty(request.getParameter("freightamt").toString().trim()))
			item.setFreightamt(new BigDecimal(request.getParameter("freightamt").toString().trim()));
//		else addFieldError("Freight amt", getMessage("orderItem.freightamt.empty"));
		
		if(request.getParameter("gross_unit_price")!=null && StringUtils.isNotEmpty(request.getParameter("gross_unit_price").toString().trim()))
			item.setGrossUnitPrice(new BigDecimal(request.getParameter("gross_unit_price").toString().trim()));
		
		if(request.getParameter("line_gross_amount")!=null && StringUtils.isNotEmpty(request.getParameter("line_gross_amount").toString().trim()))
			item.setLineGrossAmount(new BigDecimal(request.getParameter("line_gross_amount").toString().trim()));
		
		if(request.getParameter("grosspricelist")!=null && StringUtils.isNotEmpty(request.getParameter("grosspricelist").toString().trim()))
			item.setGrosspricelist(new BigDecimal(request.getParameter("grosspricelist").toString().trim()));
		
		items.add(item);
		
		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response= ServletActionContext.getResponse();
			response.addHeader("errors_exist", "true");
		}		
	}
	
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		Date cdate = new Date();
		Person person = getUser().getPerson();
		for(PurchaseOrderItem item:items){
		
			if(item.getId() == null){
				item.setStatusCode("OP");
				item.setCreated(cdate);
				item.setPersonByCreatedby(person);
				
				Session session=HibSessionFactory.getSessionFactory().getCurrentSession();
				SQLQuery sqlForno=session.createSQLQuery("select * from gen_po_item_no("+item.getPurchaseOrder().getId()+")");
				sqlForno.addScalar("gen_po_item_no",LongType.INSTANCE);
				Object no=sqlForno.uniqueResult();
				Long nr=null;
				if(no!=null && !StringUtils.isEmpty(no.toString())){
					nr=(Long)no;
				}
				String reqId=item.getPurchaseOrder().getRequisition()!=null?item.getPurchaseOrder().getRequisition().getId().toString():"";
				if(nr!=null)
					item.setItemNumber(item.getPurchaseOrder().getId()+"/"+reqId+"/"+(nr+1));
				else item.setItemNumber(item.getPurchaseOrder().getId()+"/"+reqId+"/1");
				
			}else{
				String query = "select created, createdby from tpurchase_order_item where id = " + item.getId();
				List<Object[]> dataView = DAOFactory.getFactory().getRequisitionItemDAO().getDataView(new String[]{"created", "createdby"}, new String[]{"DATE", "LONG"}, query);
				Object[] data = dataView.get(0);
				item.setCreated((Date) data[0]);
				Person p = new Person();
				p.setId((Long) data[1]);
				item.setPersonByCreatedby(p);
			}
			
			item.setIsactive("N");
			item.setLineTotal(item.getQtyordered().multiply(item.getUnitPrice()));
			item.setUpdated(cdate);
			item.setPersonByUpdatedby(person);
			
			DAOFactory.getFactory().getPurchaseOrderItemDAO().save(item);
		}
		return SUCCESS;
	}

	/**
	 * Gets the json data.
	 *
	 * @return the json data
	 */
	public String getJsonData() {
		return jsonData;
	}

	/**
	 * Sets the json data.
	 *
	 * @param jsonData the new json data
	 */
	public void setJsonData(String jsonData) {
		this.jsonData = jsonData;
	}

	/**
	 * Gets the items.
	 *
	 * @return the items
	 */
	public List<PurchaseOrderItem> getItems() {
		return items;
	}

	/**
	 * Sets the items.
	 *
	 * @param items the items to set
	 */
	public void setItems(List<PurchaseOrderItem> items) {
		this.items = items;
	}

	/**
	 * Gets the item.
	 *
	 * @return the item
	 */
	public PurchaseOrderItem getItem() {
		return item;
	}

	/**
	 * Sets the item.
	 *
	 * @param item the item to set
	 */
	public void setItem(PurchaseOrderItem item) {
		this.item = item;
	}

	/**
	 * Gets the po item array.
	 *
	 * @return the poItemArray
	 */
	public String getPoItemArray() {
		return poItemArray;
	}

	/**
	 * Sets the po item array.
	 *
	 * @param poItemArray the poItemArray to set
	 */
	public void setPoItemArray(String poItemArray) {
		this.poItemArray = poItemArray;
	}

	
	/**
	 * Validateold.
	 */
	public void validateold() {
		HttpServletRequest request = ServletActionContext.getRequest();
		print(request);
		
		items=new ArrayList<PurchaseOrderItem>();
		JSONArray array = (JSONArray) JSONSerializer.toJSON(poItemArray);
		for (Iterator<JSONObject> iterator = array.iterator(); iterator.hasNext();) {
			JSONObject o =  iterator.next();
			item = new PurchaseOrderItem();
		
			if(o.get("order_id")!=null && StringUtils.isNotEmpty(o.get("order_id").toString())){
				Long reqId = Long.valueOf(o.get("order_id").toString());
				PurchaseOrder poFake=new PurchaseOrder();
				poFake.setId(reqId);
				item.setPurchaseOrder(poFake);
			}else{
				addFieldError("Order", "orderItem.order_id.empty");
			}
			
			if(o.get("id")!=null && StringUtils.isNotEmpty(o.get("id").toString())){
				item.setId(Long.valueOf(o.get("id").toString()));
			}
			
			if(o.get("status_code")!=null && StringUtils.isNotEmpty(o.get("status_code").toString().trim())){
				String status = o.get("status_code").toString().trim();
				item.setStatusCode(status.substring(0,2).toUpperCase());
			}else{
				addFieldError("Status code", "requisition.status_code.empty");
			}
			if(o.get("bpartner_id")!=null && StringUtils.isNotEmpty(o.get("bpartner_id").toString().trim())){
				Bpartner bp = new Bpartner();
				bp.setId(new Long(o.get("bpartner_id").toString()));
				item.setBpartner(bp);
			}
			if(o.get("bpartner_location_id")!=null && StringUtils.isNotEmpty(o.get("bpartner_location_id").toString().trim())){
				BpartnerLocation bpl = new BpartnerLocation();
				bpl.setId(new Long(o.get("bpartner_location_id").toString().trim()));
				item.setBpartnerLocation(bpl);
			}
			
			if(o.get("item_name")!=null && StringUtils.isNotEmpty(o.get("item_name").toString().trim()))
				item.setItemName(o.get("item_name").toString());
			else addFieldError("Item name", getMessage("order.item.name.empty"));
			
			if(o.get("item_number")!=null && StringUtils.isNotEmpty(o.get("item_number").toString().trim()))
				item.setItemNumber(o.get("item_number").toString());
			else addFieldError("Item number", getMessage("order.item.number.empty"));
			
			if(o.get("item_desc")!=null && StringUtils.isNotEmpty(o.get("item_desc").toString().trim()))
				item.setItemDesc(o.get("item_desc").toString());
			
			if(o.get("unit_price")!=null && StringUtils.isNotEmpty(o.get("unit_price").toString().trim()))
				item.setUnitPrice(new BigDecimal(o.get("unit_price").toString().trim()));
			else addFieldError("Unit price", getMessage("order.item.unit.price.empty"));
			
			if(o.get("uom_id")!=null && StringUtils.isNotEmpty(o.get("uom_id").toString().trim())){
				Uom u = new Uom();
				u.setId(new Long(o.get("uom_id").toString().trim()));
				item.setUom(u);
			}else addFieldError("UOM", getMessage("order.item.uom.empty"));
			
			if(o.get("currency_id")!=null && StringUtils.isNotEmpty(o.get("currency_id").toString().trim())){
				Currency c = new Currency();
				c.setId(new Long(o.get("currency_id").toString().trim()));
				item.setCurrency(c);
			}else addFieldError("Currency", getMessage("order.item.currency.empty"));
			
			
			if(o.get("isactive")!=null && StringUtils.isNotEmpty(o.get("isactive").toString().trim()))
				item.setIsactive(o.get("isactive").toString().trim());
			else item.setIsactive("N");
			
			if(o.get("dateordered")!=null && StringUtils.isNotEmpty(o.get("dateordered").toString().trim())){
				try {
					item.setDateordered(DATE_FORMAT.parse(o.get("dateordered").toString().trim()));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else addFieldError("Date ordered", getMessage("orderItem.dateordered.empty"));
			
			if(o.get("datepromised")!=null && StringUtils.isNotEmpty(o.get("datepromised").toString().trim())){
				try {
					item.setDatepromised(DATE_FORMAT.parse(o.get("datepromised").toString().trim()));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}	
			
			if(o.get("datedelivered")!=null && StringUtils.isNotEmpty(o.get("datedelivered").toString().trim())){
				try {
					item.setDatedelivered(DATE_FORMAT.parse(o.get("datedelivered").toString().trim()));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			if(o.get("dateinvoiced")!=null && StringUtils.isNotEmpty(o.get("dateinvoiced").toString().trim())){
				try {
					item.setDateinvoiced(DATE_FORMAT.parse(o.get("dateinvoiced").toString().trim()));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if(o.get("description")!=null && StringUtils.isNotEmpty(o.get("description").toString().trim()))
				item.setDescription(o.get("description").toString());
			
			if(o.get("directship")!=null && StringUtils.isNotEmpty(o.get("directship").toString().trim()))
				item.setDirectship(o.get("directship").toString());
			else item.setDirectship("N");
			
			if(o.get("qtyordered")!=null && StringUtils.isNotEmpty(o.get("qtyordered").toString().trim()))
				item.setQtyordered(new BigDecimal(o.get("qtyordered").toString().trim()));
			else addFieldError("Qty ordered", getMessage("orderItem.qtyordered.empty"));
			
			if(o.get("qtyreserved")!=null && StringUtils.isNotEmpty(o.get("qtyreserved").toString().trim()))
				item.setQtyreserved(new BigDecimal(o.get("qtyreserved").toString().trim()));
			else addFieldError("Qty reserved", getMessage("orderItem.qtyreserved.empty"));
			
			if(o.get("qtydelivered")!=null && StringUtils.isNotEmpty(o.get("qtydelivered").toString().trim()))
				item.setQtydelivered(new BigDecimal(o.get("qtydelivered").toString().trim()));
			else addFieldError("Qty delivered", getMessage("orderItem.qtydelivered.empty"));
			
			if(o.get("qtyrejected")!=null && StringUtils.isNotEmpty(o.get("qtyrejected").toString().trim()))
				item.setQtyrejected(new BigDecimal(o.get("qtyrejected").toString().trim()));
			else addFieldError("Qty rejected", getMessage("orderItem.qtyrejected.empty"));
			
			
			if(o.get("qtyinvoiced")!=null && StringUtils.isNotEmpty(o.get("qtyinvoiced").toString().trim()))
				item.setQtyinvoiced(new BigDecimal(o.get("qtyinvoiced").toString().trim()));
			else addFieldError("Qty invoiced", getMessage("orderItem.qtyinvoiced.empty"));
			
			if(o.get("shipper")!=null && StringUtils.isNotEmpty(o.get("shipper").toString().trim()))
				item.setShipper(o.get("shipper").toString().trim());
			
			if(o.get("pricelist")!=null && StringUtils.isNotEmpty(o.get("pricelist").toString().trim()))
				item.setPricelist(new BigDecimal(o.get("pricelist").toString().trim()));
			else addFieldError("Price list", getMessage("orderItem.pricelist.empty"));
			
			if(o.get("priceactual")!=null && StringUtils.isNotEmpty(o.get("priceactual").toString().trim()))
				item.setPriceactual(new BigDecimal(o.get("priceactual").toString().trim()));
			else addFieldError("Price actual", getMessage("orderItem.priceactual.empty"));
			
			if(o.get("pricelimit")!=null && StringUtils.isNotEmpty(o.get("pricelimit").toString().trim()))
				item.setPricelimit(new BigDecimal(o.get("pricelimit").toString().trim()));
			else addFieldError("Price limit", getMessage("orderItem.pricelimit.empty"));
			
			if(o.get("linenetamt")!=null && StringUtils.isNotEmpty(o.get("linenetamt").toString().trim()))
				item.setLinenetamt(new BigDecimal(o.get("linenetamt").toString().trim()));
			else addFieldError("Line netamt", getMessage("orderItem.linenetamt.empty"));
			
			if(o.get("discount")!=null && StringUtils.isNotEmpty(o.get("discount").toString().trim()))
				item.setDiscount(new BigDecimal(o.get("discount").toString().trim()));
			
			if(o.get("freightamt")!=null && StringUtils.isNotEmpty(o.get("freightamt").toString().trim()))
				item.setFreightamt(new BigDecimal(o.get("freightamt").toString().trim()));
			else addFieldError("Freight amt", getMessage("orderItem.freightamt.empty"));
			
			if(o.get("gross_unit_price")!=null && StringUtils.isNotEmpty(o.get("gross_unit_price").toString().trim()))
				item.setGrossUnitPrice(new BigDecimal(o.get("gross_unit_price").toString().trim()));
			
			if(o.get("line_gross_amount")!=null && StringUtils.isNotEmpty(o.get("line_gross_amount").toString().trim()))
				item.setLineGrossAmount(new BigDecimal(o.get("line_gross_amount").toString().trim()));
			
			if(o.get("grosspricelist")!=null && StringUtils.isNotEmpty(o.get("grosspricelist").toString().trim()))
				item.setGrosspricelist(new BigDecimal(o.get("grosspricelist").toString().trim()));
			
			items.add(item);
		}
		
		if(hasFieldErrors() || hasActionErrors()){
			HttpServletResponse response= ServletActionContext.getResponse();
			response.addHeader("errors_exist", "true");
		}		
	}	
	
}

