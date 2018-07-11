package com.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Logout extends HttpServlet {
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("yes");
		HttpSession session = req.getSession();
		System.out.println(session.getAttribute("userid"));
		session.removeAttribute("userid");
		session.removeAttribute("username");
		System.out.println(session.getAttribute("userid"));
		resp.sendRedirect("home.jsp");
	}
}
