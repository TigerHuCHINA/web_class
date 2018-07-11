package com.dao;

import com.comm.BaseDao;
import com.pojo.Message;

public class MessageDao extends BaseDao {
	public boolean sendMessage(Message m)
	{
		String sql = "insert into message (passId,acceptId,content) values (?,?,?)";
		Object obs[] = {m.getPasssId(),m.getAcceptId(),m.getContent()};
		if(executeUpdate(sql, obs)==1)
		{
			free();
			return true;
		}
		else {
			free();
			return false;
		}
	}
}
