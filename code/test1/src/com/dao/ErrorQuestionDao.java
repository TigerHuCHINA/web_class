package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.comm.BaseDao;
import com.pojo.ErrorQuestion;

public class ErrorQuestionDao extends BaseDao {
	public int addQuestion(ErrorQuestion errorQuestion)
	{
		String sql = "insert into errorQuestion (questionId,examId,userId,yourAnswer) values (?,?,?,?)";
		Object obs[] = {errorQuestion.getQuestionId(),errorQuestion.getExamId(),errorQuestion.getUserId(),errorQuestion.getYourAnswer()};
		
		int row = executeUpdate(sql, obs);
		free();
		return row;
	}
	public ArrayList<ErrorQuestion> getByUserIdAndExamId(String userId, String examId)
	{
		String sql = "select * from errorQuestion where userId = ? and examId = ?";
		Object obs[] = {userId,examId};
		ResultSet set = executeSelect(sql, obs);
		ArrayList<ErrorQuestion> errorQuestions = new  ArrayList<ErrorQuestion>();
		try {
			while(set.next()) {
				ErrorQuestion errorQuestion = new ErrorQuestion();
				errorQuestion.setQuestionId(set.getString("questionId"));
				errorQuestion.setYourAnswer(set.getString("yourAnswer"));
				errorQuestions.add(errorQuestion);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		free();
		return errorQuestions;
	}
}
