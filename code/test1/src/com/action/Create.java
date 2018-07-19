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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.dao.AgreeDao;
import com.dao.CollectDao;
import com.dao.CommentDao;
import com.dao.ExamDao;
import com.dao.FollowDao;
import com.dao.MessageDao;
import com.dao.UserEditDao;
import com.dao.VideoDao;
import com.pojo.Agree;
import com.pojo.Collection;
import com.pojo.Comment;
import com.pojo.Exam;
import com.pojo.Follow;
import com.pojo.Message;
import com.pojo.Question;
import com.pojo.UserEdit;
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
				sh.append("<img src='ImageDisplay?id=video&number=");
				sh.append(videos.get(j).getCover());
				sh.append("'>");
				sh.append("</a>");
				sh.append("<div class='first'>");
				sh.append("<p class='top2'>");
				sh.append(videos.get(j).getTitle());
				sh.append("</p>");
				sh.append("<p class='bottom2'><span>�γ�ʱ��:");
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
				sh.append("��ѧϰ</span></p>");
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




	public StringBuilder createComment(String videoId,String ownerId,String userId) throws SQLException, ParseException {
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
				if(comments.get(j).getUserId().equals(ownerId)) sh.append("(�ϴ���)");
				sh.append(" :</span><br>");
				sh.append(comments.get(j).getContent());
				sh.append("</div>");
				sh.append("<div class=\"comment-date\">");
				sh.append(comments.get(j).getTime());
				sh.append("<a class=\"comment-zan\" href=\"doAgree?commentid=");
				sh.append(comments.get(j).getId());
				sh.append("\">");
				sh.append(comments.get(j).getAgree());
				AgreeDao ad=new AgreeDao();
				if(ad.hasAgree(userId, comments.get(j).getId())) sh.append(" ȡ����");
				else sh.append(" ��");
				sh.append("</div>");
				sh.append("</div>");
				sh.append("</div>");
				sh.append("</div>");
			}
			sh.append("<form name=\"form1\" method=\"post\" action=\"doComment\">");
			sh.append("<div class=\"hf\">");
			sh.append("<textarea name=\"content\" id=\"te\" class=\"hf-text\" autocomplete=\"off\" maxlength=\"100\" rows=\"10\" cols=\"50\"></textarea>");
			sh.append("<input type=\"submit\" class=\"comment-dele\" value=\"�ύ�ظ�\" onclick=\"return check()\"/>");
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
				sh.append("\t������������ۣ�\t");
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
				sh.append("\t��ע����");
				sh.append("</div>");
				//sh.append("<div class=\"comment-date\">");
				//sh.append(follows.get(j).getTime());
				//sh.append("</div>");
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
					sh.append("\t��\t");
					sh.append(collections.get(j).getTime());
					sh.append("\t�ղ��������Ƶ��\t");
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
				sh.append("\t�ղ��������Ƶ��\t");
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
				sh.append("\t˽�����㣺\t\n");
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
				sh.append("\t�����������Ƶ\t");
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
			sh.append("<div>δ�ҵ�����������Ƶ</div>");
			return sh;
		}
		try{
			PrintStream printStream = new PrintStream(new FileOutputStream("home.jsp"));
			SimpleDateFormat   formatter =new   SimpleDateFormat( "yyyy-MM-dd ");
			sh.append("<div id='videos'>");
			sh.append("<ul class='ul1'>");
			//if(videos.size()==0)sh.append("<strong>δ�ҵ�����������Ƶ</strong>");
			for(int j=0;j<videos.size();j++) {
				System.out.println(videos.get(j).getCover());
				sh.append("<li>");
				sh.append("<div class='box1'>");
				sh.append("<a class='avatar_pic' target='_self' href='video.jsp?id=");
				sh.append(videos.get(j).getId());
				sh.append("&useid=");
				sh.append(videos.get(j).getUserId());
				sh.append("'>");
				sh.append("<img src='");
				sh.append("C:\\Users\\Lenovo\\Desktop\\"+videos.get(j).getCover());
				sh.append("'>");
				sh.append("</a>");
				sh.append("<div class='first'>");
				sh.append("<p class='top2'>");
				sh.append(videos.get(j).getTitle());
				sh.append("</p>");
				sh.append("<p class='bottom2'><span>�γ�ʱ��:");
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
				sh.append("��ѧϰ</span></p>");

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
		ArrayList<Video> videos = get.getByCollectId(id);
		StringBuilder sh = new StringBuilder();
		if(videos.size()==0)
		{
			sh.append("��û���ղ��κ���Ƶ");
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
				sh.append("C:\\Users\\Lenovo\\Desktop\\"+videos.get(j).getCover());
				sh.append("'>");
				sh.append("</a>");
				sh.append("<div class='first'>");
				sh.append("<p class='top2'>");
				sh.append(videos.get(j).getTitle());
				sh.append("</p>");
				sh.append("<p class='bottom2'><span>�γ�ʱ��:");
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
				sh.append("��ѧϰ</span></p>");
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
			sh.append("��û���ϴ��κ���Ƶ");
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
				sh.append("C:\\Users\\Lenovo\\Desktop\\"+videos.get(j).getCover());
				sh.append("'>");
				sh.append("</a>");
				sh.append("<div class='first'>");
				sh.append("<p class='top2'>");
				sh.append(videos.get(j).getTitle());
				sh.append("</p>");
				sh.append("<p class='bottom2'><span>�γ�ʱ��:");
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
				sh.append("��ѧϰ</span></p>");
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
				sh.append("C:\\Users\\Lenovo\\Desktop\\"+videos.get(j).getCover());
				sh.append("'>");
				sh.append("</a>");
				sh.append("<div class='first'>");
				sh.append("<p class='top2'>");
				sh.append(videos.get(j).getTitle());
				sh.append("</p>");
				sh.append("<p class='bottom2'>������7-14<span>�γ�ʱ��:");
				sh.append(videos.get(j).getDuration());
				sh.append("</span></p>");
				sh.append("</div>");
				sh.append("<div class='last'>");
				sh.append("<p class='top2'>");
				sh.append(videos.get(j).getIntroduce());
				sh.append("</p>");
				sh.append("<p class='bottom2'>2015-08-17<span>272648��ѧϰ</span></p>");
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
		follows=dao.getByUser2(id);//videoId
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
				sh.append(follows.get(j).getFollowerid());
				sh.append("\">");
				sh.append(follows.get(j).getFollowerid());
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
	public StringBuilder createHistory(String id) throws SQLException, ParseException {
		VideoDao dao=new VideoDao();
		ArrayList<Video> videos = new ArrayList<Video>();
		videos = dao.getByVideoRecord(id);//videoId
		StringBuilder sh = new StringBuilder();
		if(videos.size()==0)
		{
			sh.append("<div>���������¼</div>");
		}
		try{
			PrintStream printStream = new PrintStream(new FileOutputStream("history.jsp"));
			sh.append("<div id=\"videos\">");
			for(int j=0;j<videos.size();j++) {	
				sh.append("<ul class=\"ul1\">");
				sh.append("<table><tr><th><li>");
				sh.append("<div class='box1'>");
				sh.append("<a onclick='return login2()' class='avatar_pic' target='_self' href='video.jsp?id=");
				sh.append(videos.get(j).getId());
				sh.append("&useid=");
				sh.append(videos.get(j).getUserId());
				sh.append("'>");
				sh.append("<img src='");
				sh.append("C:\\Users\\Lenovo\\Desktop\\"+videos.get(j).getCover());
				sh.append("'>");
				sh.append("</a>");
				sh.append("<div class='first'>");
				sh.append("<p class='top2'>");
				sh.append(videos.get(j).getTitle());
				sh.append("</p>");
				sh.append("<p class='bottom2'><span>�γ�ʱ��:");
				sh.append(videos.get(j).getDuration());
				sh.append("</span></p>");
				sh.append("</div>");
				sh.append("<div class='last'>");
				sh.append("<p class='top2'>");
				sh.append(videos.get(j).getIntroduce());
				sh.append("</p>");
				sh.append("<p class='bottom2'>");
				sh.append(videos.get(j).getTime());
				sh.append("<span>");
				sh.append(videos.get(j).getView());
				sh.append("��ѧϰ</span></p>");
				sh.append("</div>");
				sh.append("</div>");
				sh.append("</li></th>");
				sh.append("<th>");
				sh.append("<div>�ϴιۿ�ʱ�䣺<p>");
				sh.append(videos.get(j).getSeeTime());
				sh.append("</p></div>");
				sh.append("</th></tr></table>");
				sh.append("<hr width=\"1800px\"/>");
				sh.append("</ul>");
			}
			sh.append("</div>");
			printStream.println(sh.toString()); 
			printStream.close();
		}catch(FileNotFoundException e){
			e.printStackTrace();
		}
		return sh;
	}
	public StringBuilder createSelectedUser(String key) throws SQLException, ParseException {
		UserEditDao dao=new UserEditDao();
		ArrayList<UserEdit> userEdits = new ArrayList<UserEdit>();
		userEdits = dao.getByKeywords(key);//videoId
		StringBuilder sh = new StringBuilder();
		if(userEdits.size()==0)
		{
			sh.append("<div>δ����������û�</div>");
		}
		try{
			PrintStream printStream = new PrintStream(new FileOutputStream("searchvideo.jsp"));
			for(int j=0;j<userEdits.size();j++) {	
				sh.append("<div class=\"myinformation\">");
				sh.append("<div class=\"image\">");
				sh.append("<a href=\"hisHome.jsp?ownerid=");
				sh.append(userEdits.get(j).getUid() + "\">");
				sh.append("<img src=\"ImageDisplay?content=");
				sh.append(userEdits.get(j).getUid());
				sh.append("\" onclick=\"hisHome\"/>");
				sh.append("</a>");
				sh.append("</div>");
				sh.append("<div class=\"informationbox\">");
				sh.append("<div id=\"username\" class=\"info\">");
				sh.append("<tr>");
				sh.append("<td>�û���: </td><td>");
				sh.append(userEdits.get(j).getUname());
				sh.append("</td></tr></div>");
				sh.append("<div id=\"userid\" class=\"info\">");
				sh.append("<tr>");
				sh.append("<td>�û��˺�: </td><td>");
				sh.append(userEdits.get(j).getUid());
				sh.append("</td></tr></div>");
				sh.append("<div id=\"userfocus\" class=\"info\">");
				sh.append("<tr>");
				sh.append("<td>��ע��: </td><td>");
				sh.append(userEdits.get(j).getFollow());
				sh.append("</td></tr></div>");
				sh.append("<div id=\"userread\" class=\"info\">");
				sh.append("<tr>");
				sh.append("<td>�����: </td><td>");
				sh.append(userEdits.get(j).getView());
				sh.append("</td></tr></div>");
				sh.append("</div></div>");
			}
			printStream.println(sh.toString()); 
			printStream.close();
		}catch(FileNotFoundException e){
			e.printStackTrace();
		}
		return sh;
	}
	public StringBuilder browseExam(String teacherid) throws SQLException, ParseException {
		ExamDao dao=new ExamDao();
		ArrayList<Exam> exams = new ArrayList<Exam>();
		exams=dao.getByUserId(teacherid);
		StringBuilder sh = new StringBuilder();
		try{
			PrintStream printStream = new PrintStream(new FileOutputStream("?.jsp"));
			for(int j=0;j<exams.size();j++) {
				//+++++++++++++
				sh.append(exams.get(j).getExamId());
				sh.append(exams.get(j).getTitle());
				sh.append(exams.get(j).getScore());
				sh.append(exams.get(j).getTime());
				sh.append(exams.get(j).getUserId());
				//sh.append(session.getAttribute("username"));
				//+++++++++++++
			}
			printStream.println(sh.toString()); 
			printStream.close();
		}catch(FileNotFoundException e){
			e.printStackTrace();
		}
		return sh;
	}
	public StringBuilder createExam(String teacherid) throws SQLException, ParseException {
		ExamDao dao=new ExamDao();
		ArrayList<Exam> exams = new ArrayList<Exam>();
		exams=dao.getByUserId(teacherid);
		StringBuilder sh = new StringBuilder();
		System.out.println("ok");
		try {
			PrintStream printStream = new PrintStream(new FileOutputStream("editQ.jsp"));
			for(int j=0;j<exams.size();j++) {
				System.out.println("1");
				sh.append("<tr>");
				sh.append("<td>");
				sh.append("<a href=\"tQuery.jsp?id=");
				sh.append(exams.get(j).getExamId());
				sh.append("\">");
				sh.append(exams.get(j).getTitle());
				sh.append("</a>");
				sh.append("</td>");
				sh.append("<td>");
				sh.append("<input type=\"button\" value=\"����\" onClick=\"msgbox()\">");
				sh.append("</td>");
				sh.append("<td>");
				sh.append("<input type=\"button\" value=\"ɾ��\">");
				sh.append("\t");
				sh.append(exams.get(j).getTime());
				sh.append("\t");
				sh.append("</td>");
				sh.append("</tr>");

			}
		} catch (FileNotFoundException e) {
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
		}

		return sh;
	}

	public StringBuilder createExamPublish(String userid) throws SQLException, ParseException {
		//FollowDao dao = new FollowDao();
		//ArrayList<Follow> follows = new ArrayList<Follow>();
		//follows = dao1.getByUser2(userid);
		ExamDao dao = new ExamDao();
		ArrayList<Exam> exams = new ArrayList<Exam>();
		exams = dao.getByUserIdXTime3(userid);
		//int l = 0;
		//String teacher = follows.get(l).getFollowerid();
		//exams = dao2.getByUserIdXTime2(teacher);
		StringBuilder sh = new StringBuilder();

		PrintStream printStream;
		try {
			printStream = new PrintStream(new FileOutputStream("dynamic.jsp"));
			//for(int k=0;k<follows.size();k++) {
				//exams = dao2.getByUserIdXTime2(follows.get(k).getFollowerid());
				//System.out.println("11");
				for(int j=0;j<exams.size();j++) {
					System.out.println("22");
					sh.append("<ul id=\"pn1\">");
					sh.append("<li class=\"list1\">");
					sh.append("<div class=\"content\">");
					sh.append("<div class=\"comment-list\">");
					sh.append("<div class=\"comment\">");
					sh.append("<div class=\"comment-right\">");
					sh.append("<div class=\"comment-text\">");
					sh.append("<span class=\"user\">");
					sh.append("���ע��\t");
					sh.append("<a href=\"hisHome.jsp?ownerid=");//
					sh.append(exams.get(j).getUserId());
					sh.append("\">");
					sh.append(exams.get(j).getUserId());
					sh.append("</a>");
					sh.append("��ʦ");
					sh.append("\t�������Ծ�\t");
					sh.append("<a href=\"browseQ.jsp?ownerid=");//
					sh.append(exams.get(j).getUserId());
					sh.append("\">");
					sh.append(exams.get(j).getTitle());
					sh.append("</a>");
					sh.append("</div>");
					sh.append("<div class=\"comment-date\">");
					sh.append(exams.get(j).getTime());
					sh.append("</div>");
					sh.append("</div>");
					sh.append("</div>");
					sh.append("</div>");
					sh.append("</li>");
					sh.append("</ul>");
					System.out.println("2");
				}	
			//}
			printStream.println(sh.toString()); 
			printStream.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		return sh;
	}



	public StringBuilder createTeacherQuestion(String id) throws SQLException, ParseException {
		ExamDao examDao = new ExamDao();
		Exam exam = examDao.getExamById(id);//id
		ArrayList<Question> questions = new ArrayList<Question>();
		questions = examDao.getByExamId(id);//id
		StringBuilder sh = new StringBuilder();
		try{
			PrintStream printStream = new PrintStream(new FileOutputStream("tQuery.jsp"));
			sh.append("<h1 align=\"center\">");
			sh.append(exam.getTitle());
			sh.append("</h1>");
			sh.append("<h3 align=\"center\">��ֹʱ�䣺");
			sh.append(exam.getTime());
			sh.append("</h3>");
			for(int j=0;j<questions.size();j++) {	
				sh.append("<div>");
				sh.append(String.valueOf(j+1) + ". " + questions.get(j).getqContent());
				sh.append("<br><br></div>");
			}
			printStream.println(sh.toString()); 
			printStream.close();
		}catch(FileNotFoundException e){
			e.printStackTrace();
		}
		return sh;
	}
}

