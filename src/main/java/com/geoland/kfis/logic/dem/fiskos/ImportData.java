package com.geoland.kfis.logic.dem.fiskos;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.geoland.kfis.model.CadastralMunicipality;
import com.geoland.kfis.model.Employee;
import com.geoland.kfis.model.FiskosData;
import com.geoland.kfis.model.FiskosImport;
import com.geoland.kfis.model.ManagementUnit;
import com.geoland.kfis.model.ManagementUnitPeriod;
import com.geoland.kfis.model.Person;
import com.geoland.kfis.model.Region;
import com.geoland.kfis.model.TreeSpecies;
import com.geoland.kfis.persistence.dao.DAOFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class ImportData.
 *
 * @author GEO&LAND
 * @created October 5, 2014 9:34:32 AM
 * @Version 1.0
 */
public class ImportData {
	
	/** The log. */
	private static Logger log = Logger.getLogger(ImportData.class);
	
	/** The index. */
	private int index = 0; // 0 is first column
	
	/** The headers. */
	private List<String> headers = new ArrayList<String>();
	
	/** The file. */
	private File file;
	
	/** The person. */
	private Person person;
	
	/** The region id. */
	private Long regionId;
	
	/** The mu id. */
	private Long muId;
	
	/** The fiskos data list. */
	private List<FiskosData> fiskosDataList = new ArrayList<FiskosData>();
	
	/** The last version nr. */
	private Long lastVersionNr;
	
	/** The error msg. */
	private String errorMsg;
	
	/** The fiskos import. */
	private FiskosImport fiskosImport;
	
	/** The prev fiskos import. */
	private FiskosImport prevFiskosImport;
	
	/** The prev MUP. */
	private ManagementUnitPeriod prevMUP;
	
	/** The note. */
	private String note;
	
	/** The mup. */
	private ManagementUnitPeriod mup;
	
	/** The current date. */
	private Date currentDate;
	
	/** The next version nr. */
	private Long nextVersionNr;
	
	/** The region. */
	private Region region;
	
	/** The mu. */
	private ManagementUnit mu;
	
	/** The employee. */
	private Employee employee;
	
	/** The uuid. */
	private UUID uuid;
	
	/** The datefrom. */
	private String datefrom;
	
	/** The dateto. */
	private String dateto;
	
	/**
	 * Instantiates a new import data.
	 *
	 * @param person the person
	 * @param regionId the region id
	 * @param muId the mu id
	 * @param datefrom the datefrom
	 * @param dateto the dateto
	 * @param note the note
	 * @param file the file
	 */
	public ImportData(Person person, Long regionId, Long muId, String datefrom, String dateto, String note, File file) {
		this.person = person;
		this.regionId = regionId;
		this.muId = muId;
		this.datefrom = datefrom;
		this.dateto = dateto;
		this.file = file;
		this.note = note;
		this.currentDate = new Date();
		this.nextVersionNr = new Long(1);
		this.uuid = UUID.randomUUID();
	}

