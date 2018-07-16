package com.action;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.PrintStream;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServlet;

import com.dao.AgreeDao;
import com.dao.CollectDao;
import com.dao.CommentDao;
import com.dao.FollowDao;
import com.dao.MessageDao;
import com.dao.VideoDao;
import com.pojo.Agree;
import com.pojo.Collection;
import com.pojo.Comment;
import com.pojo.Follow;
import com.pojo.Message;
import com.pojo.Video;

public class Create{
	public StringBuilder createVideo() throws SQLException, ParseException {
		VideoDao vd=new VideoDao();
		ArrayList<Video> videos = new ArrayList<Video>();
		videos=vd.getAll();
		StringBuilder sh = new StringBuilder();
		try{

			PrintStream printStream = new PrintStream(new FileOutputStream("home.jsp"));
			SimpleDateFormat   formatter =new   SimpleDateFormat( "yyyy-MM-dd ");
			sh.append("<div id='videos'>");
			sh.append("<ul class='ul1'>");
			for(int j=0;j<videos.size();j++) {
				sh.append("<li>");
				sh.append("<div class='box1'>");
				sh.append("<a onclick='return login2()' class='avatar_pic' target='_self' href='video.jsp?id=");
				sh.append(videos.get(j).getId());
				sh.append("&useid=");
				sh.append(videos.get(j).getUserId());
				sh.append("'>");
				sh.append("<img src='");
				sh.append("C:\\Users\\acer\\Desktop\\"+videos.get(j).getCover());
				sh.append("'>");
				sh.append("</a>");
				sh.append("<div class='first'>");
				sh.append("<p class='top2'>");
				sh.append(videos.get(j).getTitle());
				sh.append("</p>");
				sh.append("<p class='bottom2'><span>课程时长:");
				sh.append(videos.get(j).getDuration());
				sh.append("</span></p>");
				sh.append("</div>");
				sh.append("<div class='last'>");
				sh.append("<p class='top2'>");
				sh.append(videos.get(j).getIntroduce());
				sh.append("</p>");
				sh.append("<p class='bottom2'>");
				String date=formatter.format(videos.get(j).getTime());
				sh.append(date);
				sh.append("<span>");
				sh.append(videos.get(j).getView());
				sh.append("人学习</span></p>");
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
	
	
	
	
	public StringBuilder createComment(String videoId,String userId) throws SQLException, ParseException {
		CommentDao dao=new CommentDao();
		ArrayList<Comment> comments = new ArrayList<Comment>();
		comments=dao.getByVideo(videoId);
		StringBuilder sh = new StringBuilder();
		try{
			PrintStream printStream = new PrintStream(new FileOutputStream("video.jsp"));
			sh.append("<ul id=\"pn\">");
			sh.append("<li class=\"list0\">");
			for(int j=0;j<comments.size();j++) {
				sh.append("<div class=\"comment-list\">");
				sh.append("<div class=\"comment\" user=\"self\">");
				sh.append("<div class=\"comment-right\">");
				sh.append("<div class=\"comment-text\">");
				sh.append("<span class=\"user\">");
				sh.append("<a href=\"hisHome.jsp?ownerid=");
				sh.append(comments.get(j).getUserId());
				sh.append("\">");
				sh.append(comments.get(j).getUserId());
				sh.append("</a>");
				if(comments.get(j).getUserId().equals(userId)) sh.append("(上传者)");
				sh.append(" :</span><br>");
				sh.append(comments.get(j).getContent());
				sh.append("</div>");
				sh.append("<div class=\"comment-date\">");
				sh.append(comments.get(j).getTime());
				sh.append("<a class=\"comment-zan\" href=\"doAgree?commentid=");
				
				sh.append(comments.get(j).getId());
				sh.append("\">");
				sh.append(comments.get(j).getAgree());
				sh.append(" 赞");
				sh.append("<a class=\"comment-dele\" href=\"#C1\">回复</a>");
				sh.append("</div>");
				sh.append("</div>");
				sh.append("</div>");
				sh.append("</div>");
			}
			sh.append("<form name=\"form1\" method=\"post\" action=\"doComment\">");
			sh.append("<div class=\"hf\">");
			sh.append("<textarea name=\"content\" id=\"te\" class=\"hf-text\" autocomplete=\"off\" maxlength=\"100\" rows=\"10\" cols=\"50\"></textarea>");
			sh.append("<input type=\"submit\" class=\"comment-dele\" value=\"提交回复\" onclick=\"return check()\"/>");
			sh.append("<span class=\"hf-nub\">0/100</span> </div>");
			sh.append("</form>");
			sh.append("</div>");
			sh.append("</li>");
			sh.append("</ul>");
			printStream.println(sh.toString()); 
			printStream.close();
		}catch(FileNotFoundException e){
			e.printStackTrace();
		}
		return sh;	

	}
	public StringBuilder createAgree(String userid) throws SQLException, ParseException {
		AgreeDao dao=new AgreeDao();
		ArrayList<Agree> agrees = new ArrayList<Agree>();

		agrees=dao.getByUserId(userid);//videoId
		StringBuilder sh = new StringBuilder();
		try{
				PrintStream printStream = new PrintStream(new FileOutputStream("dynamic.jsp"));
				
				for(int j=0;j<agrees.size();j++) {	
					sh.append("<ul id=\"pn1\">");
					sh.append("<li class=\"list1\">");
					sh.append("<div class=\"content\">");
					sh.append("<div class=\"comment-list\">");
					sh.append("<div class=\"comment\">");
					sh.append("<div class=\"comment-right\">");
					sh.append("<div class=\"comment-text\">");
					sh.append("<span class=\"user\">");
					sh.append("<a href=\"hisHome.jsp?ownerid=");
					sh.append(agrees.get(j).getUserid());
					sh.append("\">");
					sh.append(agrees.get(j).getUserid());
					sh.append("</a>");
					sh.append("\t点赞了你的评论：\t");
					//sh.append("<a href=\"\">");//+++++++++++++++++++++++++++++++++++
					sh.append(agrees.get(j).getContent());
					//sh.append("</a>");
					sh.append("</div>");
					sh.append("<div class=\"comment-date\">");
					sh.append(agrees.get(j).getTime());
					sh.append("</div>");
					sh.append("</div>");
					sh.append("</div>");
					sh.append("</div>");
					sh.append("</li>");
					sh.append("</ul>");
				}
				printStream.println(sh.toString()); 
				printStream.close();
		}catch(FileNotFoundException e){
			e.printStackTrace();
		}
		return sh;
	}
	public StringBuilder createFollow(String userid) throws SQLException, ParseException {
		FollowDao dao=new FollowDao();
		ArrayList<Follow> follows = new ArrayList<Follow>();
		follows=dao.getByUser(userid);//videoId
		StringBuilder sh = new StringBuilder();
		try{
				PrintStream printStream = new PrintStream(new FileOutputStream("dynamic.jsp"));
				for(int j=0;j<follows.size();j++) {	
					sh.append("<ul id=\"pn1\">");
					sh.append("<li class=\"list1\">");
					sh.append("<div class=\"content\">");
					sh.append("<div class=\"comment-list\">");
					sh.append("<div class=\"comment\">");
					sh.append("<div class=\"comment-right\">");
					sh.append("<div class=\"comment-text\">");
					sh.append("<span class=\"user\">");
					sh.append("<a href=\"hisHome.jsp?ownerid=");//+++++++++++++++++++++
					sh.append(follows.get(j).getFolloweeid());
					sh.append("\">");
					sh.append(follows.get(j).getFolloweeid());
					sh.append("</a>");
					sh.append("\t关注了你");
					sh.append("</div>");
					sh.append("<div class=\"comment-date\">");
					sh.append(follows.get(j).getTime());
					sh.append("</div>");
					sh.append("</div>");
					sh.append("</div>");
					sh.append("</div>");
					sh.append("</li>");
					sh.append("</ul>");
				}
				printStream.println(sh.toString()); 
				printStream.close();
		}catch(FileNotFoundException e){
			e.printStackTrace();
		}
		return sh;
	}
	
	public StringBuilder createCollection(String userid) throws SQLException, ParseException {
		CollectDao dao=new CollectDao();
		ArrayList<Collection> collections = new ArrayList<Collection>();
		collections=dao.getByUserId(userid);//videoId
		StringBuilder sh = new StringBuilder();
		try{
				PrintStream printStream = new PrintStream(new FileOutputStream("dynamic.jsp"));
				for(int j=0;j<collections.size();j++) {	
					/*sh.append("<li>");
					sh.append(collections.get(j).getUserid());
					sh.append("\t在\t");
					sh.append(collections.get(j).getTime());
					sh.append("\t收藏了你的视频：\t");
					sh.append(collections.get(j).getVideoid());*/
					sh.append("<ul id=\"pn1\">");
					sh.append("<li class=\"list1\">");
					sh.append("<div class=\"content\">");
					sh.append("<div class=\"comment-list\">");
					sh.append("<div class=\"comment\">");
					sh.append("<div class=\"comment-right\">");
					sh.append("<div class=\"comment-text\">");
					sh.append("<span class=\"user\">");
					sh.append("<a href=\"hisHome.jsp?ownerid=");//+++++++++++++++++++++++++
					sh.append(collections.get(j).getUserid());
					sh.append("\">");
					sh.append(collections.get(j).getUserid());
					sh.append("</a>");
					sh.append("\t收藏了你的视频：\t");
					sh.append("<a href=\"video.jsp?id=");//++++++++++++++++++++++++++++++++++++++++
					sh.append(collections.get(j).getVideoid());
					sh.append("\">");
					sh.append(collections.get(j).getContent());
					sh.append("</a>");
					sh.append("</div>");
					sh.append("<div class=\"comment-date\">");
					sh.append(collections.get(j).getTime());
					sh.append("</div>");
					sh.append("</div>");
					sh.append("</div>");
					sh.append("</div>");
					sh.append("</li>");
					sh.append("</ul>");
				}
				printStream.println(sh.toString()); 
				printStream.close();
		}catch(FileNotFoundException e){
			e.printStackTrace();
		}
		return sh;
	}
	
	public StringBuilder createMessage(String acceptid) throws SQLException, ParseException {
		MessageDao dao=new MessageDao();
		ArrayList<Message> messages = new ArrayList<Message>();
		messages=dao.getByUserId(acceptid);//videoId
		StringBuilder sh = new StringBuilder();
		try{
				PrintStream printStream = new PrintStream(new FileOutputStream("dynamic.jsp"));
				for(int j=0;j<messages.size();j++) {	
					sh.append("<ul id=\"pn1\">");
					sh.append("<li class=\"list1\">");
					sh.append("<div class=\"content\">");
					sh.append("<div class=\"comment-list\">");
					sh.append("<div class=\"comment\">");
					sh.append("<div class=\"comment-right\">");
					sh.append("<div class=\"comment-text\">");
					sh.append("<span class=\"user\">");
					sh.append("<a href=\"hisHome.jsp?ownerid=");//+++++++++++++++++++++++++++
					sh.append(messages.get(j).getPasssId());
					sh.append("\">");
					sh.append(messages.get(j).getPasssId());
					sh.append("</a>");
					sh.append("</span>");
					sh.append("\t私信了你：\t\n");
					sh.append(messages.get(j).getContent());
					sh.append("</div>");
					sh.append("<div class=\"comment-date\">");
					sh.append(messages.get(j).getTime());
					sh.append("</div>");
					sh.append("</div>");
					sh.append("</div>");
					sh.append("</div>");
					sh.append("</li>");
					sh.append("</ul>");
				}
				printStream.println(sh.toString()); 
				printStream.close();
		}catch(FileNotFoundException e){
			e.printStackTrace();
		}
		return sh;
	}
	public StringBuilder createCommentR(String id) throws SQLException, ParseException {
		CommentDao dao=new CommentDao();
		ArrayList<Comment> comments = new ArrayList<Comment>();
		comments=dao.getById(id);//videoId
		StringBuilder sh = new StringBuilder();
		try{
				PrintStream printStream = new PrintStream(new FileOutputStream("dynamic.jsp"));
				for(int j=0;j<comments.size();j++) {	
					sh.append("<ul id=\"pn1\">");
					sh.append("<li class=\"list1\">");
					sh.append("<div class=\"content\">");
					sh.append("<div class=\"comment-list\">");
					sh.append("<div class=\"comment\">");
					sh.append("<div class=\"comment-right\">");
					sh.append("<div class=\"comment-text\">");
					sh.append("<span class=\"user\">");
					sh.append("<a href=\"hisHome.jsp?ownerid=");
					sh.append(comments.get(j).getUserId());
					sh.append("\">");
					sh.append(comments.get(j).getUserId());
					sh.append("</a>");
					sh.append("\t评论了你的视频\t");
					sh.append("<a href=\"video.jsp?id=");
					sh.append(comments.get(j).getVideoId());
					sh.append("&useid=");
					sh.append(id);
					sh.append("\">");
					sh.append(comments.get(j).getVideotitle());
					sh.append("</a>");
					sh.append("</span>");
					sh.append(":\t\n");
					sh.append(comments.get(j).getContent());
					sh.append("</div>");
					sh.append("<div class=\"comment-date\">");
					sh.append(comments.get(j).getTime());
					sh.append("</div>");
					sh.append("</div>");
					sh.append("</div>");
					sh.append("</div>");
					sh.append("</li>");
					sh.append("</ul>");
				}
				printStream.println(sh.toString()); 
				printStream.close();
		}catch(FileNotFoundException e){
			e.printStackTrace();
		}
		return sh;
	}
	public StringBuilder createSelectedVideo(String key) throws SQLException, ParseException {
		VideoDao vd=new VideoDao();
		ArrayList<Video> videos = new ArrayList<Video>();
		videos=vd.getByKeywords(key);
		StringBuilder sh = new StringBuilder();
		if(videos.size()==0)
		{
			System.out.println("123132");
			sh.append("<h1 style=\"position:absolute;left:200px;top:400px;\">未找到您搜索的视频</h1>");
			return sh;
		}
		try{
			PrintStream printStream = new PrintStream(new FileOutputStream("home.jsp"));
			SimpleDateFormat   formatter =new   SimpleDateFormat( "yyyy-MM-dd ");
			sh.append("<div id='videos'>");
			sh.append("<ul class='ul1'>");
			if(videos.size()==0)sh.append("<strong>未找到您搜索的视频</strong>");
			for(int j=0;j<videos.size();j++) {
			sh.append("<li>");
			sh.append("<div class='box1'>");
			sh.append("<a class='avatar_pic' target='_self' href='video.jsp?id=");
			sh.append(videos.get(j).getUserId());
			sh.append("'>");
			sh.append("<img src='");
			sh.append("C:\\Users\\acer\\Desktop\\"+videos.get(j).getCover());
			sh.append("'>");
			sh.append("</a>");
			sh.append("<div class='first'>");
			sh.append("<p class='top2'>");
			sh.append(videos.get(j).getTitle());
			sh.append("</p>");
			sh.append("<p class='bottom2'><span>课程时长:");
			sh.append(videos.get(j).getDuration());
			sh.append("</span></p>");
			sh.append("</div>");
			sh.append("<div class='last'>");
			sh.append("<p class='top2'>");
			sh.append(videos.get(j).getIntroduce());
			sh.append("</p>");
			sh.append("<p class='bottom2'>");
			String date=formatter.format(videos.get(j).getTime());
			sh.append(date);
			sh.append("<span>");
			sh.append(videos.get(j).getView());
			sh.append("人学习</span></p>");
			
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
	public StringBuilder createCollectVideo(String id) throws SQLException, ParseException {
		getCollect get = new getCollect();
		ArrayList<Video> videos = get.getById(id);
		StringBuilder sh = new StringBuilder();
		if(videos.size()==0)
		{
			sh.append("还没有收藏任何视频");
			return sh;
		}
		try{

			PrintStream printStream = new PrintStream(new FileOutputStream("homePage.jsp"));
			SimpleDateFormat   formatter =new   SimpleDateFormat( "yyyy-MM-dd ");
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
				sh.append("C:\\Users\\acer\\Desktop\\"+videos.get(j).getCover());
				sh.append("'>");
				sh.append("</a>");
				sh.append("<div class='first'>");
				sh.append("<p class='top2'>");
				sh.append(videos.get(j).getTitle());
				sh.append("</p>");
				sh.append("<p class='bottom2'><span>课程时长:");
				sh.append(videos.get(j).getDuration());
				sh.append("</span></p>");
				sh.append("</div>");
				sh.append("<div class='last'>");
				sh.append("<p class='top2'>");
				sh.append(videos.get(j).getIntroduce());
				sh.append("</p>");
				sh.append("<p class='bottom2'>");
				String date=formatter.format(videos.get(j).getTime());
				sh.append(date);
				sh.append("<span>");
				sh.append(videos.get(j).getView());
				sh.append("人学习</span></p>");
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
	public StringBuilder createUploadVideo(String id) throws SQLException, ParseException {
		VideoDao dao = new VideoDao();
		ArrayList<Video> videos = dao.getInfoByUserId(id);
		SimpleDateFormat   formatter =new   SimpleDateFormat( "yyyy-MM-dd ");
		StringBuilder sh = new StringBuilder();
		if(videos.size()==0)
		{
			sh.append("还没有上传任何视频");
			return sh;
		}
		try{

			PrintStream printStream = new PrintStream(new FileOutputStream("homePage.jsp"));
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
				sh.append("C:\\Users\\acer\\Desktop\\"+videos.get(j).getCover());
				System.out.println("C:\\Users\\acer\\Desktop\\"+videos.get(j).getCover());
				sh.append("'>");
				sh.append("</a>");
				sh.append("<div class='first'>");
				sh.append("<p class='top2'>");
				sh.append(videos.get(j).getTitle());
				sh.append("</p>");
				sh.append("<p class='bottom2'><span>课程时长:");
				sh.append(videos.get(j).getDuration());
				sh.append("</span></p>");
				sh.append("</div>");
				sh.append("<div class='last'>");
				sh.append("<p class='top2'>");
				sh.append(videos.get(j).getIntroduce());
				sh.append("</p>");
				sh.append("<p class='bottom2'>");
				String date=formatter.format(videos.get(j).getTime());
				sh.append(date);
				sh.append("<span>");
				sh.append(videos.get(j).getView());
				sh.append("人学习</span></p>");
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
	public StringBuilder createHisUploadVideo(String id) throws SQLException, ParseException {
		VideoDao dao = new VideoDao();
		ArrayList<Video> videos = dao.getInfoByUserId(id);
		StringBuilder sh = new StringBuilder();
		try{

			PrintStream printStream = new PrintStream(new FileOutputStream("HisHome.jsp"));
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
	public StringBuilder createFriend(String id) throws SQLException, ParseException {
		FollowDao dao=new FollowDao();
		ArrayList<Follow> follows = new ArrayList<Follow>();
		follows=dao.getByUser(id);//videoId
		StringBuilder sh = new StringBuilder();
		try{
				PrintStream printStream = new PrintStream(new FileOutputStream("dynamic.jsp"));
				for(int j=0;j<follows.size();j++) {	
					sh.append("<ul id=\"pn1\">");
					sh.append("<li class=\"list1\">");
					sh.append("<div class=\"content\">");
					sh.append("<div class=\"comment-list\">");
					sh.append("<div class=\"comment\">");
					sh.append("<div class=\"comment-right\">");
					sh.append("<div class=\"comment-text\">");
					sh.append("<span class=\"user\">");
					sh.append("<a href=\"hisHome.jsp?ownerid=");
					sh.append(follows.get(j).getFolloweeid());
					sh.append("\">");
					sh.append(follows.get(j).getFolloweeid());
					sh.append("</a>");
					sh.append("</div>");
					sh.append("<div class=\"comment-date\">");
					sh.append(follows.get(j).getTime());
					sh.append("</div>");
					sh.append("</div>");
					sh.append("</div>");
					sh.append("</div>");
					sh.append("</li>");
					sh.append("</ul>");
				}
				printStream.println(sh.toString()); 
				printStream.close();
		}catch(FileNotFoundException e){
			e.printStackTrace();
		}
		return sh;
	}
}

