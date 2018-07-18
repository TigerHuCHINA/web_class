package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.action.Create;
import com.comm.BaseDao;
import com.pojo.Answer;
import com.pojo.Comment;
import com.pojo.Exam;
import com.pojo.Question;

public class ExamDao extends BaseDao {
	public int addExam(String teacherId,Exam e) {
		String sql="INSERT INTO exam (title, userId) VALUES (?, ?)";
		Object [] obs= {e.getTitle(),teacherId};
		int row = executeUpdate(sql, obs);
		free();
		return row;
	}
	public int getExamId(String teacherId) {
		String sql="select max(id) from exam where userId=?";
		Object [] obs= {teacherId};
		int row = executeUpdate(sql, obs);
		return row;
	}
	/*public int addQuestion(String teacherId,ExamDao ed) {
		String sql="insert into question (examId) values (?)";
		Object [] obs= {ed.getExamId(teacherId)};
		int row = executeUpdate(sql, obs);
		free();
		return row;
	}
	public int fillQuestion() {
		String sql="";
	}*/
	public int addQuestion(String qId/*=ed.getExamId(teacherId)*/,Question q) {
		String sql="insert into question (examId,content,empty) values (?,?,?)";
		Object [] obs= {qId,q.getqContent(),q.getEmpty()};
		int row = executeUpdate(sql, obs);
		return row;
	}
	public int getQuestionId(String teacherId,ExamDao ed) {
		String sql="select max(id) from question where examId=?";
		Object [] obs= {ed.getExamId(teacherId)};
		int row = executeUpdate(sql, obs);
		return row;
	}
	public int addAnswer(String aId,Answer a) {
		String sql="insert into answer (questionId,content,score) values (?,?,?)";
		Object [] obs= {aId,a.getaContent(),a.getaScore()};
		int row = executeUpdate(sql, obs);
		return row;
	}
	public ArrayList<Exam> getByExamId(String examId){
		String sql="select title,time from exam where id=?";
		Object obj[] = {examId};
		ResultSet set = executeSelect(sql, obj);
		ArrayList<Exam> exams = new ArrayList<Exam>();
		try {
			while(set.next()) {
				Exam exam = new Exam();
				exam.setTitle(set.getString(1));
				exam.setTime(set.getString(2));
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		free();
		return exams;
	}
	public ArrayList<Question> getByQId(String qId){
		String sql="select * from question where id=?";
		Object obj[] = {qId};
		ResultSet set = executeSelect(sql, obj);
		ArrayList<Question> questions = new ArrayList<Question>();
		try {
			while(set.next()) {
				Question question = new Question();
				question.setqId(set.getString(1));
				question.setqContent(set.getString(3));
				question.setEmpty(set.getString(4));
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		free();
		return questions;
	}
	public ArrayList<Answer> getByAId(String aId){
		String sql="select * from question where id=?";
		Object obj[] = {aId};
		ResultSet set = executeSelect(sql, obj);
		ArrayList<Answer> answers = new ArrayList<Answer>();
		try {
			while(set.next()) {
				Answer answer = new Answer();
				answer.setaId(set.getString(1));
				answer.setaContent(set.getString(3));
				answer.setaScore(set.getString(4));
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		free();
		return answers;
	}
}
