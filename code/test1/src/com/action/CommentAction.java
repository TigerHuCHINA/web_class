package com.action;
//∆¿¬€-∂≈”Ó∫Ω
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.AbstractDocument.Content;

import com.dao.CommentDao;
import com.pojo.Comment;

public class CommentAction extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("userid");
		String videoid = (String) session.getAttribute("vid");
		String content = req.getParameter("content");
		content =new String(content.getBytes("iso-8859-1"),"utf-8");
		
		Comment comment = new Comment();
		comment.setUserId(userid);
		comment.setVideoId(videoid);
		comment.setContent(content);
		
		CommentDao dao = new CommentDao();
		if(dao.sendComment(comment))
		{
			req.setAttribute("result", "≥…π¶");
			resp.sendRedirect("video.jsp?id=" + videoid + "&useid=" + (String)req.getSession().getAttribute("ownerid"));
		}
		else 
		{
			req.setAttribute("result", " ß∞‹");
			req.getRequestDispatcher("xx.jsp").forward(req, resp);
		}
	}
}
