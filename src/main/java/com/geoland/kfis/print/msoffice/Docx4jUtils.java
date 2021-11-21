package com.geoland.kfis.print.msoffice;

import java.io.File;
import java.math.BigInteger;

import javax.xml.bind.JAXBException;

import org.docx4j.XmlUtils;
import org.docx4j.jaxb.Context;
import org.docx4j.openpackaging.packages.WordprocessingMLPackage;
import org.docx4j.openpackaging.parts.WordprocessingML.DocumentSettingsPart;
import org.docx4j.openpackaging.parts.relationships.Namespaces;
import org.docx4j.wml.BooleanDefaultTrue;
import org.docx4j.wml.CTDocProtect;
import org.docx4j.wml.CTSettings;
import org.docx4j.wml.CTTblLayoutType;
import org.docx4j.wml.Jc;
import org.docx4j.wml.JcEnumeration;
import org.docx4j.wml.ObjectFactory;
import org.docx4j.wml.RPr;
import org.docx4j.wml.STAlgClass;
import org.docx4j.wml.STAlgType;
import org.docx4j.wml.STCryptProv;
import org.docx4j.wml.STDocProtect;
import org.docx4j.wml.STHint;
import org.docx4j.wml.STTblLayoutType;
import org.docx4j.wml.SectPr.PgMar;
import org.docx4j.wml.Tbl;
import org.docx4j.wml.TblGrid;
import org.docx4j.wml.TblGridCol;
import org.docx4j.wml.TblPr;
import org.docx4j.wml.TblWidth;
import org.docx4j.wml.Tc;
import org.docx4j.wml.TcPr;
import org.docx4j.wml.Tr;
  

// TODO: Auto-generated Javadoc
/**
 * The Class Docx4jUtils.
 */
public class Docx4jUtils {  
	
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
	 * Creates the wordprocessing ML package.
	 *
	 * @return the wordprocessing ML package
	 * @throws Exception the exception
	 */
    public static WordprocessingMLPackage createWordprocessingMLPackage() throws Exception{  
        return WordprocessingMLPackage.createPackage();  
    }  
      
    /**
     *  
     * ????:????????? .
     *
     * @param wordPackage ???????
     * @return            ???:??????????
     * @throws Exception the exception
     */  
    private static int getWritableWidth(WordprocessingMLPackage wordPackage)throws Exception{  
        return wordPackage.getDocumentModel().getSections().get(0).getPageDimensions().getWritableWidthTwips();  
    }  
      
