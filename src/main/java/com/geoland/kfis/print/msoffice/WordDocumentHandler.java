package com.geoland.kfis.print.msoffice;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.math.BigInteger;
import java.security.InvalidKeyException;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.Signature;
import java.security.SignatureException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBElement;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;
import javax.xml.namespace.QName;
import javax.xml.transform.stream.StreamSource;

import org.apache.commons.lang.StringUtils;
import org.docx4j.XmlUtils;
import org.docx4j.dml.wordprocessingDrawing.Inline;
import org.docx4j.jaxb.Context;
import org.docx4j.model.structure.SectionWrapper;
import org.docx4j.openpackaging.exceptions.Docx4JException;
import org.docx4j.openpackaging.packages.WordprocessingMLPackage;
import org.docx4j.openpackaging.parts.Part;
import org.docx4j.openpackaging.parts.WordprocessingML.BinaryPartAbstractImage;
import org.docx4j.openpackaging.parts.WordprocessingML.DocumentSettingsPart;
import org.docx4j.openpackaging.parts.WordprocessingML.FooterPart;
import org.docx4j.openpackaging.parts.WordprocessingML.MainDocumentPart;
import org.docx4j.openpackaging.parts.relationships.Namespaces;
import org.docx4j.openpackaging.parts.relationships.RelationshipsPart;
import org.docx4j.relationships.Relationship;
import org.docx4j.wml.BooleanDefaultTrue;
import org.docx4j.wml.CTBorder;
import org.docx4j.wml.CTDocProtect;
import org.docx4j.wml.CTSettings;
import org.docx4j.wml.CTVerticalJc;
import org.docx4j.wml.ContentAccessor;
import org.docx4j.wml.Document;
import org.docx4j.wml.FldChar;
import org.docx4j.wml.FooterReference;
import org.docx4j.wml.Ftr;
import org.docx4j.wml.HdrFtrRef;
import org.docx4j.wml.HpsMeasure;
import org.docx4j.wml.Jc;
import org.docx4j.wml.JcEnumeration;
import org.docx4j.wml.ObjectFactory;
import org.docx4j.wml.P;
import org.docx4j.wml.PPr;
import org.docx4j.wml.R;
import org.docx4j.wml.RPr;
import org.docx4j.wml.STAlgClass;
import org.docx4j.wml.STAlgType;
import org.docx4j.wml.STBorder;
import org.docx4j.wml.STCryptProv;
import org.docx4j.wml.STDocProtect;
import org.docx4j.wml.STHint;
import org.docx4j.wml.STVerticalJc;
import org.docx4j.wml.SectPr;
import org.docx4j.wml.Tbl;
import org.docx4j.wml.TblBorders;
import org.docx4j.wml.TblPr;
import org.docx4j.wml.TblWidth;
import org.docx4j.wml.Tc;
import org.docx4j.wml.TcPr;
import org.docx4j.wml.TcPrInner.GridSpan;
import org.docx4j.wml.TcPrInner.HMerge;
import org.docx4j.wml.TcPrInner.VMerge;
import org.docx4j.wml.Text;
import org.docx4j.wml.Tr;
import org.docx4j.wml.TrPr;
import org.krysalis.barcode4j.impl.code39.Code39Bean;
import org.krysalis.barcode4j.output.bitmap.BitmapCanvasProvider;


// TODO: Auto-generated Javadoc
/**
 * The Class WordDocumentHandler.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created Mar 13, 2013 8:27:33 PM
 */
public class WordDocumentHandler {
	
	/** The factory. */
	private ObjectFactory factory;
	
	/** The word ML package. */
	private WordprocessingMLPackage wordMLPackage;
	
	/** The document part. */
	private MainDocumentPart documentPart;
	
	/** The template. */
	private String template;
	
	
	/**
	 * Instantiates a new word document handler.
	 *
	 * @param template the template
	 */
	public WordDocumentHandler(String template){
		this.template = template;
	}
	
	/**
	 * Gets the word ML package.
	 *
	 * @return the word ML package
	 */
	public WordprocessingMLPackage getWordMLPackage() {
		return wordMLPackage;
	}
	
	/**
	 * Process.
	 *
	 * @throws Exception the exception
	 */
	public void process() throws Exception {
		File file = new java.io.File(template);
		factory = Context.getWmlObjectFactory();
		
		wordMLPackage = WordprocessingMLPackage.load(file);
		documentPart = wordMLPackage.getMainDocumentPart();	
		
		// unmarshallFromTemplate requires string input		
		String xml = XmlUtils.marshaltoString(documentPart.getJaxbElement(), true);		
		HashMap<String, String> mappings = new HashMap<String, String>();		
		mappings.put("colour", "green");
		mappings.put("icecream", "chocolate");
		mappings.put("row1", "chocolate");
		mappings.put("row2", "chocolate");
		mappings.put("mytest", "chocolate");
		mappings.put("mytest1", "rot");
		mappings.put("mytest2", "grün");
		
		// Do it...		
		Object obj = XmlUtils.unmarshallFromTemplate(xml, mappings);		
		// Inject result into docx		
		documentPart.setJaxbElement((Document) obj);		
	}

	/**
	 * Process.
	 *
	 * @param mappings the mappings
	 * @throws Exception the exception
	 */
	public void process(HashMap<String, String> mappings) throws Exception {
		File file = new java.io.File(template);
		factory = Context.getWmlObjectFactory();
		wordMLPackage = WordprocessingMLPackage.load(file);
		documentPart = wordMLPackage.getMainDocumentPart();	

		/**unmarshallFromTemplate requires string input*/
		String xml = XmlUtils.marshaltoString(documentPart.getJaxbElement(), true);		
		Object obj = XmlUtils.unmarshallFromTemplate(xml, mappings);
		documentPart.setJaxbElement((Document) obj);
		/**Inject result into DOCX*/			
		
		processFooter(mappings);
	}
	
	/**
	 * Process footer.
	 *
	 * @param mappings the mappings
	 */
	protected void processFooter(HashMap<String, String> mappings){
		RelationshipsPart rp = wordMLPackage.getMainDocumentPart().getRelationshipsPart();
		for ( Relationship r : rp.getRelationships().getRelationship() ) {
			Part part = rp.getPart(r);
			if (part instanceof FooterPart) {
				FooterPart footerPart = (FooterPart) part;
	            Ftr ftr = footerPart.getJaxbElement();
	            String footerXML = XmlUtils.marshaltoString(ftr, true);
	            //log.info(footerXML);
	            //System.out.println(footerXML);					
	            Object footerObj = null;
	            try {
	              footerObj = XmlUtils.unmarshallFromTemplate(footerXML, mappings);
	            } catch (JAXBException e) {
                    e.printStackTrace();
                    System.out.println(e.getMessage());
	            }
	            if (footerObj != null) {
                    footerPart.setJaxbElement((Ftr) footerObj);
	            }		            
			}
		}		
	}
	
