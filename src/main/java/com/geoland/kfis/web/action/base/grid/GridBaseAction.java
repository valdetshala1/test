package com.geoland.kfis.web.action.base.grid;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.examples.EmeddedObjects;
import org.hibernate.mapping.Map;

import com.geoland.kfis.model.CadastralMunicipality;
import com.geoland.kfis.model.Organisation;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.model.Region;
import com.geoland.kfis.web.action.base.BaseActionSupport;


// TODO: Auto-generated Javadoc
/**
 * The Class GridBaseAction.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created April 21, 2014 3:41:59 PM
 * @Version 1.0
 */
public class GridBaseAction extends BaseActionSupport {
	
	/** The log. */
	protected Logger log = Logger.getLogger(GridBaseAction.class);
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -278501006881415512L;
	
	/** The date format. */
	protected static SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd.MM.yyyy");
	
	/** The timestamp format. */
	protected static SimpleDateFormat TIMESTAMP_FORMAT = new SimpleDateFormat("dd.MM.yyyy HH:mm:ss");
	
	/** The date format custom. */
	protected static SimpleDateFormat DATE_FORMAT_CUSTOM = new SimpleDateFormat("yyyy.MM.dd");
	
	/** The df. */
	protected static SimpleDateFormat DF = new SimpleDateFormat("dd.MM.yyyy");
	
	/** The decimal format. */
	protected static DecimalFormat DECIMAL_FORMAT=new DecimalFormat("###,###.##");
	
	/** The filter params. */
	protected HashMap<String, String> filterParams=new HashMap<String, String>();
	

	/** The id. */
	protected Long id;

	// get how many rows we want to have into the grid - rowNum attribute in the
	/** The rows. */
	// grid
	protected Integer rows = 0;

	/** The page. */
	// Get the requested page. By default grid sets this to 1.
	protected Integer page = 0;

	/** The sord. */
	// sorting order - asc or desc
	protected String sord = "asc";

	/** The sidx. */
	// get index row - i.e. user click to sort.
	protected String sidx;

	/** The search field. */
	// Search Field
	protected String searchField;

	/** The search string. */
	// The Search String
	protected String searchString;

	// he Search Operation
	/** The search oper. */
	// ['eq','ne','lt','le','gt','ge','bw','bn','in','ni','ew','en','cn','nc']
	protected String searchOper;

	/** The total. */
	// Your Total Pages
	protected Integer total = 0;

	/** The records. */
	// All Records
	protected Integer records = 0;

	/** The filters. */
	protected String filters;
	
	/** The status. */
	protected String status;
	
	/** The datatype. */
	protected String datatype;
	
	/** The limit. */
	protected Integer limit;
	
	/** The count. */
	protected Integer count;
	
	/** The total pages. */
	protected Integer total_pages;
	
	/** The start. */
	protected Integer start;

	/**
	 * Emtpty conent.
	 *
	 * @param response the response
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	protected void emtptyConent(HttpServletResponse response)throws IOException {
		PrintWriter out = response.getWriter();
		try{
			out.append("<?xml version='1.0' encoding='utf-8'?>\n");
			out.append("<rows>");
			out.append("<page>" + page + "</page>");
			out.append("<total>" + total_pages + "</total>");	
			out.append("</rows>");
			out.flush();
		} finally {
			out.close();
		}			
	}	
	
	/**
	 * Calculate page.
	 */
	protected void calculatePage(){
		limit = rows;
		count = records;
		
		if( records > 0 && limit>0 ) { 
			total_pages = (count/limit);
		} else { 
			total_pages = 0; 
		}
		if (page > total_pages) page= total_pages;
		start = limit*page - limit; // do not put limit*(page - 1)		
		
	}
	
	/**
	 * calcPages.
	 *
	 * @param length the length
	 */
	protected void calcPages(Integer length){
		try {
			records = length;
			limit = rows;
			count = records;

			if (records > 0 && limit>0) {
				// total_pages = (records/limit);
				BigDecimal a = new BigDecimal(records);
				BigDecimal b = new BigDecimal(limit);
				total_pages = a.divide(b, RoundingMode.CEILING).intValue();
			} else {
				total_pages = 0;
			}
			if (page > total_pages)
				page = total_pages;

			start = limit * page - limit; // do not put limit*(page - 1)
			if(start<0) start = 0;
		} catch (Exception e) {
			log.error(e);
		}
	}
	
	
	/**
	 * Total pages.
	 */
	protected void totalPages(){
		// Calculate total Pages
		total = (int) Math.ceil((double) records / (double) rows);		
	}

