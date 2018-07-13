package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.comm.BaseDao;
import com.pojo.Video;

//视频数据库操作-杜宇航
public class VideoDao extends BaseDao{
	public ArrayList<Video> getAll() {
		String sql = "select *from video";
		ResultSet set = executeSelect(sql, null);
		ArrayList<Video> videos = new ArrayList<Video>();
		try {
			while(set.next()) {
				Video video = new Video();
				video.setId(set.getString("id"));
				video.setUserId(set.getString("userId"));
				video.setFile(set.getString("file"));
				video.setTitle(set.getString("title"));
				video.setIntroduce(set.getString("introduce"));
				SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				video.setTime(s.parse(set.getString("time")));
				video.setDuration(set.getString("duration"));
				videos.add(video);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		free();
		return videos;
	}
	public Video getInfoById(String id) throws ParseException
	{
		String sql = "select * from video where id = ?";
		Object[] obs = {id};
		ResultSet set = executeSelect(sql, obs);
		Video video = new Video();
		try {
			if(set.next()) {
				video.setId(set.getString("id"));
				video.setUserId(set.getString("userId"));
				video.setTitle(set.getString("title"));
				video.setIntroduce(set.getString("introduce"));
				SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				video.setTime(s.parse(set.getString("time")));
				video.setDuration(set.getString("duration"));
				video.setFile(set.getString("file"));
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
		return video;
	}
	
	public ArrayList<Video> getByKeywords(String key)
	{
		String sql = "select id,userId,title,introduce,time,duration from video where title like ?";
		Object obs[] = {"%" + key + "%"};
		ResultSet set = executeSelect(sql, obs);
		ArrayList<Video> videos = new ArrayList<Video>();
		try {
			while(set.next()) {
				Video video = new Video();
				video.setId(set.getString("id"));
				video.setUserId(set.getString("userId"));
				video.setTitle(set.getString("title"));
				video.setIntroduce(set.getString("introduce"));
				SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				video.setTime(s.parse(set.getString("time")));
				video.setDuration(set.getString("duration"));
				videos.add(video);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		free();
		return videos;
	}
	
}
