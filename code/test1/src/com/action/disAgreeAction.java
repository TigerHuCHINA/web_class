package com.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CollectDao;

public class disAgreeAction extends HttpServlet {
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException, ServletException {
		HttpSession session = request.getSession();
		String uid = (String)session.getAttribute("userid");
		String cid = (String)session.getAttribute("commentid");
		AgreeDao a = new AgreeDao();
		if(a.disagree(uid,cid)) {
			request.setAttribute("result", "³É¹¦");
			request.getRequestDispatcher("video.jsp").forward(request, response);
		}else {
			request.setAttribute("result", "Ê§°Ü");
			request.getRequestDispatcher("xx.jsp").forward(request, response);
		}
	}
}