	/**
	 * Gets the person data.
	 *
	 * @param person the person
	 * @return the person data
	 */
	protected String getPersonData(Person person){
		String pdata = "";
		if(person!=null){
			pdata = person.getFirstName() + " " + person.getLastName();
		}
		return pdata;
	}
	
	/**
	 * Gets the oganisation data.
	 *
	 * @param orga the orga
	 * @param language the language
	 * @return the oganisation data
	 */
	protected String getOganisationData(Organisation orga,String language){
		String odata = "";
		if(orga!=null){
			odata = ("al".equals(language)?orga.getOrgaName():"en".equals(language)?orga.getOrgaNameEn():orga.getOrgaNameSr()) + " (" + orga.getOrgaCategory() + ", " + orga.getOperLevelVal() + ")";
		}
		return odata;
	}	
	
	/**
	 * Gets the cadastral municipality data.
	 *
	 * @param mun the mun
	 * @param language the language
	 * @return the cadastral municipality data
	 */
	protected String getCadastralMunicipalityData(CadastralMunicipality mun,String language){
		String munData = "";
		if(mun!=null){
			munData = ("al".equals(language)?mun.getName():"en".equals(language)?mun.getNameEn():mun.getNameSr());
		}
		return munData;
	}
	
	/**
	 * Gets the region data.
	 *
	 * @param reg the reg
	 * @param language the language
	 * @return the region data
	 */
	protected String getRegionData(Region reg,String language){
		String regData = "";
		if(reg!=null){
			regData = ("al".equals(language)?reg.getName():"en".equals(language)?reg.getNameEn():reg.getNameSr());
		}
		return regData;
	}
	
	/**
	 * Removes the line break.
	 *
	 * @param text the text
	 * @return the string
	 */
	protected String removeLineBreak(String text){
		String s ="";
		if(StringUtils.isNotEmpty(text)){
			s = text.replace("\n", "").replace("\r", " ");
		}
		return s;
	}
	
	/**
	 * Gets the id.
	 *
	 * @return the id
	 */
	public Long getId() {
		return id;
	}

	/**
	 * Sets the id.
	 *
	 * @param id the new id
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * Gets the rows.
	 *
	 * @return the rows
	 */
	public Integer getRows() {
		return rows;
	}

	/**
	 * Sets the rows.
	 *
	 * @param rows the new rows
	 */
	public void setRows(Integer rows) {
		this.rows = rows;
	}

	/**
	 * Gets the page.
	 *
	 * @return the page
	 */
	public Integer getPage() {
		return page;
	}

	/**
	 * Sets the page.
	 *
	 * @param page the new page
	 */
	public void setPage(Integer page) {
		this.page = page;
	}

	/**
	 * Gets the sord.
	 *
	 * @return the sord
	 */
	public String getSord() {
		return sord;
	}

	/**
	 * Sets the sord.
	 *
	 * @param sord the new sord
	 */
	public void setSord(String sord) {
		this.sord = sord;
	}

	/**
	 * Gets the sidx.
	 *
	 * @return the sidx
	 */
	public String getSidx() {
		return sidx;
	}

	/**
	 * Sets the sidx.
	 *
	 * @param sidx the new sidx
	 */
	public void setSidx(String sidx) {
		this.sidx = sidx;
	}

	/**
	 * Gets the search field.
	 *
	 * @return the search field
	 */
	public String getSearchField() {
		return searchField;
	}

	/**
	 * Sets the search field.
	 *
	 * @param searchField the new search field
	 */
	public void setSearchField(String searchField) {
		this.searchField = searchField;
	}

	/**
	 * Gets the search string.
	 *
	 * @return the search string
	 */
	public String getSearchString() {
		return searchString;
	}

	/**
	 * Sets the search string.
	 *
	 * @param searchString the new search string
	 */
	public void setSearchString(String searchString) {
		this.searchString = searchString;
	}

	/**
	 * Gets the search oper.
	 *
	 * @return the search oper
	 */
	public String getSearchOper() {
		return searchOper;
	}

	/**
	 * Sets the search oper.
	 *
	 * @param searchOper the new search oper
	 */
	public void setSearchOper(String searchOper) {
		this.searchOper = searchOper;
	}

	/**
	 * Gets the total.
	 *
	 * @return the total
	 */
	public Integer getTotal() {
		return total;
	}

	/**
	 * Sets the total.
	 *
	 * @param total the new total
	 */
	public void setTotal(Integer total) {
		this.total = total;
	}

	/**
	 * Gets the records.
	 *
	 * @return the records
	 */
	public Integer getRecords() {
		return records;
	}

	/**
	 * Sets the records.
	 *
	 * @param records the new records
	 */
	public void setRecords(Integer records) {
		this.records = records;
	}