    /**
     *  
     * ????:??????,?????,????? .
     *
     * @param rows    ??
     * @param cols    ??
     * @param widths  ?????
     * @return   ???:??????
     */  
    public static Tbl createTable(int rows, int cols, int[] widths) {  
        ObjectFactory factory = Context.getWmlObjectFactory();  
        Tbl tbl = factory.createTbl();  
        // w:tblPr  
        StringBuffer tblSb = new StringBuffer();  
        tblSb.append("<w:tblPr ").append(Namespaces.W_NAMESPACE_DECLARATION).append(">");  
        tblSb.append("<w:tblStyle w:val=\"TableGrid\"/>");  
        tblSb.append("<w:tblW w:w=\"0\" w:type=\"auto\"/>");  
        //?????  
        tblSb.append("<w:tblBorders><w:top w:val=\"double\" w:sz=\"4\" w:space=\"0\" w:color=\"auto\"/>");  
        //?????  
        tblSb.append("<w:left w:val=\"none\" w:sz=\"0\" w:space=\"0\" w:color=\"auto\"/>");  
        //?????  
        tblSb.append("<w:bottom w:val=\"double\" w:sz=\"4\" w:space=\"0\" w:color=\"auto\"/>");  
        //?????  
        tblSb.append("<w:right w:val=\"none\" w:sz=\"0\" w:space=\"0\" w:color=\"auto\"/>");  
        tblSb.append("</w:tblBorders>");  
        tblSb.append("<w:tblLook w:val=\"04A0\"/>");  
        tblSb.append("</w:tblPr>");  
        TblPr tblPr = null;  
        try {  
            tblPr = (TblPr) XmlUtils.unmarshalString(tblSb.toString());  
        } catch (JAXBException e) {  
            e.printStackTrace();  
        }  
        tbl.setTblPr(tblPr);  
        if (tblPr != null) {  
            Jc jc = factory.createJc();  
            //???????  
            jc.setVal(JcEnumeration.CENTER);  
            tblPr.setJc(jc);  
            CTTblLayoutType tbll = factory.createCTTblLayoutType();  
            // ????  
            tbll.setType(STTblLayoutType.FIXED);  
            tblPr.setTblLayout(tbll);  
        }  
        // <w:tblGrid><w:gridCol w:w="4788"/>  
        TblGrid tblGrid = factory.createTblGrid();  
        tbl.setTblGrid(tblGrid);  
        // Add required <w:gridCol w:w="4788"/>  
        for (int i = 1; i <= cols; i++) {  
            TblGridCol gridCol = factory.createTblGridCol();  
            gridCol.setW(BigInteger.valueOf(widths[i - 1]));  
            tblGrid.getGridCol().add(gridCol);  
        }  
        // Now the rows  
        for (int j = 1; j <= rows; j++) {  
            Tr tr = factory.createTr();  
            tbl.getContent().add(tr);  
            // The cells  
            for (int i = 1; i <= cols; i++) {  
                Tc tc = factory.createTc();  
                tr.getContent().add(tc);  
                TcPr tcPr = factory.createTcPr();  
                tc.setTcPr(tcPr);  
                // <w:tcW w:w="4788" w:type="dxa"/>  
                TblWidth cellWidth = factory.createTblWidth();  
                tcPr.setTcW(cellWidth);  
                cellWidth.setType("dxa");  
                cellWidth.setW(BigInteger.valueOf(widths[i - 1]));  
                tc.getContent().add(factory.createP());  
            }  
  
        }  
        return tbl;  
    }  
      
    /**
     *  
     * ????:??????,????????1 .
     *
     * @param rows    ??
     * @param cols    ??
     * @param widths  ?????
     * @return   ???:??????
     */  
    public static Tbl createBorderTable(int rows, int cols, int[] widths) {  
        ObjectFactory factory = Context.getWmlObjectFactory();  
        Tbl tbl = factory.createTbl();  
        // w:tblPr  
        StringBuffer tblSb = new StringBuffer();  
        tblSb.append("<w:tblPr ").append(Namespaces.W_NAMESPACE_DECLARATION).append(">");  
        tblSb.append("<w:tblStyle w:val=\"TableGrid\"/>");  
        tblSb.append("<w:tblW w:w=\"0\" w:type=\"auto\"/>");  
        tblSb.append("<w:tblBorders><w:top w:val=\"single\" w:sz=\"4\" w:space=\"0\" w:color=\"auto\"/>");  
        tblSb.append("<w:left w:val=\"single\" w:sz=\"0\" w:space=\"0\" w:color=\"auto\"/>");  
        tblSb.append("<w:bottom w:val=\"single\" w:sz=\"4\" w:space=\"0\" w:color=\"auto\"/>");  
        tblSb.append("<w:right w:val=\"single\" w:sz=\"0\" w:space=\"0\" w:color=\"auto\"/>");  
        tblSb.append("</w:tblBorders>");  
        tblSb.append("<w:tblLook w:val=\"04A0\"/>");  
        tblSb.append("</w:tblPr>");  
        TblPr tblPr = null;  
        try {  
            tblPr = (TblPr) XmlUtils.unmarshalString(tblSb.toString());  
        } catch (JAXBException e) {  
            e.printStackTrace();  
        }  
        tbl.setTblPr(tblPr);  
        if (tblPr != null) {  
            Jc jc = factory.createJc();  
            //???????  
            jc.setVal(JcEnumeration.CENTER);  
            tblPr.setJc(jc);  
            CTTblLayoutType tbll = factory.createCTTblLayoutType();  
            // ????  
            tbll.setType(STTblLayoutType.FIXED);  
            tblPr.setTblLayout(tbll);  
        }  
        // <w:tblGrid><w:gridCol w:w="4788"/>  
        TblGrid tblGrid = factory.createTblGrid();  
        tbl.setTblGrid(tblGrid);  
        // Add required <w:gridCol w:w="4788"/>  
        for (int i = 1; i <= cols; i++) {  
            TblGridCol gridCol = factory.createTblGridCol();  
            gridCol.setW(BigInteger.valueOf(widths[i - 1]));  
            tblGrid.getGridCol().add(gridCol);  
        }  
        // Now the rows  
        for (int j = 1; j <= rows; j++) {  
            Tr tr = factory.createTr();  
            tbl.getContent().add(tr);  
            // The cells  
            for (int i = 1; i <= cols; i++) {  
                Tc tc = factory.createTc();  
                tr.getContent().add(tc);  
                TcPr tcPr = factory.createTcPr();  
                tc.setTcPr(tcPr);  
                // <w:tcW w:w="4788" w:type="dxa"/>  
                TblWidth cellWidth = factory.createTblWidth();  
                tcPr.setTcW(cellWidth);  
                cellWidth.setType("dxa");  
                cellWidth.setW(BigInteger.valueOf(widths[i - 1]));  
                tc.getContent().add(factory.createP());  
            }  
              
        }  
        return tbl;  
    }  
      
