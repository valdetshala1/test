package com.geoland.kfis.web.base.util;

import java.math.BigDecimal;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;
import net.sf.json.JsonConfig;

import org.apache.commons.beanutils.DynaBean;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

// TODO: Auto-generated Javadoc
/**
 * The Class JsonUtils.
 *
 * @author BEKIM BAJRAKTARI, GEO&LAND
 * @created Apr 19, 2014 10:52:48 AM
 * @Version 1.0
 */
public class JsonUtils{

    /** logger used by this class. */
    protected static final Log logger = LogFactory.getLog(JsonUtils.class);

    /** The Constant PATTERN_ARRAY. */
    public static final String PATTERN_ARRAY = "\\[(.*)\\]";
    
    /** The Constant PATTERN_OBJECT. */
    public static final String PATTERN_OBJECT = "\\{(.*)\\}";
    
    /** The Constant PATTERN_STRING. */
    public static final String PATTERN_STRING = "(\"|\')(.*)(\"|\')";

    /**
     * Convert json to array.
     *
     * @param jsonString the json string
     * @param config the config
     * @return the object[]
     */
    @SuppressWarnings("rawtypes")
	public static Object[] convertJsonToArray(String jsonString, JsonConfig config)
    {


        config.setArrayMode(JsonConfig.MODE_OBJECT_ARRAY);

        JSON json = JSONSerializer.toJSON(jsonString, config);

        if (config.getEnclosedType() != null && config.getEnclosedType().isArray())
        {
            Class c = config.getEnclosedType().getComponentType();
            return (Object[]) JSONArray.toArray((JSONArray) json, c);

        }
        return (Object[]) JSONArray.toArray((JSONArray) json, config);
    }

    /**
     * Convert json to bean.
     *
     * @param jsonString  Either an object, an array, or null. Otherwise, invalid JSON
     *                    string occurs.
     * @param config the config
     * @param returnType the return type
     * @param classMapping the class mapping
     * @return the object
     */
    @SuppressWarnings("rawtypes")
	public static Object convertJsonToBean(String jsonString, JsonConfig config, Class returnType, Map classMapping)
    {

        if (classMapping == null)
        {
            classMapping = Collections.EMPTY_MAP;
        }
        JSON json = JSONSerializer.toJSON(jsonString, config);
        Object bean = JSONObject.toBean((JSONObject) json, returnType, classMapping);

        return bean;
    }

    /**
     * Convert json to number.
     *
     * @param jsonString the json string
     * @return the big decimal
     */
    public static BigDecimal convertJsonToNumber(String jsonString)
    {
        return NumberUtils.createBigDecimal(jsonString);
    }

    /**
     * Converts a number array to a BigDecimal array. This is to overcome JSON-lib
     * returning either Integer, Double or other possible number types. Please take
     * note that BigDecimal is more resource-intensive.
     *
     * @param jsonString the json string
     * @param config the config
     * @return the big decimal[]
     */
    public static BigDecimal[] convertJsonToNumberArray(String jsonString, JsonConfig config)
    {

        Object[] objs = convertJsonToArray(jsonString, config);
        BigDecimal[] bds = new BigDecimal[objs.length];

        for (int i = 0; i < objs.length; i++)
        {
            bds[i] = new BigDecimal(objs[i].toString());
        }

        return bds;
    }

    /**
     * Convert json to string.
     *
     * @param jsonString the json string
     * @return the string
     */
    public static String convertJsonToString(String jsonString)
    {

        Pattern pattern = Pattern.compile("^" + PATTERN_STRING + "$");
        Matcher matcher = pattern.matcher(jsonString);

        if (matcher.matches())
        {
            jsonString = matcher.group(2);
        }

        return jsonString;
    }

    /**
     * Convert json to java object.
     *
     * @param jsonString the json string
     * @param config the config
     * @param returnType the return type
     * @param mappings the mappings
     * @return the object
     */
    @SuppressWarnings("rawtypes")
	public static Object convertJsonToJavaObject(String jsonString, JsonConfig config, Class returnType, Map mappings)
    {

        if (logger.isDebugEnabled())
        {
            logger.debug("Converting jsonString to Java object: jsonString=" + jsonString + ", config=" + config);
        }
        Object returnValue = null;

        if (isArray(jsonString))
        {
            if (List.class.isAssignableFrom(config.getEnclosedType()))
            {
                JSON json = JSONSerializer.toJSON(jsonString, config);
                returnValue = JSONArray.toCollection((JSONArray) json, config);
            }
            //Todo Sets don't seem to work
            else if (Set.class.isAssignableFrom(config.getEnclosedType()))
            {
                //Not sure why Json lib doesn't do this automatically
                config.setCollectionType(config.getEnclosedType());
                JSON json = JSONSerializer.toJSON(jsonString, config);
                returnValue = JSONArray.toCollection((JSONArray) json, config);
            }
            else
            {
                returnValue = convertJsonToArray(jsonString, config);
            }
        }
        else if (isObject(jsonString))
        {
            returnValue = convertJsonToBean(jsonString, config, returnType, mappings);
        }
        else if (isBoolean(jsonString))
        {
            returnValue = Boolean.valueOf(jsonString);
        }
        else if (isNumber(jsonString))
        {
            returnValue = convertJsonToNumber(jsonString);
        }
        else if (isNull(jsonString))
        {
            returnValue = null;
        }
        else if (isString(jsonString))
        {
            returnValue = convertJsonToString(jsonString);
        }
        else
        {
            throw new IllegalArgumentException(
                    "Provided JSON string matches neither of the known type: jsonString=" + jsonString);
        }

        if (logger.isDebugEnabled())
        {
            logger.debug("Converted and returning value '" + returnValue + "', of type '"
                    + ((returnValue != null) ? returnValue.getClass().getName() : null) + "'");
        }

        return returnValue;
    }

