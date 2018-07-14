
<%@page import="java.text.SimpleDateFormat"%>
<%@page language="java" import="java.sql.* ,javax.servlet.* ,java.util.* ,java.awt.* ,com.action.*, com.comm.* ,com.dao.* ,com.pojo.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="js/videopage.js"></script>
<link href="css/videostyle.css" rel='stylesheet' type='text/css'>
<title>视频名称</title>l
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
    
    <div id="videotype" class="info">
        <tr>
            <td>视频类型 </td>
            <td><%//这里放视频类型 %></td>
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



<div>
	<%
	CollectDao cd=new CollectDao();
	boolean result=cd.hasCollect((String)request.getSession().getAttribute("userid"),(String)request.getSession().getAttribute("vid"));
	if(result){
		System.out.print("true");
    out.print("<a id='collect'  class='addvideo' href='doCollect?flag=de' >已收藏</a>");
    } 
	else{ 
		System.out.print("false");
		out.print("<a id='collect'  class='addvideo' href='doCollect?flag=add' >收藏</a>");
    } %>
    
</div>
   	<!-- ----------------------------------点赞------------------------ -->
    <div class="praise">
		<span id="praise"><img src="picture/zan.png" id="praise-img" /></span>
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
                        <div class="comment-date">02-14 22:00 <a class="comment-zan" href="javascript:;" total="23" my="1">23 取消赞</a> <a class="comment-dele" href="javascript:;">回复</a> </div>
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
                <textarea type="text" class="hf-text" autocomplete="off" maxlength="100">评论…</textarea>
                <button class="hf-btn">回复</button>
                <span class="hf-nub">0/100</span> </div>
        </div>
    </li>
</ul>

