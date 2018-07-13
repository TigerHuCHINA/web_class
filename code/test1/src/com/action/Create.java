package com.action;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.PrintStream;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;

import com.dao.VideoDao;
import com.pojo.Video;

public class Create {
	public StringBuilder createVideo() throws SQLException, ParseException {
		VideoDao vd=new VideoDao();
		ArrayList<Video> videos = new ArrayList<Video>();
		videos=vd.getAll();
		StringBuilder sh = new StringBuilder();
		try{
			
			PrintStream printStream = new PrintStream(new FileOutputStream("home.jsp"));
			sh.append("<div id='videos'>");
			sh.append("<ul class='ul1'>");
			for(int j=0;j<videos.size();j++) {
			sh.append("<li>");
			sh.append("<div class='box1'>");
			sh.append("<a class='avatar_pic' target='_self' href='video.jsp?id=");
			sh.append(videos.get(j).getId());
			sh.append("&useid=");
			sh.append(videos.get(j).getUserId());
			sh.append("'>");
			sh.append("<img src='");
			sh.append("cover/cover.png");
			sh.append("'>");
			sh.append("</a>");
			sh.append("<div class='first'>");
			sh.append("<p class='top2'>");
			sh.append(videos.get(j).getTitle());
			sh.append("</p>");
			sh.append("<p class='bottom2'>更新至7-14<span>课程时长:");
			sh.append(videos.get(j).getDuration());
			sh.append("</span></p>");
			sh.append("</div>");
			sh.append("<div class='last'>");
			sh.append("<p class='top2'>");
			sh.append(videos.get(j).getIntroduce());
			sh.append("</p>");
			sh.append("<p class='bottom2'>2015-08-17<span>272648人学习</span></p>");
			sh.append("</div>");
			sh.append("</div>");
			sh.append("</li>");
			}
			sh.append("</ul>");
			sh.append("</div>");
			printStream.println(sh.toString()); 
			printStream.close();
			}catch(FileNotFoundException e){
			   e.printStackTrace();
			}
			return sh;	
	}
}