	/**
	 * Run.
	 *
	 * @return boolean state
	 */
	public boolean run() {
		int rowIndex = 0;
		FileInputStream fis = null;
		
		Boolean hasErrors = Boolean.FALSE;
		
		try {
			SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd.MM.yyyy");
			
			region  = DAOFactory.getFactory().getRegionDAO().get(regionId);
			mu = DAOFactory.getFactory().getManagementUnitDAO().get(muId);
			
			employee = DAOFactory.getFactory().getEmployeeDAO().get(person.getId());
			
			mup = new ManagementUnitPeriod();
			mup.setIsactive("Y");
			mup.setTrnxId(uuid.toString());
			mup.setManagementUnit(mu);
			mup.setCreatedDate(currentDate);
			mup.setUpdatedDate(currentDate);
			mup.setStartDate(DATE_FORMAT.parse(datefrom));
			mup.setEndDate(DATE_FORMAT.parse(dateto));
			mup.setEmployeeByCreatedBy(employee);
			mup.setEmployeeByUpdatedBy(employee);
			
			//Long nextVersionNr = DAOFactory.getFactory().getFiskosDataDAO().nextOfSequence("FISKOS_VERSION");
			//lastVersionNr = nextVersionNr - 1;
			
			findPrevFiskosImport(); //find previous FISKOS import data set
			findPrevMUP(); //find previous management unit period (MUP) data set
			
			fiskosImport = new FiskosImport();
			fiskosImport.setIsactive("Y");
			fiskosImport.setTrnxId(uuid.toString());
			fiskosImport.setStartDate(DATE_FORMAT.parse(datefrom));
			fiskosImport.setEndDate(DATE_FORMAT.parse(dateto));			
			fiskosImport.setCreatedDate(currentDate);
			fiskosImport.setPersonByCreatedBy(person);
			fiskosImport.setChangedDate(currentDate);
			fiskosImport.setPersonByChangedBy(person);
			fiskosImport.setManagementUnit(mu);
			fiskosImport.setRegion(region);
			fiskosImport.setVersionNr(nextVersionNr);
			fiskosImport.setNote(note);
			
			fis = new FileInputStream(file);
			XSSFWorkbook workbook = new XSSFWorkbook(fis); // Get first/desired
															// sheet from the
															// workbook
			XSSFSheet sheet = workbook.getSheetAt(0); // Iterate through each
														// rows one by one
			createHeaders(sheet);

			Iterator<Row> rowIterator = sheet.iterator();
			while (rowIterator.hasNext()) {
				Row row = rowIterator.next(); // For each row, iterate through
												// all the columns
				if (rowIndex > 0) {
					FiskosData fd = new FiskosData();

					fd.setFiskosImport(fiskosImport);
					fd.setRegionId(regionId);
					fd.setManagementUnit(mu);

					/* sort order by excel columns */
					fd.setRegion(getSVal(row, index)); //Region
					fd.setManagmentUnit(getSVal(row, next())); //NjMU
					
					// Ngastra must be a number
					String comp = getSVal(row, next());
//					Number compNr = NumberUtils.createNumber(comp.trim());
					fd.setComp(comp.trim());
					
					// NNgaster must be a number
					String stand = getSVal(row, next());
//					Number standNr = NumberUtils.createNumber(stand.trim());
					fd.setStand(stand.trim());
					
					String munName = getSVal(row, next());
					fd.setMunicipality(munName); // Kommuna
					/**
					 * determinate cadastralMunicipality
					 */
					CadastralMunicipality cadmun = findMunicipality(munName);
					fd.setCadastralMunicipality(cadmun);
					
					fd.setStandarea(getDVal(row, next())); // Siperfaqja NNgastres
					fd.setMngmClassId(getLVal(row, next())); // Klasa Menaxhuese

					index++;
					index++;

					fd.setAccessible(getSVal(row, next()));
					fd.setMinehazard(getSVal(row, next()));
					fd.setLayers(getSVal(row, next()));
					fd.setStandType(getSVal(row, next()));
					fd.setCrowncover(getDVal(row, next()));
					fd.setSlope(getDVal(row, next()));
					fd.setLittercov(getDVal(row, next()));
					fd.setAge(getLVal(row, next()));
					fd.setOrigin(getSVal(row, next()));
					fd.setConifer(getSVal(row, next()));
					fd.setConiferBon(getDVal(row, next()));
					fd.setDecidouse(getSVal(row, next()));
					fd.setDecidouseBon(getDVal(row, next()));
					fd.setTrees(getLVal(row, next()));
					fd.setVolumeM3ha(getDVal(row, next()));
					fd.setConiferPerc(getDVal(row, next()));
					fd.setDecidousePerc(getDVal(row, next()));
					fd.setPerc030(getDVal(row, next()));
					fd.setPerc3050(getDVal(row, next()));
					fd.setPerc5070(getDVal(row, next()));
					fd.setPerc70100(getDVal(row, next()));

					fd.setIncrPerc(getDVal(row, next()));
					fd.setM2Ha(getDVal(row, next()));
					fd.setDsCon(getDVal(row, next()));
					fd.setDsBro(getDVal(row, next()));

					fd.setCl1PercCon(getDVal(row, next()));
					fd.setCl2PercCon(getDVal(row, next()));
					fd.setCl3PercCon(getDVal(row, next()));
					fd.setCl4PercCon(getDVal(row, next()));

					fd.setCl1PercDec(getDVal(row, next()));
					fd.setCl2PercDec(getDVal(row, next()));
					fd.setCl3PercDec(getDVal(row, next()));
					fd.setCl4PercDec(getDVal(row, next()));

					fd.setDamagePerc(getDVal(row, next()));
					fd.setEstemateVolume(getLVal(row, next()));
					fd.setEstimateTreesPerHa(getLVal(row, next()));
					fd.setHeightMean(getLVal(row, next()));
					
					/**
					 * determinate tree species types from database
					 */
					String treeSpecies1 = getSVal(row, next());
					String treeSpecies2 = getSVal(row, next());
					String treeSpecies3 = getSVal(row, next());
					
					fd.setTreeSpecies1(treeSpecies1);
					fd.setTreeSpecies2(treeSpecies2);
					fd.setTreeSpecies2(treeSpecies3);
					
					fd.setTree1(findTreeSpecies(treeSpecies1));
					fd.setTree2(findTreeSpecies(treeSpecies2));
					fd.setTree3(findTreeSpecies(treeSpecies3));
					
					fd.setTerrainDate(getDateVal(row, next()));
					fd.setSurveyDate(getDateVal(row, next()));
					fd.setMsgtext(getSVal(row, next()));
					
					/*special fields*/
					fd.setVersionNr(nextVersionNr);
					fd.setPerson(person);
					fd.setImportedDate(currentDate);
					fd.setActive(true);
					
					fiskosDataList.add(fd);
				}

				index = 0;
				rowIndex++;
			}

		} catch (Exception e) {
			hasErrors = Boolean.TRUE;
			String headerName = "";
			if(!headers.isEmpty() && headers.size()>=index){
				headerName = headers.get(index);
			}
			errorMsg = "Error occured in Row:" + (rowIndex + 1)
					+ " and Column: " + (index + 1) + " ('"
					+ headerName+ "') with message: "
					+ e.getMessage();
			System.out
					.println(errorMsg);
			log.error(errorMsg, e);
		} finally {
			if (fis != null) {
				try {
					fis.close();
				} catch (IOException e) {
					hasErrors = Boolean.TRUE;
					String headerName = "";
					if(!headers.isEmpty() && headers.size()>=index){
						headerName = headers.get(index);
					}					
					errorMsg = "Error occured in Row:" + (rowIndex + 1)
							+ " and Column: " + (index + 1) + " ('"
							+ headerName + "') with message: "
							+ e.getMessage();	
					log.error(errorMsg, e);
				}
			}
		}
		
		return hasErrors;

	}
	
