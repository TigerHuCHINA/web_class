<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.dao.UserDao" %>
<%@page import="com.pojo.User" %>
<%@page import="com.action.Create" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
String ownerid = (String)request.getSession().getAttribute("ownerid");
UserDao ud=new UserDao();
User u=ud.dologin(ownerid);
String owmername = u.getUname();
%>
<title><%=owmername + "（" + ownerid + "）" %>老师的试卷</title>
</head>
<body>
  <table id="myTable" width="500">
<% 
Create create = new Create();
StringBuilder s = create.createExam(ownerid);
out.println(s);
%>
  </table>	
</body>
</html>