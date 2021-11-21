package com.geoland.kfis.print;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfPageEventHelper;
import com.itextpdf.text.pdf.PdfTemplate;
import com.itextpdf.text.pdf.PdfWriter;

// TODO: Auto-generated Javadoc
/**
 * The Class HeaderFooter.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created May 20, 2014 10:45:22 AM
 * @Version 1.0
 */
public class HeaderFooter extends PdfPageEventHelper {
    
    /** The tpl. */
    public PdfTemplate tpl;
    
    /** The helv. */
    public BaseFont helv;
    
    /** The nif. */
    private Long nif;
    
    /** The is crtifcate. */
    private boolean isCrtifcate;
    
    /** The print formular. */
    private boolean printCertificate, printAnex, printFormular;

    /** The formatter sq. */
    private DateFormat formatter_sq = new SimpleDateFormat("dd.MM.yyyy");
	
	/** The base font. */
	protected BaseFont baseFont;
	
	/** The nif text. */
	private PdfTemplate nifText;
	
	/** The total pages. */
	private PdfTemplate totalPages;
	
	/** The total. */
	private PdfTemplate total;
	
	/** The footer text size. */
	private float footerTextSize = 8f;
	
	/** The page number alignment. */
	private int pageNumberAlignment = Element.ALIGN_CENTER;
	/** The PdfPTable that will be added as the footer of the document. */
	protected PdfPTable footer;

