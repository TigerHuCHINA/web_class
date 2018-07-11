package com.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.pojo.User;
import com.pojo.Video;
import com.dao.VideoCountDao;

public class VisitorCountAction extends HttpServlet {
	VideoCountDao dao = new VideoCountDao();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException{
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("userid");
		String name = req.getParameter("name");
		name = new String(name.getBytes("iso-8859-1"),"utf-8");
		String videoid= req.getParameter("8");
		videoid = new String(videoid.getBytes("iso-8859-1"),"utf-8");
		User u = new User();
		Video v = new Video();
		u.setUid(id);
		u.setUname(name);
		v.setId(videoid);
		dao.doCount(u);
		dao.doRecord(u,v);
		resp.sendRedirect("counter.jsp");
	}
	
}
