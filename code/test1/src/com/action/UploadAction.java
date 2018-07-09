package com.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.comm.*;
import com.dao.FileDao;

import java.io.*;
import com.pojo.*;
/**
 * Servlet implementation class UploadAction
 */

public class UploadAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public UploadAction() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String result;
		Video v=new Video();
		FileDao bd=new FileDao();
		v.setUserId("11");
		v.setTitle(request.getParameter("title"));
		v.setIntroduce(request.getParameter("info"));
		v.setFile(new File(request.getParameter("file")));
		if(bd.Upload(v)) {
			request.setAttribute("result", "³É¹¦");
			request.getRequestDispatcher("success.jsp").forward(request, response);
		}else {
			request.setAttribute("result", "Ê§°Ü");
			request.getRequestDispatcher("upload.jsp").forward(request, response);
		}
	}

}
