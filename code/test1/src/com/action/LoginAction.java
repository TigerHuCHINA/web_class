package com.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.pojo.User;

import com.dao.UserDao;

public class LoginAction extends HttpServlet {
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
    String id = req.getParameter("userid");
   String pwd= req.getParameter("password");
   User u = dao.dologin(id);
   if(u==null)
   {
	   session.setAttribute("error", "用户名或密码错误！");
   }
   else {
	   if(!u.getUpwd().equals(pwd))
	   {
		   session.setAttribute("error", "用户名或密码错误！");
	   }
	   else
	   {
		   session.setAttribute("login", u.getUid());
	   }
   }
   dao.free();
   resp.sendRedirect("index_detail.jsp");
}
}
