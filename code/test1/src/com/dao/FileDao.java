package com.dao;
import java.io.*;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO; 
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
	/*public static void FetchFrame(String path) throws Exception, IOException {
		Frame frame=null;
		int flag=0;
		FFmpegFrameGrabber fFmpegFrameGrabber = new FFmpegFrameGrabber(path);
		
			fFmpegFrameGrabber.start();
			int length = fFmpegFrameGrabber.getLengthInFrames();
			while (flag <= length) {
                String fileName ="C://Users/acer/Desktop/" + String.valueOf(flag) + ".jpg";
                //文件储存对象
                File outPut = new File(fileName);
                //获取帧
                frame = fFmpegFrameGrabber.grabImage();
                if (frame != null) {
                    ImageIO.write(FrameToBufferedImage(frame), "jpg", outPut);
                }
                flag++;
		}
			fFmpegFrameGrabber.stop();
	
}
	public static BufferedImage FrameToBufferedImage(Frame frame) {
        //创建BufferedImage对象
        Java2DFrameConverter converter = new Java2DFrameConverter();
        BufferedImage bufferedImage = converter.getBufferedImage(frame);
        return bufferedImage;
    }	*/
	
	
	
	
	
	
	
}