	/**
	 * Instantiates a new header footer.
	 *
	 * @param nif the nif
	 * @param isCrtifcate the is crtifcate
	 * @param printCertificate the print certificate
	 * @param printAnex the print anex
	 * @param printFormular the print formular
	 */
	public HeaderFooter(Long nif, boolean isCrtifcate, boolean printCertificate, boolean printAnex, boolean printFormular) {
		super();
		this.nif = nif;
		this.isCrtifcate = isCrtifcate;
		this.printAnex = printAnex;
		this.printCertificate = printCertificate;
		this.printFormular = printFormular;
		
		footer = new PdfPTable(2);
		footer.setTotalWidth(500);
		footer.setWidthPercentage(100f);
		try {
			footer.setWidths(new float[]{50,50});
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		footer.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
		footer.getDefaultCell().setBorder(0);
	}

	/** The font. */
	Font font = FontFactory.getFont("Times New Roman", 10, Font.NORMAL, BaseColor.BLACK);
	//Font font = FontFactory.getFont(BaseFont.TIMES_ROMAN, BaseFont.WINANSI, BaseFont.NOT_EMBEDDED, 8);
	
    /** Alternating phrase for the header. */
    Phrase[] header = new Phrase[2];
    /** Current page number (will be reset for every chapter). */
    int pagenumber;

    /**
     * Initialize one of the headers.
     *
     * @param writer the writer
     * @param document the document
     * @see com.itextpdf.text.pdf.PdfPageEventHelper#onOpenDocument(
     *      com.itextpdf.text.pdf.PdfWriter, com.itextpdf.text.Document)
     */
    public void onOpenDocument(PdfWriter writer, Document document) {
		
		total = writer.getDirectContent().createTemplate(15, 16);

        try {
			helv = BaseFont.createFont("Helvetica", BaseFont.WINANSI, false);
		} catch (DocumentException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		

    }

	/**
	 * Increase the page number.
	 *
	 * @param writer the writer
	 * @param document the document
	 * @see com.itextpdf.text.pdf.PdfPageEventHelper#onStartPage(com.itextpdf.text.pdf.PdfWriter,
	 *      com.itextpdf.text.Document)
	 */
	@Override
	public void onStartPage(PdfWriter writer, Document document) {
			pagenumber++;
	}	

	/* (non-Javadoc)
	 * @see com.itextpdf.text.pdf.PdfPageEventHelper#onCloseDocument(com.itextpdf.text.pdf.PdfWriter, com.itextpdf.text.Document)
	 */
	@Override
	 public void onCloseDocument(PdfWriter writer, Document document) {
		if (isCrtifcate && printCertificate) {
			pagenumber = pagenumber - 1;
		}
		
		Phrase p = new Phrase(String.valueOf(pagenumber - 1), font);
		ColumnText.showTextAligned(total, Element.ALIGN_BOTTOM, p, 2, 2, 0);
	 }


	/**
	 * Sets the page number alignment.
	 *
	 * @param pageNumberAlignment the new page number alignment
	 */
	public void setPageNumberAlignment(int pageNumberAlignment) {
		this.pageNumberAlignment = pageNumberAlignment;
	}
    
    /* (non-Javadoc)
     * @see com.itextpdf.text.pdf.PdfPageEventHelper#onEndPage(com.itextpdf.text.pdf.PdfWriter, com.itextpdf.text.Document)
     */
    public void onEndPage(PdfWriter writer, Document document){
        try {
        	if (isCrtifcate) {
	            Rectangle page = document.getPageSize();
	            PdfPTable table = new PdfPTable(4);
	            table.setWidths(new int[]{85, 40, 6, 70});
	            table.setLockedWidth(true);
	            
	            PdfPCell cell;
	            
	            /*1*/
	            String nifcontent = "";
	            if(nif!=null){
	            	nifcontent = "NIF: " + nif;
	            }
	            Phrase ph = new Phrase(nifcontent, font);
	            cell = new PdfPCell(ph);
	            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
	            cell.setVerticalAlignment(Element.ALIGN_BOTTOM);
	            cell.setBorder(Rectangle.NO_BORDER);
	            table.addCell(cell);
	            
	    
	            
	            /*2*/
	    		if (printCertificate) {
	    			ph = new Phrase(String.format("Faqe/Strana %d nga/od", (pagenumber-1)), font);
	    		}else{
	    			ph = new Phrase(String.format("Faqe/Strana %d nga/od", pagenumber), font);
	    		}
	    		
	            cell = new PdfPCell(ph);
	            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
	            cell.setVerticalAlignment(Element.ALIGN_BOTTOM);            
	            cell.setFixedHeight(15f);
	            cell.setBorder(Rectangle.NO_BORDER);
	            table.addCell(cell);
	            
	            /*3*/
	            cell = new PdfPCell(Image.getInstance(total));
	            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
	            cell.setVerticalAlignment(Element.ALIGN_BOTTOM);
	            cell.setFixedHeight(20f);
	            cell.setBorder(Rectangle.NO_BORDER);
	            table.addCell(cell);
	            
	            /*4*/
	            String sDate = formatter_sq.format(new Date());
	            ph = new Phrase("Datë/ Datum: " + sDate, font);
	            cell = new PdfPCell(ph);
	            cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
	            cell.setVerticalAlignment(Element.ALIGN_BOTTOM);             
	            cell.setBorder(Rectangle.NO_BORDER);
	            table.addCell(cell);
	            
	            table.setTotalWidth(page.getWidth() - document.leftMargin() - document.rightMargin());
	            
				if(printCertificate && document.getPageNumber() <= 1){
					//Do nothing
				}else{
		            table.writeSelectedRows(0, -1, document.leftMargin(), document.bottomMargin(), writer.getDirectContent());
        		}
        	}else if (!isCrtifcate){
	            Rectangle page = document.getPageSize();
	            PdfPTable table = new PdfPTable(4);
	            table.setWidths(new int[]{85, 40, 6, 70});
	            table.setLockedWidth(true);
	            
	            PdfPCell cell;
	            
	            /*1*/
	            String nifcontent = "";
	            if(nif!=null){
	            	nifcontent = "NIF: " + nif;
	            }
	            Phrase ph = new Phrase(nifcontent, font);
	            cell = new PdfPCell(ph);
	            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
	            cell.setVerticalAlignment(Element.ALIGN_BOTTOM);
	            cell.setBorder(Rectangle.NO_BORDER);
	            table.addCell(cell);
	            
	            /*2*/
	            ph = new Phrase(String.format("Faqe/Strana %d nga/od", pagenumber), font);
	            cell = new PdfPCell(ph);
	            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
	            cell.setVerticalAlignment(Element.ALIGN_BOTTOM);            
	            cell.setFixedHeight(15f);
	            cell.setBorder(Rectangle.NO_BORDER);
	            table.addCell(cell);
	            
	            /*3*/
	            cell = new PdfPCell(Image.getInstance(total));
	            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
	            cell.setVerticalAlignment(Element.ALIGN_BOTTOM);
	            cell.setFixedHeight(20f);
	            cell.setBorder(Rectangle.NO_BORDER);
	            table.addCell(cell);
	            
	            /*4*/
	            String sDate = formatter_sq.format(new Date());
	            ph = new Phrase("Datë/ Datum: " + sDate, font);
	            cell = new PdfPCell(ph);
	            cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
	            cell.setVerticalAlignment(Element.ALIGN_BOTTOM);             
	            cell.setBorder(Rectangle.NO_BORDER);
	            table.addCell(cell);;
	            
	            table.setTotalWidth(page.getWidth() - document.leftMargin() - document.rightMargin());
	            table.writeSelectedRows(0, -1, document.leftMargin(), document.bottomMargin(), writer.getDirectContent());        		
        		
        	}
            
        }
        catch (Exception e) {
        }
    }	
 }
