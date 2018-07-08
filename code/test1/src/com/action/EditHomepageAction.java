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
	   String id = req.getParameter("userid");//id不能改!
	   //String pwd= req.getParameter("password");
	   String name = req.getParameter("username");
	   name = new String(name.getBytes("iso-8859-1"),"utf-8");
//	   String pwd_= req.getParameter("password2");
	   String sex = req.getParameter("usersex");
	   sex = new String(sex.getBytes("iso-8859-1"),"utf-8");
	   //输入图片地址，再另写上传方法？	   
	   String headphoto = req.getParameter("userheadphoto");
	   headphoto = new String(id.getBytes("iso-8859-1"),"utf-8");
//	   String birthday = req.getParameter("userbirthday");
//	   birthday = new String(id.getBytes("iso-8859-1"),"utf-8");
	   Integer year = Integer.valueOf(req.getParameter("year"));
	   Integer month = Integer.valueOf(req.getParameter("month"));
	   Integer day = Integer.valueOf(req.getParameter("day"));
	   String school = req.getParameter("userschool");
	   school = new String(id.getBytes("iso-8859-1"),"utf-8");
	   String profession = req.getParameter("userprofession");
	   profession = new String(id.getBytes("iso-8859-1"),"utf-8");
	   String introduce = req.getParameter("userintroduce");
	   introduce = new String(id.getBytes("iso-8859-1"),"utf-8");

	   UserEdit u = dao.doEdit(id);
//	   if(!pwd.equals(pwd_)) System.out.println("两次密码不同");
//	   if(pwd!=null) {
	//	   u.setUpwd(pwd);
//	   }
	   u.setUid(id);//
	   if(name!=null) {
		   u.setUname(name);		   
	   }
	   if(sex!="男"&&sex!="女"&&sex!=null) {
		   u.setUsex(sex);
	   }else {
		   req.setAttribute("error", "你确定有这个性别？");
	   };
	   u.setUheadphoto(headphoto);
	   u.setUbirthday(year,month,day);
	   u.setUschool(school);
	   u.setUprofession(profession);
	   u.setUintroduce(introduce);
	   dao.free();
	   resp.sendRedirect("index_detail.jsp");
	}
}
