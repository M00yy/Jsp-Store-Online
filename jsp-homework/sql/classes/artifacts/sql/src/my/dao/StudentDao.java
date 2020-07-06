package my.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import my.bean.Student;
import my.util.JDBCUtil;

public class StudentDao {
	Student student=null;
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	ArrayList<Student> list=new ArrayList<Student>();
	
	public ArrayList<Student> getAllStudent(){
		try{
			con=JDBCUtil.getConnection(); 
			String sql="select id,name,age,sex from stu_info";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				student=new Student();
				student.setId(rs.getInt("id"));
				student.setName(rs.getString("name"));
				student.setAge(rs.getInt("age"));
				student.setSex(rs.getString("sex"));
				list.add(student); 
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JDBCUtil.release(con, ps, rs);
		}
		return list;
	}
	//add
	public void addStudent(Student student){
		try{
		     con=JDBCUtil.getConnection();
		     String sql="insert into stu_info(name,age,sex) values(?,?,?)";
		     ps=con.prepareStatement(sql);
		     ps.setString(1, student.getName());
		     ps.setInt(2, student.getAge());
		     ps.setString(3, student.getSex());
		     ps.execute();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JDBCUtil.release(con, ps);
		}
	}
	//delete
	public void deleteStudent(int id){
		try{
			con=JDBCUtil.getConnection();
			String sql="delete from stu_info where id=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			ps.execute();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JDBCUtil.release(con, ps);
		}
	}
	//by id
	public Student findStudentById(int id){
		try{
			con=JDBCUtil.getConnection();
			String sql="select id,name,age,sex from stu_info where id=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			rs=ps.executeQuery();
			if(rs.next()){
				student=new Student();
				student.setId(rs.getInt("id"));
				student.setName(rs.getString("name"));
				student.setAge(rs.getInt("age"));
				student.setSex(rs.getString("sex"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JDBCUtil.release(con, ps, rs);
		}
		return student;
	}
	//update
	public void modifyStudent(Student student, int id){
		try{
			con=JDBCUtil.getConnection();
			String sql="update stu_info set name=?,age=?,sex=? where id=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, student.getName());
			ps.setInt(2, student.getAge());
			ps.setString(3, student.getSex());
			ps.setInt(4, id);
			ps.execute();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JDBCUtil.release(con, ps);
		}
	}
	
}
