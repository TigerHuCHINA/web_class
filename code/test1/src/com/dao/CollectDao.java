package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.comm.BaseDao;
import com.pojo.Collection;

public class CollectDao extends BaseDao {
	public ArrayList<Collection> getByUserId(String userId)
	{
		String sql = "select collection.id,collection.userId,video.id,collection.time,video.title"
				+ " from collection left join video on collection.videoId=video.id where video.userId = ?";
		Object obj[] = {userId};
		ResultSet set = executeSelect(sql, obj);
		ArrayList<Collection> collections = new ArrayList<Collection>();
		try {
			while(set.next()) {
				Collection collection = new Collection();
				collection.setId(set.getString(1));
				collection.setUserid(set.getString(2));
				collection.setVideoid(set.getString(3));
				collection.setTime(set.getString(4));
				collection.setContent(set.getString(5));
				collections.add(collection);
				System.out.println(collection.getVideoid());
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		free();
		return collections;
	}
	public boolean collect(Collection collection) {
		String sql = "INSERT INTO collection (`userId`,`videoId`) VALUES (?,?)";
		Object obs[] = {collection.getUserid(),collection.getVideoid()};
		String sql_ = "update video set collect = collect + 1 where id = ?";
		Object obs_[] = {collection.getVideoid()};
		if(executeUpdate(sql, obs)>=1&&executeUpdate(sql_, obs_)>=1) {
			free();
			return true;
		}else {
			free();
			return false;
		}
	}
	
	public boolean decollect(String UserId,String VideoId) {
		String sql="DELETE FROM collection WHERE userId=? and videoId=?";
		Object obs[]= {UserId,VideoId};
		if(executeUpdate(sql, obs)>=1) {
			free();
			return true;
		}else {
			free();
			return false;
		}
	}
	public boolean hasCollect(String userId,String videoId) throws SQLException {
		String sql = "select * from collection where userId = ? and videoId=?";
		Object obj[] = {userId,videoId};
		ResultSet set = executeSelect(sql, obj);
		if(set.next()) {
			return true;
		}else {
			return false;
		}

		
	}
			
	


}