	/**
	 * Process old.
	 *
	 * @param mappings the mappings
	 * @throws Exception the exception
	 */
	public void processOld(HashMap<String, String> mappings) throws Exception {
		File file = new java.io.File(template);
		factory = Context.getWmlObjectFactory();
		
		wordMLPackage = WordprocessingMLPackage.load(file);
		documentPart = wordMLPackage.getMainDocumentPart();	
		
		/**unmarshallFromTemplate requires string input*/
		/*
		String xml = XmlUtils.marshaltoString(documentPart.getJaxbElement(), true);		
		Object obj = XmlUtils.unmarshallFromTemplate(xml, mappings);
		documentPart.setJaxbElement((Document) obj);
		*/
		/**Inject result into DOCX*/		
			
		
		setReadOnly(wordMLPackage, true);
		
		/*
		StringBuffer buf = new StringBuffer();
		buf.append("<w:settings xmlns:w=\"http://schemas.openxmlformats.org/wordprocessingml/2006/main\">");
		buf.append("<w:documentProtection w:edit=\"readOnly\" w:enforcement=\"0\"/>");
		buf.append("</w:settings>");	
		Object protectPart = XmlUtils.unmarshalString(buf.toString());
		documentPart.getContent().add(protectPart);
		*/
		/*
		DocumentSettingsPart dsp = documentPart.getDocumentSettingsPart();
		CTDocProtect protect = dsp.getJaxbElement().getDocumentProtection();
		if(protect==null){
			protect = factory.createCTDocProtect();
			protect.setEdit(STDocProtect.READ_ONLY);
			//protect.setEnforcement(true);
			
			
			protect.setCryptProviderType(STCryptProv.RSA_AES);
			protect.setCryptAlgorithmClass(STAlgClass.HASH);
			protect.setCryptAlgorithmType(STAlgType.TYPE_ANY);
			protect.setCryptAlgorithmSid(BigInteger.valueOf(4));
			protect.setCryptProviderTypeExt("noaccess2013");
			protect.setCryptSpinCount(BigInteger.valueOf(100000));
			protect.setHash(signature("noaccess2013"));
			
			//protect.setSalt(???);
			protect.setHash(new String("9oN7nWkCAyEZib1RomSJTjmPpCY=").getBytes());
			dsp.getJaxbElement().setDocumentProtection(protect);
		}
		*/
		
	}
	
	/**
	 * Sets the read only.
	 *
	 * @param wordPackage the word package
	 * @param isReadOnly the is read only
	 * @throws Exception the exception
	 */
	public static void setReadOnly(WordprocessingMLPackage wordPackage, boolean isReadOnly) throws Exception {
		byte[] bt = "".getBytes();
		if (isReadOnly) {
			bt = "123456".getBytes();
		}
		ObjectFactory factory = Context.getWmlObjectFactory();
		DocumentSettingsPart ds = wordPackage.getMainDocumentPart()
				.getDocumentSettingsPart();
		if (ds == null) {
			ds = new DocumentSettingsPart();
		}
		CTSettings cs = ds.getJaxbElement();
		if (cs == null) {
			cs = factory.createCTSettings();
		}
		CTDocProtect cp = cs.getDocumentProtection();
		if (cp == null) {
			cp = new CTDocProtect();
		}
		cp.setCryptProviderType(STCryptProv.RSA_AES);
		cp.setCryptAlgorithmClass(STAlgClass.HASH);
		cp.setCryptAlgorithmType(STAlgType.TYPE_ANY);
		cp.setCryptAlgorithmSid(new BigInteger("4"));
		cp.setCryptSpinCount(new BigInteger("50000"));
		if (isReadOnly) {
			cp.setEdit(STDocProtect.READ_ONLY);
			cp.setHash(bt);
			cp.setSalt(bt);
			cp.setEnforcement(true);
			cp.setFormatting(true);
		} else {
			cp.setEdit(STDocProtect.NONE);
			cp.setHash(null);
			cp.setSalt(null);
			cp.setEnforcement(false);
			cp.setFormatting(false);
		}

		cs.setDocumentProtection(cp);
		ds.setJaxbElement(cs);
		wordPackage.getMainDocumentPart().addTargetPart(ds);
	}	
	
	/**
	 * Signature.
	 *
	 * @param pwd the pwd
	 * @return the byte[]
	 * @throws NoSuchAlgorithmException the no such algorithm exception
	 * @throws InvalidKeyException the invalid key exception
	 * @throws SignatureException the signature exception
	 */
	protected byte[] signature(String pwd) throws NoSuchAlgorithmException, InvalidKeyException, SignatureException{
		// Generate new key
		KeyPair keyPair = KeyPairGenerator.getInstance("RSA").generateKeyPair();
		PrivateKey privateKey = keyPair.getPrivate();

		// Compute signature
		Signature instance = Signature.getInstance("SHA1withRSA");
		instance.initSign(privateKey);
		instance.update((pwd).getBytes());
		byte[] signature = instance.sign();
		return signature;
	}
	
	/**
	 * Sets the cell merge.
	 *
	 * @param tc the tc
	 * @param currentRow the current row
	 * @param startRow the start row
	 * @param rowSpan the row span
	 * @param currentCol the current col
	 * @param startCol the start col
	 * @param colSpan the col span
	 */
    public static void setCellMerge(Tc tc , int currentRow , int startRow , int rowSpan , int currentCol , int startCol , int colSpan){  
        ObjectFactory factory = Context.getWmlObjectFactory();  
        TcPr tcpr = tc.getTcPr();  
        if(tcpr == null){  
            tcpr = factory.createTcPr();  
        }  
        
        if(colSpan > 1){  
            if(currentRow == startRow){  
                if(currentCol == startCol){  
                    HMerge hm = factory.createTcPrInnerHMerge();  
                    hm.setVal("restart");  
                    tcpr.setHMerge(hm);  
                    tc.setTcPr(tcpr);  
                }else if(currentCol > startCol && currentCol <= (startCol + colSpan - 1)){  
                    HMerge hm = factory.createTcPrInnerHMerge();  
                    tcpr.setHMerge(hm);  
                    tc.setTcPr(tcpr);  
                }  
            }  
        }  
        
        if(rowSpan > 1){  
            if(currentCol == startCol){  
                if(currentRow == startRow){  
                    VMerge vm = factory.createTcPrInnerVMerge();  
                    vm.setVal("restart");  
                    tcpr.setVMerge(vm);  
                    tc.setTcPr(tcpr);  
                }else if(currentRow > startRow && currentRow <= (startRow + rowSpan - 1)){  
                    VMerge vm = factory.createTcPrInnerVMerge();  
                    tcpr.setVMerge(vm);  
                    tc.setTcPr(tcpr);  
                }  
            }  
        }  
          
    } 	
	
	/**
	 * Adds the table content.
	 *
	 * @param index the index
	 */
	public void addTableContent(int index){
		List<Object> tables = getAllElementFromObject(documentPart, Tbl.class);
		for (int size = 0; size < tables.size(); size++) {
			Object tempTable = tables.get(index);
			if(size==1){
				List<Object> rows = getAllElementFromObject(tempTable, Tr.class);
				for (int i = 0; i < rows.size(); i++) {
					if (i == 0) {
					    Tbl myTbl = (Tbl) tempTable;
					    for(int j = 0; j<3;j++){
							Tr tableRow = factory.createTr();
							addTableCell(tableRow, "Field 1");
							addTableCell(tableRow, "Field 2");
							myTbl.getContent().add(tableRow);
					    }
				}
			}
		}
	  }
	}
	
	/**
	 * Gets the table.
	 *
	 * @param index the index
	 * @return the table
	 */
	public Object getTable(int index){
		List<Object> tables = getAllElementFromObject(documentPart, Tbl.class);		
		return tables.get(index);
//		if(tables!=null && index<tables.size()){
//			
//		}else{
//			return null;
//		}
	}
	
	/**
	 * Adds the table row.
	 *
	 * @param tableObj the table obj
	 * @param row the row
	 */
	public void addTableRow(Object tableObj, List<String> row){
		Tbl table = (Tbl) tableObj;
		Tr tableRow = factory.createTr();
		for (String content : row) {
			//addTableCell(tableRow, content);
			//addRegularTableCell(tableRow, content);
			addStyledTableCell(tableRow, content, false, "18");
		}
		table.getContent().add(tableRow);
		//addRegularTableCell(tableRow, "Normal text");
		//addStyledTableCell(tableRow, "Bold text", true, null);
		//addStyledTableCell(tableRow, "Bold large text", true, "40");
		//addTableCell(tc31, "content span 2x cols");
		//createTableCellGspan(wordMLPackage, tableRow1, 2);
		//addMergedCell(tableRow1, "test", "test2");
		//addTableRowWithMergedCells(null, null, "One", table);
	}

