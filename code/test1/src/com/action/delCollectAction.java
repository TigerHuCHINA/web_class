package com.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CollectDao;
//调用取消收藏的数据库指令-季宇恒
public class delCollectAction extends HttpServlet {
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException, ServletException {
		HttpSession session = request.getSession();
		String uid = (String)session.getAttribute("userid");
		String vid = (String)session.getAttribute("videoid");
		CollectDao dcd = new CollectDao();
		if(dcd.decollect(uid,vid)) {
			response.sendRedirect("video.jsp");
		}else {
			request.setAttribute("result", "失败");
			request.getRequestDispatcher("video.jsp").forward(request, response);
		}
	}
}
