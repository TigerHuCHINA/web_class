package com.dao;

import com.comm.BaseDao;
import com.pojo.User;

public class UserCountDao extends BaseDao {
	public int doCount(User u,User u0) {
		String sql="update user set view=view+1 where idname=? and \r\n" + 
				"time_to_sec(now())-(select max(time_to_sec(daytime)) as d1 from userrecord where visiting=? and visited=?)>300;";
		Object[] obs= {u0.getUid(),u.getUid(),u0.getUid()};
	
		int row = executeUpdate(sql,obs);
		free();
		return row;
	}
	//u为访问者，u0为被访问者
	public int doRecord(User u,User u0) {
		String sql="insert into userrecord(visiting,visited)values(?,?) ";
		Object[] obs= {u.getUid(),u0.getUid()};
		int row=executeUpdate(sql, obs);
		free();
		return row;
	}
}
