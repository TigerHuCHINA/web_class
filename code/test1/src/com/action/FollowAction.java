package com.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.FollowDao;
import com.pojo.Follow;

public class FollowAction extends HttpServlet {
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException, ServletException {
		HttpSession session = request.getSession();
		String follower = (String) session.getAttribute("ownerid");
		String followee = (String) session.getAttribute("userid");
		String flag=new String(request.getParameter("flag"));
		Follow ff = new Follow();
		ff.setFollowerid(follower);
		ff.setFolloweeid(followee);
		FollowDao f = new FollowDao();
		if(flag.equals(new String("add"))) {
		if(f.adFollow(ff)) {
			request.setAttribute("result", "成功");
			request.getRequestDispatcher("hisHome.jsp?ownerid="+follower).forward(request, response);
		}else {
			request.setAttribute("result", "失败");
			request.getRequestDispatcher("xx.jsp").forward(request, response);
		}
		}
		else{
			if(f.deFollow(ff)) {
				request.setAttribute("result", "成功");
				response.sendRedirect("hisHome.jsp?ownerid="+follower);
			}else {
				request.setAttribute("result", "失败");
				response.sendRedirect("hisHome.jsp?ownerid="+follower);
			}
			}
		
		
		
		
	}
}
