<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.action.Create"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>成绩</title>
</head>
<body>
<% 
String eid = request.getParameter("id");
String userId = (String)request.getSession().getAttribute("userid");
Create create = new Create();
StringBuilder s = create.createResult(userId,eid);
out.println(s);
%>
</body>
</html>