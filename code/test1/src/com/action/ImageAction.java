package com.action;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.FileDao;
import com.dao.ImageDao;
import com.pojo.Date;

/**
 * Servlet implementation class ImageAction
 */
@WebServlet("/ImageAction")
public class ImageAction extends HttpServlet {
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("userid");
		
		String file = request.getParameter("file");
		file = new String(file.getBytes("iso-8859-1"),"utf-8");
		
		FileDao fd=new FileDao();
		SimpleDateFormat df = new SimpleDateFormat("ss");
        String now=df.format(new java.util.Date());
		String tarPath=fd.getPath(file,uid+now,"headphoto");
		ImageDao id=new ImageDao();
		if(id.ImageUpload(uid, tarPath)) {
			request.setAttribute("result", "³É¹¦");
			request.getRequestDispatcher("homePage.jsp").forward(request, response);
		}else {
			request.setAttribute("result", "Ê§°Ü");
			request.getRequestDispatcher("xx.jsp").forward(request, response);
		}
	}

}
