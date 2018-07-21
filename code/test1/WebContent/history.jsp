<%@page import="com.pojo.UserEdit"%>
<%@page import="com.action.getInfo"%>
<%@page import="com.action.Create"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<link href="css/header.css" rel='stylesheet' type='text/css'>
<link href="css/video.css" rel='stylesheet' type='text/css'>
<link href="css/history.css" rel='stylesheet' type='text/css'>

<title>观看历史</title>
</head>
<body>
<!-- 顶部菜单 -->
<div class="header">


    <a class="head1" href="home.jsp">主界面</a>

    <a class="head2" href="homePage.jsp"><img src="ImageDisplay?id=user" width="100%" height="100%"></a>
        
    <a class="head3">尊敬的<%=request.getSession().getAttribute("username") %>欢迎光临</a>

    <a class="head4" href = "javascript:void(0)" onclick = "document.getElementById('light1').style.display='block';document.getElementById('fade').style.display='block'">反馈</a>


</div>

<h1 style="position:absolute;top:100px;width:100%;text-align:center;">我的观看记录</h1>
<div style="position:relative;left:100px;top:50px;">
<%
Create cv=new Create();
StringBuilder s=cv.createHistory((String)request.getSession().getAttribute("userid"));
out.println(s);
%>
</div>
</body>
</html>





























