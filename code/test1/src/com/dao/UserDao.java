package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.comm.BaseDao;
import com.pojo.User;

public class UserDao extends BaseDao {
	
	public int doRegister(User u) {
		System.out.println(u.getUid());
		System.out.println(testRepeat(u.getUid()));
		 String sql="insert into user (idname,name,password) values(?,?,?)";
		 Object[] obs={u.getUid(),u.getUname(),u.getUpwd()};
		return executeUpdate(sql, obs);
	}
	
	public User doLogin(User u) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public int testRepeat(String id)
	{
		String sql = "select count(*) from user where idname = ?";
		Object[] obs={id};
		ResultSet set = executeSelect(sql, obs);
		int result = 0;
		try {
			while(set.next()) {
				result++;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
}
