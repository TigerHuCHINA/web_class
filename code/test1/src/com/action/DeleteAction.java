package com.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ExamDao;
import com.pojo.Question;

public class DeleteAction extends HttpServlet {
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException, ServletException {
		HttpSession session = request.getSession();
		String examId = request.getParameter("id");
		ExamDao delDao = new ExamDao();
		ExamDao questionDao = new ExamDao();
		
		ArrayList<Question> questions = questionDao.getByExamId(examId);
		for(int i = 0; i < questions.size(); i++)
		{
			delDao.delAnswer(questions.get(i).getqId());
		}
		delDao.delExam(examId);
		delDao.free();
		
		response.sendRedirect("editQ.jsp");
	}
}
