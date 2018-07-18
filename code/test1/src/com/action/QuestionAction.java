package com.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class QuestionAction extends HttpServlet{
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException, ServletException {
		HttpSession session = request.getSession();
		String type = request.getParameter("questionType");
		if(type.equals("a"))
		{
			String title = request.getParameter("stTitle");
			title = new String(title.getBytes("iso-8859-1"),"utf-8");
			String a = request.getParameter("stOptionA");
			a = new String(a.getBytes("iso-8859-1"), "utf-8");
			String b = request.getParameter("stOptionB");
			b = new String(b.getBytes("iso-8859-1"), "utf-8");
			String c = request.getParameter("stOptionC");
			a = new String(a.getBytes("iso-8859-1"), "utf-8");
			String d = request.getParameter("stOptionD");
			a = new String(a.getBytes("iso-8859-1"), "utf-8");
			String content = title + "\rA: " + a + "\rB: " + b + "\rC: "
					+ c + "\rD: " + d;
			String answerValue = request.getParameter("stAnswer");
			String parse = request.getParameter("stParse");
		}
		else
		{
			
		}
	}
}
