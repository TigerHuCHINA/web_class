
<%@page import="java.text.SimpleDateFormat"%>
<%@page language="java" import="java.sql.* ,javax.servlet.* ,java.util.* ,java.awt.* ,com.action.*, com.comm.* ,com.dao.* ,com.pojo.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%if(request.getSession().getAttribute("userid")==null)response.sendRedirect("home.jsp"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="js/videopage.js"></script>
<link href="css/header.css" rel='stylesheet' type='text/css'>
<link href="css/button.css" rel='stylesheet' type='text/css'>
<link href="css/searchbox.css" rel='stylesheet' type='text/css'>
<link href="css/videostyle.css" rel='stylesheet' type='text/css'>
<title>视频名称</title>
<link type="text/css" rel="stylesheet" href="css/yizan.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<!-- --------------------------------评论---------------------------- -->
<style type="text/css">
ul,ol {
	list-style:none;
	position:absolute;
	top:900px;
	left:500px;
}
a {
	text-decoration:none;
}
a:hover,a:visited,a:link,a:active {
	text-decoration:none;
}
sup {
	vertical-align:text-top;
}
sub {
	vertical-align:text-bottom;
}
legend {
	color:#000;
}
fieldset,img {
	border:0;
}
button,input,select,textarea {
	font-size:100%;
}
table {
	border-collapse:collapse;
	border-spacing:0;
}
.clear {
	clear:both;
	float:none;
	height:0;
	overflow:hidden;
}
body {
	color:#333;
	font:12px/1.3 'Arial','Microsoft YaHei';
}
#pn {
	width:550px;
	height:auto;
	background:#fff;
	margin:0 auto;
	padding:20px;
}
.list0 {
	padding:20px 0;
	position:relative;
	border-top:1px solid #eee;
}
.head {
	width:60px;
	float:left;
}
.head img {
	width:60px;
	height:60px;
}
.close {
	width:20px;
	height:20px;
	position:absolute;
	top:0;
	right:0;
	color:#696e78;
	font-size:14px;
	text-align:center;
	line-height:20px;
}
.close:hover {
	color:#eb7350;
}
.content {
	width:450px;
	line-height:20px;
	font-size:14px;
	margin-left:70px;
}
.name {
	color:#eb7350;
}
.pic {
	margin:5px 0;
}
.good:after {
	clear:both;
	content:'';
	display:block;
	width:0;
	height:0;
	visibility:hidden;
}
.good {
	*zoom:1;
}
.date {
	float:left;
	color:#808080;
}
.good a {
	float:right;
	color:#808080;
}
.people {
	background:#F7F7F7;
	height:28px;
	line-height:28px;
	padding-left:10px;
	margin:5px 0;
}
.comment:after {
	clear:both;
	content:'';
	display:block;
	width:0;
	height:0;
	visibility:hidden;
}
.comment {
	*zoom:1;
	padding:10px 0;
	border-top:1px solid #eee;
}
.comment-right {
	float:left;
	width:410px;
}
.comment-text {
	line-height:18px;
}
.comment-text span {
	color:#eb7350;
}
.comment-date {
	font-size:12px;
	line-height:14px;
	color:#ccc;
	position:relative;
}
.comment-zan {
	position:absolute;
	right:40px;
	bottom:0;
	color:#808080;
}
.comment-dele {
	position:absolute;
	right:0;
	bottom:0;
	color:#808080;
}
.hf:after {
	clear:both;
	content:'';
	display:block;
	width:0;
	height:0;
	visibility:hidden;
}
.hf {
	*zoom:1;
}
.hf-text {
	border:1px solid #eee;
	display:block;
	height:15px;
	width:438px;
	padding:5px;
	resize:none;
	color:#ccc;
	font-size:12px;
}
.hf-on .hf-text {
	height:60px;
	color:#333;
	border:1px solid #ff8140;
}
.hf-btn {
	float:right;
	width:65px;
	height:26px;
	background:#f7f7f7;
	color:#ccc;
	font-size:12px;
	display:none;
}
.hf-btn-on {
	background:#ff8140;
	color:#fff;
}
.hf-nub {
	float:right;
	padding:3px 5px;
	color:#666;
	display:none;
}
.hf-on .hf-btn {
	display:inline;
}
.hf-on .hf-nub {
	display:inline;
}
</style>


</head>
<body>
<!-- 顶部菜单 -->
<div class="header">

    <a class="head1" href="home.jsp">主界面</a>

    <a class="head2" href="homePage.jsp"><img src="ImageDisplay?id=user" width="75px" height="75px"></a>
        
    <a class="head3">尊敬的<%=request.getSession().getAttribute("username") %>欢迎光临</a>

    <a class="head4" href = "javascript:void(0)" onclick = "document.getElementById('light1').style.display='block';document.getElementById('fade').style.display='block'">反馈</a>


</div>
<!-- ----------------------播放视频，邓慧颖---------------------------------- -->

<!-- 搜索框 常庭瑞 -->
<div class="search2 bar1">
    <form action="searchvideo.jsp" onsubmit="return login2()">
        <input type="text" name="content" placeholder="请输入你感兴趣的课程或用户">
        <button id="search" type="submit"></button>
    </form>
</div>
<%
String vid=request.getParameter("id");
request.getSession().setAttribute("vid",vid);
String ownerid=request.getParameter("useid");
request.getSession().setAttribute("ownerid",ownerid);
%>
<div class="content">
<div class="background1"></div>

<div class="myvideo">
    <video width="800" height="500" controls="controls" style="position:absolute;left:550px;top:100px;">

        <source src="VideoDisplay" type="audio/mp4">
    </video>

<%
	VideoCountAction visitorcount = new VideoCountAction();
	visitorcount.doo((String)request.getSession().getAttribute("userid"),vid);
%>
<%
 VideoDao vd=new VideoDao();
if(vid==null){
	vid=(String)request.getAttribute("id");
	}
Video v=vd.getInfoById(vid);
String videoname=v.getTitle();
String view=v.getView(); 
%>



</div>
<div class="information">
    <div id="videoname" class="info">
        <tr>
            <td>视频名称 </td>
            <td><%=videoname%></td>
        </tr>
    </div>
    
    <div id="userlocation" class="info">
        <tr>
            <td>上传者 </td>

            <td><a href="hisHome.jsp?ownerid=<%=ownerid%>" ><%=ownerid%></a></td> 
        </tr>
    </div>
    
    <div id="playcount" class="info">
        <tr>
            <td>观看数 </td>
            <td><%=view%></td>
        </tr>
    </div>
    
</div>

<div class="mybutton">
	<%
	CollectDao cd=new CollectDao();
	boolean result=cd.hasCollect((String)request.getSession().getAttribute("userid"),(String)request.getSession().getAttribute("vid"));
	if(result){
    out.print("<a id='collect' onmouseover=\"mOver(this)\" onmouseout=\"mOut(this)\" class='mybtn1 btn btn-medium type3' href='doCollect?flag=de' >已收藏</a>");
    } 
	else{ 
		out.print("<a id='collect'  class='mybtn1 btn btn-medium type3' href='doCollect?flag=add' >收藏</a>");
    } %>
</div>
<script>
function mOver(obj)
{
obj.innerHTML="取消收藏"
}

function mOut(obj)
{
obj.innerHTML="已收藏"
}
</script>

<!-- ---------------------------评论--------------------------- -->
<%
Create cv=new Create();
StringBuilder s=cv.createComment(vid,ownerid,(String)request.getSession().getAttribute("userid"));
out.println(s);
%>
<!-- -------------------------------评论结束----------------------- -->
</div>

</div>
</body>
</html>