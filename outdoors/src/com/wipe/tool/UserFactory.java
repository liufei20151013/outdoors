package com.wipe.tool;

import java.io.IOException;
import java.util.Properties;

public class UserFactory {

	private Properties prop=new Properties();
	private UserFactory(){
		
		try {
			prop.load(UserFactory.class.getClassLoader().getResourceAsStream("user.properties"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}
		
	}
	private static UserFactory uf=new UserFactory();
	public static UserFactory getInstance(){
		return uf;
	}
	
	//获得文件夹地址
	public String getUri(String path){
		
		return prop.getProperty(path);
		
	}
	
	public <T> T createDao(Class<T> clazz){
		String key=clazz.getSimpleName();
		String daoImplClass=prop.getProperty(key);
		try {
			return (T)Class.forName(daoImplClass).newInstance();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		} 
	}
	
	
}
