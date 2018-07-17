package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.action.Create;
import com.comm.BaseDao;
import com.pojo.Comment;
import com.pojo.Exam;

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
		free();
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
	public int addQuestion(String teacherId,ExamDao ed,Exam e) {
		String sql="insert into question (examId,content,empty) values (?,?,?)";
		Object [] obs= {ed.getExamId(teacherId),e.getqContent(),e.getEmpty()};
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
	public int addAnswer(String teacherId,ExamDao ed,Exam e) {
		String sql="insert into answer (questionId,content,score) values (?,?,?)";
		Object [] obs= {ed.getQuestionId(teacherId, ed),e.getaContent(),e.getaScore()};
		int row = executeUpdate(sql, obs);
		free();
		return row;
	}
	public ArrayList<Exam> getByExamId(String examId){
		String sql="select title,time from exam where Id=?";
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
	public ArrayList<Question> getBy
}
