package com.geoland.kfis.print.msoffice;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.Date;
import java.util.Hashtable;

// TODO: Auto-generated Javadoc
/**
 * This code takes in a hashtable containing key fields required to populate
 * values into a Word template (XML) and output a Word document (also XML).
 * Template should contain ##KEY## fields for each hashtable key with same
 * name (without the ##s); the ##KEY## will be replaced by the value.
 * The main() method is written as an example.
 * Modified from code found at http://dinoch.dyndns.org:7070/WordML/AboutWordML.jsp
 * @author C. Peter Chen of http://dev-notes.com
 * @date 20080327
 */

public class MSWordUtils {
	
	/**
	 * This main() method is used for demonstration purposes only.
	 *
	 * @author C. Peter Chen of http://dev-notes.com
	 * @param args the arguments
	 * @date 20080327
	 */
	public static void main(String[] args) {
		String templatePathFilename1 = "D:\\Downloads\\POI\\print\\word_template.xml";
		String outputPathFilename1 = "D:\\Downloads\\POI\\print\\word_output.xml";
		
		String templatePathFilename = "D:\\Downloads\\POI\\print\\2_Refused_decision.xml";
		String outputPathFilename = "D:\\Downloads\\POI\\print\\2_Refused_decision_out.doc";
		
		Hashtable ht = new Hashtable();
		ht.put("INVOICENUMBER","384123");
		ht.put("CUSTOMERNAME","Some Company, LLC.");
		ht.put("ITEMNAME1","Coffee");
		ht.put("UNITPRICE1","1.50");
		ht.put("QTY1","1");
		ht.put("LINETOTAL1","1.50");
		ht.put("ITEMNAME2","Donut");
		ht.put("UNITPRICE2","1.00");
		ht.put("QTY2","2");
		ht.put("LINETOTAL2","2.00");
		ht.put("INVOICETOTAL","3.50");
		ht.put("DUEDATE","4/1/2008");
		
		//keto fuha i perkasin tempalte=2_Refused_decision.doc
		ht.put("FARMER","Endri Bajraktari");
		ht.put("MUNICIPALITY","Rahovec");
		ht.put("COMMUNE","Polluzhe");
		ht.put("NIF","233/39999/111");
		ht.put("GRANT","Për refuzim për pagesa direkte për bletë");
		ht.put("CURRENTDATE", new Date().toString());
		
		
		
		generateWordDoc(ht, templatePathFilename, outputPathFilename);
	}
	
	/**
	 * Letter 11.
	 */
	/*
	--11_Information_Letter(1).XML
	##NURDECISIONPD##
	##FARMER##
	##PERSONALID##
	##ADDRESS##
	##PHONENR##
	##GRANTNAME##
	##NUR##
	##LIST_INCOMPLET_DOCUMENTS##
	##ISSUED_DATE##
	*/
	public static void letter11(){
		String sql = "select * from ";
	}
	
	/**
	 * Generate word doc.
	 *
	 * @author C. Peter Chen of http://dev-notes.com
	 * @param ht the ht
	 * @param templatePathFilename the template path filename
	 * @param outputPathFilename the output path filename
	 * @date 20080327
	 */
	public static void generateWordDoc(Hashtable ht, String templatePathFilename, String outputPathFilename) {	
		try {
			//BufferedReader reader = new BufferedReader(new FileReader(templatePathFilename));
			BufferedReader reader = new BufferedReader(
					   new InputStreamReader(
			                      new FileInputStream(templatePathFilename), "UTF8"));
			
			
			File destination = new File(outputPathFilename);
			//Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outputPathFilename), "UTF8"));
			//BufferedWriter writer = new BufferedWriter(new FileWriter(destination));
			BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outputPathFilename), "UTF8"));

			String thisLine;
			int i = 0;
			
			while ((thisLine = reader.readLine()) != null) {
				System.out.println(i);
				
				for (java.util.Enumeration<String> e = ht.keys(); e.hasMoreElements();) {
					//String name = (String) e.nextElement();
					String name = new String(e.nextElement().getBytes(), "UTF-8");
					
					String value = ht.get(name).toString();
					// Use this if we need to XML-encode the string in hashtable value...
					thisLine = thisLine.replaceAll("##" + name.toUpperCase() + "##", XmlEncode(value));
					// ... or this if we do not need to do XML-encode.
					//thisLine= thisLine.replaceAll("##" + name.toUpperCase() + "##", value);
			    }
				String newString = new String(thisLine.getBytes("UTF-8"), "UTF-8");
				writer.write(newString);
				writer.newLine();
				i++;
			}
			writer.close();
			System.out.println("done");
		}
		catch (Exception e) {
			System.out.println("exception!=" + e);
		}
	}

	/**
	 * Generate word doc.
	 *
	 * @param ht the ht
	 * @param templatePathFilename the template path filename
	 * @param outputFile the output file
	 */
	public static void generateWordDoc(Hashtable<String, String> ht, String templatePathFilename, File outputFile) {	
		try {
			BufferedReader reader = new BufferedReader(
					   new InputStreamReader(
			                      new FileInputStream(templatePathFilename), "UTF8"));
			
			BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outputFile), "UTF8"));

			String thisLine;
			int i = 0;
			
			while ((thisLine = reader.readLine()) != null) {
//				System.out.println(i);
				for (java.util.Enumeration<String> e = ht.keys(); e.hasMoreElements();) {
					String name = new String(e.nextElement().getBytes(), "UTF-8");
					String value = ht.get(name).toString();
					thisLine = thisLine.replaceAll("##" + name.toUpperCase() + "##", XmlEncode(value));
//					thisLine = thisLine.replaceAll("##" + name.toUpperCase() + "##", value);
					if(name.equals("LIST_INCOMPLET_DOCUMENTS")){
						//thisLine("<w:br/>");
						//writer.newLine();
						//writer.write("<w:br/>");
					}
					
			    }
				String newString = new String(thisLine.getBytes("UTF-8"), "UTF-8");
				writer.write(newString);

				writer.newLine();
				i++;
			}
			writer.close();
//			System.out.println("done");
		}
		catch (Exception e) {
			System.out.println("exception!=" + e);
		}
	}
	
	/**
	 * Encodes regular text to XML.
	 *
	 * @author http://dinoch.dyndns.org:7070/WordML/AboutWordML.jsp
	 * @param text the text
	 * @return string
	 * @date 20050328
	 */
	private static String XmlEncode(String text) {
		int[] charsRequiringEncoding = {38, 60, 62, 34, 61, 39};
		for(int i = 0; i < charsRequiringEncoding.length - 1; i++) {
			text = text.replaceAll(String.valueOf((char)charsRequiringEncoding[i]),"&#"+charsRequiringEncoding[i]+";");
		}
		return text; 
	}
	
}