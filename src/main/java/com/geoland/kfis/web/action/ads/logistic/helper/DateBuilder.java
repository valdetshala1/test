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

import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

// TODO: Auto-generated Javadoc
/**
 * The Class DateBuilder.
 */
public class DateBuilder {

    /** The calendar. */
    private Calendar calendar;

    /**
     * Instantiates a new date builder.
     */
    public DateBuilder() {
        this(TimeZone.getTimeZone("UTC"));
    }

    /**
     * Instantiates a new date builder.
     *
     * @param time the time
     */
    public DateBuilder(Date time) {
        this(time, TimeZone.getTimeZone("UTC"));
    }

    /**
     * Instantiates a new date builder.
     *
     * @param timeZone the time zone
     */
    public DateBuilder(TimeZone timeZone) {
        this(new Date(0), timeZone);
    }

    /**
     * Instantiates a new date builder.
     *
     * @param time the time
     * @param timeZone the time zone
     */
    public DateBuilder(Date time, TimeZone timeZone) {
        calendar = Calendar.getInstance(timeZone);
        calendar.clear();
        calendar.setTimeInMillis(time.getTime());
    }

    /**
     * Sets the year.
     *
     * @param year the year
     * @return the date builder
     */
    public DateBuilder setYear(int year) {
        if (year < 100) {
            year += 2000;
        }
        calendar.set(Calendar.YEAR, year);
        return this;
    }

    /**
     * Sets the month.
     *
     * @param month the month
     * @return the date builder
     */
    public DateBuilder setMonth(int month) {
        calendar.set(Calendar.MONTH, month - 1);
        return this;
    }

    /**
     * Sets the day.
     *
     * @param day the day
     * @return the date builder
     */
    public DateBuilder setDay(int day) {
        calendar.set(Calendar.DAY_OF_MONTH, day);
        return this;
    }

    /**
     * Sets the date.
     *
     * @param year the year
     * @param month the month
     * @param day the day
     * @return the date builder
     */
    public DateBuilder setDate(int year, int month, int day) {
        return setYear(year).setMonth(month).setDay(day);
    }

    /**
     * Sets the date reverse.
     *
     * @param day the day
     * @param month the month
     * @param year the year
     * @return the date builder
     */
    public DateBuilder setDateReverse(int day, int month, int year) {
        return setDate(year, month, day);
    }

    /**
     * Sets the current date.
     *
     * @return the date builder
     */
    public DateBuilder setCurrentDate() {
        Calendar now = Calendar.getInstance(calendar.getTimeZone());
        return setYear(now.get(Calendar.YEAR)).setMonth(now.get(Calendar.MONTH)).setDay(now.get(Calendar.DAY_OF_MONTH));
    }

    /**
     * Sets the hour.
     *
     * @param hour the hour
     * @return the date builder
     */
    public DateBuilder setHour(int hour) {
        calendar.set(Calendar.HOUR_OF_DAY, hour);
        return this;
    }

    /**
     * Sets the minute.
     *
     * @param minute the minute
     * @return the date builder
     */
    public DateBuilder setMinute(int minute) {
        calendar.set(Calendar.MINUTE, minute);
        return this;
    }

    /**
     * Adds the minute.
     *
     * @param minute the minute
     * @return the date builder
     */
    public DateBuilder addMinute(int minute) {
        calendar.add(Calendar.MINUTE, minute);
        return this;
    }

    /**
     * Sets the second.
     *
     * @param second the second
     * @return the date builder
     */
    public DateBuilder setSecond(int second) {
        calendar.set(Calendar.SECOND, second);
        return this;
    }

    /**
     * Sets the millis.
     *
     * @param millis the millis
     * @return the date builder
     */
    public DateBuilder setMillis(int millis) {
        calendar.set(Calendar.MILLISECOND, millis);
        return this;
    }

    /**
     * Adds the millis.
     *
     * @param millis the millis
     * @return the date builder
     */
    public DateBuilder addMillis(long millis) {
        calendar.setTimeInMillis(calendar.getTimeInMillis() + millis);
        return this;
    }

    /**
     * Sets the time.
     *
     * @param hour the hour
     * @param minute the minute
     * @param second the second
     * @return the date builder
     */
    public DateBuilder setTime(int hour, int minute, int second) {
        return setHour(hour).setMinute(minute).setSecond(second);
    }

    /**
     * Sets the time reverse.
     *
     * @param second the second
     * @param minute the minute
     * @param hour the hour
     * @return the date builder
     */
    public DateBuilder setTimeReverse(int second, int minute, int hour) {
        return setHour(hour).setMinute(minute).setSecond(second);
    }

    /**
     * Sets the time.
     *
     * @param hour the hour
     * @param minute the minute
     * @param second the second
     * @param millis the millis
     * @return the date builder
     */
    public DateBuilder setTime(int hour, int minute, int second, int millis) {
        return setHour(hour).setMinute(minute).setSecond(second).setMillis(millis);
    }

    /**
     * Gets the date.
     *
     * @return the date
     */
    public Date getDate() {
        return calendar.getTime();
    }

}
