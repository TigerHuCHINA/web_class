package com.action;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.PrintStream;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;

import com.dao.MessageDao;
import com.pojo.Message;
//调用显示消息的数据库指令-季宇恒
public class displayMessage {
	public StringBuilder createVideo() throws SQLException, ParseException, FileNotFoundException {
		MessageDao md=new MessageDao();
		ArrayList<Message> messages = new ArrayList<Message>();
		Message message = new Message();
		String acceptid = message.getAcceptId();
		messages=md.getByUserId(acceptid);
		StringBuilder sh = new StringBuilder();
		PrintStream printStream = new PrintStream(new FileOutputStream("home.jsp"));
	return sh;
	}
}
/*
import java.io.FileNotFoundException;
			sh.append("<div id='videos'>");
			sh.append("<ul class='ul1'>");
			for(int j=0;j<videos.size();j++) {
			sh.append("<li>");
			sh.append("<div class='box1'>");
			sh.append("<a class='avatar_pic' target='_self' href='video.jsp?id=");
			sh.append(videos.get(j).getId());
			sh.append("&video=");
			sh.append("name");
			sh.append("'>");
			sh.append("<img src='picture/1.png'/>");
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

*/