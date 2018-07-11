package com.comm;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.*;
//数据库基础操作-杜宇航
public class BaseDao {
	private static String driver="com.mysql.jdbc.Driver";
	private String url="jdbc:mysql://localhost/schoolol";
	private String user = "root";
	private String pwd="123456";
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	private FileInputStream f;
	static{
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	private void getConnection(){
		try {
			conn= DriverManager.getConnection(url,user,pwd);
		} catch (SQLException e) {
			System.out.println("fail");
			e.printStackTrace();
			
		}
	}

	public int executeUpdate(String sql,Object [] obs){
		int row=0;
		getConnection();
		try {
			ps = conn.prepareStatement(sql);
			if(obs!=null&&obs.length>0){
				for(int i=0;i<obs.length;i++){
					if(obs[i] instanceof File) {
					f=new FileInputStream((File)obs[i]);
					ps.setBinaryStream(i+1,f,((File)obs[i]).length());
					}else {
					ps.setObject(i+1, obs[i]);
					}
				}
			}
			row= ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return row;
	}

	public ResultSet executeSelect(String sql,Object [] obs){
		ResultSet result = null;
		getConnection();

		try {
			ps = conn.prepareStatement(sql);
			if(obs!=null&&obs.length>0){
				for(int i=0;i<obs.length;i++){
					ps.setObject(i+1, obs[i]);
				}
			}
			result= ps.executeQuery();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public void free(){
		try {
			if(rs!=null)
				rs.close();
			if(ps!=null)
				ps.close();
			if(conn!=null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
