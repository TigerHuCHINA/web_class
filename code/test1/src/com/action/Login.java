package com.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet{
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		Cookie[] cookies = req.getCookies();
		String name = new String();
		String id = new String();
		for(Cookie cookie : cookies){
		    if(cookie.getName() == "username")
		    {
		    	name = cookie.getValue();
		    }
		    else if(cookie.getName() == "userid")
		    {
		    	id = cookie.getValue();
		    }
		}
		Cookie userIdCookie = new Cookie("userid", id);
		Cookie userNameCookie = new Cookie("username", name);
		userIdCookie.setMaxAge(60*60*24*7);
		userNameCookie.setMaxAge(60*60*24*7);
		resp.addCookie(userIdCookie);
		resp.addCookie(userNameCookie);
		session.setAttribute("userid",id);
		session.setAttribute("username",name);
		req.getRequestDispatcher("home.jsp").forward(req, resp);
	}
}