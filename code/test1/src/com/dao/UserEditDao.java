package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.comm.BaseDao;
import com.pojo.UserEdit;
import com.pojo.Video;


//用户数据库操作-季宇恒
public class UserEditDao extends BaseDao{
	public int doEdit(UserEdit u) {
		String sql="UPDATE user SET name=?,sex=?,birthday=?,school=?,profession=?,introduce=?,province=?,city=? WHERE idname=?";
		Object[] obs={u.getUname(),u.getUsex(),u.getUbirthday(),u.getUschool(),u.getUprofession(),u.getUintroduce(),u.getUprovince(),u.getUcity(),u.getUid()};
		int row = executeUpdate(sql, obs);
		free();
		return row;
	}
	
	public UserEdit getInfoById(String id)//此处需修改
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
	
	public ArrayList<Video> getUploadVideo(String id){
		String sql = "select * from video where userId=?";
		Object[] obs = {id};
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
}