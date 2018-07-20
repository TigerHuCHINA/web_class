package com.action;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.dao.AgreeDao;
import com.dao.CollectDao;
import com.dao.CommentDao;
import com.dao.ErrorQuestionDao;
import com.dao.ExamDao;
import com.dao.FollowDao;
import com.dao.MessageDao;
import com.dao.ResultDao;
import com.dao.UserDao;
import com.dao.UserEditDao;
import com.dao.VideoDao;
import com.pojo.Agree;
import com.pojo.Answer;
import com.pojo.Collection;
import com.pojo.Comment;
import com.pojo.ErrorQuestion;
import com.pojo.Exam;
import com.pojo.Follow;
import com.pojo.Message;
import com.pojo.Question;
import com.pojo.Result;
import com.pojo.User;
import com.pojo.UserEdit;
import com.pojo.Video;


public class Create {
public StringBuilder createVideo() throws SQLException, ParseException, IOException{
		VideoDao vd=new VideoDao();
		ArrayList<Video> videos = new ArrayList<Video>();
		videos=vd.getAll();
		StringBuilder sh = new StringBuilder();
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
			sh.append(videos.get(j).getId());
			sh.append("' width='100%' height='100%'>");
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
		return sh;	
	}

	public StringBuilder createComment(String videoId,String ownerId,String userId) throws SQLException, ParseException {
		CommentDao dao=new CommentDao();
		ArrayList<Comment> comments = new ArrayList<Comment>();
		comments=dao.getByVideo(videoId);
		StringBuilder sh = new StringBuilder();
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
			UserDao userDao = new UserDao();
			User user = userDao.dologin(comments.get(j).getUserId());
			sh.append(user.getUname());
			sh.append("(" + comments.get(j).getUserId() + ")");
			sh.append("</a>");
			if(comments.get(j).getUserId().equals(ownerId)) sh.append("(上传者)");
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
			if(ad.hasAgree(userId, comments.get(j).getId())) sh.append(" 取消赞");
			else sh.append(" 赞");
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
		return sh;	

	}

	public StringBuilder createAgree(String userid) throws SQLException, ParseException {
		AgreeDao dao=new AgreeDao();
		ArrayList<Agree> agrees = new ArrayList<Agree>();

		agrees=dao.getByUserId(userid);//videoId
		StringBuilder sh = new StringBuilder();
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

			UserDao userDao = new UserDao();
			User user = userDao.dologin(agrees.get(j).getUserid());
			sh.append(user.getUname());
			sh.append("(" + agrees.get(j).getUserid() + ")");

			sh.append("</a>");
			sh.append("\t点赞了你的评论：\t");
			sh.append(agrees.get(j).getContent());
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
		return sh;
	}

	public StringBuilder createFollow(String userid) throws SQLException, ParseException {
		FollowDao dao=new FollowDao();
		ArrayList<Follow> follows = new ArrayList<Follow>();
		follows=dao.getByUser(userid);//videoId
		StringBuilder sh = new StringBuilder();

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
			UserDao userDao = new UserDao();
			User user = userDao.dologin(follows.get(j).getFolloweeid());
			sh.append(user.getUname());
			sh.append("(" + follows.get(j).getFolloweeid() + ")");
			sh.append("</a>");
			sh.append("\t关注了你");
			sh.append("</div>");
			sh.append("</div>");
			sh.append("</div>");
			sh.append("</div>");
			sh.append("</li>");
			sh.append("</ul>");
		}

