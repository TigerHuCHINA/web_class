package com.action;
//�ղ�-���
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
//�ղ���Ƶ-������˹
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
				request.setAttribute("result", "�ɹ��ղ�");
				request.setAttribute("id", vid);
				response.sendRedirect("video.jsp?id="+vid+"&useid="+session.getAttribute("ownerid"));
				
			}else {
				request.setAttribute("result", "�ղ�ʧ��");
				request.setAttribute("id", vid);
				request.getRequestDispatcher("xx.jsp").forward(request, response);
			}
		}

		else{
			if(cd.decollect(uid, vid)) {
				request.setAttribute("result", "�ɹ�ȡ���ղ�");
				request.setAttribute("vid", vid);
				response.sendRedirect("video.jsp?id="+vid+"&useid="+session.getAttribute("ownerid"));
			}else {
				request.setAttribute("result", "ȡ���ղ�ʧ��");
				request.getRequestDispatcher("xx.jsp").forward(request, response);
			}

		}
		
		
	}

}
