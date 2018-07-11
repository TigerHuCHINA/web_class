package com.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.MessageDao;
import com.pojo.Message;

public class MessageAction extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		String passId = req.getParameter("passId");
		String acceptId = req.getParameter("acceptId");
		String content = req.getParameter("content");
		content = new String(content.getBytes("iso-8859-1"),"utf-8");
		
		Message m = new Message();
		m.setPasssId(passId);
		m.setAcceptId(acceptId);
		m.setContent(content);
		
		MessageDao dao = new MessageDao();
		
		if(dao.sendMessage(m)) {
			req.setAttribute("result", "�ɹ�");
			req.getRequestDispatcher("success.jsp").forward(req, resp);
		}else {
			req.setAttribute("result", "ʧ��");
			req.getRequestDispatcher("upload.jsp").forward(req, resp);
		}
	}
}
