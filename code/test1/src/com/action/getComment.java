package com.action;

import java.util.ArrayList;

import com.dao.CommentDao;
import com.pojo.Comment;

//��ȡ�ض���Ƶ�µ���������-���
public class getComment {
	public ArrayList<Comment> getByVideoId(String id)
	{
		CommentDao dao = new CommentDao();
		return dao.getByVideo(id);
	}
}
