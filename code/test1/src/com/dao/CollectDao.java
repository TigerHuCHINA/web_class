package com.dao;

import com.comm.BaseDao;

public class CollectDao extends BaseDao {
public boolean collect(String UserId,String VideoId) {
	String sql="INSERT INTO `schoolol`.`collection` (`userId`,`videoId`) VALUES (?,?)";
	Object [] obs= {UserId,11};
	if(executeUpdate(sql, obs)>=1) {
		free();
		return true;
	}else {
		free();
		return false;
	}
}
}
