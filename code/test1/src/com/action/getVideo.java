package com.action;

import java.util.ArrayList;

import com.dao.VideoDao;
import com.pojo.Video;


//获取全部视频-杜宇航
public class getVideo{
	public ArrayList<Video> getAll() {
		// TODO Auto-generated method stub
		VideoDao dao = new VideoDao();
		return dao.getAll();
	}
}
