package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;



import com.dto.User;

public class UserDao 
{
   public void saveUser(User user)
   {

		String name=user.getName();
		int age=user.getAge();
		String email=user.getEmail();
		String password=user.getPasword();
		System.out.println("hello");
		long mobile=user.getMobile();
	    try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			//establish the connection
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/advance_proj_1","root","root");
			//create a platform
			PreparedStatement pst=con.prepareStatement("insert into employee (name,age,email,password,mobile) values(?,?,?,?,?)");
			  pst.setString(1, name);
			  pst.setInt(2, age);
			  pst.setString(3, email);
			  pst.setString(4, password);
			  pst.setLong(5, mobile);
			  int pts = pst.executeUpdate();
			  System.out.println("data save" + pts);
			  pst.close();
			  con.close();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
   }

public User fetchUserById( int id) 
   {
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/advance_proj_1","root","root");
		PreparedStatement pst = con.prepareStatement("select * from employee where id=?");
		pst.setInt(1, id);
		ResultSet rst = pst.executeQuery();
		if(rst.next())
		{
			User user= new User();
			user.setId(rst.getInt("id"));
			user.setName(rst.getString("name"));
			user.setAge(rst.getInt("age"));
			user.setEmail(rst.getString("email"));
			user.setPasword(rst.getString("password"));
			user.setMobile(rst.getLong("mobile"));
			
			
			return user;
		}
	} catch (ClassNotFoundException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return null;
   }   
   public List<User> fetchAllUser()
   {
	   List<User> lu=new ArrayList() ;
	   try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/advance_proj_1","root","root");
		Statement stmt = con.createStatement();
		ResultSet rst = stmt.executeQuery("select * from employee");
		while(rst.next())
		{
			int id= rst.getInt(1);
			String name = rst.getString(2);
			int age = rst.getInt(3);
			String email = rst.getString(4);
			String password = rst.getString(5);
			long mobile = rst.getLong(6);
			
			User user= new User();
			
			user.setId(id);
			user.setName(name);
			user.setAge(age);
			user.setEmail(email);
			user.setPasword(password);
			user.setMobile(mobile);
			lu.add(user);
		}
		
		con.close();
	
	} catch (ClassNotFoundException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	   return lu ;
   }
   public int updateUserById(int id,User user)
   {
	   int row=0;
	   try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/advance_proj_1","root","root");
	   PreparedStatement pst = con.prepareStatement("update employee set name=?,age=?,email=?,mobile=? where id=? ");
	   
	   pst.setString(1, user.getName());
	   pst.setInt(2, user.getAge());
	   pst.setString(3, user.getEmail());
	   pst.setLong(4, user.getMobile());
	   pst.setInt(5, id);
	   
	   row = pst.executeUpdate();
	} catch (ClassNotFoundException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	   return row;
   }
   public void deleteUserById( int id )
   {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/advance_proj_1","root","root");
			PreparedStatement pst = con.prepareStatement("delete from employee where id=?");
			pst.setInt(1, id);
			pst.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
   }
   public User fetchUserByEmailAndPassword (String email, String password)
   {
	  
	   try {
		   Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/advance_proj_1","root","root");
			 PreparedStatement pst = con.prepareStatement("select * from employee where email=? and password=?");
			      pst.setString(1, email);
			      pst.setString(2, password);
				ResultSet rst2 =  pst.executeQuery();
				if(rst2.next())
				{
					 int id = rst2.getInt("id");
					  String Name=rst2.getString("name");
					  int Age=rst2.getInt("age");
					  String Email=rst2.getString("email");
					  String Password=rst2.getString("password");
					  long Mobile=rst2.getLong("mobile");
					 
					  User user = new User();
					  
					  user.setId(id);
					  user.setName(Name);
					  user.setAge(Age);
					  user.setEmail(Email);
					  user.setPasword(Password);
					  user.setMobile(Mobile);
					  
					  return user;
				}
				
				
			pst.close();
			con.close();
			
			} 
		   catch (ClassNotFoundException | SQLException e) 
		{
			e.printStackTrace();
		}
	     return null;
       }

}
