package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.comm.BaseDao;
import com.pojo.User;

public class UserDao extends BaseDao {
	
	public int doRegister(User u) {
		 String sql="insert into user (idname,name,password) values(?,?,?)";
		 Object[] obs={u.getUid(),u.getUname(),u.getUpwd()};
		return executeUpdate(sql, obs);
	}
	
	public User dologin(String id) {
		User user = new User();
		String sql = "select * from user where idname = ?";
		Object[] obs={id};
		ResultSet set = executeSelect(sql, obs);
		try {
			if(set.next()) {
				user.setUid(set.getString(1));
				System.out.println(user.getUid());
				user.setUname(set.getString(2));
				user.setUpwd(set.getString(3));
			}
			else {
				return null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

	public int testRepeat(String id)
	{
		String sql = "select * from user where idname = ?";
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