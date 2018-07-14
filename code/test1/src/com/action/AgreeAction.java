package com.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AgreeDao;
import com.pojo.Agree;
public class AgreeAction extends HttpServlet {
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException, ServletException {
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("userid");
		String commentid = request.getParameter("commentid");
		
		Agree aa = new Agree();
		aa.setUserid(userid);
		aa.setCommentid(commentid);
		AgreeDao a = new AgreeDao();
		if(a.addAgree(aa)) {
			request.setAttribute("result", "³É¹¦");
			response.sendRedirect("video.jsp?id=" + (String)request.getSession().getAttribute("vid") + "&useid=" + (String)request.getSession().getAttribute("ownerid"));
		}else {
			request.setAttribute("result", "Ê§°Ü");
			request.getRequestDispatcher("xx.jsp").forward(request, response);
		}
	}
}
