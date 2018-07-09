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
//从表单获取各项信息的内容字段-季宇恒
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		String id = req.getParameter("userid");
		String name = req.getParameter("name");
		String sex = req.getParameter("sex");
		String province = req.getParameter("province");
		String city = req.getParameter("city");
		String birthday = req.getParameter("birthday");
		String school = req.getParameter("school");
		String profession = req.getParameter("profession");
		String introduce = req.getParameter("introduce");
		UserEdit u = new UserEdit();
		u.setUid("11");
		u.setUname(name);		   
		u.setUsex(sex);
		u.setUprovince(province);
		u.setUcity(city);
		u.setUbirthday(birthday);
		u.setUschool(school);
		u.setUprofession(profession);
		u.setUintroduce(introduce);
		dao.doEdit(u);
			session.setAttribute("","修改成功！");
		dao.free();
		resp.sendRedirect("homePage.jsp");
	}
}