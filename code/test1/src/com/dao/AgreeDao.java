package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.comm.BaseDao;
import com.pojo.Agree;

public class AgreeDao extends BaseDao{
	public ArrayList<Agree> getByComment(String commentId)
	{
		String sql = "select * from comment where commentId = ?";
		Object obj[] = {commentId};
		ResultSet set = executeSelect(sql, obj);
		ArrayList<Agree> agrees = new ArrayList<Agree>();
		try {
			while(set.next()) {
				Agree agree = new Agree();
				agree.setId(set.getString(1));
				agree.setUserid(set.getString(2));
				agree.setCommentid(set.getString(3));
				agree.setTime(set.getString(4));
				agrees.add(agree);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		free();
		return agrees;
	}
	public boolean addAgree(Agree agree)
	{
		String sql = "insert into agree('userId','commentId') values (?,?)";
		Object obs[] = {agree.getUserid(),agree.getCommentid()};
		if(executeUpdate(sql, obs)>=1) {
			free();
			return true;
		}else {
			free();
			return false;
		}
	}
	public boolean delAgree(Agree disagree) {
		String sql = "delete from agree where userId=? and commentId=?";
		Object obs[] = {disagree.getUserid(),disagree.getCommentid()};
		if(executeUpdate(sql, obs)>=1) {
			free();
			return true;
		}else {
			free();
			return false;
		}
	}
}
