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
		String birthday = req.getParameter("birthday");
		String school = req.getParameter("school");
		String profession = req.getParameter("profession");
		String introduce = req.getParameter("introduce");

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
		resp.sendRedirect("homePage.jsp");
	}
}
//ºæ”Ó∫„