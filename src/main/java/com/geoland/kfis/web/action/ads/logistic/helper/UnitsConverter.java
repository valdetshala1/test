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

// TODO: Auto-generated Javadoc
/**
 * The Class UnitsConverter.
 */
public final class UnitsConverter {

    /**
     * Instantiates a new units converter.
     */
    private UnitsConverter() {
    }

    /**
     * Knots from kph.
     *
     * @param value the value
     * @return the double
     */
    public static double knotsFromKph(double value) { // km/h
        return value * 0.539957;
    }

    /**
     * Knots from mph.
     *
     * @param value the value
     * @return the double
     */
    public static double knotsFromMph(double value) {
        return value * 0.868976;
    }

    /**
     * Knots from mps.
     *
     * @param value the value
     * @return the double
     */
    public static double knotsFromMps(double value) { // m/s
        return value * 1.94384;
    }

    /**
     * Knots from cps.
     *
     * @param value the value
     * @return the double
     */
    public static double knotsFromCps(double value) { // cm/s
        return value * 0.0194384449;
    }

}
