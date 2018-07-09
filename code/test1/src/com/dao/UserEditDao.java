package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.comm.BaseDao;
import com.pojo.UserEdit;


//用户数据库操作-季宇恒
public class UserEditDao extends BaseDao{
	public int doEdit(UserEdit u) {
		String sql="UPDATE user SET name=?,sex=?,birthday=?,school=?,profession=?,introduce=?,province=?,city=? WHERE idname=?";
		System.out.println("132");
		Object[] obs={u.getUname(),u.getUsex(),u.getUbirthday(),u.getUschool(),u.getUprofession(),u.getUintroduce(),u.getUprovince(),u.getUcity(),u.getUid()};
		return executeUpdate(sql, obs);
	}
	
	public UserEdit getInfoById(String id)//此处需修改
	{
		String sql = "select * from user where idname = ?";
		Object[] obs = {id};
		ResultSet set = executeSelect(sql, obs);
		UserEdit u = new UserEdit();
		try {
			if(set.next()) {
				u.setUid(set.getString(1));
				u.setUname(set.getString(2));
				u.setUsex(set.getString(4));
				u.setUheadphoto(set.getString(5));
				u.setUbirthday(set.getString(6));
				u.setUschool(set.getString(7));
				u.setUprofession(set.getString(8));
				u.setUintroduce(set.getString(9));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
	}
}