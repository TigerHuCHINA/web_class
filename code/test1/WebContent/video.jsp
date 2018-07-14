
<%@page import="java.text.SimpleDateFormat"%>
<%@page language="java" import="java.sql.* ,javax.servlet.* ,java.util.* ,java.awt.* ,com.action.*, com.comm.* ,com.dao.* ,com.pojo.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="js/videopage.js"></script>

<link href="css/button.css" rel='stylesheet' type='text/css'>
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
<!-- ---------------------------------评论结束--------------------------------- -->
</head>
<body>
<div id="counter">
	<form action="doCount" action="doRecord" method="post">
	<div>
		<input type="submit" value="计算" class="counter" />
	</div>
	</form>
</div>
<!-- ----------------------播放视频，邓慧颖---------------------------------- -->


<div class="search1 dd1">
    <form class="search1">
        <input type="text" placeholder="搜索你感兴趣的课程">
		<button id="search" class="searchbutton" type="submit" style="background-image:url(picture/8.jpg); background-size:100% 100%;"></button>
    
        <a href="home.jsp">主界面</a>
    </form>
</div>
<%
String vid=request.getParameter("id");
request.getSession().setAttribute("vid",vid);
String ownerid=request.getParameter("useid");
request.getSession().setAttribute("ownerid",ownerid);
%>

<div class="background1"></div>

<div class="myvideo">
    <video width="800" height="500" controls="controls" style="position:absolute;left:550px;top:100px;">

        <source src="VideoDisplay" type="audio/mp4">
    </video>

<%
	VideoCountAction visitorcount = new VideoCountAction();
	visitorcount.doo((String)request.getSession().getAttribute("userid"),vid);
%>
<%-- <%
VideoDao vd=new VideoDao();
Video v=vd.getInfoById(vid);
String videoname=v.getTitle();

%> --%>
</div>



<div class="information">
    <div id="videoname" class="info">
        <tr>
            <td>视频名称 </td>
            <td><%//=videoname%></td>
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
            <td><a href="hisHome.jsp?ownerid=<%=ownerid%>"><%=ownerid%></a></td>
        </tr>
    </div>
    
    <div id="playcount" class="info">
        <tr>
            <td>观看数 </td>
            <td><%//观看数%></td>
        </tr>
    </div>
    
</div>

<!-- <a class="addvideo btn btn-medium type3" href="doCollect" onclick="function()">收藏</a> -->
<div class="mybuttons">
<div>
    <a class="mybtn1 btn btn-medium type3" href="doCollect">收藏</a>
</div>

<div>
    <a id="delvideo" class="mybtn1 btn btn-medium type2" onmouseover="funcText1()" onmouseout="funcText2()">已收藏</a>
</div>
</div>
<script>
var demo = document.getElementById("delvideo");
function funcText1(){
	demo.innerHTML="取消收藏";
	}
function funcText2(){
	demo.innerHTML="已收藏";
	}
</script>


   	<!-- ----------------------------------点赞------------------------ -->
    <div class="praise">
		<span id="praise"><img src="picture/zan.png" id="praise-img" onclick="changeImg()"/></span>
		<span id="praise-txt">1455</span>
		<span id="add-num"><em>+1</em></span>
	</div>
<!--动态点赞结束-->
<script>
$(function(){
	$("#praise").click(function(){
		var praise_img = $("#praise-img");
		var text_box = $("#add-num");
		var praise_txt = $("#praise-txt");
		var num=parseInt(praise_txt.text());
		if(praise_img.attr("src") == ("picture/yizan.png")){
			$(this).html("<img src='picture/zan.png' id='praise-img' class='animation' />");
			praise_txt.removeClass("hover");
			text_box.show().html("<em class='add-animation'>-1</em>");
			$(".add-animation").removeClass("hover");
			num -=1;
			praise_txt.text(num)
		}else{
			$(this).html("<img src='picture/yizan.png' id='praise-img' class='animation' />");
			praise_txt.addClass("hover");
			text_box.show().html("<em class='add-animation'>+1</em>");
			$(".add-animation").addClass("hover");
			num +=1;
			praise_txt.text(num)
		}
	});
})
</script>
   <!-- -----------------------------------点赞结束------------------------------- --> 
<!-- ---------------------------评论--------------------------- -->
<ul id="pn">
    <li class="list0"> <a class="close" href="javascript:;">X</a>
        <div class="content">
            <div class="comment-list">
                <div class="comment" user="self">
                    <div class="comment-right">
                        <div class="comment-text"><span class="user">老王：</span>我</div>
                        <div class="comment-date">02-14 22:00 <a class="comment-zan" href="javascript:;" total="23" my="1">23 取消赞</a> <a class="comment-dele" href="#C1">回复</a> </div>
                    </div>
                </div>
                <div class="comment" user="self">
                    <div class="comment-right">
                        <div class="comment-text"><span class="user">我：</span>看哭了留卡号吧</div>
                        <div class="comment-date">02-14 24:00 <a class="comment-zan" href="javascript:;" total="0" my="0">赞</a> <a class="comment-dele" href="javascript:;">删除</a> </div>
                    </div>
                </div>
            </div>
            <div class="hf">
                <textarea name="C1" type="text" class="hf-text" autocomplete="off" maxlength="100"></textarea>
                <button class="hf-btn">回复</button>
                <span class="hf-nub">0/100</span> </div>
        </div>
    </li>
</ul>
<!-- -------------------------------评论结束----------------------- -->
</body>
</html>