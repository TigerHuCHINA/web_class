package com.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.pojo.UserEdit;
import com.dao.UserEditDao;

public class EditHomepageAction extends HttpServlet {
	UserEditDao dao = new UserEditDao();
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
		String sex = req.getParameter("sex");
<<<<<<< HEAD
=======
		sex = new String(sex.getBytes("iso-8859-1"),"utf-8");
		System.out.println(sex);
		String province = req.getParameter("province");
<<<<<<< HEAD
		province = new String(province.getBytes("iso-8859-1"),"utf-8");
		String city = req.getParameter("city");
		city = new String(city.getBytes("iso-8859-1"),"utf-8");
>>>>>>> parent of 696c366... Revert "个人主页及修改的完善"
		String birthday = req.getParameter("birthday");
		String school = req.getParameter("school");
		String profession = req.getParameter("profession");
		String introduce = req.getParameter("introduce");

=======
		province = new String(name.getBytes("iso-8859-1"),"utf-8");
		String city = req.getParameter("city");
		city = new String(name.getBytes("iso-8859-1"),"utf-8");
		String birthday = req.getParameter("birthday");
		String school = req.getParameter("school");
		school = new String(name.getBytes("iso-8859-1"),"utf-8");
		String profession = req.getParameter("profession");
		profession = new String(name.getBytes("iso-8859-1"),"utf-8");
		String introduce = req.getParameter("introduce");
		introduce = new String(name.getBytes("iso-8859-1"),"utf-8");
>>>>>>> parent of f1cba78... 第一版本结束
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
		resp.sendRedirect("modified.jsp");
	}
}
//�����