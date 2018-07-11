package com.dao;

import com.comm.BaseDao;
import com.pojo.User;
import com.pojo.Video;

public class VideoCountDao extends BaseDao {
	public int doCount(User u) {
		String sql="update video set view=view+1 where userId=? and "
				+ "timediff(minute,current_time,(select daytime as d1 from videorecord where userId=? and videoId=?))>5";
		Object[] obs= {u.getUid(),u.getUid(),u.getUname()};
		int row = executeUpdate(sql,obs);
		free();
		return row;
	}
	
	public int doRecord(User u,Video v) {
		String sql="insert into videorecord(userId,videoId)values(?,?) ";
		Object[] obs= {u.getUid(),v.getId()};
		int row=executeUpdate(sql, obs);
		free();
		return row;
	}
}
