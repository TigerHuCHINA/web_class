package com.action;

import com.dao.UserEditDao;
import com.pojo.UserEdit;

//��ȡ�ض��û���������Ϣ-���
public class getInfo {
	public UserEdit getInfoById(String id)
	{
		UserEditDao userEditDao = new UserEditDao();
		return userEditDao.getInfoById(id);
	}
}
