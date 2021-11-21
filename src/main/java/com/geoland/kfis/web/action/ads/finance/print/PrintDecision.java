package com.geoland.kfis.web.action.ads.finance.print;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.ResourceBundle;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.docx4j.convert.out.pdf.viaXSLFO.PdfSettings;
import org.docx4j.openpackaging.exceptions.Docx4JException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.kfis.model.AnnualBudgetAllocation;
import com.geoland.kfis.model.Organisation;
import com.geoland.kfis.persistence.dao.DAOFactory;
import com.geoland.kfis.persistence.hibernate.usertypes.Month;
import com.geoland.kfis.print.msoffice.WordDocumentHandler;

// TODO: Auto-generated Javadoc
/**
 * The Class PrintDecision.
 */
public class PrintDecision {
	
	/** The log. */
	Logger log = Logger.getLogger(PrintDecision.class);
	
	/** The template. */
	private String template;
	
	/** The output. */
	private String output;
	
	/** The settings. */
	private ResourceBundle settings;
	
	/** The file type. */
	private String fileType;
	
	/**
	 * Instantiates a new prints the decision.
	 *
	 * @param settings the settings
	 */
	public PrintDecision(ResourceBundle settings) {
		this.settings = settings;
		init();
	}

	/**
	 * Inits the.
	 */
	private void init(){
		template = settings.getString("templates");
		output = settings.getString("output");
	}

	/**
	 * Allocation.
	 *
	 * @param month the month
	 * @param year the year
	 * @param month2 the month 2
	 * @return the file
	 * @throws Exception the exception
	 */
	public File allocation(String month,String year,String month2) throws Exception{
		
		String queryAllocation="select * from tfin_annu_budget_alloc where month='"+month+"' and year="+year;
		List<AnnualBudgetAllocation> allocationList = DAOFactory.getFactory().getAnnuBudgetAllocationDAO().executeSQLQuery(queryAllocation);
		WordDocumentHandler wdh =null;
		
			if(!StringUtils.isEmpty(month2) && !StringUtils.isEmpty(month)){
				
				new WordDocumentHandler("C:/Users/glp0305/Desktop/template_kfis/budget/allocation/input/period_allocation.docx");
				
			}else {
				new WordDocumentHandler("C:/Users/glp0305/Desktop/template_kfis/budget/allocation/input/month_allocation.docx");
			}
					
				 
		HashMap<String, String> hm=new HashMap<String, String>();
		hm.put("month", month);
		hm.put("year", "2014");
		wdh.process(hm);
		Object tableObj = wdh.getTable(0);
		int rowNr =4;
		for(AnnualBudgetAllocation a:allocationList){
			List<String> row = new ArrayList<String>();
			row.add(rowNr+"");
			Long departmentId=a.getOrganisation().getParty().getId();
			Organisation department=DAOFactory.getFactory().getOrganisationDAO().get(departmentId);
			row.add(department.getOrgaName().toString());
			row.add(a.getOrganisation().getOrgaName().toString());
			row.add(a.getWoodSales().toString());
			row.add(a.getOtherIncome().toString());
			row.add(a.getTotal().toString());
			row.add(a.getAllocation36().toString());
			row.add(a.getMunicipality30Portion().toString());
			row.add(a.getKfaRemainder().toString());
			
			row.add("");
			
			wdh.addTableRow(tableObj, rowNr, row);
			rowNr++;
			
		}
		
		File file = new File("C:/Users/glp0305/Desktop/template_kfis/budget/allocation/output/allocationOutput.docx");
		saveDocument(wdh, file);
		return file;
	
	}
	
	
	/**
	 * Allocation year.
	 *
	 * @param year the year
	 * @return the file
	 * @throws Exception the exception
	 */
	public File allocationYear(String year) throws Exception{
		String queryAllocation="";
		Session session = HibSessionFactory.getSessionFactory().getCurrentSession();
		
//		List<AnnualBudgetAllocation> allocationList = DAOFactory.getFactory().getAnnuBudgetAllocationDAO().executeSQLQuery(queryAllocation); 
		WordDocumentHandler wdh =new WordDocumentHandler("C:/Users/glp0305/Desktop/template_kfis/budget/allocation/input/period_allocation.docx");
		String organizationQuery="select p.*, o.* from tparty as p left join torganisation as o on p.id = o.id where orga_type='O' and operation_level='M'";
		
		List<Organisation> organizationList=DAOFactory.getFactory().getOrganisationDAO().executeSQLQuery(organizationQuery);
		Month[] monthList=Month.values();
		
		HashMap<String, String> hm=new HashMap<String, String>();
		hm.put("month1",Month.JANUARY.toString());
		hm.put("month2", Month.DECEMBER.toString());
		hm.put("year",year);
		wdh.process(hm);
		Object tableObj = wdh.getTable(0);
		int rowNr =1;
			for(Organisation o:organizationList){
				List<String> row = new ArrayList<String>();
				row.add(rowNr+"");
				row.add(o.getOrgaName().toString());
				
				for(Month m:monthList ){
					queryAllocation="select sum(municipality_30_portion)  from tfin_annu_budget_alloc where year="+year+" and month='"+m.getDOMKEY()+"' and municipality_id="+o.getId();
					 SQLQuery sqlQuery = session.createSQLQuery(queryAllocation);
					 sqlQuery.addScalar("sum");
					 Object recs = sqlQuery.uniqueResult();
					 String rowRez="";
					 if(recs==null){
						 rowRez="";
					 }else {
						 rowRez=recs.toString();
					}
						 
						 
					 row.add(rowRez);
				}
				wdh.addTableRow(tableObj, rowNr, row);
				rowNr++;
				
			}
			
		
		File file = new File("C:/Users/glp0305/Desktop/template_kfis/budget/allocation/output/allocationOutput.docx");
		saveDocument(wdh, file);
		return file;
	}
	
	/**
	 * Save document.
	 *
	 * @param wdh the wdh
	 * @param file the file
	 * @throws FileNotFoundException the file not found exception
	 * @throws Docx4JException the docx 4 J exception
	 */
	protected void saveDocument(WordDocumentHandler wdh, File file) throws FileNotFoundException, Docx4JException{
		if("pdf".equals(fileType)){
			boolean saveFO = false;
			String absolutePath = file.getAbsolutePath();
     	    String filePath = absolutePath.substring(0,absolutePath.lastIndexOf(File.separator));
			int index = file.getName().indexOf(".");
			String n = file.getName().substring(0, index);
			File pdf = new File(filePath + "/" + n + ".pdf");
			
     	    org.docx4j.convert.out.pdf.PdfConversion con = new org.docx4j.convert.out.pdf.viaXSLFO.Conversion(wdh.getWordMLPackage());
			String inputfilepath = filePath + "/";
			if (saveFO) {
				((org.docx4j.convert.out.pdf.viaXSLFO.Conversion)con).setSaveFO(
						new java.io.File(inputfilepath + ".fo"));
			}
			
			OutputStream os = new java.io.FileOutputStream(pdf);
			con.output(os, new PdfSettings() );
		}else{
			wdh.save(file.getAbsolutePath());
		}
		
	}	
}
