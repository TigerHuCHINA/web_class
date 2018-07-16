<%@page import="com.pojo.UserEdit"%>
<%@page import="com.action.getInfo"%>
<%@page import="com.action.Create"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%if(request.getSession().getAttribute("userid")==null)response.sendRedirect("home.jsp"); %>
<%if(request.getSession().getAttribute("userid")==null)response.sendRedirect("home.jsp"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="css/header.css" rel='stylesheet' type='text/css'>
<link href="css/video.css" rel='stylesheet' type='text/css'>
<link href="css/searchvideo.css" rel='stylesheet' type='text/css'>

<title>搜索视频</title>	
</head>
<body>
<!-- 顶部菜单 -->
<div class="header">


    <a class="head1" href="home.jsp">主界面</a>

    <a class="head2" href="homePage.jsp"><img src="ImageDisplay?id=user" width="100%" height="100%"></a>
        
    <a class="head3">尊敬的<%=request.getSession().getAttribute("username") %>欢迎光临</a>

    <a class="head4" href = "javascript:void(0)" onclick = "document.getElementById('light1').style.display='block';document.getElementById('fade').style.display='block'">反馈</a>


</div>
<div style="position:relative;top:100px;">
<div >相关视频</div>
<%
Create cv=new Create();
String key = request.getParameter("content");
//key = new String(key.getBytes("iso-8859-1"),"utf-8");
System.out.println(key);
StringBuilder s=cv.createSelectedVideo(key);
out.println(s);
%>

<div>相关用户</div>

<%
StringBuilder s_=cv.createSelectedUser(key);
out.println(s_);
%>




</div>
</body>
</html>