<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.action.Create"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生成绩</title>
</head>

<body>
<table width="300" id="table1" name="table1">
<% 
String eid = request.getParameter("id");
Create create = new Create();
StringBuilder s = create.createExamResults(eid);
out.println(s);
%>
</table>
<input type="button" value="确认" onclick="window.location='editQ.jsp'">	
	
</body>
</html>