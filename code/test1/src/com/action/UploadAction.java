package com.action;

import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.comm.*;
import com.dao.FileDao;

import java.io.*;
import com.pojo.*;
/**
 * Servlet implementation class UploadAction
 */
//上传视频到数据库-阿依多斯
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
		FileDao bd=new FileDao();
		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("userid");
		String title = request.getParameter("title");
		title = new String(title.getBytes("iso-8859-1"),"utf-8");
		String introduce = request.getParameter("info");
		introduce = new String(introduce.getBytes("iso-8859-1"),"utf-8");
		
		String file = request.getParameter("file");//视频上传
		file = new String(file.getBytes("iso-8859-1"),"utf-8");
		File f = new File(file);
		SimpleDateFormat df = new SimpleDateFormat("ss");
        String now=df.format(new java.util.Date());
		String tarPath=bd.getPath(file,uid+now,"video");

		
		String cover =request.getParameter("file2");//封面上传
		cover=new String(cover.getBytes("iso-8859-1"),"utf-8");
		String tarPath2=bd.getPath(cover,uid+now,"picture");

		
		Video v=new Video();
		v.setUserId(uid);
		v.setTitle(title);
		v.setIntroduce(introduce);
		v.setFile(tarPath);
		v.setDuration(f);
		v.setCover(tarPath2);
		if(bd.Upload(v)) {
			request.setAttribute("result", "成功");
			request.getRequestDispatcher("success.jsp").forward(request, response);
		}else {
			request.setAttribute("result", "失败");
			request.getRequestDispatcher("xx.jsp").forward(request, response);
		}
	}

}
