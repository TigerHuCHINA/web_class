package com.dao;
import java.io.*;

import com.comm.BaseDao;
import com.pojo.*;
public class FileDao extends BaseDao {
	public  boolean Upload(Video v) {
		String sql="INSERT INTO `schoolol`.`video` (`userid`,`title`,`introduce`,`view`,`file`) VALUES (?,?,?,0,?)";
		Object [] obs= {v.getUserId(),v.getTitle(),v.getIntroduce(),v.getFile()};
		if(executeUpdate(sql, obs)>=1) {
			free();
			return true;
		}else {
			free();
			return false;
		}
	}
}
