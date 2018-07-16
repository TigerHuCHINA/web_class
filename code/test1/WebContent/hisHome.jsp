<%@page import="com.pojo.UserEdit"%>
<%@page import="com.action.getInfo"%>
<%@page import="com.action.UserCountAction" %>
<%@page import="java.sql.* ,javax.servlet.* ,java.util.* ,java.awt.* ,com.action.*, com.comm.* ,com.dao.* ,com.pojo.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<link href="css/button.css" rel='stylesheet' type='text/css'>
<link href="css/header.css" rel='stylesheet' type='text/css'>
<link href="css/homePageStyle.css" rel='stylesheet' type='text/css'>
<link href="css/style.css" rel='stylesheet' type='text/css'>

<script src="js/calender.js"></script>
<script src="js/location.js"></script>
<title>别人的个人主页</title>
	

</head>
<body>

<%
	
	/*getInfo get = new getInfo();
	String name = (String)session.getAttribute("userid");
	UserEdit u = get.getInfoById(name);
	String id = String.valueOf(11);
	String id0= String.valueOf(11);
	UserCountAction usercount = new UserCountAction();
	usercount.doo(id,id0);*/

if(((String)request.getSession().getAttribute("userid")).equals((String)request.getSession().getAttribute("ownerid")))
		{
			response.sendRedirect("homePage.jsp");
		}

%>

<!----------------顶部菜单--------------->
<div class="header">


    <a class="head1" href="home.jsp">主界面</a>

    <a class="head2" href="homePage.jsp"><img src="picture/1.png" width="100%" height="100%"></a>
        
    <a class="head3">尊敬的<%=request.getSession().getAttribute("username") %>欢迎光临</a>

    <a class="head4" href = "javascript:void(0)" onclick = "document.getElementById('light1').style.display='block';document.getElementById('fade').style.display='block'">反馈</a>


</div>

<%
String ownerid=(String)request.getParameter("ownerid");
UserEditDao ued=new UserEditDao();
UserEdit ue=ued.getInfoById(ownerid);
UserDao ud=new UserDao();
User u=ud.dologin(ownerid);
String ownername=u.getUname();
String birthday=ue.getUbirthday();
String sex=ue.getUsex();
String school=ue.getUschool();
String profession=ue.getUprofession();
String introduce=ue.getUintroduce();
String province = ue.getUprovince();
String city = ue.getUcity();
String follow = ue.getFollow();
String view = ue.getView();
request.getSession().setAttribute("ownerid",ownerid);
%>


<!-- 个人头像与信息 -->
<div class="myinformation">
    <div class="image">
        <img src="ImageDisplay"/>    
    </div>
    <div class="informationbox">
        <div id="username" class="info">
            <tr>
                <td>用户名: </td>
                <td><%=ownername%></td>
            </tr>
        </div>
    
        <div id="userid" class="info">
            <tr>
                <td>用户账号: </td>
                <td><%=ownerid%></td>
            </tr>
        </div>
    
        <div id="userlocation" class="info">
            <tr>
                <td>所在地: </td>
                <td><%=province%> <%//=city %></td>
            </tr>
        </div>
    
        <div id="userdate" class="info">
            <tr>
                <td>生日: </td>
                <td><%=birthday %></td>
            </tr>
        </div>
    
        <div id="usersex" class="info">
            <tr>
                <td>性别: </td>
                <td><%=sex%></td>
            </tr>
        </div>
    
        <div id="userschool" class="info">
            <tr>
                <td>学校: </td>
                <td><%=school%></td>
            </tr>
        </div>
    
        <div id="userclass" class="info">
            <tr>
                <td>专业: </td>
                <td><%=profession%></td>
            </tr>
        </div>
        <div id="userinformation" class="info">
            <tr>
                <td>个人简介: </td>
                <td><%=introduce%></td>
            </tr>
        </div>
        <div id="userfocus" class="info">
            <tr>
                <td>关注量: </td>
                <td><%=follow %></td>
            </tr>
        </div>
    
        <div id="userread" class="info">
	        <tr>
	            <td>浏览量: </td>
	            <td><%=view %></td>
	        </tr>
        </div>
           
    </div>
</div>


<div class="mybuttons">
    <div>
	    <a class="mybtn1 btn btn-medium type2" href = "javascript:void(0)" onclick = "document.getElementById('light1').style.display='block';document.getElementById('fade').style.display='block'">私信</a>
    </div>
</div>


<div class="videos">
    <div class="myvideo">
        <div class="title">他的视频： 共
    <%
        VideoDao dao = new VideoDao();
        out.print(dao.getInfoByUserId(ownerid).size());
     %>    
        个视频</div>
    </div>
    <%
Create c=new Create();
StringBuilder s=c.createUploadVideo(ownerid);
out.println(s);
%>
</div>

<!-- -----------------------------------关注、收藏----------------------------------- -->
<div class="focusinfo">
<%
FollowDao fd=new FollowDao();
boolean hasfollow=fd.hasFollow((String)request.getSession().getAttribute("ownerid"),(String)request.getSession().getAttribute("userid"));
if(hasfollow){System.out.print("true");}
else{System.out.print("false");}
if(hasfollow){
out.print("<a class='focus' href='doFollow?flag=de' onclick='focus();'>取消关注</a>");
}else{
out.print("<a class='focus' href='doFollow?flag=add' onclick='focus();'>关注</a>");
}
%>

	
</div>

<div class="same">
	<strong><%=follow %></strong>关注<br>
	<strong class="look"><%=view %></strong>浏览
</div>

<!-- ---------------------------------------------私信----------------------------------------------- -->
<div class="sixin"><a href="#" onclick="return PopLayer(this)">私信</a></div>
<div id="lightbox2"></div>
<div id="pop2" style="background-image:url(picture/back.jpg)">




<!-- 隐藏界面1 -->
<div id="light1">
    <a href = "javascript:void(0)" id= "close1" onclick = "document.getElementById('light1').style.display='none';document.getElementById('fade').style.display='none'">×</a>  
    <form action = "doMessage" method = "post">
        <div class="char">
        	<textarea name="content" id="te" rows="11" cols="45"></textarea>
        </div>
        <div>
        	<input class="check" type="submit" value="提交" onclick="check()"/>
        </div>
	</form>
</div> 


<div id="fade" class="black_overlay"></div> 

<%
	/*String id1 = String.valueOf(11);
	String id2= String.valueOf(11);
	UserCountAction visitorcount = new UserCountAction();
	visitorcount.doo(id1,id2);*/
%>   
<%
	getInfo get = new getInfo();
	String name = (String)request.getSession().getAttribute("userid");
	String id = String.valueOf(name);
	String id0= String.valueOf((String)request.getSession().getAttribute("ownerid"));
	UserCountAction usercount = new UserCountAction();
	usercount.doo(id,id0);
%>








</body>
</html>