		return sh;
	}

	public StringBuilder createCollection(String userid) throws SQLException, ParseException {
		CollectDao dao=new CollectDao();
		ArrayList<Collection> collections = new ArrayList<Collection>();
		collections=dao.getByUserId(userid);//videoId
		StringBuilder sh = new StringBuilder();
		for(int j=0;j<collections.size();j++) {	
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
			UserDao userDao = new UserDao();
			User user = userDao.dologin(collections.get(j).getUserid());
			sh.append(user.getUname());
			sh.append("(" + collections.get(j).getUserid() + ")");
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
		return sh;
	}

	public StringBuilder createMessage(String acceptid) throws SQLException, ParseException {
		MessageDao dao=new MessageDao();
		ArrayList<Message> messages = new ArrayList<Message>();
		messages=dao.getByUserId(acceptid);//videoId
		StringBuilder sh = new StringBuilder();
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
			UserDao userDao = new UserDao();
			User user = userDao.dologin(messages.get(j).getPasssId());
			sh.append(user.getUname());
			sh.append("(" + messages.get(j).getPasssId() + ")");
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
		return sh;
	}
	public StringBuilder createCommentR(String id) throws SQLException, ParseException {
		CommentDao dao=new CommentDao();
		ArrayList<Comment> comments = new ArrayList<Comment>();
		comments=dao.getById(id);//videoId
		StringBuilder sh = new StringBuilder();
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
			UserDao userDao = new UserDao();
			User user = userDao.dologin(comments.get(j).getUserId());
			sh.append(user.getUname());
			sh.append("(" + comments.get(j).getUserId() + ")");
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
		return sh;
	}
	public StringBuilder createSelectedVideo(String key) throws SQLException, ParseException {
		VideoDao vd=new VideoDao();
		ArrayList<Video> videos = new ArrayList<Video>();
		videos=vd.getByKeywords(key);
		StringBuilder sh = new StringBuilder();
		if(videos.size()==0)
		{
			sh.append("<div>未找到您搜索的视频</div>");
			return sh;
		}
		SimpleDateFormat   formatter =new   SimpleDateFormat( "yyyy-MM-dd ");
		sh.append("<div id='videos'>");
		sh.append("<ul class='ul1'>");
		//if(videos.size()==0)sh.append("<strong>未找到您搜索的视频</strong>");
		for(int j=0;j<videos.size();j++) {
			sh.append("<li>");
			sh.append("<div class='box1'>");
			sh.append("<a class='avatar_pic' target='_self' href='video.jsp?id=");
			sh.append(videos.get(j).getId());
			sh.append("&useid=");
			sh.append(videos.get(j).getUserId());
			sh.append("'>");
			sh.append("<img src='ImageDisplay?id=video&number=");
			sh.append(videos.get(j).getId());
			sh.append("' width='100%' height='100%'>");
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
		return sh;	
	}
	public StringBuilder createCollectVideo(String id) throws SQLException, ParseException {
		getCollect get = new getCollect();
		ArrayList<Video> videos = get.getByCollectId(id);
		StringBuilder sh = new StringBuilder();
		if(videos.size()==0)
		{
			sh.append("还没有收藏任何视频");
			return sh;
		}

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
			sh.append("<img src='ImageDisplay?id=video&number=");
			sh.append(videos.get(j).getId());
			sh.append("' width='100%' height='100%'>");
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
			sh.append("<img src='ImageDisplay?id=video&number=");
			sh.append(videos.get(j).getId());
			sh.append("' width='100%' height='100%'>");
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
		return sh;	
	}
	public StringBuilder createHisUploadVideo(String id) throws SQLException, ParseException {
		VideoDao dao = new VideoDao();
		ArrayList<Video> videos = dao.getInfoByUserId(id);
		StringBuilder sh = new StringBuilder();
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
			sh.append("<img src='ImageDisplay?id=video&number=");
			sh.append(videos.get(j).getId());
			sh.append("' width='100%' height='100%'>");
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
		return sh;	
	}
	public StringBuilder createFriend(String id) throws SQLException, ParseException {
		FollowDao dao=new FollowDao();
		ArrayList<Follow> follows = new ArrayList<Follow>();
		follows=dao.getByUser2(id);//videoId
		StringBuilder sh = new StringBuilder();
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
			UserDao userDao = new UserDao();
			User user = userDao.dologin(follows.get(j).getFollowerid());
			sh.append(user.getUname());
			sh.append("(" + follows.get(j).getFollowerid() + ")");
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
		return sh;
	}
	public StringBuilder createHistory(String id) throws SQLException, ParseException {
		VideoDao dao=new VideoDao();
		ArrayList<Video> videos = new ArrayList<Video>();
		videos = dao.getByVideoRecord(id);//videoId
		StringBuilder sh = new StringBuilder();
		if(videos.size()==0)
		{
			sh.append("<div>暂无浏览记录</div>");
		}
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
			sh.append("<img src='ImageDisplay?id=video&number=");
			sh.append(videos.get(j).getId());
			sh.append("' width='100%' height='100%'>");
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
			sh.append(videos.get(j).getTime());
			sh.append("<span>");
			sh.append(videos.get(j).getView());
			sh.append("人学习</span></p>");
			sh.append("</div>");
			sh.append("</div>");
			sh.append("</li></th>");
			sh.append("<th>");
			sh.append("<div>上次观看时间：<p>");
			sh.append(videos.get(j).getSeeTime());
			sh.append("</p></div>");
			sh.append("</th></tr></table>");
			sh.append("<hr width=\"1800px\"/>");
			sh.append("</ul>");
		}
		sh.append("</div>");
		return sh;
	}
	public StringBuilder createSelectedUser(String key) throws SQLException, ParseException {
		UserEditDao dao=new UserEditDao();
		ArrayList<UserEdit> userEdits = new ArrayList<UserEdit>();
		userEdits = dao.getByKeywords(key);//videoId
		StringBuilder sh = new StringBuilder();
		if(userEdits.size()==0)
		{
			sh.append("<div>未搜索到相关用户</div>");
		}
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
			sh.append("<td>用户名: </td><td>");
			sh.append(userEdits.get(j).getUname());
			sh.append("</td></tr></div>");
			sh.append("<div id=\"userid\" class=\"info\">");
			sh.append("<tr>");
			sh.append("<td>用户账号: </td><td>");
			sh.append(userEdits.get(j).getUid());
			sh.append("</td></tr></div>");
			sh.append("<div id=\"userfocus\" class=\"info\">");
			sh.append("<tr>");
			sh.append("<td>关注量: </td><td>");
			sh.append(userEdits.get(j).getFollow());
			sh.append("</td></tr></div>");
			sh.append("<div id=\"userread\" class=\"info\">");
			sh.append("<tr>");
			sh.append("<td>浏览量: </td><td>");
			sh.append(userEdits.get(j).getView());
			sh.append("</td></tr></div>");
			sh.append("</div></div>");
		}
		return sh;
	}
	public StringBuilder browseExam(String teacherid) throws SQLException, ParseException {
		ExamDao dao=new ExamDao();
		ArrayList<Exam> exams = new ArrayList<Exam>();
		exams=dao.getByUserId(teacherid);
		StringBuilder sh = new StringBuilder();
		for(int j=0;j<exams.size();j++) {
			System.out.println("???");
			sh.append("<tr>");
			sh.append("<td>");
			sh.append(exams.get(j).getTitle());
			sh.append("</a>");
			sh.append("\t截止时间：");
			sh.append(exams.get(j).getTime());
			sh.append("</td>");
			sh.append("<td>");
			sh.append("<a href=\"begin.jsp?id=");
			sh.append(exams.get(j).getExamId());
			sh.append("\">");
			sh.append("<input type=\"button\" value=\"开始答题\" >");
			sh.append("</a>");
			sh.append("</td>");
			sh.append("</tr>");
		}
		return sh;
	}
	public StringBuilder createExam(String teacherid) throws SQLException, ParseException {
		ExamDao dao=new ExamDao();
		ArrayList<Exam> exams = new ArrayList<Exam>();
		exams=dao.getByUserId(teacherid);
		StringBuilder sh = new StringBuilder();
			for(int j=0;j<exams.size();j++) {
				String id = exams.get(j).getExamId();
				sh.append("<tr>");
				sh.append("<td>");
				sh.append("<a href=\"tQuery.jsp?id=");
				sh.append(id);
				sh.append("\">");
				sh.append("</a>");
				sh.append("</td>");
				sh.append("<td class=\"mytext\">");
				sh.append(exams.get(j).getTitle());
				sh.append("</td>");
				sh.append("<td>");
				sh.append("<div class=\"mybtn2\">");
				sh.append("<input type=\"submit\" value=\"发布\" class=\"btn btn-medium type1\" onclick=\"document.getElementById('exam').value=");
				sh.append(id);
				sh.append("\">");
				sh.append("</div>");
				sh.append("</td>");
				sh.append("<td>");
				sh.append("<div class=\"mybtn2\">");
				sh.append("<input type=\"button\" value=\"查看成绩\" class=\"btn btn-medium type2\" onclick=\"window.location='totGrade.jsp?id=");
				sh.append(id);
				sh.append("'\">");
				sh.append("</div>");
				sh.append("</td>");
				sh.append("<td>");
				sh.append("<div class=\"mybtn2\">");
				sh.append("<input type=\"button\" value=\"删除\" class=\"btn btn-medium type3\" onclick=\"window.location='doDelete?id=");
				sh.append(id);
				sh.append("'\">");
				sh.append("</div>");
				sh.append("\t");
				
				sh.append("\t");
				sh.append("</td>");
				sh.append("<td class=\"mytext\">");
				sh.append(exams.get(j).getTime());
				sh.append("</td>");
				sh.append("</tr>");
			}
		return sh;
	}

	public StringBuilder createExamPublish(String userid) throws SQLException, ParseException {
		ExamDao dao = new ExamDao();
		ArrayList<Exam> exams = new ArrayList<Exam>();
		exams = dao.getByUserIdXTime3(userid);
		StringBuilder sh = new StringBuilder();
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
			sh.append("你关注的\t");
			sh.append("<a href=\"hisHome.jsp?ownerid=");//
			sh.append(exams.get(j).getUserId());
			sh.append("\">");
			UserDao userDao = new UserDao();
			User user = userDao.dologin(exams.get(j).getUserId());
			sh.append(user.getUname());
			sh.append("(" + exams.get(j).getUserId() + ")");
			sh.append("</a>");
			sh.append("老师\t发布了试卷：\t");
			sh.append("<a href=\"begin.jsp?id=");//
			sh.append(exams.get(j).getExamId());
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
		}	
		return sh;
	}



	public StringBuilder createTeacherQuestion(String id) throws SQLException, ParseException {
		ExamDao examDao = new ExamDao();
		Exam exam = examDao.getExamById(id);//id
		ArrayList<Question> questions = new ArrayList<Question>();
		questions = examDao.getByExamId(id);//id
		StringBuilder sh = new StringBuilder();
		sh.append("<h1 align=\"center\">");
		sh.append(exam.getTitle());
		sh.append("</h1>");
		sh.append("<h3 align=\"center\">截止时间：");
		sh.append(exam.getTime());
		sh.append("</h3>");
		for(int j=0;j<questions.size();j++) {	
			sh.append("<div>");
			sh.append(String.valueOf(j+1) + ". " + questions.get(j).getqContent());
			sh.append("<br><br></div>");
		}
		return sh;
	}

	public StringBuilder createStudentQuestion(String id) throws SQLException, ParseException {
		ExamDao examDao = new ExamDao();
		Exam exam = examDao.getExamById(id);
		ArrayList<Question> questions = new ArrayList<Question>();
		questions = examDao.getByExamId(id);
		StringBuilder sh = new StringBuilder();
		sh.append("<h1 align=\"center\">");
		sh.append(exam.getTitle());
		sh.append("</h1>");
		for(int j=0;j<questions.size();j++) {	
			sh.append("<div>");
			sh.append(String.valueOf(j+1) + ". " + questions.get(j).getqContent());
			sh.append("<br>");
			for(int k = 0; k < Integer.parseInt(questions.get(j).getEmpty()); k++)
			{
				sh.append("<input type=\"text\" name=\"");
				sh.append("text" + String.valueOf(j) + String.valueOf(k));
				sh.append("\">");
			}
			sh.append("<br><br></div>");
		}
		return sh;
	}

	public StringBuilder createResult(String userId,String examId) throws SQLException, ParseException {
		ExamDao examDao = new ExamDao();
		Exam exam = examDao.getExamById(examId);
		ErrorQuestionDao errorQuestionDao = new ErrorQuestionDao();
		ArrayList<ErrorQuestion> errorQuestions = errorQuestionDao.getByUserIdAndExamId(userId, examId);
		ArrayList<Question> questions = new ArrayList<Question>();
		ExamDao questionDao = new ExamDao();
		for(int i = 0; i < errorQuestions.size(); i++)
		{
			Question question = questionDao.getQuestionById(errorQuestions.get(i).getQuestionId());
			questions.add(question);
		}
		StringBuilder sh = new StringBuilder();
		sh.append("<h1 align=\"center\">");
		sh.append(exam.getTitle());
		sh.append("</h1><br><p><hr/><h4>错题</h4>");
		for(int j=0;j<questions.size();j++) {	
			sh.append("<div>");
			sh.append(questions.get(j).getqContent());
			sh.append("<br>");
			sh.append("<font name=\"youran1\">你的答案：");
			sh.append(errorQuestions.get(j).getYourAnswer());
			sh.append("</font><br>");
			sh.append("<font name=\"an1\">正确答案：");
			ArrayList<Answer> answers = questionDao.getByQId(questions.get(j).getqId());
			for(int k = 0; k < answers.size(); k++)
			{
				if(k == answers.size()-1) sh.append(answers.get(k).getaContent());
				else sh.append(answers.get(k).getaContent() + ", ");
			}
			sh.append("</font><br>");
			sh.append("<font name=\"analy1\">试题解析: ");
			if(questions.get(j).getqAnalysis()!=null)sh.append(questions.get(j).getqAnalysis());
			else sh.append("暂无解析");
			sh.append("</font><br><br></div>");
		}
		sh.append("<hr/>");
		sh.append("<p>本次考试总成绩为：");
		ResultDao resultDao = new ResultDao();
		Result result = resultDao.getByUserIdAndExamId(userId, examId);
		sh.append(result.getScore());
		sh.append("/");
		sh.append(exam.getScore());
		sh.append("</p>");
		questionDao.free();
		return sh;
	}
	public StringBuilder createExamResults(String examId){
		ResultDao resultDao = new ResultDao();
		ArrayList<Result> results = resultDao.getByExamId(examId);
		ExamDao examDao = new ExamDao();
		Exam exam = examDao.getExamById(examId);
		StringBuilder sh = new StringBuilder();
		sh.append("<tr><th colspan=\"2\">");
		sh.append(exam.getTitle());
		sh.append("</th></tr>");
		sh.append("<tr><td>学生姓名</td><td>得分</td><td>提交时间</td></tr>");
		for(int j=0;j<results.size();j++) {	
			sh.append("<tr><td>");
			UserDao userDao = new UserDao();
			User user = userDao.dologin(results.get(j).getUserId());
			sh.append(user.getUname() + "(" + user.getUid() + ")");
			sh.append("</td><td>");
			sh.append(results.get(j).getScore());
			sh.append("</td><td>");
			sh.append(results.get(j).getTime());
			sh.append("</td></tr>");
		}
		return sh;
	}
}

