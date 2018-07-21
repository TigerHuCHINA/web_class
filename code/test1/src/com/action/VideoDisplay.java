package com.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.VideoDao;
import com.pojo.UserEdit;
import com.pojo.Video;

/**
 * Servlet implementation class VideoDisplay
 */
//显示视频-阿依多斯
public class VideoDisplay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VideoDisplay() {
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
	//显示视频-阿依多斯
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path=this.getServletContext().getRealPath("");
		HttpSession session = request.getSession();
		String vid = (String)session.getAttribute("vid");
		VideoDao v = new VideoDao();
		Video video = null;
		try {
			video = v.getInfoById(vid);
			File f=new File(path+"/video/"+video.getFile());
			InputStream is =new FileInputStream(f);  
		    OutputStream os = null;
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


