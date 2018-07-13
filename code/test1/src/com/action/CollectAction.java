package com.action;

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
		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("userid");
		String vid = (String) session.getAttribute("vid");
		System.out.println(vid);
		
		Collection collection = new Collection();
		collection.setUserid(uid);
		collection.setVideoid(vid);
		
		CollectDao cd=new CollectDao();
		if(cd.collect(collection)) {
			request.setAttribute("result", "³É¹¦");
			request.getRequestDispatcher("home.jsp").forward(request, response);
		}else {
			request.setAttribute("result", "Ê§°Ü");
			request.getRequestDispatcher("xx.jsp").forward(request, response);
		}
	}

}
