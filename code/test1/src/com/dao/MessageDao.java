package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
	public ArrayList<Message> getByUserId(String acceptId)
	{
		String sql = "select * from message where acceptId = ?";
		Object obj[] = {acceptId};
		ResultSet set = executeSelect(sql, obj);
		ArrayList<Message> messages = new ArrayList<Message>();
		try {
			while(set.next()) {
				Message message = new Message();
				message.setPasssId(set.getString(2));
				message.setAcceptId(set.getString(3));
				message.setContent(set.getString(4));
				message.setTime(set.getString(5));
				message.setUname(set.getString(6));
				messages.add(message);
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		free();
		return messages;
	}
}
