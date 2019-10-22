package com.oracle.intelagr.common;

import java.beans.PropertyDescriptor;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.ResourceBundle;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.BeanUtils;


public final class POVOConvertUtil {
	private static Log log = LogFactory.getLog(POVOConvertUtil.class);

	public static Map convertBundleToMap(ResourceBundle rb) {
		Map map = new HashMap();
		for (Enumeration keys = rb.getKeys(); keys.hasMoreElements();) {
			String key = (String) keys.nextElement();
			map.put(key, rb.getString(key));
		}
		return map;
	}

	public static Properties convertBundleToProperties(ResourceBundle rb) {
		Properties props = new Properties();
		for (Enumeration keys = rb.getKeys(); keys.hasMoreElements();) {
			String key = (String) keys.nextElement();
			props.put(key, rb.getString(key));
		}
		return props;
	}

	public static Object populateObject(Object obj, ResourceBundle rb) {
		try {
			Map map = convertBundleToMap(rb);

			BeanUtils.copyProperties(obj, map);
		} catch (Exception e) {
			e.printStackTrace();
			log.error("Exception occured populating object: " + e.getMessage());
		}
		return obj;
	}

	public static Object getTargetObject(String targetClass)
			throws ClassNotFoundException, InstantiationException, IllegalAccessException {
		Class obj = Class.forName(targetClass);
		if (log.isDebugEnabled()) {
			log.debug("returning className: " + obj.getName());
		}
		return obj.newInstance();
	}

	public static Object convert(Object o, String targetClass) throws Exception {
		if (o == null) {
			return null;
		}
		Object target = getTargetObject(targetClass);
		BeanUtils.copyProperties(o, target);
		return target;
	}

	public static Object convertLists(Object o, String targetClass) throws Exception {
		if (o == null) {
			return null;
		}
		Object target = null;

		PropertyDescriptor[] origDescriptors = PropertyUtils.getPropertyDescriptors(o);
		for (int i = 0; i < origDescriptors.length; i++) {
			String name = origDescriptors[i].getName();
			if (origDescriptors[i].getPropertyType().equals(List.class)) {
				List list = (List) PropertyUtils.getProperty(o, name);
				for (int j = 0; j < list.size(); j++) {
					Object origin = list.get(j);
					target = convert(origin, targetClass);
					list.set(j, target);
				}
				PropertyUtils.setProperty(o, name, list);
			}
		}
		return o;
	}
}
