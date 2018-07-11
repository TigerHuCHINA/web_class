<%@page import="com.pojo.UserEdit"%>
<%@page import="com.action.getInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/homePageStyle.css" rel='stylesheet' type='text/css'>
<script src="js/calender.js"></script>
<script src="js/location.js"></script>
<title>个人主页</title>	
<!-- --------------------------私信------------------------------- -->
<style type="text/css">
			#write{
				width:98%;
				height:28%;
				border:1px blue solid;
				margin:10px auto auto;
				position:absolute;
				 top:1000px;
			}
			.btn{
				width: 51px;
				height: 28px;
				margin: 2px auto auto 90%;	
			}
    
			.personal{
				width:99%;
				height:100px;
				border:1px #33ff00 solid;
				margin:2px auto;
				overflow-y:auto;
			}
		</style>		
	<script type="text/javascript">			
		function  check()
		{
			var content=$("te").value;
			content=trim(content);
			if(content.length<1)
			{
				alert("请输入内容");
				return;
			}
			var infoid="<%=session.getAttribute("infoid")%>";
			if(infoid!="null"){
				alert("私信发送成功！");
				document.getElementById("te").value="";
				return;
			}
		}			
		function $(id){
			return document.getElementById(id);
		}
		function trim(str){ //删除左右两端的空格
    		return str.replace(/(^\s*)|(\s*$)/g, "");
		}
	</script>
<!-- -------------------------------------------------------------- -->
<style>
 .Home{
 left:10px;
 font-size:200%;
 }
</style>
</head>
<body style="background-image:url('picture/4.jpg');background-attachment: fixed;background-repeat: no-repeat;background-size: cover;">
<%
	getInfo get = new getInfo();
	String name = (String)session.getAttribute("userid");
	UserEdit u = get.getInfoById(name);
%>
	<a class="Home" href="home.jsp"><strong>Home</strong></a>
<div class="image">
    <img src="<%=u.getUheadphoto() %>">
</div>

<div class="information">
    <div id="username" class="info">
        <tr>
            <td>用户名 </td>
            <td><%=u.getUname() %></td>
        </tr>
    </div>
    
    <div id="userid" class="info">
        <tr>
            <td>用户账号 </td>
            <td><%=u.getUid() %></td>
        </tr>
    </div>
    
    <div id="userlocation" class="info">
        <tr>
            <td>所在地 </td>
            <td><%//这里放所在地 %></td>
        </tr>
    </div>
    
    <div id="userdate" class="info">
        <tr>
            <td>生日 </td>
            <td><%=u.getUbirthday() %></td>
        </tr>
    </div>
    
    <div id="usersex" class="info">
        <tr>
            <td>性别 </td>
            <td><%=u.getUsex() %></td>
        </tr>
    </div>
    
    <div id="userschool" class="info">
        <tr>
            <td>学校 </td>
            <td><%=u.getUschool() %></td>
        </tr>
    </div>
    
    <div id="userclass" class="info">
        <tr>
            <td>专业 </td>
            <td><%=u.getUprofession() %></td>
        </tr>
    </div>
    <div id="userinformation" class="info">
        <tr>
            <td>个人简介 </td>
            <td><%=u.getUintroduce() %></td>
        </tr>
    </div>
</div>

<div class="videos">
    <div class="myvideo">
        <div class="title">他的视频： 共0个视频</div>
    </div>

    <div class="mycollect">
        <div class="title">他的收藏： 共0个视频</div>
    </div>
</div>
<!-- -----------------------------------关注、收藏----------------------------------- -->
<div class="focusinfo">
	<a class="focus" onclick="focus();">关注</a>
</div>
<div class="same">
	<strong>2</strong>关注</br>
	<strong class="look">1.4k</strong>浏览
</div>
<!-- ---------------------------------------------评论----------------------------------------------- -->
<div id="write">
	<textarea   id="te" style="margin: auto auto; width:100%;height:79%;"></textArea>
	<input type="button" value="私信" class="btn" onclick="check()">				
</div>
</div>
<!-- -------------------------------------------------------------------------------------------------- -->

</body>
</html>