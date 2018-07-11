package com.dao;

import com.comm.BaseDao;
import java.io.*;
public class ImageDao extends BaseDao {
public boolean ImageUpload(String id,File file) {
	String sql="UPDATE `schoolol`.`user` SET `headphoto`=? WHERE `idname`=?";
	Object [] obs= {file,id};
	if(executeUpdate(sql, obs)>=1) {
		free();
		return true;
	}else {
		free();
		return false;
	}
}
}
