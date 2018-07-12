package com.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserCountDao;
import com.pojo.User;

public class UserCountAction extends HttpServlet {
	UserCountDao dao = new UserCountDao();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException{
	}
	public void doo(String id1,String id2) throws UnsupportedEncodingException {
		String id = id1;
		String id0 = id2;
		User u = new User();
		User u0= new User();
		u.setUid(id);
		u0.setUid(id0);
		dao.doCount(u,u0);
		dao.doRecord(u,u0);
	}
}
