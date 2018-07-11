package com.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.FeedbackDao;
import com.pojo.Feedback;

public class FeedbackAction extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		String string = (String) req.getAttribute("content");
		string = new String(string.getBytes("iso-8859-1"),"utf-8");
		Feedback feedback = new Feedback();
		feedback.setUserid((String) session.getAttribute("userid"));
		feedback.setContent(string);
		FeedbackDao dao = new FeedbackDao();
		if(dao.feedbackCommit(feedback)) {
			req.setAttribute("result", "³É¹¦");
			req.getRequestDispatcher("xx.jsp").forward(req, resp);
		}else {
			req.setAttribute("result", "Ê§°Ü");
			req.getRequestDispatcher("xx.jsp").forward(req, resp);
		}
	}
}
