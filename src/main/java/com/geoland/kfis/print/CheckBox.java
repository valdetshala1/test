package com.geoland.kfis.print;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.ExceptionConverter;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.BaseField;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfFormField;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPCellEvent;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.RadioCheckField;

// TODO: Auto-generated Javadoc
/**
 * The Class CheckBox.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created May 20, 2014 10:45:33 AM
 * @Version 1.0
 */
public class CheckBox implements PdfPCellEvent{
	
	/** The writer. */
	private PdfWriter writer;
	
	/** The name. */
	private String name;
	
	/** The checked. */
	private Boolean checked;

	/**
	 * Instantiates a new check box.
	 *
	 * @param writer the writer
	 * @param name the name
	 * @param checked the checked
	 */
	public CheckBox(PdfWriter writer, String name, Boolean checked)	{
		this.writer = writer;
		this.name = name;
		this.checked = checked;
	}

	/* (non-Javadoc)
	 * @see com.itextpdf.text.pdf.PdfPCellEvent#cellLayout(com.itextpdf.text.pdf.PdfPCell, com.itextpdf.text.Rectangle, com.itextpdf.text.pdf.PdfContentByte[])
	 */
	public void cellLayout(PdfPCell cell, Rectangle position, PdfContentByte[] canvases)
	{
//		float llx = position.getLeft() + ((position.getRight() -  position.getLeft()) / 2f) - 5f;
//		float lly = position.getBottom() + ((position.getTop() -  position.getBottom()) / 2f) - 5f;
		
		float llx = position.getRight() - 40f;
		float lly = position.getBottom() + ((position.getTop() -  position.getBottom()) / 2f) - 5f;
		
		try
		{
			RadioCheckField rf = new RadioCheckField(writer, new Rectangle(llx, lly, llx + 10, lly + 10), name, "Yes");

			rf.setCheckType(RadioCheckField.TYPE_CHECK);
			rf.setBorderWidth(BaseField.BORDER_WIDTH_THIN);
			rf.setBorderColor(BaseColor.BLACK);
			rf.setBackgroundColor(BaseColor.WHITE);
			//rf.setRotation(90);
			rf.setOptions(RadioCheckField.READ_ONLY);
			rf.setChecked(checked);
			

			PdfFormField ff = rf.getCheckField();
			writer.addAnnotation(ff);
		}
		catch (Exception e)
		{
			throw new ExceptionConverter(e);
		}
	}
	
}