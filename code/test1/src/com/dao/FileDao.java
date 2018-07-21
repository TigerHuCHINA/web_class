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
		String sql="INSERT INTO `schoolol`.`video` (`userid`,`title`,`introduce`,`view`,`file`,`duration`,`cover`) VALUES (?,?,?,0,?,?,?)";
		Object [] obs= {v.getUserId(),v.getTitle(),v.getIntroduce(),v.getFile(),v.getDuration(),v.getCover()};
		if(executeUpdate(sql, obs)>=1) {
			free();
			return true;
		}else {
			free();
			return false;
		}
	}	
}
