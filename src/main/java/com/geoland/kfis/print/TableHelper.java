package com.geoland.kfis.print;

import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfAnnotation;
import com.itextpdf.text.pdf.PdfAppearance;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfFormField;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPCellEvent;
import com.itextpdf.text.pdf.PdfWriter;

// TODO: Auto-generated Javadoc
/**
 * The Class TableHelper.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created May 20, 2014 10:44:25 AM
 * @Version 1.0
 */
public class TableHelper {

	/**
	 * Create a checkbox in a cell.
	 *
	 * @param writer the writer
	 * @param fieldName the field name
	 * @param checkedValue the checked value
	 * @return the pdf P cell
	 */
	public static PdfPCell cellWithCheckbox(PdfWriter writer,
			String fieldName, String checkedValue) {
		int dimension = 20;
		PdfContentByte cb = writer.getDirectContent();

		PdfFormField field = PdfFormField.createCheckBox(writer); 
		PdfAppearance tpOff = cb.createAppearance(12, 12);
		PdfAppearance tpOn = cb.createAppearance(12, 12);

		tpOff.setRGBColorFill(255, 128, 128);
		tpOff.rectangle(1, 1, dimension, dimension);
		tpOff.stroke();

		// drawRectangleMarkedWithX( dimension, tpOn );

		field.setFieldName(fieldName);

		field.setAppearance(PdfAnnotation.APPEARANCE_NORMAL, "Off", tpOff);
		field.setAppearance(PdfAnnotation.APPEARANCE_NORMAL, checkedValue, tpOn);

		field.setFlags(PdfFormField.FLAGS_PRINT); // Print the checkbox

		PdfPCell cell = new PdfPCell();

		// Checkbox display fix
		cell.setMinimumHeight(16);
		cell.setPaddingRight(10);

		cell.setCellEvent(new CheckboxCell(field, dimension + 1, writer, fieldName, checkedValue));

		cell.setBorderWidth(0);

		return cell;
	}

	/**
	 * Layout for checkbox cells.
	 */
	static class CheckboxCell implements PdfPCellEvent {

		/** The form field. */
		PdfFormField formField;
		
		/** The writer. */
		PdfWriter writer;
		
		/** The width. */
		int width;
		
		/** The name. */
		String name;
		
		/** The checked value. */
		String checkedValue;

		/**
		 * Instantiates a new checkbox cell.
		 *
		 * @param formField the form field
		 * @param width the width
		 * @param writer the writer
		 * @param name the name
		 * @param value the value
		 */
		public CheckboxCell(PdfFormField formField, int width,
				PdfWriter writer, String name, String value) {
			this.formField = formField;
			this.width = width;
			this.writer = writer;
			this.name = name;
			this.checkedValue = value;
		}

		/* (non-Javadoc)
		 * @see com.itextpdf.text.pdf.PdfPCellEvent#cellLayout(com.itextpdf.text.pdf.PdfPCell, com.itextpdf.text.Rectangle, com.itextpdf.text.pdf.PdfContentByte[])
		 */
		public void cellLayout(PdfPCell cell, Rectangle rect, PdfContentByte[] canvas) {
			try {
				// Alignment hacks
				Rectangle r = new Rectangle(rect.getLeft() + 2,
						rect.getBottom() + 3, rect.getLeft() + width + 1,
						rect.getTop() - 3);
				formField.setWidget(r, PdfAnnotation.HIGHLIGHT_NONE);
				writer.addAnnotation(formField);
			} catch (Exception e) {
				System.out.println(e);
			}
		}
	}

}