	/**
	 * Gets the datatype.
	 *
	 * @return the datatype
	 */
	public String getDatatype() {
		return datatype;
	}

	/**
	 * Sets the datatype.
	 *
	 * @param datatype the new datatype
	 */
	public void setDatatype(String datatype) {
		this.datatype = datatype;
	}

	/**
	 * Gets the limit.
	 *
	 * @return the limit
	 */
	public Integer getLimit() {
		return limit;
	}

	/**
	 * Sets the limit.
	 *
	 * @param limit the new limit
	 */
	public void setLimit(Integer limit) {
		this.limit = limit;
	}

	/**
	 * Gets the count.
	 *
	 * @return the count
	 */
	public Integer getCount() {
		return count;
	}

	/**
	 * Sets the count.
	 *
	 * @param count the new count
	 */
	public void setCount(Integer count) {
		this.count = count;
	}

	/**
	 * Gets the total pages.
	 *
	 * @return the total pages
	 */
	public Integer getTotal_pages() {
		return total_pages;
	}

	/**
	 * Sets the total pages.
	 *
	 * @param total_pages the new total pages
	 */
	public void setTotal_pages(Integer total_pages) {
		this.total_pages = total_pages;
	}

	/**
	 * Gets the start.
	 *
	 * @return the start
	 */
	public Integer getStart() {
		return start;
	}

	/**
	 * Sets the start.
	 *
	 * @param start the new start
	 */
	public void setStart(Integer start) {
		this.start = start;
	}

	/**
	 * Gets the filters.
	 *
	 * @return the filters
	 */
	public String getFilters() {
		return filters;
	}

	/**
	 * Sets the filters.
	 *
	 * @param filters the new filters
	 */
	public void setFilters(String filters) {
		this.filters = filters;
	}

	/**
	 * Gets the status.
	 *
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * Sets the status.
	 *
	 * @param status the new status
	 */
	public void setStatus(String status) {
		this.status = status;
	}

	/* (non-Javadoc)
	 * @see com.geoland.kfis.web.action.base.BaseActionSupport#print(javax.servlet.http.HttpServletRequest)
	 */
	@SuppressWarnings("rawtypes")
	protected void print(HttpServletRequest request){
		System.out.println("-----------START---------");
		Enumeration en = request.getParameterNames();
		while (en.hasMoreElements()) {
			String paramName = (String) en.nextElement();
			System.out.println(paramName + " = "
					+ request.getParameter(paramName) + "<br/>");
		}		
		System.out.println("-----------END---------");
		System.out.println("\n");
	}	
	
	
	/**
	 * Fdate.
	 *
	 * @param date the date
	 * @return the string
	 */
	protected String fdate(Date date){
		if(date!=null){
			return DATE_FORMAT.format(date);
		}
		return "";
	}
	
	/**
	 * F date time.
	 *
	 * @param date the date
	 * @return the string
	 */
	protected String fDateTime(Date date){
		if(date!=null){
			return TIMESTAMP_FORMAT.format(date);
		}
		return "";
	}
	
	/**
	 * Gets the JSON object.
	 *
	 * @param jsonArray the json array
	 * @param fieldName the field name
	 * @return JSONObject
	 */
	protected JSONObject getJSONObject(JSONArray jsonArray, String fieldName) {
		for (int i = 0; i < jsonArray.size(); i++) {
			JSONObject jsonObject = jsonArray.getJSONObject(i);
			String field = jsonObject.getString("field");
			if (field.equals(fieldName)) {
				return jsonObject;
			}
		}
		return null;
	}
	

	/**
	 * set empty content.
	 *
	 * @param out PrintWriter
	 */
	protected void setEmtpyContent(PrintWriter out){
		JSONArray jsonArray = new JSONArray();
		JSONObject header = new JSONObject();
		header.element("TotalRows", 0);

		String str = jsonArray.toString();
		out.append(str);		
	}
	
	/**
	 * String date format.
	 *
	 * @param dateString the date string
	 * @return date (yyyy-mm-dd)
	 */
	protected String stringDateFormat(String dateString){
		String[] elements=dateString.split("\\.");
		return ""+elements[2]+"-"+elements[1]+"-"+elements[0];
	}
	
