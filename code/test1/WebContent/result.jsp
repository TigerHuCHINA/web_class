<!--  邓慧颖  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.action.Create"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/button.css" rel='stylesheet' type='text/css'>
<link href="css/header.css" rel='stylesheet' type='text/css'>
<link href="css/result.css" rel='stylesheet' type='text/css'>

<title>成绩</title>
</head>
<body>
<!-- 顶部菜单 -->
<div class="header">

    <a class="head1" href="home.jsp">主界面</a>

    <a class="head2" style="cursor:default;"><img src="ImageDisplay?id=user" width="75px" height="75px"></a>
        
    <a class="head3" style="cursor:default;"><%=request.getSession().getAttribute("username") %></a>

    <a class="head4" href = "javascript:void(0)" onclick = "document.getElementById('light1').style.display='block';document.getElementById('fade').style.display='block'">反馈</a>


</div>
<div class="content">

<% 
String eid = request.getParameter("id");
String userId = (String)request.getSession().getAttribute("userid");
Create create = new Create();
StringBuilder s = create.createResult(userId,eid);
out.println(s);
%>
</div>
</body>
</html>