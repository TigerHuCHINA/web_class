package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.comm.BaseDao;
import com.pojo.Agree;
import com.pojo.Follow;

public class FollowDao extends BaseDao {
	public ArrayList<Follow> getByUser(String userId)
	{
		String sql = "select * from follow where followerId = ?";
		Object obj[] = {userId};
		ResultSet set = executeSelect(sql, obj);
		ArrayList<Follow> follows = new ArrayList<Follow>();
		try {
			while(set.next()) {
				Follow follow = new Follow();
				follow.setId(set.getString(1));
				follow.setFollowerid(set.getString(2));
				follow.setFolloweeid(set.getString(3));
				follow.setTime(set.getString(4));
				follows.add(follow);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		free();
		return follows;
	}
	public boolean adFollow(Follow follow)
	{
		String sql = "insert into follow('followerId','followeeId') values (?,?)";
		Object obs[] = {follow.getFollowerid(),follow.getFolloweeid()};
		if(executeUpdate(sql, obs)>=1) {
			free();
			return true;
		}else {
			free();
			return false;
		}
	}
	public boolean deFollow(Follow defollow)
	{
		String sql = "delete from follow where followerId=? and followeeId=?";
		Object obs[] = {defollow.getFollowerid(),defollow.getFolloweeid()};
		if(executeUpdate(sql, obs)>=1) {
			free();
			return true;
		}else {
			free();
			return false;
		}
	}
}
