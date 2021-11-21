package com.geoland.kfis.print;

import java.io.IOException;

import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.ExceptionConverter;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.GrayColor;
import com.itextpdf.text.pdf.PdfBorderDictionary;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfFormField;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPCellEvent;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.TextField;

// TODO: Auto-generated Javadoc
/**
 * The Class TextFields.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created May 20, 2014 10:44:34 AM
 * @Version 1.0
 */
public class TextFields implements PdfPCellEvent {
    /** The text field index of a TextField that needs to be added to a cell. */
    protected int tf;

    /**
     * Creates a cell event that will add a text field to a cell.
     * @param tf a text field index.
     */
    public TextFields(int tf) {
        this.tf = tf;
    }

    /**
     * Creates and adds a text field that will be added to a cell.
     *
     * @param cell the cell
     * @param rectangle the rectangle
     * @param canvases the canvases
     * @see com.itextpdf.text.pdf.PdfPCellEvent#cellLayout(com.itextpdf.text.pdf.PdfPCell,
     *      com.itextpdf.text.Rectangle, com.itextpdf.text.pdf.PdfContentByte[])
     */
    public void cellLayout(PdfPCell cell, Rectangle rectangle, PdfContentByte[] canvases) {
        PdfWriter writer = canvases[0].getPdfWriter();
        TextField text = new TextField(writer, rectangle,
                String.format("text_%s", tf));
        text.setBackgroundColor(new GrayColor(0.75f));
        switch(tf) {
        case 1:
            text.setBorderStyle(PdfBorderDictionary.STYLE_BEVELED);
            text.setText("Enter your name here...");
            text.setFontSize(0);
            text.setAlignment(Element.ALIGN_CENTER);
            text.setOptions(TextField.REQUIRED);
            break;
        case 2:
            text.setMaxCharacterLength(8);
            text.setOptions(TextField.COMB);
            text.setBorderStyle(PdfBorderDictionary.STYLE_SOLID);
//            text.setBorderColor(BaseColor.BLUE);
            text.setBorderWidth(2);
            break;
        case 3:
//            text.setBorderStyle(PdfBorderDictionary.STYLE_INSET);
            text.setOptions(TextField.PASSWORD);
            text.setVisibility(TextField.VISIBLE_BUT_DOES_NOT_PRINT);
            break;
        case 4:
//            text.setBorderStyle(PdfBorderDictionary.STYLE_DASHED);
//            text.setBorderColor(BaseColor.RED);
//            text.setBorderWidth(2);
            text.setFontSize(8);
            text.setText(
                "Enter the reason why you want to win a free accreditation for the Foobar Film Festival");
            text.setOptions(TextField.MULTILINE | TextField.REQUIRED);
            break;
        }
        try {
            PdfFormField field = text.getTextField();
            if (tf == 3) {
                field.setUserName("Choose a password");
            }
            writer.addAnnotation(field);
        }
        catch(IOException ioe) {
            throw new ExceptionConverter(ioe);
        }
        catch(DocumentException de) {
            throw new ExceptionConverter(de);
        }
    }

}
