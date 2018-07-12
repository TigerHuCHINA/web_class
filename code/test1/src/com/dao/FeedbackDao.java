package com.dao;

import com.comm.BaseDao;
import com.pojo.Feedback;

public class FeedbackDao extends BaseDao {
	public boolean feedbackCommit(Feedback feedback)
	{
		String sql = "INSERT INTO feedback (`userid`, `content`) VALUES (?, ?)";
		Object obs[] = {feedback.getUserid(),feedback.getContent()};
		if(executeUpdate(sql, obs)>=1) {
			free();
			return true;
		}else {
			free();
			return false;
		}
	}
	
}
