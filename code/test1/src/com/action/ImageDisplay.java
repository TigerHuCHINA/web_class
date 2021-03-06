package com.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.VideoDao;
import com.pojo.UserEdit;
import com.pojo.Video;

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
	//��ʾͼƬ-������˹
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path=this.getServletContext().getRealPath("");
		getInfo get = new getInfo();
		HttpSession session = request.getSession();
		String ownername = (String)session.getAttribute("ownerid");
		String name = (String)session.getAttribute("userid");
		String flag=request.getParameter("id");
		String content = request.getParameter("content");
		if(content!=null)
		{
			UserEdit u = get.getInfoById(content);
			File f=new File(path+"/headphoto/"+u.getUheadphoto());
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
		else if(flag.equals("user"))
		{
			UserEdit u = get.getInfoById(name);
			File f=new File(path+"/headphoto/"+u.getUheadphoto());
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
		else if(flag.equals("owner")) {
			UserEdit u = get.getInfoById(ownername);
			File f=new File(path+"/headphoto/"+u.getUheadphoto());
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
		else if(flag.equals("video")) {
			String number=request.getParameter("number");
			VideoDao vd=new VideoDao();
			try {
				Video v=vd.getInfoById(number);
				File f=new File(path+"/cover/"+v.getCover());
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
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}
}



