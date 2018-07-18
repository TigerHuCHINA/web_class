<%@page import="com.action.Create"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教师---试卷</title>
</head>
<body>
<% 
String eid = request.getParameter("id");
Create create = new Create();
StringBuilder s = create.createTeacherQuestion(eid);
out.println(s);
%>
<input type="button" value="确认" onclick="editQ.jsp">
</body>
</html>