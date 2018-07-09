package com.dao;

import com.comm.BaseDao;
import com.pojo.UserEdit;

public class UserEditDao extends BaseDao{
	public int doEdit(UserEdit u) {

		String sql="UPDATE user SET name=?,sex=?,birthday=?,school=?,profession=?,introduce=? WHERE id=?";
		Object[] obs={u.getUname(),u.getUsex(),u.getUbirthday(),u.getUschool(),u.getUprofession(),u.getUintroduce(),u.getUid()};
		return executeUpdate(sql, obs);
	}
}
//ºæ”Ó∫„