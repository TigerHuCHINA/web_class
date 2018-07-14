<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="com.action.Create"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>动态界面</title>
<link rel="stylesheet" href="css/tabulous.css">
<script src="js/tabulous.js"></script>
<!-- --------------------------------TAB切换------------------------- -->
<!-- <script>
$(function(){
	$('.tabs').tabulous({
		effect: 'slideLeft'
	});
});
</script> -->
<!-- ---------------------------------切换结束------------------------------- -->
<style>
ul,ol {
	list-style:none;
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
.comment-left {
	width:30px;
	float:left;
	display:inline;
	margin-right:10px;
}
.comment-left img {
	width:30px;
	height:30px;
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
</style>
</head>
<body>
<!-- -----------------------------------------切换开始---------------------- -->
<!-- <div class="main">
	<div class="mianc">
		<div class="tabs">
			<ul>
				<li><a href="#tabs-1" title="">Tab 1</a></li>
				<li><a href="#tabs-2" title="">Tab 2</a></li>
				<li><a href="#tabs-3" title="">Tab 3</a></li>
			</ul>

			<div id="tabs_container">
				<div id="tabs-1">
					<p>Proin elit arcu, rutrum commodo, vehicula tempus, commodo a, risus. Curabitur nec arcu. Donec sollicitudin mi sit amet mauris. Nam elementum quam ullamcorper ante. Etiam aliquet massa et lorem. Mauris dapibus lacus auctor risus.</p>
					<p>Aenean tempor ullamcorper leo. Vivamus sed magna quis ligula eleifend adipiscing. Duis orci. Aliquam sodales tortor vitae ipsum. Aliquam nulla. Duis aliquam molestie erat. Ut et mauris vel pede varius sollicitudin. Sed ut dolor nec orci tincidunt interdum. Phasellus ipsum. Nunc tristique tempus lectus.</p>
				</div>

				<div id="tabs-2">
					<p>Morbi tincidunt, dui sit amet facilisis feugiat, odio metus gravida ante, ut pharetra massa metus id nunc. Duis scelerisque molestie turpis. Sed fringilla, massa eget luctus malesuada, metus eros molestie lectus, ut tempus eros massa ut dolor.</p>
				</div>

				<div id="tabs-3">
					<p>Mauris eleifend est et turpis. Duis id erat. Suspendisse potenti. Aliquam vulputate, pede vel vehicula accumsan, mi neque rutrum erat, eu congue orci lorem eget lorem.</p>
					<p>Vestibulum non ante. Class aptent taciti sociosqu ad litora torquent per conubia nostra , per inceptos himenaeos. Fusce sodales.</p>
				</div>
			</div>
		</div>
	</div>	        
</div> -->
<!-- --------------------------------TAB切换结束---------------------------------------------- -->
<ul id="pn">
    <li class="list0">
            <div class="comment-list">
                <div class="comment" user="self">
                    <div class="comment-right">
                        <div class="comment-text"><span class="user"><%//评论人 %></span><%//说了什么 %></div>
                        <div class="comment-date">02-14 22:00 <input type="button" class="comment-zan" onclick="dianzan()" value="23 赞">
                   		    <a class="comment-dele" href="#C1">回复</a>
                        </div>
                    </div>
                </div>
            </div>
         <form name="form1" method="post" action="">
            <div class="hf">
                <textarea name="C1" id="te" class="hf-text" autocomplete="off" maxlength="100" rows="10" cols="50"></textarea>
         	      <input type="submit" class="comment-dele" value="提交回复" onclick="return check()"/>
                <span class="hf-nub">0/100</span> </div>
         </form>
        </div>
        
    </li>
</ul>
<script>
function  check()
{
	var content=$("te").value;
	content=trim(content);
	if(content.length<1)
	{
		alert("请输入内容");
		return false;
	}
	var infoid=<%=session.getAttribute("infoid")%>;
	if(infoid!=null){
		alert("回复成功！");
		document.getElementById("te").value="";
		return true;
	}
}			
function $(id){
	return document.getElementById(id);
}
function trim(str){ //删除左右两端的空格
	return str.replace(/(^\s*)|(\s*$)/g, "");
}

</script>


<%
Create cv=new Create();
StringBuilder s=cv.createComment((String)request.getSession().getAttribute("vid"));
out.println(s);
%>





</body>
</html>