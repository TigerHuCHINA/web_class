package com.dao;

import com.comm.BaseDao;
import com.pojo.User;
import com.pojo.Video;

public class VideoCountDao extends BaseDao {
	public int doCount(User u,Video v) {
		System.out.println("³É¹¦");
		//String sql="if exists(select from video where userId=? and videoId=?)"
		//		+ "update video set view=view+1 where userId=? and videoId=?"
		//		+ "else insert into video(userId,videoId,view) values(?,?,1)";
		String sql="update video set view=view+1 where userId=? and Id=? and \r\n" + 
				"time_to_sec(now())-(select max(time_to_sec(daytime)) as d1 from videorecord where userId=? and videoId=?)>300;";
		Object[] obs= {u.getUid(),v.getId(),u.getUid(),v.getId()};
		
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
