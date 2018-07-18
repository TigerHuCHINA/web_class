package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.comm.BaseDao;
import com.pojo.Answer;
import com.pojo.Exam;
import com.pojo.Question;

public class ExamDao extends BaseDao {
	public int addExam(Exam e) {
		String sql="INSERT INTO exam (title) VALUES (?)";
		Object [] obs= {e.getTitle()};
		int row = executeUpdate(sql, obs);
		free();
		return row;
	}
	public int getExamId(String teacherId) {
		String sql="select max(id) from exam where userId=?";
		Object [] obs= {teacherId};
		int row = executeUpdate(sql, obs);
		free();
		return row;
	}
	public int addQuestion(Question q) {
		String sql="insert into question (examId,content,score,analysis) values (?,?,?,?)";
		Object [] obs= {q.geteId(),q.getqContent(),q.getScore(),q.getqAnalysis()};
		int row = executeUpdate(sql, obs);
		free();
		return row;
	}
	public int getQuestionId(String teacherId,ExamDao ed) {
		String sql="select max(id) from question where examId=?";
		Object [] obs= {ed.getExamId(teacherId)};
		int row = executeUpdate(sql, obs);
		free();
		return row;
	}
	public int addAnswer(Answer a) {
		String sql="insert into answer (questionId,content,score) values (?,?,?)";
		Object [] obs= {a.getqId(),a.getaContent(),a.getaScore()};
		int row = executeUpdate(sql, obs);
		return row;
	}
	public ArrayList<Exam> getByUserId(String userId){
		String sql="select * from exam where userId=?";
		Object obj[] = {userId};
		ResultSet set = executeSelect(sql, obj);
		ArrayList<Exam> exams = new ArrayList<Exam>();
		try {
			while(set.next()) {
				Exam exam = new Exam();
				exam.setExamId(set.getString(1));
				exam.setTitle(set.getString(2));
				exam.setScore(set.getString(3));
				exam.setTime(set.getString(4));
				exam.setUserId(set.getString(5));
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		free();
		return exams;
	}
	public ArrayList<Question> getByExamId(String examId){
		String sql="select * from question where examId=?";
		Object obj[] = {examId};
		ResultSet set = executeSelect(sql, obj);
		ArrayList<Question> questions = new ArrayList<Question>();
		try {
			while(set.next()) {
				Question question = new Question();
				question.setqId(set.getString(1));
				question.setExamId(set.getString(2));
				question.setqContent(set.getString(3));
				question.setqScore(set.getString(4));
				question.setqAnalysis(set.getString(5));
				question.setEmpty(set.getString(6));
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		free();
		return questions;
	}
	public ArrayList<Answer> getByQId(String qId){
		String sql="select * from answer where questionId=?";
		Object obj[] = {qId};
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
	public String getCurrentEid(String userid)
	{
		String sql = "select max(id) from exam where userId = ?";
		Object obs[] = {userid};
		ResultSet set = executeSelect(sql, obs);
		String eid = "";
		try {
			if(set.next())
			{
				eid = set.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		free();
		return eid;
	}
	public String getCurrentQid(String eid)
	{
		String sql = "select max(id) from exam where examId = ?";
		Object obs[] = {eid};
		ResultSet set = executeSelect(sql, obs);
		String qid = "";
		try {
			if(set.next())
			{
				qid = set.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		free();
		return qid;
	}
}
