package com.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
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
		String savePath = this.getServletContext().getRealPath("");
		HttpSession session = request.getSession();
		File file = new File(savePath);
		String uid = (String) session.getAttribute("userid");
		SimpleDateFormat df = new SimpleDateFormat("ss");
		if (!file.exists() && !file.isDirectory()) {
			System.out.println(savePath+"目录不存在，需要创建");
			file.mkdir();
		}
		String message = "";
		try{
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setHeaderEncoding("UTF-8");
			if(!ServletFileUpload.isMultipartContent(request)){
				return;
			}
			List<FileItem> list = upload.parseRequest(request);
			for(FileItem item : list){
			String filename = item.getName();
			if(filename==null || filename.trim().equals("")){
				continue;
			}
			String now=df.format(new java.util.Date());
			filename = filename.substring(filename.lastIndexOf("\\")+1);
			String extName = filename.substring(filename.lastIndexOf(".")+1);
			String name=uid+now+"."+extName;
			InputStream in = item.getInputStream();
			FileOutputStream out = new FileOutputStream(savePath +"/headphoto/"+ name);
			byte buffer[] = new byte[1024];
			int len = 0;
			while((len=in.read(buffer))>0){
				out.write(buffer, 0, len);
			}
			ImageDao id=new ImageDao();
			if(id.ImageUpload(uid, name)) {
				message="成功"+savePath;
			}
			in.close();
			out.close();
			item.delete();
			}//end for
			}
			catch (Exception e) {
				message= "文件上传失败！"+savePath;;	
				e.printStackTrace();
			}
		
		    request.setAttribute("result",message);	
			response.sendRedirect("homePage.jsp");
		
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		/*HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("userid");
		
		String file = request.getParameter("file");
		file = new String(file.getBytes("iso-8859-1"),"utf-8");
		
		FileDao fd=new FileDao();
		SimpleDateFormat df = new SimpleDateFormat("ss");
        String now=df.format(new java.util.Date());
		String tarPath=fd.getPath(file,uid+now,"picture");
		ImageDao id=new ImageDao();
		if(id.ImageUpload(uid, tarPath)) {
			request.setAttribute("result", "成功");
			request.getRequestDispatcher("homePage.jsp").forward(request, response);
		}else {
			request.setAttribute("result", "失败");
			request.getRequestDispatcher("xx.jsp").forward(request, response);
		}*/
	}


