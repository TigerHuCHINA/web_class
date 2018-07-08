package com.action;

import java.util.ArrayList;

import com.dao.VideoDao;
import com.pojo.Video;

public class getVideo{
	public ArrayList<Video> getAll() {
		// TODO Auto-generated method stub
		VideoDao dao = new VideoDao();
		return dao.getAll();
	}
}
