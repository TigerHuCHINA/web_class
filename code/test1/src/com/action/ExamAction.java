package com.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ExamDao;
import com.pojo.Exam;

public class ExamAction extends HttpServlet {
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException, ServletException {
		HttpSession session = request.getSession();
		String title = request.getParameter("quTitle");
		title = new String(title.getBytes("iso-8859-1"),"utf-8");
		String userId = (String) session.getAttribute("userId");
		
		Exam exam = new Exam();
		exam.setTitle(title);
		exam.setUserId(userId);
		ExamDao examDao = new ExamDao();
		examDao.addExam(exam);
		session.setAttribute("examid", examDao.getCurrentEid(userId));
	}	
}