	/**
	 * Adds the table row.
	 *
	 * @param tableObj the table obj
	 * @param rowNr the row nr
	 * @param row the row
	 * @param startCol the start col
	 * @param colSpan the col span
	 */
	public void addTableRow(Object tableObj, int rowNr, List<String> row, int startCol , int colSpan){
		Tbl table = (Tbl) tableObj;
		Tr tableRow = factory.createTr();
		int countRow = 0;
		for (String content : row) {
			Tc tableCell = factory.createTc();
			addStyling(tableCell, content, false, "18");
			tableRow.getContent().add(tableCell);
			if(countRow==startCol){
				applyGridSpan(tableCell, colSpan);
			}
			countRow++;
		}
		table.getContent().add(rowNr, tableRow);
	}
	
	/**
	 * Adds the table row.
	 *
	 * @param tableObj the table obj
	 * @param row the row
	 * @param startCol the start col
	 * @param colSpan the col span
	 */
	public void addTableRow(Object tableObj, List<String> row, int startCol , int colSpan){
		Tbl table = (Tbl) tableObj;
		Tr tableRow = factory.createTr();
		int countRow = 0;
		for (String content : row) {
			Tc tableCell = factory.createTc();
			addStyling(tableCell, content, false, "18");
			tableRow.getContent().add(tableCell);
			if(countRow==startCol){
				applyGridSpan(tableCell, colSpan);
			}
			countRow++;
		}
		table.getContent().add(tableRow);
	}
	
	/**
	 * Apply grid span.
	 *
	 * @param cell the cell
	 * @param span the span
	 */
	protected void applyGridSpan( final Tc cell, final int span ) {
        TcPr tcPr = factory.createTcPr();
        TblWidth tblWidth = factory.createTblWidth();
        tblWidth.setType( "dxa" );
        //tblWidth.setW( BigInteger.valueOf( span ) ); //columnWidth * span
        //tcPr.setTcW( tblWidth  );
        if ( span > 1) {
            GridSpan gridSpan = factory.createTcPrInnerGridSpan();
            gridSpan.setVal(BigInteger.valueOf(span));
            tcPr.setGridSpan(gridSpan);
        }
        cell.setTcPr(tcPr);
    }
	
	/**
	 * Adds the table row.
	 *
	 * @param tableObj the table obj
	 * @param rowNr the row nr
	 * @param row the row
	 */
	public void addTableRow(Object tableObj, int rowNr, List<String> row){
		Tbl table = (Tbl) tableObj;
		Tr tableRow = factory.createTr();
		for (String content : row) {
			addStyledTableCell(tableRow, content, false, "18");
		}
		table.getContent().add(rowNr, tableRow);
	}

	/**
	 * Delete row.
	 *
	 * @param tableObj the table obj
	 * @param rowNr the row nr
	 */
	public void deleteRow(Object tableObj, int rowNr){
		Tbl table = (Tbl) tableObj;
		table.getContent().remove(rowNr);
	}
	
	/**
	 * Adds the table row.
	 *
	 * @param tableObj the table obj
	 * @param rowNr the row nr
	 * @param content the content
	 * @param colSpan the col span
	 */
	public void addTableRow(Object tableObj, int rowNr, String content, BigInteger colSpan){
		Tbl table = (Tbl) tableObj;
		Tr tableRow = factory.createTr();
		
		if(colSpan != null){
			TrPr pr3 = new TrPr();
			tableRow.setTrPr(pr3);

			Tc rowColsSpan = factory.createTc();
			TcPr tcPr3 = new TcPr();
			TblWidth width31 = new TblWidth();
			width31.setType("dxa");
			width31.setW(new BigInteger("0"));
			tcPr3.setTcW(width31);
			
			GridSpan gridSpan = new GridSpan();
			gridSpan.setVal(colSpan);
			tcPr3.setGridSpan(gridSpan);
		    rowColsSpan.setTcPr(tcPr3);
		
		    addStyling(rowColsSpan, content, false, "18");
		    
			tableRow.getContent().add(rowColsSpan);
			table.getContent().add(rowNr, tableRow);		    
		}
			
	}

	
	/**
	 * Adds the row span.
	 *
	 * @param tableObj the table obj
	 * @param colspan the colspan
	 * @param content the content
	 */
	public void addRowSpan(Object tableObj, String colspan, String content){
		Tbl table = (Tbl) tableObj;
		// create row 3
		Tr tr3 = factory.createTr();

		TrPr pr3 = new TrPr();
		tr3.setTrPr(pr3);

		Tc tc31 = factory.createTc();
		TcPr tcPr3 = new TcPr();
		TblWidth width31 = new TblWidth();
		width31.setType("dxa");
		width31.setW(new BigInteger("0"));
		tcPr3.setTcW(width31);
		

		GridSpan gridSpan = new GridSpan();
		gridSpan.setVal(new BigInteger(colspan));
		tcPr3.setGridSpan(gridSpan);
	    tc31.setTcPr(tcPr3);
		
	    
		
		addStyling(tc31, content, false, "18");
		//tc31.getEGBlockLevelElts().add(wordMLPackage.getMainDocumentPart().createParagraphOfText(content));

		tr3.getEGContentCellContent().add(tc31);
		table.getEGContentRowContent().add(tr3);		
	}
	
	
	/**
	 * Adds the tc V merge.
	 *
	 * @param tr the tr
	 * @param label the label
	 * @param text the text
	 * @param vMergeVal the v merge val
	 * @param width the width
	 */
	private void addTcVMerge(Tr tr, String label, String text, String vMergeVal, String width) {
		Tc tc = factory.createTc();
		TcPr tcPr = new TcPr();
		TblWidth tblwidth = new TblWidth();
		tblwidth.setType("dxa");
		tblwidth.setW(new BigInteger(width));
		tcPr.setTcW(tblwidth);

		VMerge merge = new VMerge();
		if (vMergeVal != null) {
			merge.setVal(vMergeVal);
		}
		tcPr.setVMerge(merge);

		tc.setTcPr(tcPr);
		if (text != null) {
			tc.getEGBlockLevelElts().add(
					wordMLPackage.getMainDocumentPart().createParagraphOfText(
							text));
		}

		tr.getEGContentCellContent().add(tc);
	}
	
	/**
	 * For horizontal merge, you can create a cell with the code below and insert into a table row.
	 *
	 * @param wordMLPackage the word ML package
	 * @param p the p
	 * @param gridspan the gridspan
	 * @return the tc
	 */
	private Tc createTableCellGspan(WordprocessingMLPackage wordMLPackage, P p, int gridspan) {
	    org.docx4j.wml.Tc tc = factory.createTc();
	    org.docx4j.wml.TcPr tcpr = factory.createTcPr();
	    tc.setTcPr(tcpr);
	    CTVerticalJc valign = factory.createCTVerticalJc();
	    valign.setVal(STVerticalJc.TOP);
	    tcpr.setVAlign(valign);
	    org.docx4j.wml.TcPrInner.GridSpan gspan = factory.createTcPrInnerGridSpan();
	    gspan.setVal(new BigInteger("" + gridspan));
	    tcpr.setGridSpan(gspan);
	    tc.getEGBlockLevelElts().add(p);
	    return tc;
	}
	

