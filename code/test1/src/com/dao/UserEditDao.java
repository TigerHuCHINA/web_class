package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.comm.BaseDao;
import com.pojo.UserEdit;

public class UserEditDao extends BaseDao{
	public int doEdit(UserEdit u) {
<<<<<<< HEAD

		String sql="UPDATE user SET name=?,sex=?,birthday=?,school=?,profession=?,introduce=? WHERE id=?";
		Object[] obs={u.getUname(),u.getUsex(),u.getUbirthday(),u.getUschool(),u.getUprofession(),u.getUintroduce(),u.getUid()};
		return executeUpdate(sql, obs);
=======
		String sql="UPDATE user SET name=?,sex=?,birthday=?,school=?,profession=?,introduce=?,province=?,city=? WHERE idname=?";
		Object[] obs={u.getUname(),u.getUsex(),u.getUbirthday(),u.getUschool(),u.getUprofession(),u.getUintroduce(),u.getUprovince(),u.getUcity(),u.getUid()};
		System.out.println(u.getUid());
		int row = executeUpdate(sql, obs);
		free();
		return row;
>>>>>>> parent of 13963e2... Revert "‰øÆÊîπÂõûËØùÊú∫Âà∂"
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
				u.setUname(set.getString(1));
				u.setUsex(set.getString(1));
				u.setUheadphoto(set.getString(1));
				u.setUbirthday(set.getString(1));
				u.setUschool(set.getString(1));
				u.setUprofession(set.getString(1));
				u.setUintroduce(set.getString(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
	}
}
//ºæ”Ó∫„