package com.action;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.dao.AgreeDao;
import com.dao.ExamDao;
import com.pojo.Agree;
import com.pojo.Exam;

public class getExam extends HttpServlet{
	private HttpServletRequest request;
	HttpSession session = request.getSession();
	public StringBuilder createExam(String teacherid) throws SQLException, ParseException {
		ExamDao dao=new ExamDao();
		ArrayList<Exam> exams = new ArrayList<Exam>();
		exams=dao.getByUserId(teacherid);
		StringBuilder sh = new StringBuilder();
		try{
				PrintStream printStream = new PrintStream(new FileOutputStream("?.jsp"));
				for(int j=0;j<exams.size();j++) {
				//+++++++++++++
					sh.append(exams.get(j).getExamId());
					sh.append(exams.get(j).getTitle());
					sh.append(exams.get(j).getScore());
					sh.append(exams.get(j).getTime());
					sh.append(exams.get(j).getUserId());
					sh.append(session.getAttribute("username"));
				//+++++++++++++
				}
				printStream.println(sh.toString()); 
				printStream.close();
		}catch(FileNotFoundException e){
			e.printStackTrace();
		}
		return sh;
	}
	public StringBuilder browseExam(String teacherid) throws SQLException, ParseException {
		ExamDao dao=new ExamDao();
		ArrayList<Exam> exams = new ArrayList<Exam>();
		exams=dao.getByUserId(teacherid);
		StringBuilder sh = new StringBuilder();
		try{
				PrintStream printStream = new PrintStream(new FileOutputStream("?.jsp"));
				for(int j=0;j<exams.size();j++) {
				//+++++++++++++	
					sh.append(exams.get(j).getExamId());
					sh.append(exams.get(j).getTitle());
					sh.append(exams.get(j).getScore());
					sh.append(exams.get(j).getTime());
					sh.append(exams.get(j).getUserId());
					sh.append(session.getAttribute("username"));
				//+++++++++++++	
				}
				printStream.println(sh.toString()); 
				printStream.close();
		}catch(FileNotFoundException e){
			e.printStackTrace();
		}
		return sh;
	}
}
