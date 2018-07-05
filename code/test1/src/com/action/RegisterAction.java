package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.spi.SyncFactoryException;

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
		HttpSession session = req.getSession();
	    String name = req.getParameter("username");
	   name = new String(name.getBytes("iso-8859-1"),"utf-8");
	   String id = req.getParameter("userid");
	   String pwd= req.getParameter("password");
	   
	   User u = new User();
	   u.setUname(name);
	   u.setUpwd(pwd);
	   u.setUid(id);

	   if(dao.testRepeat(u.getUid())!=0)
	   {
		   session.setAttribute("register", "用户名已存在！");
	   }
	   else {
		   dao.doRegister(u);
		   session.setAttribute("register", "Hello, " + u.getUname());
	   }
	   dao.free();
	   resp.sendRedirect("index_detail.jsp");
}
}
