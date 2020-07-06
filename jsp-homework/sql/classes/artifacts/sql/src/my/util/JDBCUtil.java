package my.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
//import java.sql.Statement;
import java.sql.ResultSet;
import java.util.Properties;

public class JDBCUtil {
	public static Connection getConnection(){
		Properties pro=DBInit.initDB();
		String driver=pro.getProperty("driver");
		String userName=pro.getProperty("username");
		String password=pro.getProperty("password");
		String url=pro.getProperty("url");
		Connection con=null;
		try {
			Class.forName(driver);
			con=DriverManager.getConnection(url,userName,password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	public static void release(Connection con,PreparedStatement ps,ResultSet rs){
		try{
			if(rs!=null){
				rs.close();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		try{
			if(ps!=null){
				ps.close();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		try{
			if(con!=null){
				con.close();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public static void release(Connection con,PreparedStatement ps){
		try{if(ps!=null){ps.close();}}catch(Exception e){e.printStackTrace();}
		try{if(con!=null){con.close();}}catch(Exception e){e.printStackTrace();}
	}
	}
