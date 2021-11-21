package com.geoland.kfis.print.msoffice;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;

// TODO: Auto-generated Javadoc
/**
 * The Class CreateDocumentFromScratch.
 */
public class CreateDocumentFromScratch {
	 
    /**
     * The main method.
     *
     * @param args the arguments
     */
    public static void main(String[] args) {
        XWPFDocument document = new XWPFDocument();
 
        XWPFParagraph paragraphOne = document.createParagraph();
        XWPFRun paragraphOneRunOne = paragraphOne.createRun();
        paragraphOneRunOne.setText("Hello world! This is paragraph one!");
        XWPFRun paragraphOneRunTwo = paragraphOne.createRun();
        paragraphOneRunTwo.setText(" More text in paragraph one...");
 
        XWPFParagraph paragraphTwo = document.createParagraph();
        XWPFRun paragraphTwoRunOne = paragraphTwo.createRun();
        paragraphTwoRunOne.setText("And this is paragraph two.");
 
        FileOutputStream outStream = null;
        try {
            outStream = new FileOutputStream("D:\\Downloads\\POI\\test.doc");
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
 
        try {
            document.write(outStream);
            outStream.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
 
}