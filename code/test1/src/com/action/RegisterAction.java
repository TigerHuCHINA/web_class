package com.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pojo.User;

import javafx.scene.control.Alert;

import com.dao.UserDao;

public class RegisterAction extends HttpServlet {
	UserDao dao = new UserDao();
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
	    String name = req.getParameter("username");
	   name = new String(name.getBytes("iso-8859-1"),"utf-8");
	   String id = req.getParameter("userid");
	   String pwd= req.getParameter("password");
	   String pwd_= req.getParameter("password2");

	   if(!pwd.equals(pwd_))
	   {
		   req.setAttribute("message", "两次密码输入不同");
		   resp.sendRedirect("index_detail.jsp");
	   }
	   User u = new User();
	   u.setUname(name);
	   u.setUpwd(pwd);
	   u.setUid(id);

	   dao.doRegister(u);
	
}
}
