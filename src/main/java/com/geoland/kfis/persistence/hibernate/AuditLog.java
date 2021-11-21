package com.geoland.kfis.persistence.hibernate;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.TreeMap;

import org.apache.log4j.Logger;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.geoland.framework.persistence.base.AbstractPersistentObject;
import com.geoland.framework.persistence.hibernate.HibSessionFactory;
import com.geoland.framework.persistence.model.User;

// TODO: Auto-generated Javadoc
/**
 * Class responsible for auditing.
 *
 * @author GEOLAND
 * @param <T> the generic type
 */
public class AuditLog<T>{
	
	/** The log. */
	private static Logger _log = Logger.getLogger(AuditInterceptor.class);
	
	/** The table check. */
	private static Map<String, String> tableCheck = new HashMap<String, String>();

	/**
	 * Compare entries.
	 *
	 * @param <K> the key type
	 * @param <V> the value type
	 * @param map1 the map 1
	 * @param map2 the map 2
	 * @return the map
	 */
	protected static <K extends Comparable<? super K>, V>
	Map<K, String> compareEntries(final Map<K, V> map1, final Map<K, V> map2){
	    final Collection<K> allKeys = new HashSet<K>();
	    allKeys.addAll(map1.keySet());
	    allKeys.addAll(map2.keySet());
	    final Map<K, String> result = new TreeMap<K, String>();
	    for(final K key : allKeys){
	    	if(map1.containsKey(key) == map2.containsKey(key) &&
		            !Boolean.valueOf(equal(map1.get(key), map2.get(key)))){
	        result.put(key,map2.get(key)!=null?map2.get(key).toString():"");
	    	}
	    }
	    return result;
	}

	/**
	 * equal.
	 *
	 * @param obj1 the obj 1
	 * @param obj2 the obj 2
	 * @return boolean
	 */
	protected static boolean equal(final Object obj1, final Object obj2){
		if(obj1!=null && obj2!=null){
			return obj1.toString().equals(obj2.toString());
		}
	    return obj1 == obj2 || (obj1 != null && obj1.equals(obj2));
	}
	
	/**
	 * audit method.
	 *
	 * @param action the action
	 * @param data the data
	 * @throws IllegalArgumentException the illegal argument exception
	 * @throws IllegalAccessException the illegal access exception
	 */
	public static void audit(String action, Set<AbstractPersistentObject> data) throws IllegalArgumentException, IllegalAccessException{
		for (AbstractPersistentObject entity : data) {
			String auditTable = "tables_aud";
			boolean bOk = checkIfTableExists(auditTable);
			if(bOk){
				String diff = "";
				Map<String, Object> fieldNamesAndValues = ObjUtil.getFieldNamesAndValues(entity);
				String _origData="";
				Session s = HibSessionFactory.getSessionFactory().openSession();
				Object _orig = loadOrignial(entity.getClass(), entity.getId(),s);
				if("UPDATE".equals(action) && _orig!=null ){
					
					Map<String, Object> _origValues = ObjUtil.getFieldNamesAndValues(_orig);
					_origData = ObjUtil.getFieldsData(_orig);
					final Map<String, String> comparisonResult = compareEntries(_origValues, fieldNamesAndValues);
					
					StringBuilder bui = new StringBuilder();
					Iterator<Entry<String, String>> iterator = comparisonResult.entrySet().iterator();
					while (iterator.hasNext()){
						Entry<String, String> next = iterator.next();
						String objValue=next.getValue();
						if(next.getValue().startsWith("com.geoland.kfis")){
							String []itemSplit = next.getValue().split("\\.");
							objValue=itemSplit[itemSplit.length-1];
						}
							bui.append(next.getKey()+"=>>" + objValue);
							if(iterator.hasNext())
								bui.append("|||");
					}
				    if(bui.length()>0){
				    	diff = "" + bui.toString() + "";
				    }						
				}
				if("DELETE".equals(action)){
					_origData = ObjUtil.getFieldsData(_orig);
				}
				s.close();
				String userdata = "NONE";
				User cu = entity.getCurrentUser();
				if(cu!=null) 
					userdata = cu.getFirstName() + " " + cu.getLastName() + "(" + cu.getUsername() + ")";
				
				Date currentDate = new Date();
				String  sql = "insert into " + auditTable + " (ACTION,DETAIL,DIFF,ENTITY_ID,ENTITY_NAME,CREATED_DATE,CERATED_BY) values('" + action + "', '"+_origData+"', '"  + diff + "', " + entity.getId() + ", '" + entity.getClass().getSimpleName() + "', '"  + currentDate.toString() + "', '" + userdata + "')" ;
				SQLQuery createSQLQuery = HibSessionFactory.getSessionFactory().getCurrentSession().createSQLQuery(sql);
				createSQLQuery.executeUpdate();
			}else{
				_log.info("Audit TABLE " + auditTable + " dosn't exists. Please check database schema.");
			}
			
		}
	}
	
	/**
	 * Load orignial.
	 *
	 * @param clazz the clazz
	 * @param id the id
	 * @param s the s
	 * @return the object
	 */
	protected static Object loadOrignial(Class<?> clazz, Serializable id,Session s){
		Object obj = null;
		try {
			obj = s.get(clazz, id);
		} catch (Exception e) {
			throw new RuntimeException( e );
		} finally {
//			s.close();
		}
		return obj;
	}	
	
	/**
	 * Check if table exists.
	 *
	 * @param tableName the table name
	 * @return true, if successful
	 */
	@SuppressWarnings("unchecked")
	protected static boolean checkIfTableExists(String tableName){
		if(tableCheck.containsKey(tableName)){
			return true;
		}
		
		boolean ret = false;
		String sql = "SELECT EXISTS ( SELECT 1 FROM pg_catalog.pg_class c JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace" +
				" WHERE  n.nspname = 'public'" +
				" AND    c.relname = '" + tableName + "'" +
				" AND    c.relkind = 'r');";
		SQLQuery query = HibSessionFactory.getSessionFactory().getCurrentSession().createSQLQuery(sql);
		List<Boolean> list = query.list();
		if(list!=null && !list.isEmpty()){
			ret = list.get(0);
			tableCheck.put(tableName, tableName);
		}
		
		return ret;
	}	
}
