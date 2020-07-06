package my.util;

import java.io.InputStream;
import java.util.Properties;

public class DBInit {
	public static Properties initDB(){
		Properties pro=new Properties();
		try {
			Class<DBInit> c=DBInit.class;
			ClassLoader cl=c.getClassLoader();//¿‡º”‘ÿ∆˜
			InputStream in=cl.getResourceAsStream("dbinfo.properties");
			pro.load(in);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pro;
	}
	
	public static void main(String[] args){
		Properties pro=DBInit.initDB();
		String value=pro.getProperty("url");
		System.out.println(value);
	}
}
