package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.comm.BaseDao;
import com.pojo.Comment;

//评论数据库操作-杜宇航
public class CommentDao extends BaseDao{
	public ArrayList<Comment> getByVideo(String videoId)
	{
		String sql = "select * from comment where videoId = ?";
		Object obj[] = {videoId};
		ResultSet set = executeSelect(sql, obj);
		ArrayList<Comment> comments = new ArrayList<Comment>();
		try {
			if(set.next()) {
				Comment comment = new Comment();
				comment.setId(set.getString(1));
				comment.setUserId(set.getString(2));
				comment.setVideoId(set.getString(3));
				comment.setContent(set.getString(4));
				//comment.setTime(set.getString(5));
				comments.add(comment);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		free();
		return comments;
	}
}
