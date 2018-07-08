package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.comm.BaseDao;
import com.pojo.User;
import com.pojo.UserEdit;

public class UserEditDao extends BaseDao{
	public UserEdit doEdit(String id) {
		UserEdit user = new UserEdit();	
		//String sql="select * from schoolol where idname=?"
		//		+ "(UPDATE schoolol.user SET name='?', password='?' sex='?' headphoto='?' birthday='?' school='?' profession='?' introduce='?' WHERE id=?)"
		String sql = "select * from user where idname = ?";
		//Object[] obs={u.getUid(),u.getUname(),u.getUpwd(),u.getUsex(),u.getUheadphoto(),u.getUbirthday(),u.getUschool(),u.getUprofession(),u.getUintroduce(),u.getUid()};
		Object[] obs={id};
		ResultSet set = executeSelect(sql, obs);
		try {
			if(set.next()) {
				user.setUname(set.getString(1));
				System.out.println(user.getUid());
//				user.setUpwd(set.getString(2));
//				user.setUpwd(set.getString(3));
				user.setUsex(set.getString(4));
				user.setUheadphoto(set.getString(5));
				user.setYear(set.getInt(6));//≤‚ ‘∫≈¬ÎÀ≥–Ú
				user.setMonth(set.getInt(7));
				user.setDay(set.getInt(8));
				user.setUschool(set.getString(9));
				user.setUprofession(set.getString(10));
				user.setUintroduce(set.getString(11));
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
}
