
<%@page import="java.text.SimpleDateFormat"%>
<%@page language="java" import="java.sql.* ,javax.servlet.* ,java.util.* ,java.awt.* ,com.action.*, com.comm.* ,com.dao.* ,com.pojo.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="js/videopage.js"></script>
<link href="css/videostyle.css" rel='stylesheet' type='text/css'>
<title>视频名称</title>

</head>
<body>

<!-- ----------------------播放视频，邓慧颖---------------------------------- -->
<video width="320" height="240" controls="controls">


<div class="search1 dd1">
    <form class="search1">
        <input type="text" placeholder="搜索你感兴趣的课程">
		<button id="search" class="searchbutton" type="submit" style="background-image:url(picture/8.jpg); background-size:100% 100%;"></button>
    
        <a href="home.jsp">主界面</a>
    </form>
</div>


<div class="background1"></div>

<div class="myvideo">
    <video width="800" height="500" controls="controls" style="position:absolute;left:550px;top:100px;">

        <source src="class.mp4" type="audio/mp4">
    </video>

<% 
	String id = String.valueOf(11);
	//String name = (String)session.getAttribute("name");
	String videoid= String.valueOf(11);
	VisitorCountAction visitorcount = new VisitorCountAction();
	visitorcount.doo(id,videoid);
%>

</div>



<div class="information">
    <div id="videoname" class="info">
        <tr>
            <td>视频名称 </td>
            <td><%//这里放视频名称 %></td>
        </tr>
    </div>
    
    <div id="videotype" class="info">
        <tr>
            <td>视频类型 </td>
            <td><%//这里放视频类型 %></td>
        </tr>
    </div>
    
    <div id="userlocation" class="info">
        <tr>
            <td>上传者 </td>
            <td><a href=""><%//上传者昵称%></a></td>
        </tr>
    </div>
    
    <div id="playcount" class="info">
        <tr>
            <td>观看数 </td>
            <td><%//观看数%></a></td>
        </tr>
    </div>
    
</div>


<div>
    <a class="addvideo" href="CollectAction" onclick="function()">收藏</a>
</div>

<div id="talk">
    <div id="show"></div>
    <div id="write">
		<textArea id="te" style="margin: auto auto; width:100%;height:79%;"></textArea>
	    <input type="button" value="发布" class="btn" onclick="add()">				
    </div>
</div>


</body>
</html>