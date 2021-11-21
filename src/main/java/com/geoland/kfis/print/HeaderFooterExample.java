package com.geoland.kfis.print;

import java.io.FileOutputStream;
import java.io.IOException;

import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.PdfAction;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfPageEventHelper;
import com.itextpdf.text.pdf.PdfWriter;


// TODO: Auto-generated Javadoc
/**
 * The Class HeaderFooterExample.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created May 20, 2014 10:45:16 AM
 * @Version 1.0
 */
public class HeaderFooterExample extends PdfPageEventHelper {

	/** The Phrase that will be added as the header of the document. */
	protected Phrase header;

	/** The PdfPTable that will be added as the footer of the document. */
	protected PdfPTable footer;

	/**
	 * Constructs an Event that adds a Header and a Footer.
	 */
	public HeaderFooterExample() {
		header = new Phrase("This is the header of the document.");
		footer = new PdfPTable(4);
		footer.setTotalWidth(300);
		footer.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
		footer.addCell(new Phrase(new Chunk("First Page")
				.setAction(new PdfAction(PdfAction.FIRSTPAGE))));
		footer.addCell(new Phrase(new Chunk("Prev Page")
				.setAction(new PdfAction(PdfAction.PREVPAGE))));
		footer.addCell(new Phrase(new Chunk("Next Page")
				.setAction(new PdfAction(PdfAction.NEXTPAGE))));
		footer.addCell(new Phrase(new Chunk("Last Page")
				.setAction(new PdfAction(PdfAction.LASTPAGE))));
	}

	/* (non-Javadoc)
	 * @see com.itextpdf.text.pdf.PdfPageEventHelper#onStartPage(com.itextpdf.text.pdf.PdfWriter, com.itextpdf.text.Document)
	 */
	@Override
	public void onStartPage(PdfWriter arg0, Document arg1) {
		// TODO Auto-generated method stub
		super.onStartPage(arg0, arg1);
	}
	
	/**
	 * On end page.
	 *
	 * @param writer the writer
	 * @param document the document
	 * @see com.lowagie.text.pdf.PdfPageEvent#onEndPage(com.lowagie.text.pdf.PdfWriter,
	 *      com.lowagie.text.Document)
	 */
	public void onEndPage(PdfWriter writer, Document document) {
		PdfContentByte cb = writer.getDirectContent();
		if (document.getPageNumber() > 1) {
			ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, header,
					(document.right() - document.left()) / 2
							+ document.leftMargin(), document.top() + 10, 0);
		}
		footer.writeSelectedRows(0, -1,
				(document.right() - document.left() - 300) / 2
						+ document.leftMargin(), document.bottom() - 10, cb);
	}

	/**
	 * Generates a file with a header and a footer.
	 * 
	 * @param args
	 *            no arguments needed here
	 */
	public static void main(String[] args) {
		System.out.println("Chapter 14: Header Footer Example");
		System.out.println("-> Creates a PDF file with a header and a footer.");
		System.out.println("-> jars needed: iText.jar");
		System.out.println("-> files generated in /results subdirectory:");
		System.out.println("   header_footer.pdf");
		// step 1: creation of a document-object
		Document document = new Document();
		try {
			// step 2:
			PdfWriter writer = PdfWriter.getInstance(document,
					new FileOutputStream("D:/print/header_footer.pdf"));
			writer.setViewerPreferences(PdfWriter.PageLayoutTwoColumnLeft);
			writer.setPageEvent(new HeaderFooterExample());
			document.setMargins(36, 36, 54, 72);
			// step 3:
			document.open();
			// step 4: we grab the ContentByte and do some stuff with it
			for (int k = 1; k <= 300; ++k) {
				document.add(new Phrase(
						"Quick brown fox jumps over the lazy dog. "));
			}
		} catch (DocumentException de) {
			System.err.println(de.getMessage());
		} catch (IOException ioe) {
			System.err.println(ioe.getMessage());
		}
		document.close();
	}
}