    /**
     * Convert java object to json.
     *
     * @param object the object
     * @param config the config
     * @return the string
     */
    public static String convertJavaObjectToJson(Object object, JsonConfig config)
    {

        if (object == null)
        {
            return "null";
        }

        if (object instanceof String)
        {
            return "'" + object + "'";
        }

        if (object instanceof Boolean || object instanceof Number)
        {
            return object.toString();
        }

        // Else, we try some luck then
        return JSONSerializer.toJSON(object, config).toString();
    }

    /**
     * Checks if the JSON string is an array. It does not validate the syntax of the
     * entire string.
     *
     * @param jsonString the json string
     * @return true, if is array
     */
    public static boolean isArray(String jsonString)
    {
        return isMatched(jsonString.trim(), "^" + PATTERN_ARRAY + "$");
    }

    /**
     * Checks if is boolean.
     *
     * @param jsonString the json string
     * @return true, if is boolean
     */
    public static boolean isBoolean(String jsonString)
    {
        return jsonString.equals("true") || jsonString.equals("false");
    }

    /**
     * Checks if is null.
     *
     * @param jsonString the json string
     * @return true, if is null
     */
    public static boolean isNull(String jsonString)
    {
        return jsonString.equals("null");
    }

    /**
     * Checks if the JSON string is a number. It does not validate the syntax of the
     * entire string.
     *
     * @param jsonString the json string
     * @return true, if is number
     */
    public static boolean isNumber(String jsonString)
    {
        return NumberUtils.isNumber(jsonString);
    }

    /**
     * Checks if the JSON string is an object. It does not validate the syntax of the
     * entire string.
     *
     * @param jsonString the json string
     * @return true, if is object
     */
    public static boolean isObject(String jsonString)
    {
        return isMatched(jsonString.trim(), "^" + PATTERN_OBJECT + "$");
    }

    /**
     * Checks if the JSON string is a string. It does not validate the syntax of the
     * entire string.
     *
     * @param jsonString the json string
     * @return true, if is string
     */
    public static boolean isString(String jsonString)
    {
        return !isNumber(jsonString) && !isBoolean(jsonString) && !isNull(jsonString) && !isArray(jsonString)
                && !isObject(jsonString);
    }

    /**
     * Checks if is matched.
     *
     * @param string the string
     * @param patternString the pattern string
     * @return true, if is matched
     */
    private static boolean isMatched(String string, String patternString)
    {

        Pattern pattern = Pattern.compile(patternString);
        Matcher matcher = pattern.matcher(string);

        return matcher.matches();
    }

    /**
     * Converts a DynaBean to intended Java object.
     *
     * @param clazz the clazz
     * @param dynaBean the dyna bean
     * @return the object from dyna bean
     * @throws Exception the exception
     */
    @SuppressWarnings("rawtypes")
	public static Object getObjectFromDynaBean(Class clazz, DynaBean dynaBean) throws Exception
    {

        Object returnValue = null;

        if (clazz == null || dynaBean == null)
        {
            throw new NullPointerException("Class instance or DynaBean instance should not be null, clazz="
                    + clazz + ", dynaBean=" + dynaBean);
        }

        returnValue = clazz.newInstance();
        org.apache.commons.beanutils.BeanUtils.copyProperties(returnValue, dynaBean);

        return returnValue;
    }

    /**
     * Gets the object from dyna bean.
     *
     * @param className the class name
     * @param dynaBean the dyna bean
     * @return the object from dyna bean
     * @throws Exception the exception
     */
    @SuppressWarnings("rawtypes")
	public static Object getObjectFromDynaBean(String className, DynaBean dynaBean) throws Exception
    {

        Class clazz = Class.forName(className);
        return getObjectFromDynaBean(clazz, dynaBean);
    }

    /**
     * Handy method to convert a jsonString (of type ObjectBean) to an object (its
     * getObject() method). Please take note that list type will be converted to
     * Object[] not List or its subtype.
     *
     * @param jsonString the json string
     * @param config the config
     * @param returnClass the return class
     * @return the object from json string
     * @throws Exception the exception
     */
    @SuppressWarnings("rawtypes")
	public static Object getObjectFromJsonString(String jsonString, JsonConfig config, Class returnClass) throws Exception
    {

        Object returnValue;
        Object object = JsonUtils.convertJsonToJavaObject(jsonString, config, returnClass, null);

        if (object instanceof DynaBean)
        {
            returnValue = getObjectFromDynaBean(returnClass, (DynaBean) object);
        }
        else
        {
            returnValue = object;
        }

        if (logger.isDebugEnabled())
        {
            logger.debug("Returning value of type " + ((returnValue == null) ? null : returnValue.getClass()));
        }

        return returnValue;
    }
}
