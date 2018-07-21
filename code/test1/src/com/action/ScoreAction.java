package com.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ErrorQuestionDao;
import com.dao.ExamDao;
import com.dao.ResultDao;
import com.pojo.Answer;
import com.pojo.ErrorQuestion;
import com.pojo.Exam;
import com.pojo.Question;
import com.pojo.Result;
import com.pojo.User;

//生成分数-杜宇航
public class ScoreAction extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		String userId = (String)session.getAttribute("userid");
		String examId = req.getParameter("id");
		ExamDao questionDao = new ExamDao();
		ArrayList<Question> questions = questionDao.getByExamId(examId);
		Double score = 0.0;
		ExamDao answerDao = new ExamDao();
		
		for(int i = 0; i < questions.size(); i++)
		{
			Boolean isRight = true;
			ArrayList<Answer> answers = answerDao.getByQId(questions.get(i).getqId());
			for(int j = 0; j < answers.size(); j++)
			{
				String trueAnswer = answers.get(j).getaContent();
				String yourAnswer = req.getParameter("text" + String.valueOf(i) + String.valueOf(j));
				yourAnswer = new String(yourAnswer.getBytes("iso-8859-1"),"utf-8");
				if(!trueAnswer.equals(yourAnswer))
				{
					isRight = false;
				}
			}
			if(isRight) score += Double.valueOf(questions.get(i).getqScore());
			else 
			{
				ErrorQuestion errorQuestion = new ErrorQuestion();
				errorQuestion.setExamId(examId);
				errorQuestion.setQuestionId(questions.get(i).getqId());
				errorQuestion.setUserId(userId);
				String yourAnswer = "";
				for(int k = 0; k < answers.size(); k++)
				{
					if(k == answers.size()-1) yourAnswer += req.getParameter("text" + String.valueOf(i) + String.valueOf(k));
					else yourAnswer += req.getParameter("text" + String.valueOf(i) + String.valueOf(k)) + ", ";
				}
				yourAnswer = new String(yourAnswer.getBytes("iso-8859-1"),"utf-8");
				errorQuestion.setYourAnswer(yourAnswer);
				ErrorQuestionDao errorQuestionDao = new ErrorQuestionDao();
				errorQuestionDao.addQuestion(errorQuestion);
			}
		}
		Result result = new Result();
		result.setExamId(examId);
		result.setUserId(userId);
		result.setScore(String.valueOf(score));
		ResultDao resultDao = new ResultDao();
		resultDao.addResult(result);
		
		resp.sendRedirect("result.jsp?id=" + examId);
	}
}