    /**
     *  
     * ????:??????,?????,????? .
     *
     * @param wordPackage  ???????
     * @param rows         ????
     * @param cols         ????
     * @param tableWidth   ?????
     * @param style        ?????
     * @param jcEnumerationVal ???????
     * @return             ???:??????
     * @throws Exception the exception
     */  
    private static Tbl createTable(WordprocessingMLPackage wordPackage , int rows , int cols , String tableWidth , String style , JcEnumeration jcEnumerationVal)throws Exception{  
        int writableWidthTwips = getWritableWidth(wordPackage);  
        if(cols == 0){  
            cols = 1;  
        }  
        int cellWidth = new Double(Math.floor( (writableWidthTwips/cols ))).intValue();  
        int[] widths = new int[cols];  
        for(int i = 0 ; i < cols ; i++){  
            widths[i] = cellWidth;  
        }  
        return createTable(rows, cols, widths);  
    }  
      
    /**
     *  
     * ????:??????,????????:????:dxa,????:?? .
     *
     * @param wordPackage ???????
     * @param rows        ????
     * @param cols        ????
     * @param tableWidth  ????
     * @return            ???:??????
     * @throws Exception the exception
     */  
    public static Tbl createTable(WordprocessingMLPackage wordPackage , int rows , int cols , String tableWidth) throws Exception{  
        return createTable(wordPackage, rows, cols, tableWidth , "dxa", JcEnumeration.CENTER);  
    }  
      
    /**
     *  
     * ????:??????,????????:9328,????:dxa,????:?? .
     *
     * @param wordPackage ???????
     * @param rows        ????
     * @param cols        ????
     * @return            ???:??????
     * @throws Exception the exception
     */  
    public static Tbl createTable(WordprocessingMLPackage wordPackage , int rows , int cols) throws Exception{  
        return createTable(wordPackage, rows, cols, "9328", "dxa", JcEnumeration.CENTER);  
    }  
      
    /**
     *  
     * ????:????????????? .
     *
     * @param wordPackage  ???????
     * @param info         ???????
     * @param unmarshal    ?????,????????
     * @throws Exception the exception
     */  
    private static void addObject(WordprocessingMLPackage wordPackage , Object info , boolean unmarshal)throws Exception{  
        if(unmarshal){  
            wordPackage.getMainDocumentPart().addObject(org.docx4j.XmlUtils.unmarshalString(String.valueOf(info)));  
        }else{  
            wordPackage.getMainDocumentPart().addObject(info);  
        }  
    }  
      