	/**
	 * For vertical merge, you can use the code below for your cell.
	 *
	 * @param wordMLPackage the word ML package
	 * @param p the p
	 * @param vMerge the v merge
	 * @return the tc
	 */
	public Tc createTableCellVMerge(WordprocessingMLPackage wordMLPackage, P p, String vMerge) {
	    org.docx4j.wml.Tc tc = factory.createTc();
	    org.docx4j.wml.TcPr tcpr = factory.createTcPr();
	    tc.setTcPr(tcpr);
	    CTVerticalJc valign = factory.createCTVerticalJc();
	    valign.setVal(STVerticalJc.TOP);
	    tcpr.setVAlign(valign);

	    org.docx4j.wml.TcPrInner.VMerge vm = factory.createTcPrInnerVMerge();
	    vm.setVal(vMerge);
	    tcpr.setVMerge(vm);

	    tc.getEGBlockLevelElts().add(p);
	    return tc;
    }
	
	
	/**
	 * Save.
	 *
	 * @param outputfilepath the outputfilepath
	 * @return the file
	 * @throws Docx4JException the docx 4 J exception
	 */
	public File save(String outputfilepath) throws Docx4JException{
		File file = new java.io.File(outputfilepath);
		try {
			setReadOnly(wordMLPackage, true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		wordMLPackage.save(file);
		return file;
	}
	
	
	/**
	 * In this method we add a table cell to the given row with the given
	 *  paragraph as content.
	 *
	 * @param tableRow the table row
	 * @param content the content
	 */	
    private void addTableCell(Tr tableRow, String content) {
		Tc tableCell = factory.createTc();
		tableCell.getContent().add(
			wordMLPackage.getMainDocumentPart().createParagraphOfText(content));
			
		tableRow.getContent().add(tableCell);
    }	
    
    /**
     * Gets the template.
     *
     * @param name the name
     * @return WordprocessingMLPackage
     * @throws Docx4JException the docx 4 J exception
     * @throws FileNotFoundException the file not found exception
     */
	private WordprocessingMLPackage getTemplate(String name) throws Docx4JException, FileNotFoundException {
		WordprocessingMLPackage template = WordprocessingMLPackage.load(new FileInputStream(new File(name)));
		return template;
	}
	
	/**
	 * Gets the all element from object.
	 *
	 * @param obj the obj
	 * @param toSearch the to search
	 * @return the all element from object
	 */
	private List<Object> getAllElementFromObject(Object obj, Class<?> toSearch) {
		List<Object> result = new ArrayList<Object>();
		if (obj instanceof JAXBElement) obj = ((JAXBElement<?>) obj).getValue();
 
		if (obj.getClass().equals(toSearch))
			result.add(obj);
		else if (obj instanceof ContentAccessor) {
			List<?> children = ((ContentAccessor) obj).getContent();
			for (Object child : children) {
				result.addAll(getAllElementFromObject(child, toSearch));
			}
 
		}
		return result;
	}	
	
	/**
	 * Replace placeholder.
	 *
	 * @param template the template
	 * @param name the name
	 * @param placeholder the placeholder
	 */
	private void replacePlaceholder(WordprocessingMLPackage template, String name, String placeholder ) {
		List<Object> texts = getAllElementFromObject(template.getMainDocumentPart(), Text.class);
 
		for (Object text : texts) {
			Text textElement = (Text) text;
			if (textElement.getValue().equals(placeholder)) {
				textElement.setValue(name);
			}
		}
	}	
	
	/**
	 * Write docx to stream.
	 *
	 * @param template the template
	 * @param target the target
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws Docx4JException the docx 4 J exception
	 */
	private void writeDocxToStream(WordprocessingMLPackage template, String target) throws IOException, Docx4JException {
		File f = new File(target);
		template.save(f);
	}	
	
	/**
	 * Replace paragraph.
	 *
	 * @param placeholder the placeholder
	 * @param textToAdd the text to add
	 * @param template the template
	 * @param addTo the add to
	 */
	private void replaceParagraph(String placeholder, String textToAdd, WordprocessingMLPackage template, ContentAccessor addTo) {
		// 1. get the paragraph
		List<Object> paragraphs = getAllElementFromObject(template.getMainDocumentPart(), P.class);
 
		P toReplace = null;
		for (Object p : paragraphs) {
			List<Object> texts = getAllElementFromObject(p, Text.class);
			for (Object t : texts) {
				Text content = (Text) t;
				if (content.getValue().equals(placeholder)) {
					toReplace = (P) p;
					break;
				}
			}
		}
 
		// we now have the paragraph that contains our placeholder: toReplace
		// 2. split into seperate lines
		String as[] = StringUtils.splitPreserveAllTokens(textToAdd, '\n');
 
		for (int i = 0; i < as.length; i++) {
			String ptext = as[i];
			if(toReplace!=null){
			// 3. copy the found paragraph to keep styling correct
			P copy = (P) XmlUtils.deepCopy(toReplace);
 
			// replace the text elements from the copy
			List<?> texts = getAllElementFromObject(copy, Text.class);
			if (texts.size() > 0) {
				Text textToReplace = (Text) texts.get(0);
				textToReplace.setValue(ptext);
			}
 
			// add the paragraph to the document
			addTo.getContent().add(copy);
			}
		}
 
		// 4. remove the original one
		if(toReplace!=null){
		((ContentAccessor)toReplace.getParent()).getContent().remove(toReplace);
		}
 
	}
	
	/**
	 * Replace table.
	 *
	 * @param placeholders the placeholders
	 * @param textToAdd the text to add
	 * @param template the template
	 * @throws Docx4JException the docx 4 J exception
	 * @throws JAXBException the JAXB exception
	 */
	private void replaceTable(String[] placeholders, List<Map<String, String>> textToAdd,
			WordprocessingMLPackage template) throws Docx4JException, JAXBException {
		List<Object> tables = getAllElementFromObject(template.getMainDocumentPart(), Tbl.class);
 
		// 1. find the table
		Tbl tempTable = getTemplateTable(tables, placeholders[0]);
		
		List<Object> rows = getAllElementFromObject(tempTable, Tr.class);
 
		// first row is header, second row is content
		if (rows.size() == 2) {
			// this is our template row
			Tr templateRow = (Tr) rows.get(1);
 
			for (Map<String, String> replacements : textToAdd) {
				// 2 and 3 are done in this method
				addRowToTable(tempTable, templateRow, replacements);
			}
 
			// 4. remove the template row
			tempTable.getContent().remove(templateRow);
		}
	}	
	
	/**
	 * Gets the template table.
	 *
	 * @param tables the tables
	 * @param templateKey the template key
	 * @return the template table
	 * @throws Docx4JException the docx 4 J exception
	 * @throws JAXBException the JAXB exception
	 */
	private Tbl getTemplateTable(List<Object> tables, String templateKey) throws Docx4JException, JAXBException {
		for (Iterator<Object> iterator = tables.iterator(); iterator.hasNext();) {
			Object tbl = iterator.next();
			List<?> textElements = getAllElementFromObject(tbl, Text.class);
			for (Object text : textElements) {
				Text textElement = (Text) text;
				if (textElement.getValue() != null && textElement.getValue().equals(templateKey))
					return (Tbl) tbl;
			}
		}
		return null;
	}	
	
	/**
	 * Adds the row to table.
	 *
	 * @param reviewtable the reviewtable
	 * @param templateRow the template row
	 * @param replacements the replacements
	 */
	private void addRowToTable(Tbl reviewtable, Tr templateRow, Map<String, String> replacements) {
		Tr workingRow = (Tr) XmlUtils.deepCopy(templateRow);
		List<?> textElements = getAllElementFromObject(workingRow, Text.class);
		for (Object object : textElements) {
			Text text = (Text) object;
			String replacementValue = (String) replacements.get(text.getValue());
			if (replacementValue != null)
				text.setValue(replacementValue);
		}
 
		reviewtable.getContent().add(workingRow);
	}	

	/**
	 *  In this method we create a row, add the merged column to it, and then
	 *  add two regular cells to it. Then we add the row to the table.
	 *
	 * @param mergedContent the merged content
	 * @param field1Content the field 1 content
	 * @param field2Content the field 2 content
	 * @param table the table
	 */
	public void addTableRowWithMergedCells(String mergedContent,
			String field1Content, String field2Content, Tbl table) {
		Tr tableRow1 = factory.createTr();

		addMergedColumn(tableRow1, mergedContent);

		addTableCell(tableRow1, field1Content);
		addTableCell(tableRow1, field2Content);

		table.getContent().add(tableRow1);
	}

	/**
	 *  In this method we add a column cell that is merged with cells in other
	 *  rows. If the given content is null, we pass on empty content and a merge
	 *  value of null.
	 *
	 * @param row the row
	 * @param content the content
	 */
	private void addMergedColumn(Tr row, String content) {
		if (content == null) {
			addMergedCell(row, "", null);
		} else {
			addMergedCell(row, content, "restart");
		}
	}

	/**
	 *  We create a table cell and then a table cell properties object.
	 *  We also create a vertical merge object. If the merge value is not null,
	 *  we set it on the object. Then we add the merge object to the table cell
	 *  properties and add the properties to the table cell. Finally we set the
	 *  content in the table cell and add the cell to the row.
	 * 
	 *  If the merge value is 'restart', a new row is started. If it is null, we
	 *  continue with the previous row, thus merging the cells.
	 *
	 * @param row the row
	 * @param content the content
	 * @param vMergeVal the v merge val
	 */
	public void addMergedCell(Tr row, String content, String vMergeVal) {
		Tc tableCell = factory.createTc();
		TcPr tableCellProperties = new TcPr();

		VMerge merge = new VMerge();
		if(vMergeVal != null){
			merge.setVal(vMergeVal);
		}
		tableCellProperties.setVMerge(merge);

		tableCell.setTcPr(tableCellProperties);
		if(content != null) {
	    		tableCell.getContent().add(
				wordMLPackage.getMainDocumentPart().
					createParagraphOfText(content));
		}

  		row.getContent().add(tableCell);
  	}

	
	

	/**
	 *  In this method we'll add the borders to the table.
	 *
	 * @param table the table
	 */
	@SuppressWarnings("unused")
	private void addBorders(Tbl table) {
		table.setTblPr(new TblPr());
		CTBorder border = new CTBorder();
		border.setColor("auto");
		border.setSz(new BigInteger("4"));
		border.setSpace(new BigInteger("0"));
		border.setVal(STBorder.SINGLE);

		TblBorders borders = new TblBorders();
		borders.setBottom(border);
		borders.setLeft(border);
		borders.setRight(border);
		borders.setTop(border);
		borders.setInsideH(border);
		borders.setInsideV(border);
		table.getTblPr().setTblBorders(borders);
	}
	
	
	/**
	 *  In this method we create a table cell,add the styling and add the cell to
	 *  the table row.
	 *
	 * @param tableRow the table row
	 * @param content the content
	 * @param bold the bold
	 * @param fontSize the font size
	 */
	private void addStyledTableCell(Tr tableRow, String content,
						boolean bold, String fontSize) {
		Tc tableCell = factory.createTc();
		addStyling(tableCell, content, bold, fontSize);
		tableRow.getContent().add(tableCell);
	}
	
    /**
     *       
     * Convenience method that creates the JAXBElement to contain the given complex    
     *  *  field character. 
     *
     * @param fldchar     *  @return
     * @return the wrapped fld char
     */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static JAXBElement getWrappedFldChar(FldChar fldchar) {
		return new JAXBElement(new QName(Namespaces.NS_WORD12, "fldChar"),
				FldChar.class, fldchar);
	}

	/** The context. */
	public static JAXBContext context = org.docx4j.jaxb.Context.jc;
	
	/**
	 * Gets the check box JAXB.
	 *
	 * @return the check box JAXB
	 */
	private String getCheckBoxJAXB(){
		StringBuilder buf = new StringBuilder();
		buf.append("<w:p xmlns:w=\"http://schemas.openxmlformats.org/wordprocessingml/2006/main\" w:rsidP=\"006008C5\" w:rsidR=\"004A1992\" w:rsidRDefault=\"004A1992\">");
	    buf.append("<w:pPr>");
	        buf.append("<w:keepNext/>");
	        buf.append("<w:spacing w:before=\"120\"/>");
	        buf.append("<w:jc w:val=\"center\"/>");
	        buf.append("<w:rPr>");
	            buf.append("<w:rFonts w:ascii=\"Book Antiqua\" w:cs=\"Arial\" w:hAnsi=\"Book Antiqua\"/>");
	            buf.append("<w:b/>");
	            buf.append("<w:sz w:val=\"18\"/>");
	            buf.append("<w:szCs w:val=\"18\"/>");
	         buf.append("</w:rPr>");
	     buf.append("</w:pPr>");
	    buf.append("<w:r>");
	        buf.append("<w:rPr>");
	            buf.append("<w:rFonts w:ascii=\"Book Antiqua\" w:cs=\"Arial\" w:hAnsi=\"Book Antiqua\"/>");
	            buf.append("<w:b/>");
	            buf.append("<w:sz w:val=\"18\"/>");
	            buf.append("<w:szCs w:val=\"18\"/>");
	         buf.append("</w:rPr>");
	        buf.append("<w:t>Bbi1</w:t>");
	     buf.append("</w:r>");
	    buf.append("<w:sdt>");
	        buf.append("<w:sdtPr>");
	            buf.append("<w:rPr>");
	                buf.append("<w:rFonts w:ascii=\"Book Antiqua\" w:cs=\"Arial\" w:hAnsi=\"Book Antiqua\"/>");
	                buf.append("<w:b/>");
	                buf.append("<w:sz w:val=\"18\"/>");
	                buf.append("<w:szCs w:val=\"18\"/>");
	             buf.append("</w:rPr>");
	            buf.append("<w:id w:val=\"-2016689838\"/>");
	         buf.append("</w:sdtPr>");
	        buf.append("<w:sdtContent>");
	            buf.append("<w:r>");
	                buf.append("<w:rPr>");
	                    buf.append("<w:rFonts w:ascii=\"MS Gothic\" w:cs=\"Arial\" w:eastAsia=\"MS Gothic\" w:hAnsi=\"Book Antiqua\" w:hint=\"eastAsia\"/>");
	                    buf.append("<w:b/>");
	                    buf.append("<w:sz w:val=\"18\"/>");
	                    buf.append("<w:szCs w:val=\"18\"/>");
	                 buf.append("</w:rPr>");
	                buf.append("<w:t>â˜?</w:t>");
	             buf.append("</w:r>");
	         buf.append("</w:sdtContent>");
	     buf.append("</w:sdt>");
	 buf.append("</w:p>");	
	 
	 return buf.toString();
	}
	
	/** The random. */
	Random random = new Random();
	
	/**
	 * Gets the check box.
	 *
	 * @param checked the checked
	 * @return the check box
	 */
	public String getCheckBox(boolean checked){
		 StringBuilder buf3 = new StringBuilder();
		 buf3.append("<w:p xmlns:w=\"http://schemas.openxmlformats.org/wordprocessingml/2006/main\" w:rsidP=\"008E27CD\" w:rsidR=\"006A5473\" w:rsidRDefault=\"004D597C\" w:rsidRPr=\"00C67021\">");
		    buf3.append("<w:pPr>");
		    	buf3.append("<w:jc w:val=\"center\"/>");
		        buf3.append("<w:rPr>");
		            buf3.append("<w:rFonts w:ascii=\"Book Antiqua\" w:cs=\"Arial\" w:hAnsi=\"Book Antiqua\"/>");
		            buf3.append("<w:sz w:val=\"18\"/>");
		            buf3.append("<w:szCs w:val=\"18\"/>");
		        buf3.append("</w:rPr>");
		    buf3.append("</w:pPr>");
		    buf3.append("<w:r>");
		        buf3.append("<w:rPr>");
		        	buf3.append("<w:vAlign w:val=\"center\"/>");
		            buf3.append("<w:rFonts w:ascii=\"Book Antiqua\" w:cs=\"Arial\" w:hAnsi=\"Book Antiqua\"/>");
		            buf3.append("<w:sz w:val=\"28\"/>");
		            buf3.append("<w:szCs w:val=\"18\"/>");
		        buf3.append("</w:rPr>");
		        /*buf3.append("<w:t>bbi</w:t>");*/
		    buf3.append("</w:r>");
		    String name = random.nextInt() + "_GoBack";
		    buf3.append("<w:bookmarkStart w:id=\"0\" w:name=\"" + name + "\"/>");
		    buf3.append("<w:bookmarkEnd w:id=\"0\"/>");
		    buf3.append("<w:r w:rsidR=\"006A5473\" w:rsidRPr=\"00AE4AF4\">");
		        buf3.append("<w:rPr>");
		        	buf3.append("<w:vAlign w:val=\"center\"/>");
		            buf3.append("<w:rFonts w:ascii=\"Book Antiqua\" w:cs=\"Arial\" w:hAnsi=\"Book Antiqua\"/>");
		            buf3.append("<w:sz w:val=\"28\"/>");
		            buf3.append("<w:szCs w:val=\"18\"/>");
		            buf3.append("</w:rPr>");
		            
		            if(checked){
		            	buf3.append("<w:sym w:char=\"F078\" w:font=\"Wingdings\"/>");
		            }else{
		            	buf3.append("<w:sym w:char=\"F071\" w:font=\"Wingdings\"/>");
		            }
		    buf3.append("</w:r>");
		buf3.append("</w:p>");
		
		return buf3.toString();
	}
	
	/**
	 *  This is where we add the actual styling information. In order to do this
	 *  we first create a paragraph. Then we create a text with the content of
	 *  the cell as the value. Thirdly, we create a so-called run, which is a
	 *  container for one or more pieces of text having the same set of
	 *  properties, and add the text to it. We then add the run to the content
	 *  of the paragraph.
	 *  So far what we've done still doesn't add any styling. To accomplish that,
	 *  we'll create run properties and add the styling to it. These run
	 *  properties are then added to the run. Finally the paragraph is added
	 *  to the content of the table cell.
	 *  http://blog.iprofs.nl/2012/09/06/creating-word-documents-with-docx4j/
	 *
	 * @param tableCell the table cell
	 * @param content the content
	 * @param bold the bold
	 * @param fontSize the font size
	 */
	private void addStyling(Tc tableCell, String content,
					boolean bold, String fontSize) {
		
		if(StringUtils.isNotEmpty(content) && content.startsWith("checkbox")){
			try {
				if(content.indexOf("=true")>0){
					Object checkbox = XmlUtils.unmarshalString(getCheckBox(true));
					tableCell.getContent().add(checkbox);
				}else{
					Object checkbox = XmlUtils.unmarshalString(getCheckBox(false));
					tableCell.getContent().add(checkbox);
				}
				
			} catch (JAXBException e) {
				e.printStackTrace();
			}
			
		}else{
			P paragraph = factory.createP();
		
			Text text = factory.createText();
			text.setValue(content);
	
			R run = factory.createR();
			run.getContent().add(text);

			paragraph.getContent().add(run);
	
			RPr runProperties = factory.createRPr();
			if (bold) {
				addBoldStyle(runProperties);
			}
	
			if (fontSize != null && !fontSize.isEmpty()) {
				setFontSize(runProperties, fontSize);
			}
	
			run.setRPr(runProperties);
	
			tableCell.getContent().add(paragraph);
		}
	}

	/**
	 *  In this method we're going to add the font size information to the run
	 *  properties. First we'll create a half-point measurement. Then we'll
	 *  set the fontSize as the value of this measurement. Finally we'll set
	 *  the non-complex and complex script font sizes, sz and szCs respectively.
	 *
	 * @param runProperties the run properties
	 * @param fontSize the font size
	 */
	private void setFontSize(RPr runProperties, String fontSize) {
		HpsMeasure size = new HpsMeasure();
		size.setVal(new BigInteger(fontSize));
		runProperties.setSz(size);
		runProperties.setSzCs(size);
	}

	/**
	 *  In this method we'll add the bold property to the run properties.
	 *  BooleanDefaultTrue is the Docx4j object for the b property.
	 *  Technically we wouldn't have to set the value to true, as this is
	 *  the default.
	 *
	 * @param runProperties the run properties
	 */
	private void addBoldStyle(RPr runProperties) {
		BooleanDefaultTrue b = new BooleanDefaultTrue();
		b.setVal(true);
		runProperties.setB(b);
	}	

	/**
	 *  In this method, we once again create a regular cell, as in the previous
	 *  examples.
	 *
	 * @param tableRow the table row
	 * @param content the content
	 */
	private void addRegularTableCell(Tr tableRow, String content) {
		Tc tableCell = factory.createTc();
		tableCell.getContent().add(
			wordMLPackage.getMainDocumentPart().createParagraphOfText(
				content));
		tableRow.getContent().add(tableCell);
	}
	
	
	/**
	 * Keep table together.
	 */
	public void keepTableTogether(){
		/*
		Br objBr = new Br();
		 objBr.setType(STBrType.PAGE);
		 P para = factory.createP();
		 para.getParagraphContent().add(objBr);
		 */
		
        // 1. Iterate through all rows of table and select last row.
        // 2. Set KepNext to false for last row of table.
        
        // 1. Iterate through all rows of table
		/*
        for( int i = 0; i < theRowCount; i++ ) {
           org.docx4j.wml.Tr tr = createSimilarNewTableRow(refTr, cols);
           tbl.getContent().add(tr);
           // 1.1 Select last row only
           if(i == theRowCount -1){
           // 2.1 Iterate through all content (Type org.docx4j.wml.Tc) of last row of table.
              for( Object trContent : tr.getContent() ) {
                 if( trContent instanceof javax.xml.bind.JAXBElement ) {
                    if( ((JAXBElement) trContent).getDeclaredType().getName().equals("org.docx4j.wml.Tc") ) {
                       org.docx4j.wml.Tc tc = (org.docx4j.wml.Tc) ((JAXBElement) trContent).getValue();
                       if(tc != null){
                       // 2.2 Iterate through all para (Type org.docx4j.wml.P) of each content of last row of table.
                          for( Object tcContent : tc.getContent() ) {
                             if(tcContent != null && tcContent instanceof P){
                                P tcP = (P)tcContent;
                                // 2.3 Set Para property KeepNext to false.
                                BooleanDefaultTrue bd = new BooleanDefaultTrue();
                                bd.setVal(false);
                                tcP.getPPr().setKeepNext(bd);
                             }
                          }
                       }
                    }

                 }
              }
           }
        }
        */
	}

	
	/**
	 * Deep copy.
	 *
	 * @param <T> the generic type
	 * @param value the value
	 * @return the t
	 */
	private <T> T deepCopy(T value) {
	      try {
	         JAXBElement<?> elem;
	         Class<?> valueClass;
	         if (value instanceof JAXBElement<?>) {
	            elem = (JAXBElement<?>) value;
	            valueClass = elem.getDeclaredType();
	         } else {
	            @SuppressWarnings("unchecked")
	            Class<T> classT = (Class<T>) value.getClass();
	            elem = new JAXBElement<T>(
	                  new QName("temp"), classT, value);
	            valueClass = classT;
	         }
	         
	         Marshaller mar = Context.jc.createMarshaller();
	         ByteArrayOutputStream bout = new ByteArrayOutputStream(256);
	         mar.marshal(elem, bout);

	         Unmarshaller unmar = Context.jc.createUnmarshaller();
	         elem = unmar.unmarshal(
	               new StreamSource(
	                     new ByteArrayInputStream(bout.toByteArray())),
	               valueClass);
	         
	         T res;
	         if (value instanceof JAXBElement<?>) {
	            @SuppressWarnings("unchecked")
	            T resT = (T) elem;
	            res = resT;
	         } else {
	            @SuppressWarnings("unchecked")
	            T resT = (T) elem.getValue();
	            res = resT;
	         }
	         return res;
	      } catch (JAXBException ex) {
	         throw new IllegalArgumentException(ex);
	      }
	   }
	
    /**
     * Gets the r pr.
     *
     * @param isBlod the is blod
     * @return the r pr
     */
    public static RPr getRPr(boolean isBlod){  
        return Docx4jUtils.getRPr("??", "000000", "18", STHint.EAST_ASIA, isBlod);  
    }
    
    /**
     * Gets the r pr.
     *
     * @param fontFamily the font family
     * @param isBlod the is blod
     * @return the r pr
     */
    public static RPr getRPr(String fontFamily , boolean isBlod){  
        return Docx4jUtils.getRPr(fontFamily, "000000", "18", STHint.EAST_ASIA, isBlod);  
    }  
    
    /**
     * Gets the r pr.
     *
     * @param fontFamily the font family
     * @param hpsMeasureSize the hps measure size
     * @param isBlod the is blod
     * @return the r pr
     */
    public static RPr getRPr(String fontFamily, String hpsMeasureSize, boolean isBlod){  
        return Docx4jUtils.getRPr(fontFamily, "000000", hpsMeasureSize, STHint.EAST_ASIA, isBlod);  
    }     
    
    /**
     * Gets the CT border.
     *
     * @param type the type
     * @param color the color
     * @param border the border
     * @param space the space
     * @return the CT border
     */
    public static CTBorder getCTBorder(int type , String color , String border , String space){  
        CTBorder ctb = new CTBorder();  
        if(type == 0){  
            ctb.setVal(STBorder.NIL);  
        }else{  
            ctb.setColor(color);  
            ctb.setSz(new BigInteger(border));  
            ctb.setSpace(new BigInteger(space));  
            if(type == 2){  
                ctb.setVal(STBorder.DOUBLE);  
            }else{  
                ctb.setVal(STBorder.SINGLE);  
            }  
        }  
        return ctb;  
    } 
    
    /**
     * Sets the cell content style.
     *
     * @param p the p
     * @param jcEnumeration the jc enumeration
     */
    public static void setCellContentStyle(P p , JcEnumeration jcEnumeration){  
        PPr pPr = p.getPPr();  
        if(pPr == null){  
            ObjectFactory factory = Context.getWmlObjectFactory();  
            pPr = factory.createPPr();  
        }  
        org.docx4j.wml.Jc jc = pPr.getJc();  
        if(jc == null){  
            jc = new org.docx4j.wml.Jc();  
        }  
        jc.setVal(jcEnumeration);  
        pPr.setJc(jc);  
        p.setPPr(pPr);  
    } 
    
    /**
     * Sets the cell content style.
     *
     * @param p the new cell content style
     */
    public static void setCellContentStyle(P p){  
        setCellContentStyle(p, JcEnumeration.CENTER);  
    } 
    
    
    /**
     * Fill table data.
     *
     * @param wordPackage the word package
     * @param tbl the tbl
     * @param dataList the data list
     * @param titleList the title list
     * @param isFixedTitle the is fixed title
     * @param tFontFamily the t font family
     * @param tFontSize the t font size
     * @param tIsBlod the t is blod
     * @param tJcEnumeration the t jc enumeration
     * @param fontFamily the font family
     * @param fontSize the font size
     * @param isBlod the is blod
     * @param jcEnumeration the jc enumeration
     */
    private static void fillTableData(WordprocessingMLPackage wordPackage , Tbl tbl , List dataList , List titleList , boolean isFixedTitle,String tFontFamily , String tFontSize , boolean tIsBlod , JcEnumeration tJcEnumeration,String fontFamily , String fontSize , boolean isBlod , JcEnumeration jcEnumeration){  
        List rowList = tbl.getContent();  
        //???????  
        int rows = rowList.size();  
        int tSize = 0;  
        //??  
        if(titleList != null && titleList.size() > 0){  
            tSize = titleList.size();  
            for(int t = 0 ; t < tSize ; t++){  
                Object[] tobj = (Object[]) titleList.get(t);  
                Tr tr0 = (Tr) XmlUtils.unwrap(rowList.get(t));  
                List colList = tr0.getContent();  
                for(int c = 0 ; c < colList.size() ; c++){  
                    Tc tc0 = (Tc) XmlUtils.unwrap(colList.get(c));  
                    //??????  
                    fillCellData(tc0, converObjToStr(tobj[c], ""), tFontFamily, tFontSize, tIsBlod, tJcEnumeration);  
                }  
                if(isFixedTitle){  
                    //??????  
                    fixedTitle(tr0);  
                }  
            }  
        }  
        int colsSize = 1;  
        //????,???????????  
        for(int r = tSize ; r < rows ; r++){  
            Tr tr = (Tr) XmlUtils.unwrap(rowList.get(r));  
            Object[] objs = null;  
            //?????????,????????????  
            if(dataList != null && (dataList.size() >= (rows - tSize))){  
                objs = (Object[]) dataList.get(r - tSize);  
            }  
            List colsList = tr.getContent();  
            //???????  
            colsSize = colsList.size();  
            for(int i = 0 ; i < colsSize ; i++){  
                Tc tc = (Tc) XmlUtils.unwrap(colsList.get(i));  
                //??????  
                if(objs != null){  
                    fillCellData(tc, converObjToStr(objs[i], ""), fontFamily, fontSize, isBlod, jcEnumeration);  
                }else{  
                    fillCellData(tc, "", fontFamily, fontSize, isBlod, jcEnumeration);  
                }  
            }  
        }  
    } 
    
    /**
     * Fill table data.
     *
     * @param wordPackage the word package
     * @param tbl the tbl
     * @param dataList the data list
     * @param titleList the title list
     */
    public static void fillTableData(WordprocessingMLPackage wordPackage , Tbl tbl , List dataList , List titleList){  
        fillTableData(wordPackage, tbl, dataList, titleList, true, "??", "18", true, JcEnumeration.CENTER, "??", "18", false, JcEnumeration.CENTER);  
    }  
    
    /**
     * Fixed title.
     *
     * @param tr the tr
     */
    public static void fixedTitle(Tr tr){  
        ObjectFactory factory = Context.getWmlObjectFactory();  
        BooleanDefaultTrue bdt = factory.createBooleanDefaultTrue();  
        //??????  
        bdt.setVal(true);  
        TrPr trpr = tr.getTrPr();  
        if(trpr == null){  
            trpr = factory.createTrPr();  
        }  
        trpr.getCnfStyleOrDivIdOrGridBefore().add(factory.createCTTrPrBaseTblHeader(bdt));  
        tr.setTrPr(trpr);  
    } 
    
    /**
     * Fill cell data.
     *
     * @param tc the tc
     * @param data the data
     * @param fontFamily the font family
     * @param fontSize the font size
     * @param isBlod the is blod
     * @param jcEnumeration the jc enumeration
     */
    private static void fillCellData(Tc tc , String data , String fontFamily , String fontSize , boolean isBlod , JcEnumeration jcEnumeration){  
        ObjectFactory factory = Context.getWmlObjectFactory();  
        org.docx4j.wml.P p = (P) XmlUtils.unwrap(tc.getContent().get(0));  
        //???????????  
        setCellContentStyle(p , jcEnumeration);  
        org.docx4j.wml.Text t = factory.createText();  
        t.setValue(data);  
        org.docx4j.wml.R run = factory.createR();  
        //??????????  
        run.setRPr(getRPr(fontFamily, fontSize, isBlod));  
        TcPr tcpr = tc.getTcPr();  
        if(tcpr == null){  
            tcpr = factory.createTcPr();  
        }  
        //????????  
        CTVerticalJc valign = factory.createCTVerticalJc();  
        valign.setVal(STVerticalJc.CENTER);  
        tcpr.setVAlign(valign);  
        run.getContent().add(t);  
        p.getContent().add(run);  
    }  
    
    /**
     * Fill cell data.
     *
     * @param tc the tc
     * @param data the data
     * @param isBlod the is blod
     */
    public static void fillCellData(Tc tc , String data , boolean isBlod ){  
        fillCellData(tc, data, "??", "18", isBlod, JcEnumeration.CENTER);  
    }  
    
    /**
     * Gets the content info.
     *
     * @param content the content
     * @return the content info
     */
    public static String getContentInfo(String content){  
        StringBuffer sb = new StringBuffer();  
        sb.append("<w:p xmlns:w=\"http://schemas.openxmlformats.org/wordprocessingml/2006/main\" >");  
        sb.append("<w:pPr><w:spacing w:line=\"360\" w:lineRule=\"auto\"/><w:ind w:firstLineChars=\"200\" w:firstLine=\"480\"/>");  
        sb.append("<w:rPr><w:rFonts w:asciiTheme=\"minorEastAsia\" w:hAnsiTheme=\"minorEastAsia\"/>");  
        sb.append("<w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr></w:pPr><w:r w:rsidRPr=\"00792470\"><w:rPr>");  
        sb.append("<w:rFonts w:asciiTheme=\"minorEastAsia\" w:hAnsiTheme=\"minorEastAsia\" w:hint=\"eastAsia\"/>");  
        sb.append("<w:sz w:val=\"24\"/><w:szCs w:val=\"24\"/></w:rPr><w:t>");  
        sb.append(content);  
        sb.append("</w:t></w:r></w:p>");  
        return sb.toString();  
    }  
    
    /**
     * Sets the read only.
     *
     * @param fileName the file name
     * @param isReadOnly the is read only
     * @return true, if successful
     * @throws Exception the exception
     */
    public static boolean setReadOnly(String fileName , boolean isReadOnly)throws Exception{  
        try {  
            File file = new File(fileName);  
            if (!file.exists()) {  
                return false;  
            }  
            WordprocessingMLPackage wordPackage = WordprocessingMLPackage.load(file);  
            setReadOnly(wordPackage, isReadOnly);  
            Docx4jUtils.saveWordPackage(wordPackage, file);  
        } catch (Exception e) {  
            e.printStackTrace();  
            return false;  
        }  
        return true;  
    }  

    /**
     * Insert footer image.
     *
     * @param wordPackage the word package
     * @param code the code
     * @throws Exception the exception
     */
    public static void insertFooterImage(WordprocessingMLPackage wordPackage , String code)throws Exception {  
        try {  
            createFooterReference(wordPackage, createFooterPart(wordPackage, code));  
        } catch (Exception e) {  
            e.printStackTrace();  
            throw new Exception("insertFooterImage ??????????:" , e);  
        }  
    } 
    
    /**
     * Creates the footer reference.
     *
     * @param wordPackage the word package
     * @param relationship the relationship
     * @throws Exception the exception
     */
    private static void createFooterReference(WordprocessingMLPackage wordPackage,Relationship relationship )throws Exception {  
        org.docx4j.wml.ObjectFactory factory = new org.docx4j.wml.ObjectFactory();  
        List<SectionWrapper> sections = wordPackage.getDocumentModel().getSections();  
        SectPr sectPr = sections.get(sections.size() - 1).getSectPr();  
        if (sectPr == null ) {  
            sectPr = factory.createSectPr();  
            wordPackage.getMainDocumentPart().addObject(sectPr);  
            sections.get(sections.size() - 1).setSectPr(sectPr);  
        }  
        FooterReference headerReference = factory.createFooterReference();  
        headerReference.setId(relationship.getId());  
        headerReference.setType(HdrFtrRef.DEFAULT);  
        sectPr.getEGHdrFtrReferences().add(headerReference);  
    }
    
    /**
     * Creates the footer part.
     *
     * @param wordPackage the word package
     * @param code the code
     * @return the relationship
     * @throws Exception the exception
     */
    private static Relationship createFooterPart(WordprocessingMLPackage wordPackage , String code)throws Exception {  
        FooterPart footerPart = new FooterPart();  
        footerPart.setPackage(wordPackage);  
        footerPart.setJaxbElement(getFtr(wordPackage, footerPart , code));  
        return wordPackage.getMainDocumentPart().addTargetPart(footerPart);  
    }
    
    /**
     * Gets the ftr.
     *
     * @param wordPackage the word package
     * @param sourcePart the source part
     * @param code the code
     * @return the ftr
     * @throws Exception the exception
     */
    private static Ftr getFtr(WordprocessingMLPackage wordPackage, Part sourcePart, String code) throws Exception {  
        org.docx4j.wml.ObjectFactory factory = new org.docx4j.wml.ObjectFactory();  
        Ftr ftr = factory.createFtr();  
        byte[] bt = generateCode39Barcode(code);  
        ftr.getContent().add(getPImage(wordPackage,sourcePart, bt, "filename", "alttext", 1, 2));  
        return ftr;  
    }     
    
    /**
     * Generate code 39 barcode.
     *
     * @param code the code
     * @return the byte[]
     * @throws Exception the exception
     */
    private static byte[] generateCode39Barcode(String code)throws Exception{  
        Code39Bean bean = new Code39Bean();     
        final int dpi = 200;     
        bean.setModuleWidth(0.15);     
        bean.setHeight(10);     
        bean.setWideFactor(3);     
        bean.doQuietZone(true);     
        ByteArrayOutputStream out = null;  
        try {  
            out = new ByteArrayOutputStream();  
            BitmapCanvasProvider canvas = new BitmapCanvasProvider(dpi,BufferedImage.TYPE_BYTE_GRAY, true, 0);     
            bean.generateBarcode(canvas, code);     
            canvas.finish();     
            BufferedImage barcodeImage = canvas.getBufferedImage();     
            ImageIO.write(barcodeImage, "jpeg", out);    
            out.flush();  
            return out.toByteArray();  
        } catch (Exception e) {  
            e.printStackTrace();  
        }finally{  
            if(out != null){  
                try {  
                    out.close();  
                } catch (Exception e) {  
                    e.printStackTrace();  
                }  
            }  
        }  
        return null;  
    }  
    
    /**
     * Gets the p image.
     *
     * @param wordPackage the word package
     * @param sourcePart the source part
     * @param bytes the bytes
     * @param filenameHint the filename hint
     * @param altText the alt text
     * @param id1 the id 1
     * @param id2 the id 2
     * @return the p image
     * @throws Exception the exception
     */
    private static org.docx4j.wml.P getPImage( WordprocessingMLPackage wordPackage, Part sourcePart, byte[] bytes,  
            String filenameHint, String altText,   
            int id1, int id2) throws Exception {  
        BinaryPartAbstractImage imagePart = BinaryPartAbstractImage.createImagePart(wordPackage, sourcePart, bytes);  
        Inline inline = imagePart.createImageInline(filenameHint, altText, id1, id2, false);  
        org.docx4j.wml.ObjectFactory factory = new org.docx4j.wml.ObjectFactory();  
        org.docx4j.wml.P  p = factory.createP();  
        org.docx4j.wml.R  run = factory.createR();        
        p.getContent().add(run);          
        org.docx4j.wml.Drawing drawing = factory.createDrawing();         
        run.getContent().add(drawing);        
        drawing.getAnchorOrInline().add(inline);  
        PPr pPr = p.getPPr();  
        if(pPr == null){  
            pPr = factory.createPPr();  
        }  
        Jc jc = pPr.getJc();  
        if(jc == null){  
            jc = new org.docx4j.wml.Jc();  
        }  
        //?????????  
        jc.setVal(JcEnumeration.RIGHT);  
        pPr.setJc(jc);  
        p.setPPr(pPr);  
        return p;  
    } 
    
    /**
     * Conver obj to str.
     *
     * @param obj the obj
     * @param defaultStr the default str
     * @return the string
     */
    public static String converObjToStr(Object obj , String defaultStr){  
        if(obj != null){  
            return obj.toString();  
        }  
        return defaultStr;  
    } 
    
	/**
	 * Sets the cell V merage.
	 *
	 * @param tc the tc
	 * @param currentRow the current row
	 * @param startRow the start row
	 * @param rowSpan the row span
	 * @param currentCol the current col
	 * @param startCol the start col
	 */
    public static void setCellVMerage(Tc tc , int currentRow , int startRow , int rowSpan , int currentCol , int startCol){  
        setCellMerge(tc, currentRow, startRow, rowSpan, currentCol, startCol, 1);  
    }
    
    /**
     * Sets the cell H merge.
     *
     * @param tc the tc
     * @param currentRow the current row
     * @param startRow the start row
     * @param currentCol the current col
     * @param startCol the start col
     * @param colSpan the col span
     */
    public static void setCellHMerge(Tc tc , int currentRow , int startRow , int currentCol , int startCol , int colSpan){  
        setCellMerge(tc, currentRow, startRow, 1, currentCol, startCol, colSpan);  
    }     
}
