package com.action;
//收藏-杜宇航
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CollectDao;
import com.pojo.Collection;

/**
 * Servlet implementation class CollectAction
 */

public class CollectAction extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//收藏视频-阿依多斯
		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("userid");
		String vid = (String) session.getAttribute("vid");
		String flag=new String(request.getParameter("flag"));

		Collection collection = new Collection();
		collection.setUserid(uid);
		collection.setVideoid(vid);

		CollectDao cd=new CollectDao();
		if(flag.equals(new String("add"))){
			if(cd.collect(collection)) {
				request.setAttribute("result", "成功收藏");
				request.setAttribute("id", vid);
				response.sendRedirect("video.jsp?id="+vid+"&useid="+session.getAttribute("ownerid"));
				
			}else {
				request.setAttribute("result", "收藏失败");
				request.setAttribute("id", vid);
				request.getRequestDispatcher("xx.jsp").forward(request, response);
			}
		}

		else{
			if(cd.decollect(uid, vid)) {
				request.setAttribute("result", "成功取消收藏");
				request.setAttribute("vid", vid);
				response.sendRedirect("video.jsp?id="+vid+"&useid="+session.getAttribute("ownerid"));
			}else {
				request.setAttribute("result", "取消收藏失败");
				request.getRequestDispatcher("xx.jsp").forward(request, response);
			}

		}
		
		
	}

}
