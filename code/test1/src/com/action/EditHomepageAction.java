package com.action;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.PRIVATE_MEMBER;

import com.pojo.User;
import com.pojo.UserEdit;
import com.dao.UserDao;
import com.dao.UserEditDao;

public class EditHomepageAction extends HttpServlet {
	UserEditDao dao = new UserEditDao();
	/*protected void service(HttpServletRequest arg0, HttpServletResponse arg1)
		throws ServletException, IOException {
	// TODO Auto-generated method stub
	super.service(arg0, arg1);
}*/
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		String id = req.getParameter("userid");
		String name = req.getParameter("username");
		//name = new String(name.getBytes("iso-8859-1"),"utf-8");
		String sex = req.getParameter("sex");
		//sex = new String(sex.getBytes("iso-8859-1"),"utf-8");
		String birthday = req.getParameter("birthday");

		//birthday = new String(id.getBytes("iso-8859-1"),"utf-8");
		String school = req.getParameter("school");
		//school = new String(id.getBytes("iso-8859-1"),"utf-8");
		String profession = req.getParameter("profession");
		//profession = new String(id.getBytes("iso-8859-1"),"utf-8");
		String introduce = req.getParameter("introduce");
		//introduce = new String(id.getBytes("iso-8859-1"),"utf-8");

		UserEdit u = new UserEdit();

		u.setUid(id);
		u.setUname(name);		   
		u.setUsex(sex);
		u.setUbirthday(birthday);
		u.setUschool(school);
		u.setUprofession(profession);
		u.setUintroduce(introduce);
		dao.doEdit(u);
		dao.free();
		System.out.println("11");
		resp.sendRedirect("modified.jsp");
	}
}
