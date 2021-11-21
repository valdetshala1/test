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

import java.util.ArrayList;
import java.util.regex.Pattern;

// TODO: Auto-generated Javadoc
/**
 * The Class PatternBuilder.
 */
public class PatternBuilder {

    /** The fragments. */
    private final ArrayList<String> fragments = new ArrayList<>();

    /**
     * Optional.
     *
     * @return the pattern builder
     */
    public PatternBuilder optional() {
        return optional(1);
    }

    /**
     * Optional.
     *
     * @param count the count
     * @return the pattern builder
     */
    public PatternBuilder optional(int count) {
        fragments.add(fragments.size() - count, "(?:");
        fragments.add(")?");
        return this;
    }

    /**
     * Expression.
     *
     * @param s the s
     * @return the pattern builder
     */
    public PatternBuilder expression(String s) {
        s = s.replaceAll("\\|$", "\\\\|"); // special case for delimiter

        fragments.add(s);
        return this;
    }

    /**
     * Text.
     *
     * @param s the s
     * @return the pattern builder
     */
    public PatternBuilder text(String s) {
        fragments.add(s.replaceAll("([\\\\\\.\\[\\{\\(\\)\\*\\+\\?\\^\\$\\|])", "\\\\$1"));
        return this;
    }

    /**
     * Number.
     *
     * @param s the s
     * @return the pattern builder
     */
    public PatternBuilder number(String s) {
        s = s.replace("dddd", "d{4}").replace("ddd", "d{3}").replace("dd", "d{2}");
        s = s.replace("xxxx", "x{4}").replace("xxx", "x{3}").replace("xx", "x{2}");

        s = s.replace("d", "\\d").replace("x", "[0-9a-fA-F]").replaceAll("([\\.])", "\\\\$1");
        s = s.replaceAll("\\|$", "\\\\|").replaceAll("^\\|", "\\\\|"); // special case for delimiter

        fragments.add(s);
        return this;
    }

    /**
     * Any.
     *
     * @return the pattern builder
     */
    public PatternBuilder any() {
        fragments.add(".*?");
        return this;
    }

    /**
     * Binary.
     *
     * @param s the s
     * @return the pattern builder
     */
    public PatternBuilder binary(String s) {
        fragments.add(s.replaceAll("(\\p{XDigit}{2})", "\\\\$1"));
        return this;
    }

    /**
     * Or.
     *
     * @return the pattern builder
     */
    public PatternBuilder or() {
        fragments.add("|");
        return this;
    }

    /**
     * Group begin.
     *
     * @return the pattern builder
     */
    public PatternBuilder groupBegin() {
        return expression("(?:");
    }

    /**
     * Group end.
     *
     * @return the pattern builder
     */
    public PatternBuilder groupEnd() {
        return expression(")");
    }

    /**
     * Group end.
     *
     * @param s the s
     * @return the pattern builder
     */
    public PatternBuilder groupEnd(String s) {
        return expression(")" + s);
    }

    /**
     * Compile.
     *
     * @return the pattern
     */
    public Pattern compile() {
        return Pattern.compile(toString(), Pattern.DOTALL);
    }

    /* (non-Javadoc)
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        for (String fragment : fragments) {
            builder.append(fragment);
        }
        return builder.toString();
    }

}
