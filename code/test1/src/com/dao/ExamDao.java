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
		String sql="INSERT INTO exam (title,userId) VALUES (?,?)";
		Object [] obs= {e.getTitle(),e.getUserId()};

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
		Object [] obs= {q.geteId(),q.getqContent(),q.getqScore(),q.getqAnalysis()};
		int row = executeUpdate(sql, obs);
		free();
		return row;
	}
	public int getQuestionId(String examId) {
		String sql="select max(id) from question where examId=?";
		Object [] obs= {examId};
		int row = executeUpdate(sql, obs);
		free();
		return row;
	}
	public int addAnswer(Answer a) {//δfree
		String sql="insert into answer (questionId,content) values (?,?)";
		Object [] obs= {a.getqId(),a.getaContent()};
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
				exams.add(exam);
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		free();
		return exams;
	}
	
	public ArrayList<Exam> getByUserIdXTime(String userId){
		String sql="select * from exam where userId=? and time_to_sec(now())-time_to_sec(time)>0 ";
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
	
	public ArrayList<Exam> getByUserIdXTime2(String userId){
		String sql="select * from exam where userId=? and now()-time<0"; 
		//String sql="select * from exam where userId=? and time_to_sec(now())-time_to_sec(time)>0"; 
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
				exams.add(exam);
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		free();
		return exams;
	}
	
	public ArrayList<Exam> getByUserIdXTime3(String userId){
		String sql="select * from exam left join follow on exam.userId=follow.followerId where follow.followeeId=? and TIMESTAMPDIFF(second,now(),exam.time)>0 order by exam.time desc;";
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
				exams.add(exam);
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
				question.seteId(set.getString(2));
				question.setqContent(set.getString(3));
				question.setqScore(set.getString(4));
				question.setqAnalysis(set.getString(5));
				question.setEmpty(set.getString(6));
				questions.add(question);
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		free();
		return questions;
	}
	public ArrayList<Answer> getByQId(String qId){//δfree
		String sql="select * from answer where questionId=?";
		Object obj[] = {qId};
		ResultSet set = executeSelect(sql, obj);
		ArrayList<Answer> answers = new ArrayList<Answer>();
		try {
			while(set.next()) {
				Answer answer = new Answer();
				answer.setaId(set.getString(1));
				answer.setqId(set.getString(2));
				answer.setaContent(set.getString(3));
				answers.add(answer);
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
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
		String sql = "select max(id) from question where examId = ?";
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
	public Exam getExamById(String id)
	{
		String sql = "select * from exam where id = ?";
		Object obs[] = {id};
		ResultSet set = executeSelect(sql, obs);
		Exam exam = new Exam();
		try {
			if(set.next())
			{
				exam.setExamId(set.getString(1));
				exam.setTitle(set.getString(2));
				exam.setScore(set.getString(3));
				exam.setTime(set.getString(4));
				exam.setUserId(set.getString(5));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		free();
		return exam;
	}
	public Question getQuestionById(String id)//δfree
	{
		String sql = "select id,content,analysis from question where id = ?";
		Object obs[] = {id};
		ResultSet set = executeSelect(sql, obs);
		Question question = new Question();
		try {
			if(set.next())
			{
				question.setqId(set.getString(1));
				question.setqContent(set.getString(2));
				question.setqAnalysis(set.getString(3));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return question;
	}
	public int publish(String id, String min)
	{
		int minute = Integer.valueOf(min);
		int hour_ = minute/60;
		int min_ = minute%60;
		String time = String.valueOf(hour_) + ":" + String.valueOf(min_) + ":00";
		String sql = "update exam set time = date_add(now(),interval ? hour_second) where id = ?";
		Object obs[] = {time,id};
		int row = executeUpdate(sql, obs);
		free();
		return row;
	}
	public void delExam(String id) {
		String sql = "delete from exam where id = ?";
		String sql2 = "delete from result where examId = ?";
		String sql3 = "delete from question where examId = ?";
		String sql4 = "delete from errorQuestion where examId = ?";
		Object obs[] = {id};
		executeUpdate(sql4, obs);
		executeUpdate(sql3, obs);
		executeUpdate(sql2, obs);
		executeUpdate(sql, obs);
		free();
	}
	public void delAnswer(String id) {//δfree
		String sql = "delete from answer where questionId = ?";
		Object obs[] = {id};
		executeUpdate(sql, obs);
	}
}
