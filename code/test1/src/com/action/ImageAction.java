package com.action;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ImageDao;

/**
 * Servlet implementation class ImageAction
 */
@WebServlet("/ImageAction")
public class ImageAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImageAction() {
        super();
        // TODO Auto-generated constructor stub
    }

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
		File file = new File(request.getParameter("file"));
		System.out.println(uid+file.getName());
		ImageDao id=new ImageDao();
		if(id.ImageUpload(uid, file)) {
			request.setAttribute("result", "³É¹¦");
			request.getRequestDispatcher("homePage.jsp").forward(request, response);
		}else {
			request.setAttribute("result", "Ê§°Ü");
			request.getRequestDispatcher("xx.jsp").forward(request, response);
		}
	}

}
