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
<h1 style="position:relative;top:80px;">相关视频</h1>
<%
Create cv=new Create();
String key = request.getParameter("content");
StringBuilder s=cv.createSelectedVideo(key);
out.println(s);
%>

<h1>相关用户</h1>

<div class="myinformation">
    <div class="image">
        <img src="ImageDisplay" onclick="hisHome"/>    
    </div>
    <div class="informationbox">
        <div id="username" class="info">
            <tr>
                <td>用户名: </td>
                <td><%//=ownername%></td>
            </tr>
        </div>
    
        <div id="userid" class="info">
            <tr>
                <td>用户账号: </td>
                <td><%//=ownerid%></td>
            </tr>
        </div>
        
        <div id="userfocus" class="info">
            <tr>
                <td>关注量: </td>
                <td><%//=follow %></td>
            </tr>
        </div>
    
        <div id="userread" class="info">
	        <tr>
	            <td>浏览量: </td>
	            <td><%//=view %></td>
	        </tr>
        </div>
           
    </div>
</div>


<div class="myinformation">
    <div class="image">
        <img src="ImageDisplay" onclick="hisHome.jsp"/>    
    </div>
    <div class="informationbox">
        <div id="username" class="info">
            <tr>
                <td>用户名: </td>
                <td><%//=ownername%></td>
            </tr>
        </div>
    
        <div id="userid" class="info">
            <tr>
                <td>用户账号: </td>
                <td><%//=ownerid%></td>
            </tr>
        </div>
        
        <div id="userfocus" class="info">
            <tr>
                <td>关注量: </td>
                <td><%//=follow %></td>
            </tr>
        </div>
    
        <div id="userread" class="info">
	        <tr>
	            <td>浏览量: </td>
	            <td><%//=view %></td>
	        </tr>
        </div>
           
    </div>
</div>




</body>
</html>