	/**
	 * Gets the condition.
	 *
	 * @return condition
	 */
	protected String getCondition(){
		String condition = null;
		
		if(filters!=null && StringUtils.isNotEmpty(filters)){
			StringBuilder where = new StringBuilder();
			
			/** 4.) To work with this, we need to serialize this as a JSONObject.*/ 
			JSONObject jsonFilter = (JSONObject) JSONSerializer.toJSON( filters );
			
			/** 5.) Now we can get the value from the JSON Object. First we get the parameter groupOp.*/ 
			String groupOp = jsonFilter.getString("groupOp");
			
			/** 6.) Now we need the rules as JSONArray and the size of this array.  */
			JSONArray rules = jsonFilter.getJSONArray("rules");
			int rulesCount = JSONArray.getDimensions(rules)[0];
			
			boolean op_and = false;
			/** 7.) In a simple for-loop we can get the values of the rule.  */
			for (int i = 0; i < rulesCount; i++) {
				JSONObject rule = rules.getJSONObject(i);
				
				String data = rule.getString("data");
				if( !StringUtils.isEmpty(data))
				filterParams.put(rule.getString("field"),data.toLowerCase());

				if(data==null || StringUtils.isEmpty(data)) data = ""; 
				/*
                  'eq'=>" = ",
                  'ne'=>" <> ",
                  'lt'=>" < ",
                  'le'=>" <= ",
                  'gt'=>" > ",
                  'ge'=>" >= ",
                  'bw'=>" LIKE ",
                  'bn'=>" NOT LIKE ",
                  'in'=>" IN ",
                  'ni'=>" NOT IN ",
                  'ew'=>" LIKE ",
                  'en'=>" NOT LIKE ",
                  'cn'=>" LIKE " ,
                  'nc'=>" NOT LIKE " );
			    */
				if(op_and) where.append(groupOp + " ");
				if("eq".equals(rule.getString("op"))){
					where.append(rule.getString("field") + " = '" + data + "' ");
					op_and = true;
				}else if("ne".equals(rule.getString("op"))){
					where.append(rule.getString("field") + " <> '" + data + "' ");
					op_and = true;
				}else if("lt".equals(rule.getString("op"))){
					where.append(rule.getString("field") + " < " + data + " ");
					op_and = true;					
				}else if("le".equals(rule.getString("op"))){
					where.append(rule.getString("field") + " <= " + data + " ");
					op_and = true;
				}else if("gt".equals(rule.getString("op"))){
					where.append(rule.getString("field") + " > " + data + " ");
					op_and = true;
				}else if("ge".equals(rule.getString("op"))){
					where.append(rule.getString("field") + " >= " + data + " ");
					op_and = true;		
				}else if("bw".equals(rule.getString("op"))){
					where.append("LOWER(CAST(" + rule.getString("field") + " AS varchar)) LIKE '%" + data.toLowerCase() + "%' ");
					op_and = true;
				}else if("bn".equals(rule.getString("op"))){
					where.append("LOWER(CAST(" + rule.getString("field") + " AS varchar)) NOT LIKE '%" + data.toLowerCase() + "%' ");
					op_and = true;
				}else if("ew".equals(rule.getString("op"))){
					where.append("LOWER(CAST(" + rule.getString("field") + " AS varchar)) LIKE '%" + data.toLowerCase() + "%' ");
					op_and = true;
				}else if("en".equals(rule.getString("op"))){
					where.append("LOWER(CAST(" + rule.getString("field") + " AS varchar)) NOT LIKE '%" + data.toLowerCase() + "%' ");
					op_and = true;
				}else if("cn".equals(rule.getString("op"))){
					where.append("LOWER(CAST(" + rule.getString("field") + " AS varchar)) LIKE '%" + data.toLowerCase() + "%' ");
					op_and = true;
				}else if("nc".equals(rule.getString("op"))){
					where.append("LOWER(CAST(" + rule.getString("field") + " AS varchar)) NOT LIKE '%" + data.toLowerCase() + "%' ");
					op_and = true;
				}				
				
			}	
			
			condition = where.toString();
		}
		return condition;
	}	
	
	/**
	 * Gets the alfresco conetent.
	 *
	 * @param tableName the table name
	 * @param entityId the entity id
	 * @return the alfresco conetent
	 */
	public void getAlfrescoConetent(String tableName,Long entityId){
	}
	
	
	/**
	 * 
	 * @param httpRequest
	 */
    @SuppressWarnings("rawtypes")
	protected void printRequest(HttpServletRequest httpRequest) {
        System.out.println(" \n\n Headers");

        Enumeration headerNames = httpRequest.getHeaderNames();
        while(headerNames.hasMoreElements()) {
            String headerName = (String)headerNames.nextElement();
            System.out.println(headerName + " = " + httpRequest.getHeader(headerName));
        }

        System.out.println("\n\nParameters");

        Enumeration params = httpRequest.getParameterNames();
        while(params.hasMoreElements()){
            String paramName = (String)params.nextElement();
            System.out.println(paramName + " = " + httpRequest.getParameter(paramName));
        }

        //System.out.println("\n\n Row data");
        //System.out.println(extractPostRequestBody(httpRequest));
    }	
}
