package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.comm.BaseDao;
import com.pojo.Follow;
import com.pojo.Result;

public class ResultDao extends BaseDao {
	public int addResult(Result result)
	{
		String sql = "insert into result (userId,examId,score) values (?,?,?)";
		Object obs[] = {result.getUserId(),result.getExamId(),result.getScore()};
		
		int row = executeUpdate(sql, obs);
		free();
		return row;
	}
	public Result getByUserIdAndExamId(String userId, String examId)
	{
		String sql = "select * from result where userId = ? and examId = ? order by time desc";
		Object obs[] = {userId,examId};
		ResultSet set = executeSelect(sql, obs);
		Result result = new Result();
		try {
			if(set.next()) {
				result.setId(set.getString(1));
				result.setUserId(set.getString(2));
				result.setExamId(set.getString(3));
				result.setScore(set.getString(4));
				result.setTime(set.getString(5));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		free();
		return result;
	}
}
