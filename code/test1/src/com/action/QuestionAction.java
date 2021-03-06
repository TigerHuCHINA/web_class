package com.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ExamDao;
import com.pojo.Answer;
import com.pojo.Question;

//�༭�Ծ�-���
public class QuestionAction extends HttpServlet{
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException, ServletException {
		HttpSession session = request.getSession();
		String type = request.getParameter("questionType");
		if(type.equals("a"))
		{
			String title = request.getParameter("stTitle1");
			title = new String(title.getBytes("iso-8859-1"),"utf-8");
			String a = request.getParameter("stOptionA");
			a = new String(a.getBytes("iso-8859-1"), "utf-8");
			String b = request.getParameter("stOptionB");
			b = new String(b.getBytes("iso-8859-1"), "utf-8");
			String c = request.getParameter("stOptionC");
			c = new String(c.getBytes("iso-8859-1"), "utf-8");
			String d = request.getParameter("stOptionD");
			d = new String(d.getBytes("iso-8859-1"), "utf-8");
			String content = title + "    A: " + a + "    B: " + b + "    C: "
					+ c + "    D: " + d;
			String analysis = request.getParameter("stParse1");
			analysis = new String(analysis.getBytes("iso-8859-1"), "utf-8");
			String examId = (String) session.getAttribute("examid");
			String score = request.getParameter("score1");
			String answerValue = request.getParameter("stAnswer");
			answerValue = new String(answerValue.getBytes("iso-8859-1"), "utf-8");
			
			Question question = new Question();
			question.seteId(examId);
			question.setqContent(content);
			question.setqAnalysis(analysis);
			question.setqScore(score);
			ExamDao questionDao = new ExamDao();
			questionDao.addQuestion(question);
			
			Answer answer = new Answer();
			ExamDao getDao = new ExamDao();
			String qid = getDao.getCurrentQid(examId);
			answer.setqId(qid);
			answer.setaContent(answerValue);
			ExamDao answerDao = new ExamDao();
			answerDao.addAnswer(answer);
			answerDao.free();
		}
		else
		{
			String content = request.getParameter("stTitle2");
			content = new String(content.getBytes("iso-8859-1"), "utf-8");
			String analysis = request.getParameter("stParse2");
			analysis = new String(analysis.getBytes("iso-8859-1"), "utf-8");
			String examId = (String) session.getAttribute("examid");
			String score = request.getParameter("score2");
			ArrayList<String> answerValues = new ArrayList<String>();
			int i = 1;
			while(request.getParameter("questions[" + String.valueOf(i) + "]") != null)
			{
				String answerValue = request.getParameter("questions[" + String.valueOf(i) + "]");
				answerValue = new String(answerValue.getBytes("iso-8859-1"), "utf-8");
				answerValues.add(answerValue);
				i++;
			}
			
			Question question = new Question();
			question.seteId(examId);
			question.setqContent(content);
			question.setqAnalysis(analysis);
			question.setqScore(score);
			ExamDao questionDao = new ExamDao();
			questionDao.addQuestion(question);
			
			ExamDao getDao = new ExamDao();
			String qid = getDao.getCurrentQid(examId);
			ExamDao answerDao = new ExamDao();
			for(int j = 0; j < answerValues.size(); j++)
			{
				Answer answer = new Answer();
				answer.setqId(qid);
				answer.setaContent(answerValues.get(j));
				answerDao.addAnswer(answer);
			}
			answerDao.free();
		}
		response.sendRedirect("subject.jsp");
	}
}
