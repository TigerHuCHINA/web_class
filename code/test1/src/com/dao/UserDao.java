package com.dao;

import com.comm.BaseDao;
import com.pojo.User;

public class UserDao extends BaseDao {
	
	public int doRegister(User u) {
		 String sql="insert into user (idname,name,password) values(?,?,?)";
		 Object[] obs={u.getUid(),u.getUname(),u.getUpwd()};
		return executeUpdate(sql, obs);
	}
	
	public User doLogin(User u) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
