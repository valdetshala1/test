package com.geoland.kfis.logic.utils;

import java.io.UnsupportedEncodingException;

import org.apache.commons.lang3.Validate;

// TODO: Auto-generated Javadoc
/**
 * The Class StringUtils.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created July 6, 2014 3:03:06 AM
 * @Version 1.0
 */
public class StringUtils {

  /** The Constant BAR. */
  public static final String BAR    = bar(1);
  
  /** The Constant END. */
  public static final String END    = bar(2);
  
  /** The Constant MIDDLE. */
  public static final String MIDDLE = bar(3);

  /**
   * Bar.
   *
   * @param i the i
   * @return the string
   */
  private static String bar(int i) {
    try {
      switch (i) {
      case 1:
        return new String(new byte[] { -30, -108, -126 }, "utf8");
      case 2:
        return new String(new byte[] { -30, -108, -108 }, "utf8");
      case 3:
        return new String(new byte[] { -30, -108, -100 }, "utf8");
      }
    } catch (UnsupportedEncodingException e) {
      e.printStackTrace();
    }
    return null;
  }

  /**
   * Format a paragraph to that has all lines but the first indented.
   *
   * @param text text to be formatted
   * @param hangIndent hanging indentation. hangIndent >= 0
   * @param width the width of formatted paragraph
   * @param considerSpace true if only split at white spaces.
   * @return the string
   */
  public static String hangIndent(String text, int hangIndent, int width,
      boolean considerSpace) {
    Validate.isTrue(
        hangIndent >= 0,
        "hangIndent should not be negative: %d",
        hangIndent);
    Validate.isTrue(width >= 0, "text width should not be negative: %d", width);
    Validate.isTrue(
        hangIndent < width,
        "hangIndent should not be less than width: hangIndent=%d, width=%d",
        hangIndent,
        width);

    StringBuilder sb = new StringBuilder(text.substring(0, hangIndent));
    // Needed to handle last line correctly.
    // Will be trimmed at last
    text = text.substring(hangIndent) + "\n";
    // hang indent
    String spaces = org.apache.commons.lang3.StringUtils
        .repeat(' ', hangIndent);
    String replacement = spaces + "$1\n";
    String regex = "(.{1," + (width - hangIndent) + "})";
    if (considerSpace) {
      regex += "\\s+";
    }
    text = text.replaceAll(regex, replacement);
    // remove first spaces and last "\n"
    text = text.substring(hangIndent, text.length() - 1);
    return sb.append(text).toString();
  }

  /**
   * Format a paragraph to that has the first indented.
   *
   * @param text text to be formatted
   * @param indent indentation. indent >= 0
   * @param width the width of formatted paragraph
   * @param considerSpace true if only split at white spaces.
   * @return the string
   */
  public static String indent(String text, int indent, int width,
      boolean considerSpace) {
    Validate.isTrue(indent >= 0, "indent should not be negative: %d", indent);
    Validate.isTrue(width >= 0, "text width should not be negative: %d", width);
    Validate.isTrue(
        indent < width,
        "indent should not be less than width: indent=%d, width=%d",
        indent,
        width);

    String spaces = org.apache.commons.lang3.StringUtils.repeat(' ', indent);

    // Needed to handle last line correctly.
    // Will be trimmed at last
    text = spaces + text + "\n";
    // split
    String replacement = "$1\n";
    String regex = "(.{1," + width + "})";
    if (considerSpace) {
      regex += "\\s+";
    }
    text = text.replaceAll(regex, replacement);
    // remove first spaces and last "\n"
    text = text.substring(0, text.length() - 1);
    return text;
  }
}
