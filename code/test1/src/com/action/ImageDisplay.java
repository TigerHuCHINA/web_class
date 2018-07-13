package com.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pojo.UserEdit;

/**
 * Servlet implementation class ImageDisplay
 */
public class ImageDisplay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImageDisplay() {
        super();
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
		getInfo get = new getInfo();
		HttpSession session = request.getSession();
		String ownername = request.getParameter("id");
		String name = (String)session.getAttribute("userid");
		
		if(ownername!=null) {
		UserEdit u = get.getInfoById(ownername);
		File f=new File(u.getUheadphoto());
		InputStream is = new FileInputStream(f);  
	    OutputStream os = null;
	    response.setContentType("image/jpeg");
	    os = response.getOutputStream();
	    int num;  
	    byte buf[] = new byte[1024]; 
	    while(   (num=is.read(buf))!=-1   ){  
	        os.write(buf, 0, num);  
	    } 
	    os.flush();  
	    is.close();  
	    os.close(); 
		}
		
		if(name!=null) {
			UserEdit u = get.getInfoById(name);
			File f=new File(u.getUheadphoto());
			InputStream is = new FileInputStream(f);  
		    OutputStream os = null;
		    response.setContentType("image/jpeg");
		    os = response.getOutputStream();
		    int num;  
		    byte buf[] = new byte[1024]; 
		    while(   (num=is.read(buf))!=-1   ){  
		        os.write(buf, 0, num);  
		    } 
		    os.flush();  
		    is.close();  
		    os.close(); 
	    

	    
	    
	}
	}
}