	/**
	 * Gets the fiskos data list.
	 *
	 * @return the fiskos data list
	 */
	public List<FiskosData> getFiskosDataList() {
		return fiskosDataList;
	}
	
	/**
	 * Gets the error msg.
	 *
	 * @return the error msg
	 */
	public String getErrorMsg() {
		return errorMsg;
	}
	
	/**
	 * Gets the last version nr.
	 *
	 * @return the last version nr
	 */
	public Long getLastVersionNr() {
		return lastVersionNr;
	}

	/**
	 * Creates the headers.
	 *
	 * @param sheet the sheet
	 */
	protected void createHeaders(XSSFSheet sheet) {
		Row row = sheet.getRow(0);
		Iterator<Cell> cellIterator = row.cellIterator();
		while (cellIterator.hasNext()) {
			Cell cell = cellIterator.next();
			headers.add(cell.getStringCellValue());
		}
	}

	/**
	 * Next.
	 *
	 * @return the int
	 */
	protected int next() {
		this.index = this.index + 1;
		return this.index;
	}

	/**
	 * Gets the s val.
	 *
	 * @param row the row
	 * @param index the index
	 * @return the s val
	 */
	protected String getSVal(Row row, int index) {
		Cell cell = row.getCell(index);
		if (cell != null) {
			if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
				Double ncv = cell.getNumericCellValue();
				return ncv.toString();
			} else if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
				return cell.getStringCellValue();
			}

		}
		return null;
	}

	/**
	 * Gets the i val.
	 *
	 * @param row the row
	 * @param index the index
	 * @return the i val
	 */
	protected Integer getIVal(Row row, int index) {
		Cell cell = row.getCell(index);
		if (cell != null) {
			if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
				Double ncv = cell.getNumericCellValue();
				return Integer.getInteger(ncv.toString());
			} else if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
				String val = cell.getStringCellValue();
				return Integer.getInteger(val);

			}
		}
		return null;
	}

	/**
	 * Gets the l val.
	 *
	 * @param row the row
	 * @param index the index
	 * @return the l val
	 */
	protected Long getLVal(Row row, int index) {
		Cell cell = row.getCell(index);
		if (cell != null) {
			if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
				Double numericCellValue = cell.getNumericCellValue();
				return numericCellValue.longValue();
			} else if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
				String val = cell.getStringCellValue();
				if(StringUtils.isNumeric(val))
					return new Long(val).longValue();
			}
		}
		return null;
	}

	/**
	 * Gets the d val.
	 *
	 * @param row the row
	 * @param index the index
	 * @return the d val
	 */
	protected Double getDVal(Row row, int index) {
		Cell cell = row.getCell(index);
		if (cell != null) {
			if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
				return cell.getNumericCellValue();
			} else if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
				String scv = cell.getStringCellValue();
				return Double.parseDouble(scv);
			}
		}
		return null;

	}

	/**
	 * Gets the date val.
	 *
	 * @param row the row
	 * @param index the index
	 * @return the date val
	 * @throws ParseException the parse exception
	 */
	protected Date getDateVal(Row row, int index) throws ParseException {
		Cell cell = row.getCell(index);
		if (cell != null) {
			String val = row.getCell(index).getStringCellValue();
			// 8/1/2011 12:00:00 AM
			//String pattern = "MM/dd/yyyy hh:mm:ss a";
			//DateTimeFormatter format = DateTimeFormatter.ofPattern(pattern);
			// LocalDateTime ldt = LocalDateTime.parse(val, format);
			// System.out.println(ldt);
			// Date parseDate =
			// org.apache.commons.lang3.time.DateUtils.parseDate(val, pattern);
			
			SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy hh:mm:ss a");
			Date newDate = sdf.parse(val);
			return newDate;
		}
		return null;
	}

	/**
	 * Gets the fiskos import.
	 *
	 * @return the fiskos import
	 */
	public FiskosImport getFiskosImport() {
		return fiskosImport;
	}

	/**
	 * Gets the prev fiskos import.
	 *
	 * @return the prev fiskos import
	 */
	public FiskosImport getPrevFiskosImport() {
		return prevFiskosImport;
	}
	
	/**
	 * Gets the prev MUP.
	 *
	 * @return the prev MUP
	 */
	public ManagementUnitPeriod getPrevMUP() {
		return prevMUP;
	}
	
	/**
	 * Gets the mup.
	 *
	 * @return the mup
	 */
	public ManagementUnitPeriod getMup() {
		return mup;
	}
	
	/**
	 * Find prev MUP.
	 *
	 * @return true, if successful
	 */
	protected boolean findPrevMUP(){
		String query = "select * from TGIS_MU_PERIOD where isactive = 'Y' and mu_id = " + muId;
		List<ManagementUnitPeriod> res = DAOFactory.getFactory().getManagementUnitPeriodDAO().executeSQLQuery(query);
		if(res!=null && !res.isEmpty()){
			if(res.size()>1){
				errorMsg = "The previos data set from TGIS_MU_PERIOD coudn't be determinated. (Info: Region:" + region.getName() + ", Management Unit: " + mu.getMuName() + ")";
				log.info(errorMsg);
				log.info(query);
				return false;				
			}else{
				prevMUP = res.get(0);
				prevMUP.setIsactive("N");
				prevMUP.setEmployeeByUpdatedBy(employee);
				prevMUP.setUpdatedDate(currentDate);
			}
		}
		return true;
	}
	
	/**
	 * Find prev fiskos import.
	 *
	 * @return true, if successful
	 */
	protected boolean findPrevFiskosImport(){
		String query = "select * from tfrm_fiskos_import where isactive = 'Y' and region_id = " + regionId + " and mu_id = " + muId;
		List<FiskosImport> res = DAOFactory.getFactory().getFiskosImportDAO().executeSQLQuery(query);
		if(res!=null && !res.isEmpty()){
			if(res.size()>1){
				errorMsg = "The previos data set from tfrm_fiskos_import coudn't be determinated. (Info: Region:" + region.getName() + ", Management Unit: " + mu.getMuName() + ")";
				log.info(errorMsg);
				log.info(query);
				return false;
			}else{
				prevFiskosImport = res.get(0);
				prevFiskosImport.setIsactive("N");
				prevFiskosImport.setChangedDate(currentDate);
				prevFiskosImport.setPersonByChangedBy(person);
				nextVersionNr += prevFiskosImport.getVersionNr();
			}
		}		
		return true;
	}
	
	/**
	 * Find municipality.
	 *
	 * @param term the term
	 * @return the cadastral municipality
	 */
	protected CadastralMunicipality findMunicipality(String term){
		CadastralMunicipality cm = null;
		if(StringUtils.isNotEmpty(term)){
			String query = "select * from tgis_cadastral_municipality where name ilike '%" + term + "%' or name_en ilike '%" + term + "%' or name_sr ilike '%" + term + "%'";
			List<CadastralMunicipality> list = DAOFactory.getFactory().getCadastralMunicipalityDAO().executeSQLQuery(query);
			if(list!=null && !list.isEmpty()){
				cm = list.get(0);
			}else{
				int middle = term.length() / 2;
				String first = term.substring(0, middle);
				String last = term.substring(middle+1);
				query = "select * from tgis_cadastral_municipality where name ilike '%" + first + "%' or name_en ilike '%" + first + "%' or name_sr ilike '%" + first + "%'";
				list = DAOFactory.getFactory().getCadastralMunicipalityDAO().executeSQLQuery(query);
				if(list!=null && !list.isEmpty()){
					cm = list.get(0);
				}else{
					query = "select * from tgis_cadastral_municipality where name ilike '%" + last + "%' or name_en ilike '%" + last + "%' or name_sr ilike '%" + last + "%'";
					list = DAOFactory.getFactory().getCadastralMunicipalityDAO().executeSQLQuery(query);
					if(list!=null && !list.isEmpty()){
						cm = list.get(0);
					}
				}
			}
		}
		
		return cm;
	}
	
	/**
	 * Find tree species.
	 *
	 * @param term the term
	 * @return the long
	 */
	protected Long findTreeSpecies(String term){
		Long tsId = null;
		TreeSpecies ts = null;
		if(StringUtils.isNotEmpty(term)){
			String query = "select * from tfrm_tree_species where name_al ilike '%" + term + "%' or name_en ilike '%" + term + "%' or name_sr ilike '%" + term + "%'";
			List<TreeSpecies> list = DAOFactory.getFactory().getTreeSpeciesDAO().executeSQLQuery(query);
			if(list!=null && !list.isEmpty()){
				ts = list.get(0);
				tsId = ts.getId();
			}else{
				int middle = term.length() / 2;
				String first = term.substring(0, middle);
				String last = term.substring(middle+1);
				query = "select * from tfrm_tree_species where name_al ilike '%" + first + "%' or name_en ilike '%" + first + "%' or name_sr ilike '%" + first + "%'";
				list = DAOFactory.getFactory().getTreeSpeciesDAO().executeSQLQuery(query);
				if(list!=null && !list.isEmpty()){
					ts = list.get(0);
					tsId = ts.getId();
				}else{
					query = "select * from tfrm_tree_species where name_al ilike '%" + last + "%' or name_en ilike '%" + last + "%' or name_sr ilike '%" + last + "%'";
					list = DAOFactory.getFactory().getTreeSpeciesDAO().executeSQLQuery(query);
					if(list!=null && !list.isEmpty()){
						ts = list.get(0);
						tsId = ts.getId();
					}
				}
			}
		}
		
		
		return tsId;
	}
}
