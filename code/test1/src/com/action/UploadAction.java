package com.action;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import com.dao.FileDao;
import com.pojo.Video;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.io.*;
import java.text.SimpleDateFormat;
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
		String temp=null;
		FileDao fd=new FileDao();
		SimpleDateFormat df = new SimpleDateFormat("ss");
		Map<String,String> resultMap = new HashMap<String,String>();
		Video v=new Video();
		String uid = (String) session.getAttribute("userid");
		String savePath = this.getServletContext().getRealPath("");
		File file = new File(savePath);
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
				if(item.isFormField()){//fliter,title,info
					String name = item.getFieldName();
					String value = item.getString("UTF-8");
					resultMap.put(name, value);
					v.setTitle(resultMap.get("title"));
					v.setIntroduce(resultMap.get("info"));
				}else{
					String filename = item.getName();
					if(filename==null || filename.trim().equals("")){
						continue;
					}
			        String now=df.format(new java.util.Date());
					filename = filename.substring(filename.lastIndexOf("\\")+1);
					String extName = filename.substring(filename.lastIndexOf(".")+1);
					String name=uid+now+"."+extName;
					if(extName.equals("mp4")||extName.equals("audio")) {
						savePath=this.getServletContext().getRealPath("")+"video/";
						v.setFile(name);
						temp=name;
					}else {
						savePath=this.getServletContext().getRealPath("")+"cover/";
						v.setCover(name);
					}
					InputStream in = item.getInputStream();
					FileOutputStream out = new FileOutputStream(savePath + name);
					byte buffer[] = new byte[1024];
					int len = 0;
					while((len=in.read(buffer))>0){
						out.write(buffer, 0, len);
					}
					if(temp!=null) {
					File f = new File(this.getServletContext().getRealPath("")+"video/"+temp);
					v.setDuration(f);
					}
					in.close();
					out.close();
					item.delete();
					message = "文件上传成功！"+savePath;
				}
			}//end for
			v.setUserId(uid);
			fd.Upload(v);
			/*System.out.println("title:"+resultMap.get("title"));
			System.out.println("intro:"+resultMap.get("info"));
			System.out.println("uid:"+uid);
			System.out.println("file:"+v.getFile());
			System.out.println("cover:"+v.getCover());
			System.out.println("duration:"+v.getDuration());*/
		}catch (Exception e) {
			message= "文件上传失败！";		
			e.printStackTrace();
		}
		request.setAttribute("result",message);	
		response.sendRedirect("success.jsp");
		/*FileDao bd=new FileDao();
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
		}*/
	}

}
