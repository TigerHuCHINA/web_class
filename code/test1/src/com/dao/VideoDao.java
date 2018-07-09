package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.comm.BaseDao;
import com.pojo.Video;

//视频数据库操作-杜宇航
public class VideoDao extends BaseDao{
	public ArrayList<Video> getAll() {
		String sql = "select * from video";
		ResultSet set = executeSelect(sql, null);
		ArrayList<Video> videos = new ArrayList<Video>();
		try {
			if(set.next()) {
				Video video = new Video();
				video.setId(set.getString(1));
				video.setUserId(set.getString(1));
				video.setTitle(set.getString(1));
				video.setIntroduce(set.getString(1));
				//video.setTime(set.getString(1));
				videos.add(video);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return videos;
	}
}
