package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.comm.BaseDao;
import com.pojo.Comment;

//�������ݿ����-���
public class CommentDao extends BaseDao{
	public ArrayList<Comment> getByVideo(String videoId)
	{
		String sql = "select * from comment where videoId = ?";
		Object obj[] = {videoId};
		ResultSet set = executeSelect(sql, obj);
		ArrayList<Comment> comments = new ArrayList<Comment>();
		try {
			while(set.next()) {
				Comment comment = new Comment();
				comment.setId(set.getString(1));
				comment.setUserId(set.getString(2));
				comment.setVideoId(set.getString(3));
				comment.setContent(set.getString(4));
				comment.setTime(set.getString(5));
				comment.setAgree(set.getString(6));
				comments.add(comment);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		free();
		return comments;
	}
	
	public boolean sendComment(Comment comment)
	{
		String sql = "insert into feedback('userId','videoId','content') values (?,?,?)";
		Object obs[] = {comment.getUserId(),comment.getVideoId(),comment.getContent()};
		if(executeUpdate(sql, obs)>=1) {
			free();
			return true;
		}else {
			free();
			return false;
		}
	}
}
