
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
<%
VideoDao vd=new VideoDao();
Video v=vd.getInfoById(vid);
String videoname=v.getTitle();

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


<div>
    <a class="addvideo" href="doCollect" onclick="function()">收藏</a>
</div>

<form action="doComment" method="post">
<div id="talk">
    <div id="show">   
    
    <!-- ----------------------------------评论和点赞------------------------ -->
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
   <!-- -----------------------------------评论和点赞结束------------------------------- -->
     
    </div>
    <div id="write">
		<textArea name="content" id="te" style="margin: auto auto; width:100%;height:79%;"></textArea>
	    <input type="submit" value="发布" class="btn" onclick="add()">
	     </div>
</div>
</form>

</body>
</html>