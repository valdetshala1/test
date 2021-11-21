package com.geoland.kfis.web.base.converter;

import java.text.*;

// TODO: Auto-generated Javadoc
/**
 * The Class BewareDecimalFormat.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created Apr 19, 2014 10:35:39 AM
 * @Version 1.0
 */
public final class BewareDecimalFormat {

  /**
   * The main method.
   *
   * @param aArguments the arguments
   */
  public static void main (String... aArguments) {

    String patternOne = "#,##0.00";
    log("Format : " + patternOne);
    parseUserInput("1000", patternOne);
    parseUserInput("1,000.00", patternOne);
    parseUserInput("1000.33", patternOne);
    parseUserInput(".20", patternOne);
    parseUserInput(".2", patternOne); 
    parseUserInput(".222", patternOne); 
    parseUserInput(".222333444", patternOne); 
    parseUserInput("100.222333444", patternOne); 
    parseUserInput(".22A", patternOne); 
    parseUserInput(".22BlahA", patternOne); 
    parseUserInput("22Blah", patternOne); 
    parseUserInput("Blah22", patternOne); 
    parseUserInput("100000,000.00", patternOne);
    parseUserInput("10,0000,000.00", patternOne);
    parseUserInput("1,0000,0000.00", patternOne);

    String patternTwo= "#,###0.00"; //group every 4 digits, not 3
    log(" ");
    log("Format : " + patternTwo);
    parseUserInput("1000.00", patternTwo);
    parseUserInput("1,000.00", patternTwo);
    parseUserInput("1,0000.00", patternTwo);
    parseUserInput("1,00000.00", patternTwo);
    log("Done.");
  }

  // PRIVATE //

  /**
   * Parses the user input.
   *
   * @param aValue the a value
   * @param aDecimalFormatPattern the a decimal format pattern
   */
  private static void parseUserInput(String aValue, String aDecimalFormatPattern) {
    DecimalFormat format = new DecimalFormat(aDecimalFormatPattern);
    ParsePosition parsePosition = new ParsePosition(0);
    Object object = format.parse(aValue, parsePosition);

    if( object == null ) {
      log("Failed to parse: " + aValue);
    }
    else if( parsePosition.getIndex() < aValue.length() ) {
      log(
        aValue + " parsed OK (not whole input) ParsePos:" + 
        parsePosition.getIndex() + ", Parse Result: " + object 
      );
    }
    else {
      log(
        aValue + " parsed OK. ParsePos: " + parsePosition.getIndex() + 
        ", Parse Result: " + object
      );
    } 
  }

  /**
   * Log.
   *
   * @param aMessage the a message
   */
  private static void log(Object aMessage){
    System.out.println(String.valueOf(aMessage));
  }
} 
