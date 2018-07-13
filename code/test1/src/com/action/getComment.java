package com.action;

import java.util.ArrayList;

import com.dao.CommentDao;
import com.pojo.Comment;

//获取特定视频下的所有评论-杜宇航
public class getComment {
	public ArrayList<Comment> getByVideoId(String id)
	{
		CommentDao dao = new CommentDao();
		return dao.getByVideo(id);
	}
}
