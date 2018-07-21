package com.action;
//µ„‘ﬁ-∂≈”Ó∫Ω
import java.io.IOException;
import java.sql.SQLException;

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
		AgreeDao ad=new AgreeDao();
		boolean r=false;
		try {
			r=ad.hasAgree(userid, commentid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		Agree aa = new Agree();
		aa.setUserid(userid);
		aa.setCommentid(commentid);
		AgreeDao a = new AgreeDao();
		
		if(!r){
		if(a.addAgree(aa)) {
			request.setAttribute("result", "≥…π¶");
			response.sendRedirect("video.jsp?id=" + (String)request.getSession().getAttribute("vid") + "&useid=" + (String)request.getSession().getAttribute("ownerid"));
		}else {
			request.setAttribute("result", " ß∞‹");
			request.getRequestDispatcher("xx.jsp").forward(request, response);
		}
		}
		else{
			if(a.delAgree(aa)) {
				request.setAttribute("result", "≥…π¶");
				response.sendRedirect("video.jsp?id=" + (String)request.getSession().getAttribute("vid") + "&useid=" + (String)request.getSession().getAttribute("ownerid"));
			}else {
				request.setAttribute("result", " ß∞‹");
				request.getRequestDispatcher("xx.jsp").forward(request, response);
			}
			}
		
		
		
		
	}
}
