package com.dao;

import com.comm.BaseDao;
import com.pojo.Collection;

public class CollectDao extends BaseDao {
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
		Object obs[]= {UserId,11};
		if(executeUpdate(sql, obs)>=1) {
			free();
			return true;
		}else {
			free();
			return false;
		}
	}
}
