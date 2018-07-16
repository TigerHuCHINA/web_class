package com.action;

import java.text.ParseException;
import java.util.ArrayList;

import com.dao.CollectDao;
import com.dao.VideoDao;
import com.pojo.Collection;
import com.pojo.Video;
import com.sun.org.apache.bcel.internal.util.SecuritySupport;

public class getCollect {
	public ArrayList<Video> getById(String id)
	{
		CollectDao collectDao = new CollectDao();
		VideoDao videoDao = new VideoDao();
		ArrayList<Collection> collections = collectDao.getByUserId(id);
		ArrayList<Video> videos = new ArrayList<Video>();
		for(int i = 0; i < collections.size(); i++)
		{
			try {
				Video video = videoDao.getInfoById(collections.get(i).getVideoid());
				videos.add(video);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return videos;
	}
	public ArrayList<Video> getByCollectId(String id)
	{
		CollectDao collectDao = new CollectDao();
		VideoDao videoDao = new VideoDao();
		ArrayList<Collection> collections = collectDao.getByCollectUserId(id);
		ArrayList<Video> videos = new ArrayList<Video>();
		for(int i = 0; i < collections.size(); i++)
		{
			try {
				Video video = videoDao.getInfoById(collections.get(i).getVideoid());
				videos.add(video);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return videos;
	}
}
