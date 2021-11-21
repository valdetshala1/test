/*
 * Copyright 2015 Anton Tananaev (anton.tananaev@gmail.com)
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.geoland.kfis.web.action.ads.logistic.helper;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

// TODO: Auto-generated Javadoc
/**
 * The Class Parser.
 */
public class Parser {

    /** The position. */
    private int position;
    
    /** The matcher. */
    private Matcher matcher;

    /**
     * Instantiates a new parser.
     *
     * @param pattern the pattern
     * @param input the input
     */
    public Parser(Pattern pattern, String input) {
        matcher = pattern.matcher(input);
    }

    /**
     * Matches.
     *
     * @return true, if successful
     */
    public boolean matches() {
        position = 1;
        return matcher.matches();
    }

    /**
     * Find.
     *
     * @return true, if successful
     */
    public boolean find() {
        position = 1;
        return matcher.find();
    }

    /**
     * Skip.
     *
     * @param number the number
     */
    public void skip(int number) {
        position += number;
    }

    /**
     * Checks for next.
     *
     * @return true, if successful
     */
    public boolean hasNext() {
        return hasNext(1);
    }

    /**
     * Checks for next.
     *
     * @param number the number
     * @return true, if successful
     */
    public boolean hasNext(int number) {
        String value = matcher.group(position);
        if (value != null && !value.isEmpty()) {
            return true;
        } else {
            position += number;
            return false;
        }
    }

    /**
     * Next.
     *
     * @return the string
     */
    public String next() {
        return matcher.group(position++);
    }

    /**
     * Next int.
     *
     * @return the int
     */
    public int nextInt() {
        return nextInt(10);
    }

    /**
     * Next int.
     *
     * @param radix the radix
     * @return the int
     */
    public int nextInt(int radix) {
        if (hasNext()) {
            return Integer.parseInt(next(), radix);
        } else {
            return 0;
        }
    }

    /**
     * Next long.
     *
     * @return the long
     */
    public long nextLong() {
        return nextLong(10);
    }

    /**
     * Next long.
     *
     * @param radix the radix
     * @return the long
     */
    public long nextLong(int radix) {
        if (hasNext()) {
            return Long.parseLong(next(), radix);
        } else {
            return 0;
        }
    }

    /**
     * Next double.
     *
     * @return the double
     */
    public double nextDouble() {
        if (hasNext()) {
            return Double.parseDouble(next());
        } else {
            return 0.0;
        }
    }

    /**
     * The Enum CoordinateFormat.
     */
    public enum CoordinateFormat {
        
        /** The deg deg. */
        DEG_DEG,
        
        /** The deg hem. */
        DEG_HEM,
        
        /** The deg min min. */
        DEG_MIN_MIN,
        
        /** The deg min hem. */
        DEG_MIN_HEM,
        
        /** The deg min min hem. */
        DEG_MIN_MIN_HEM,
        
        /** The hem deg min min. */
        HEM_DEG_MIN_MIN,
        
        /** The hem deg. */
        HEM_DEG,
        
        /** The hem deg min. */
        HEM_DEG_MIN,
        
        /** The hem deg min hem. */
        HEM_DEG_MIN_HEM
    }

    /**
     * Next coordinate.
     *
     * @param format the format
     * @return the double
     */
    public double nextCoordinate(CoordinateFormat format) {
        double coordinate;
        String hemisphere = null;

        switch (format) {
            case DEG_DEG:
                coordinate = Double.parseDouble(next() + '.' + next());
                break;
            case DEG_HEM:
                coordinate = nextDouble();
                hemisphere = next();
                break;
            case DEG_MIN_MIN:
                coordinate = nextInt();
                coordinate += Double.parseDouble(next() + '.' + next()) / 60;
                break;
            case DEG_MIN_MIN_HEM:
                coordinate = nextInt();
                coordinate += Double.parseDouble(next() + '.' + next()) / 60;
                hemisphere = next();
                break;
            case HEM_DEG:
                hemisphere = next();
                coordinate = nextDouble();
                break;
            case HEM_DEG_MIN:
                hemisphere = next();
                coordinate = nextInt();
                coordinate += nextDouble() / 60;
                break;
            case HEM_DEG_MIN_HEM:
                hemisphere = next();
                coordinate = nextInt();
                coordinate += nextDouble() / 60;
                if (hasNext()) {
                    hemisphere = next();
                }
                break;
            case HEM_DEG_MIN_MIN:
                hemisphere = next();
                coordinate = nextInt();
                coordinate += Double.parseDouble(next() + '.' + next()) / 60;
                break;
            case DEG_MIN_HEM:
            default:
                coordinate = nextInt();
                coordinate += nextDouble() / 60;
                hemisphere = next();
                break;
        }

        if (hemisphere != null && (hemisphere.equals("S") || hemisphere.equals("W") || hemisphere.equals("-"))) {
            coordinate = -coordinate;
        }

        return coordinate;
    }

    /**
     * Next coordinate.
     *
     * @return the double
     */
    public double nextCoordinate() {
        return nextCoordinate(CoordinateFormat.DEG_MIN_HEM);
    }

}
