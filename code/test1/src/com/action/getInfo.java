package com.action;

import com.dao.UserEditDao;
import com.pojo.UserEdit;

//获取特定用户的所有信息-杜宇航
public class getInfo {
	public UserEdit getInfoById(String id)
	{
		UserEditDao userEditDao = new UserEditDao();
		return userEditDao.getInfoById(id);
	}
}
