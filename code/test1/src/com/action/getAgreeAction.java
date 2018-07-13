package com.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dao.AgreeDao;
import com.pojo.Agree;

public class getAgreeAction extends HttpServlet {
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException, ServletException {
		
	}
	public ArrayList<Agree> getByUserId(String id)
	{
		AgreeDao dao = new AgreeDao();
		return dao.getByUserId(id);
	}
}