<script>
 function addloadEvent(func) {
     var oldonload = window.onload;
     if (typeof window.onload != "function") {
         window.onload = func;
     } else {
         window.onload = function() {
             if (oldonload) {
                 oldonload();
             }
             func();
         }
     }
 }
 addloadEvent(b);

 function b() {
     var pn = document.getElementById("pn");
     var lists = pn.children;
     //删除当前节点
     function remove(node) {
         node.parentNode.removeChild(node);
     }
     //上面的点赞
     function praisebox(box, el) {
         //获取赞数量容器
         var praise = box.getElementsByClassName("people")[0];
         //获取容器当前total值
         var total = parseInt(praise.getAttribute("total"));
         //获取点击的innerHTML
         var txt = el.innerHTML;
         //创建一个新的total存储用
         var newtotal;
         //判断点击的文字内容
         if (txt == "赞") {
             //total值+1 因为我还没点击赞，所以要点击的时候就多了一个人 total+1
             newtotal = total + 1;
             //判断赞数量 把相应文字放到赞容器里
             praise.innerHTML = newtotal == 1 ? "我觉得很赞" : "我和" + total + "个人觉得很赞";
             el.innerHTML = "取消赞";
         } else {
             //反之total值-1
             newtotal = total - 1;
             praise.innerHTML = newtotal == 0 ? "" : newtotal + "个人觉得很赞";
             el.innerHTML = "赞";
         }
         //更新total值
         praise.setAttribute("total", newtotal);
         //如果没有人点赞容器隐藏
         praise.style.display = (newtotal == 0) ? "none" : "block";
     }
     //回复评论
     function reply(box) {
         //获取评论框
         var textarea = box.getElementsByTagName("textarea")[0];
         //获取包含所有评论的容器
         var comment = box.getElementsByClassName("comment-list")[0];
         //创建新的评论div
         var div = document.createElement("div");
         //赋类名
         div.className = "comment";
         //设置属性
         div.setAttribute("user", "self");
         //获取每条评论的innerHTML结构，每次只替换textarea的输入内容和 当前发送时间
           var html = '<div class="comment-right">' +
             '<div class="comment-text"><span>我：</span>' + textarea.value + '</div>' +
             '<div class="comment-date">' +
             getTime() +
             '<a class="comment-zan" href="javascript:;" total="0" my="0">赞</a>' +
             '<a class="comment-dele" href="javascript:;">删除</a>' +
             '</div>' +
             '</div>';
       /*   var html = '<div class="comment-left">' + '<img src="http://www.jq22.com/img/cs/500x500-4.png" alt=""/>' + '</div>' +
             '<div class="comment-right">' +
             '<div class="comment-text"><span>我：</span>' + textarea.value + '</div>' +
             '<div class="comment-date">' +
             getTime() +
             '<a class="comment-zan" href="javascript:;" total="0" my="0">赞</a>' +
             '<a class="comment-dele" href="javascript:;">删除</a>' +
             '</div>' +
             '</div>'; */
         //插入到新建的评论div
         div.innerHTML = html;
         //把新评论插入到评论列表
         comment.appendChild(div);
         //评论后初始化textarea输入框
         textarea.value = "评论…";
         textarea.parentNode.className = "hf";
     }
     //获取当前时间回复评论时调用
     function getTime() {
         var t = new Date();
         var y = t.getFullYear();
         var m = t.getMonth() + 1;
         var d = t.getDate();
         var h = t.getHours();
         var mi = t.getMinutes();
         m = m < 10 ? "0" + m : m;
         d = d < 10 ? "0" + d : d;
         h = h < 10 ? "0" + h : h;
         mi = mi < 10 ? "0" + mi : mi;
         return y + "-" + m + "-" + d + "" + h + ":" + mi;
     }
     //回复里点赞
     function praiseReply(el) {
         //获取当前total值 也就是所有点赞数量
         var total = parseInt(el.getAttribute("total"));
         //获取当前my值 我的点赞
         var my = parseInt(el.getAttribute("my"));
         //创建新的total
         var newtotal;
         //判断my=0就是我准备要点赞
         if (my == 0) {
             //我点了赞总数量就要+1
             newtotal = total + 1;
             //更新total值
             el.setAttribute("total", newtotal);
             //更新my值
             el.setAttribute("my", 1);
             //更新文字 就是我点了后 文字就是取消赞了
             el.innerHTML = newtotal + " 取消赞";
         } else {
             //反之-1
             newtotal = total - 1;
             el.setAttribute("total", newtotal);
             el.setAttribute("my", 0);
             el.innerHTML = (newtotal == 0) ? " 赞" : newtotal + " 赞";
         }
     }
     //操作回复
     function operateReply(el) {
         //每条评论
         var comment = el.parentNode.parentNode.parentNode;
         //整个状态
         var box = comment.parentNode.parentNode.parentNode;
         //评论框
         var textarea = box.getElementsByTagName("textarea")[0];
         //名字
         var user = comment.getElementsByClassName("user")[0];
         //点击的innerHTML
         var txt = el.innerHTML;
         //判断当前点击的是否为回复
         if (txt == "回复") {
             //评论框触发焦点事件 也就是变高
             textarea.onfocus();
             //内容变为回复+当前人的名字
             textarea.value = "回复 " + user.innerHTML;
             //调用键盘事件
             textarea.onkeyup();
         } else {
             //否则就是删除节点
             remove(comment);
         }
     }
     //遍历所有状态消息
     for (var i = 0; i < lists.length; i++) {
         //全部事件代理
         lists[i].onclick = function(e) {
             //获取当前点击事件
             var e = e || window.event;
             var el = e.srcElement;
             if (!el) {
                 el = e.target;
             }
             //判断点击的类名
             switch (el.className) {
                 //关闭整个状态
                 case "close":
                     remove(el.parentNode);
                     break;
                     //上面的点赞
                 case "dzan":
                     praisebox(el.parentNode.parentNode.parentNode, el);
                     break;
                     //回复评论
                 case "hf-btn hf-btn-on":
                     reply(el.parentNode.parentNode.parentNode);
                     break;
                     //每条评论中点赞
                 case "comment-zan":
                     praiseReply(el);
                     break;
                 case "comment-dele":
                     operateReply(el);
                     break;
             }
         }
         var textarea = lists[i].getElementsByClassName("hf-text")[0];
         //焦点事件
         textarea.onfocus = function() {
             this.parentNode.className = 'hf hf-on';
             this.value = this.value == '评论…' ? '' : this.value;
         }
         //失焦事件
         textarea.onblur = function() {
             if (this.value == '') {
                 this.parentNode.className = 'hf';
                 this.value = '评论…';
             }
         }
         //键盘事件
         textarea.onkeyup = function() {
             var len = this.value.length;
             var textParentNode = this.parentNode;
             var textBtn = textParentNode.children[1];
             var textNub = textParentNode.children[2];
             if (len == 0 /*|| len>100*/ ) {
                 textBtn.className = "hf-btn";
             } else {
                 textBtn.className = "hf-btn hf-btn-on";
                 /*this.style.color="#333"; */
             }
             textNub.innerHTML = len + "/100";
         }
     }
     //遍历结束
 }
</script>
<!-- -------------------------------评论结束----------------------- -->
</body>
</html>