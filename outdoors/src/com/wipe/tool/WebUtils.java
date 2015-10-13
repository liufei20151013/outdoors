package com.wipe.tool;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;

public class WebUtils {

	// 用来把表单中的数据放到bean中
	public static <T> T register2Bean(HttpServletRequest request,
			Class<T> beanClass) {
		try {
			// 创建要封装数据的bean
			T bean = beanClass.newInstance();
			// 把request中的数据放到bean中
			Enumeration e = request.getParameterNames();

			while (e.hasMoreElements()) {
				String name = (String) e.nextElement();
				String value = request.getParameter(name);
				BeanUtils.setProperty(bean, name, value);
			}
			return bean;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

}
