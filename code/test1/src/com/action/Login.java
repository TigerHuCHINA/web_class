package com.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login {
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		Cookie idCookie = opCookie.getCookieByName(req, "userid");
		Cookie nameCookie = opCookie.getCookieByName(req, "username");
		/*Cookie userIdCookie = new Cookie("userid", id);
		Cookie userNameCookie = new Cookie("username", name);
		userIdCookie.setMaxAge(60*60*24*7);
		userNameCookie.setMaxAge(60*60*24*7);
		resp.addCookie(userIdCookie);
		resp.addCookie(userNameCookie);*/
		opCookie.addCookie(resp, "userid", idCookie.getValue(), 60*60*24*7);
		opCookie.addCookie(resp, "username", idCookie.getValue(), 60*60*24*7);
		session.setAttribute("userid",idCookie.getValue());
		session.setAttribute("username",nameCookie.getValue());
	}
}
