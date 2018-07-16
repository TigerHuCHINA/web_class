package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.comm.BaseDao;
import com.pojo.UserEdit;
import com.pojo.Video;


//�û����ݿ����-�����
public class UserEditDao extends BaseDao{
	public int doEdit(UserEdit u) {
		String sql="UPDATE user SET name=?,sex=?,birthday=?,school=?,profession=?,introduce=?,province=?,city=? WHERE idname=?";
		Object[] obs={u.getUname(),u.getUsex(),u.getUbirthday(),u.getUschool(),u.getUprofession(),u.getUintroduce(),u.getUprovince(),u.getUcity(),u.getUid()};
		int row = executeUpdate(sql, obs);
		free();
		return row;
	}
	
	public UserEdit getInfoById(String id)//�˴����޸�
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
				u.setUprovince(set.getString(10));
				u.setUcity(set.getString(11));
				u.setFollow(set.getString(12));
				u.setView(set.getString(13));
				
				free();
			}
			else {
				free();
				return null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
	}
	
	public ArrayList<UserEdit> getByKeywords(String key)
	{
		String sql = "select idname,name,headphoto from user where name like ?";
		Object obs[] = {"%" + key + "%"};
		ResultSet set = executeSelect(sql, obs);
		ArrayList<UserEdit> users = new ArrayList<UserEdit>();
		try {
			while(set.next()) {
				UserEdit userEdit = new UserEdit();
				userEdit.setUid(set.getString("idname"));
				userEdit.setUname(set.getString("name"));
				userEdit.setUheadphoto(set.getString("headphoto"));
				users.add(userEdit);
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		free();
		return users;
	}
}