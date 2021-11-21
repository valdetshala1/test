package com.geoland.kfis.persistence.hibernate;

import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;

// TODO: Auto-generated Javadoc
/**
 * The Class ObjUtil.
 */
public class ObjUtil {
	
	/** The Constant logger. */
	private final static Logger logger = Logger.getLogger(ObjUtil.class);

	/**
	 * Gets the class annotation value.
	 *
	 * @param classType the class type
	 * @param annotationType the annotation type
	 * @param attributeName the attribute name
	 * @return the class annotation value
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static String getClassAnnotationValue(Class classType, Class annotationType, String attributeName) {
        String value = null;
        Annotation annotation = classType.getAnnotation(annotationType);
        if (annotation != null) {
            try {
                value = (String) annotation.annotationType().getMethod(attributeName).invoke(annotation);
            } catch (Exception ex) {
            }
        }
 
        return value;
    }
	
	/**
	 * Gets the field names and values.
	 *
	 * @param valueObj the value obj
	 * @return the field names and values
	 * @throws IllegalArgumentException the illegal argument exception
	 * @throws IllegalAccessException the illegal access exception
	 */
	@SuppressWarnings("rawtypes")
	public static Map<String, Object> getFieldNamesAndValues(final Object valueObj)
			throws IllegalArgumentException, IllegalAccessException {
		//logger.info("Begin - getFieldNamesAndValues");
		Class c1 = valueObj.getClass();
		//logger.info("Class name got is:: " + c1.getName());

		Map<String, Object> fieldMap = new HashMap<String, Object>();
		Field[] valueObjFields = c1.getDeclaredFields();

		// compare values now
		for (int i = 0; i < valueObjFields.length; i++) {
			if(!valueObjFields[i].getType().getCanonicalName().equals("java.util.Set")){
				String fieldName = valueObjFields[i].getName();
				//logger.info("Getting Field Values for Field:: " + valueObjFields[i].getName() + ", Type:: " + valueObjFields[i].getType());
				valueObjFields[i].setAccessible(true);
	
				Object newObj = valueObjFields[i].get(valueObj);
	
				//logger.info("Value of field" + fieldName + "newObj:: " + newObj);
				fieldMap.put(fieldName, newObj);
			}
		}
		//logger.info("End - getFieldNamesAndValues");
		return fieldMap;
	}
	
	/**
	 * Gets the fields data.
	 *
	 * @param valueObj the value obj
	 * @return the fields data
	 * @throws IllegalArgumentException the illegal argument exception
	 * @throws IllegalAccessException the illegal access exception
	 */
	@SuppressWarnings("rawtypes")
	public static String getFieldsData(final Object valueObj)
			throws IllegalArgumentException, IllegalAccessException {
		//logger.info("Begin - getFieldNamesAndValues");
		Class c1 = valueObj.getClass();
		//logger.info("Class name got is:: " + c1.getName());

		Field[] valueObjFields = c1.getDeclaredFields();

		String output="";
		// compare values now
		for (int i = 0; i < valueObjFields.length; i++) {
			if(!valueObjFields[i].getType().getCanonicalName().equals("java.util.Set") &&
					!valueObjFields[i].getName().equals("serialVersionUID")&&
					!valueObjFields[i].getName().equals("id")){
				String fieldName = valueObjFields[i].getName();
				//logger.info("Getting Field Values for Field:: " + valueObjFields[i].getName() + ", Type:: " + valueObjFields[i].getType());
				valueObjFields[i].setAccessible(true);
				Object newObj = valueObjFields[i].get(valueObj);
				String objValue ="null";
				if(newObj!=null)
					objValue =newObj.toString();
				if(objValue.startsWith("com.geoland.kfis")){
					String []itemSplit = objValue.split("\\.");
					objValue=itemSplit[itemSplit.length-1];
				}
				
				output += fieldName+"=>>" +objValue;
				if(i<valueObjFields.length-1)
					output +="|||";
//				fieldMap.put(fieldName, newObj);
			}
		}
		//logger.info("End - getFieldNamesAndValues");
		return output;
	}
	
	/**
	 * Gets the simple field names and values.
	 *
	 * @param valueObj the value obj
	 * @return Map
	 * @throws IllegalArgumentException the illegal argument exception
	 * @throws IllegalAccessException the illegal access exception
	 */
	@SuppressWarnings("rawtypes")
	public static Map<String, Object> getSimpleFieldNamesAndValues(final Object valueObj)
			throws IllegalArgumentException, IllegalAccessException {
		logger.info("Begin - getFieldNamesAndValues");
		Class c1 = valueObj.getClass();
		logger.info("Class name got is:: " + c1.getName());

		Map<String, Object> fieldMap = new HashMap<String, Object>();
		Field[] valueObjFields = c1.getDeclaredFields();
		
		// compare values now
		for (int i = 0; i < valueObjFields.length; i++) {

			if(valueObjFields[i].getType().isPrimitive()){
				String fieldName = valueObjFields[i].getName();
	
				logger.info("Getting Field Values for Field:: " + valueObjFields[i].getName());
				valueObjFields[i].setAccessible(true);
	
				Object newObj = valueObjFields[i].get(valueObj);
	
				logger.info("Value of field" + fieldName + "newObj:: " + newObj);
				fieldMap.put(fieldName, newObj);
			}

		}
		logger.info("End - getFieldNamesAndValues");
		return fieldMap;
	}
	
	/** The built in map. */
	@SuppressWarnings("rawtypes")
	private static Map<String, Class> builtInMap = new HashMap<String, Class>();
	static{
	       builtInMap.put("int", Integer.TYPE );
	       builtInMap.put("long", Long.TYPE );
	       builtInMap.put("double", Double.TYPE );
	       builtInMap.put("float", Float.TYPE );
	       builtInMap.put("bool", Boolean.TYPE );
	       builtInMap.put("char", Character.TYPE );
	       builtInMap.put("byte", Byte.TYPE );
	       builtInMap.put("void", Void.TYPE );
	       builtInMap.put("short", Short.TYPE );
	       
	}	
}
