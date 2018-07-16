<%@page import="com.pojo.UserEdit"%>
<%@page import="com.action.getInfo"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%if(request.getSession().getAttribute("userid")==null)response.sendRedirect("home.jsp"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<link href="css/header.css" rel='stylesheet' type='text/css'>


<title>留言界面</title>
</head>
<body>
<!-- 顶部菜单 -->
<div class="header">


    <a class="head1" href="home.jsp">主界面</a>

    <a class="head2" href="homePage.jsp"><img src="ImageDisplay?id=user" width="100%" height="100%"></a>
        
    <a class="head3">尊敬的<%=request.getSession().getAttribute("username") %>欢迎光临</a>

    <a class="head4" href = "javascript:void(0)" onclick = "document.getElementById('light1').style.display='block';document.getElementById('fade').style.display='block'">反馈</a>


</div>

<h1 style="text-align:center;">留言板</h1>
<div class="message">

    <hr/>
    
    <div id="messageName" class="info">
        <tr>
            <td>留言者： </td>
            <td><%//这里放留言者 %></td>
        </tr>
    </div>
    
    <div id="messageDate" class="info">
        <tr>
            <td>留言时间： </td>
            <td><%//这里放留言时间 %></td>
        </tr>
    </div>
    
    <div id="messageContent" class="info">
        <tr>
            <td>留言内容： </td>
            <td><%//这里放留言内容 %></td>
        </tr>
    </div>
    <hr/>

</div>
</body>
</html>





























