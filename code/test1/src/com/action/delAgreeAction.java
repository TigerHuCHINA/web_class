package com.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AgreeDao;
import com.pojo.Agree;
//����ȡ���޵����ݿ�ָ��-�����
public class delAgreeAction extends HttpServlet {
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException, ServletException {
		HttpSession session = request.getSession();
		Agree aa = new Agree();
		AgreeDao a = new AgreeDao();
		if(a.delAgree(aa)) {
			response.sendRedirect("video.jsp");
		}else {
			request.setAttribute("result", "ʧ��");
			request.getRequestDispatcher("video.jsp").forward(request, response);
		}
	}
}