    /**
     *  
     * ????:???????? .
     *
     * @param wordPackage  ???????
     * @param info         ????
     * @throws Exception the exception
     */  
    public static void addObject(WordprocessingMLPackage wordPackage , Object info)throws Exception{  
        addObject(wordPackage, info, true);  
    }  
      
    /**
     *  
     * ????:???????? .
     *
     * @param wordPackage  ???????
     * @param tbl          ??
     * @throws Exception the exception
     */  
    public static void addObjectForTbl(WordprocessingMLPackage wordPackage , Tbl tbl)throws Exception{  
        addObject(wordPackage, tbl, false);  
    }  
      
    /**
     *  
     * ????:?????? .
     *
     * @param wordPackage  ???????
     * @param fileName     ?????????,????
     * @throws Exception the exception
     */  
    public static void saveWordPackage(WordprocessingMLPackage wordPackage , String fileName)throws Exception{  
        saveWordPackage(wordPackage, new File(fileName));  
    }  
      
    /**
     *  
     * ????:?????? .
     *
     * @param wordPackage  ???????
     * @param file         ??
     * @throws Exception the exception
     */  
    public static void saveWordPackage(WordprocessingMLPackage wordPackage , File file)throws Exception{  
        wordPackage.save(file);  
    }  
      
    /**
     *  
     * ????:????? .
     *
     * @param wordPackage ???????
     * @param top    ???
     * @param bottom ???
     * @param left   ???
     * @param right  ???
     */  
    public static void setMarginSpace(WordprocessingMLPackage wordPackage , String top , String bottom , String left , String right ){  
        ObjectFactory factory = Context.getWmlObjectFactory();  
        PgMar pg = factory.createSectPrPgMar();  
        pg.setTop(new BigInteger(top));  
        pg.setBottom(new BigInteger(bottom));  
        pg.setLeft(new BigInteger(left));  
        pg.setRight(new BigInteger(right));  
        wordPackage.getDocumentModel().getSections().get(0).getSectPr().setPgMar(pg);  
    }  
      
    /** 
     * ????:?????,??????1440,2.54?? 
     * @param wordPackage ??????? 
     * @param left   ??? 
     * @param right  ??? 

     */  
    public static void setMarginSpace(WordprocessingMLPackage wordPackage , String left , String right ){  
        setMarginSpace(wordPackage, "1440", "1440", left, right);  
    }  
      
    /** 
     * ????:?????,??????1440,2.54??,??????1797,3.17?? 
     * @param wordPackage ??????? 

     */  
    public static void setMarginSpace(WordprocessingMLPackage wordPackage){  
        setMarginSpace(wordPackage, "1440", "1440", "1797", "1797");  
    }  
      
    /**
     *  
     *
     * @param fontFamily      ????
     * @param colorVal        ????
     * @param hpsMeasureSize  ????
     * @param sTHint          ????
     * @param isBlod          ????
     * @return                ???:????????
     */  
	public static RPr getRPr(String fontFamily, String colorVal, String hpsMeasureSize, STHint sTHint, boolean isBlod){  
        ObjectFactory factory = Context.getWmlObjectFactory();  
        RPr rPr = factory.createRPr();  
          
        org.docx4j.wml.RFonts rf = new org.docx4j.wml.RFonts();  
        rf.setHint(sTHint);  
        rf.setAscii(fontFamily);  
        rf.setHAnsi(fontFamily);  
        rPr.setRFonts(rf);  
          
        BooleanDefaultTrue bdt = Context.getWmlObjectFactory().createBooleanDefaultTrue();  
        rPr.setBCs(bdt);  
        if(isBlod){  
            rPr.setB(bdt);  
        }  
        org.docx4j.wml.Color color = new org.docx4j.wml.Color();  
        color.setVal(colorVal);  
        rPr.setColor(color);  
  
        org.docx4j.wml.HpsMeasure sz = new org.docx4j.wml.HpsMeasure();  
        sz.setVal(new BigInteger(hpsMeasureSize));  
        rPr.setSz(sz);  
        rPr.setSzCs(sz);  
          
        return rPr;  
    }  
}
