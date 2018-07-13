package com.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import org.bytedeco.javacv.FrameGrabber.Exception;

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
		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("userid");
		String title = request.getParameter("title");
		title = new String(title.getBytes("iso-8859-1"),"utf-8");
		String introduce = request.getParameter("info");
		introduce = new String(introduce.getBytes("iso-8859-1"),"utf-8");
		String file = request.getParameter("file");
		file = new String(file.getBytes("iso-8859-1"),"utf-8");
		File f = new File(file);
		
		Video v=new Video();
		v.setUserId(uid);
		v.setTitle(title);
		v.setIntroduce(request.getParameter(introduce));
		v.setFile(f);
		v.setDuration(f);
		
		FileDao bd=new FileDao();
		if(bd.Upload(v)) {
			request.setAttribute("result", "成功");
			request.getRequestDispatcher("success.jsp").forward(request, response);
		}else {
			request.setAttribute("result", "失败");
			request.getRequestDispatcher("upload.jsp").forward(request, response);
		}
	}

}
