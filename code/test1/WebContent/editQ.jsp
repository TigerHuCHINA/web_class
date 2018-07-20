<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@page import="com.action.Create"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑试卷</title>
<link href="css/bootstrap-3.1.1.min.css" rel='stylesheet' type='text/css'>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body>
<h1 align="center">编辑试卷</h1>

<form action="doPublish" method="post">
<input type= "hidden" id="exam" name="exam">
<input name="min" id="txt1" type="text" placeholder="请输入截止时间（多少分钟）">
  <table id="myTable" width="500">
<% 
Create create = new Create();
StringBuilder s = create.createExam((String)request.getSession().getAttribute("userid"));
out.println(s);
%>
  </table>	
</form>  
<input type="button" value="添加" onclick="window.location='query.jsp'">

<script>

</script>
</body>
</html>