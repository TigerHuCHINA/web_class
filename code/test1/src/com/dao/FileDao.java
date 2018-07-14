package com.dao;
import java.io.*;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;

/*import org.bytedeco.javacv.FFmpegFrameGrabber; 
import org.bytedeco.javacv.Frame;
import org.bytedeco.javacv.FrameGrabber.Exception;
import org.bytedeco.javacv.Java2DFrameConverter;*/
import com.comm.BaseDao;
import com.pojo.*;
public class FileDao extends BaseDao {
	public  boolean Upload(Video v) {
		String sql="INSERT INTO `schoolol`.`video` (`userid`,`title`,`introduce`,`view`,`file`,`duration`) VALUES (?,?,?,0,?,?)";
		Object [] obs= {v.getUserId(),v.getTitle(),v.getIntroduce(),v.getFile(),v.getDuration()};
		if(executeUpdate(sql, obs)>=1) {
			free();
			return true;
		}else {
			free();
			return false;
		}
	}
	public String getPath(String filepath,String id,String folder) throws IOException {
		String tarPath = null;
		if(folder=="cover") {
			tarPath="cover";
		}else if(folder=="headphoto") {
			tarPath="picture";
		}else if(folder=="video") {
			tarPath="video";
		}
		File file=new File(filepath);
		String fileName=file.getName();
		String format=fileName.substring(fileName.lastIndexOf(".") + 1);
		FileInputStream f=new FileInputStream(file);
		FileOutputStream out=null;
		byte[] bs = new byte[1024];
		int len;
		File tempFile = new File(tarPath);
		if (!tempFile.exists()) {
            tempFile.mkdirs();
        }
		tarPath=tarPath+"/"+id+"."+format;
		System.out.println("tarPath:"+tarPath);
		out = new FileOutputStream(tarPath);
		 while ((len = f.read(bs)) != -1) {
             out.write(bs, 0, len);
         }
		 try {
             out.close();
             f.close();
         } catch (IOException e) {
             e.printStackTrace();
         }
		
		return tarPath;
	}
	
	
	
	
	
	
	
}
