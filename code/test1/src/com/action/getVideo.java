package com.action;

import java.text.ParseException;
import java.util.ArrayList;

import com.dao.VideoDao;
import com.pojo.Video;


//��ȡȫ����Ƶ-���
public class getVideo{
	public ArrayList<Video> getAll() throws ParseException {
		// TODO Auto-generated method stub
		VideoDao dao = new VideoDao();
		return dao.getAll();
	}
}
