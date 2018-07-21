package com.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.FollowDao;
import com.pojo.Follow;
//调用取消关注的数据库指令-季宇恒
public class deFollowAction {
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException, ServletException {
		HttpSession session = request.getSession();
		Follow ff = new Follow();
		FollowDao f = new FollowDao();
		if(f.deFollow(ff)) {
			response.sendRedirect("homePage.jsp");
		}else {
			request.setAttribute("result", "失败");
			request.getRequestDispatcher("homePage.jsp").forward(request, response);
		}
	}
}
