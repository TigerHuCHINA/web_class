package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.comm.BaseDao;
import com.pojo.UserEdit;

public class UserEditDao extends BaseDao{
	public int doEdit(UserEdit u) {

		String sql="UPDATE user SET name=?,sex=?,birthday=?,school=?,profession=?,introduce=? WHERE id=?";
		Object[] obs={u.getUname(),u.getUsex(),u.getUbirthday(),u.getUschool(),u.getUprofession(),u.getUintroduce(),u.getUid()};
		return executeUpdate(sql, obs);
	}
	
	public UserEdit getInfoById(String id)
	{
		String sql = "select * from user where idname = ?";
		Object[] obs = {id};
		ResultSet set = executeSelect(sql, obs);
		UserEdit u = new UserEdit();
		try {
			if(set.next()) {
				u.setUid(set.getString(1));
<<<<<<< HEAD
				u.setUname(set.getString(1));
				u.setUsex(set.getString(1));
				u.setUheadphoto(set.getString(1));
				u.setUbirthday(set.getString(1));
				u.setUschool(set.getString(1));
				u.setUprofession(set.getString(1));
				u.setUintroduce(set.getString(1));
=======
				u.setUname(set.getString(2));
				u.setUsex(set.getString(4));
				u.setUheadphoto(set.getString(5));
				u.setUbirthday(set.getString(6));
				u.setUschool(set.getString(7));
				u.setUprofession(set.getString(8));
				u.setUintroduce(set.getString(9));
				u.setUprovince(set.getString(10));
				u.setUcity(set.getString(11));
				free();
			}
			else {
				free();
				return null;
>>>>>>> parent of 696c366... Revert "个人主页及修改的完善"
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
	}
}
//�����