<%@page import="com.pojo.UserEdit"%>
<%@page import="com.action.getInfo"%>
<%@page import="com.action.UserCountAction" %>
<%@page import="java.sql.* ,javax.servlet.* ,java.util.* ,java.awt.* ,com.action.*, com.comm.* ,com.dao.* ,com.pojo.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/homePageStyle.css" rel='stylesheet' type='text/css'>
<link href="css/header.css" rel='stylesheet' type='text/css'>
<script src="js/calender.js"></script>
<script src="js/location.js"></script>
<title>别人的个人主页</title>
	
<!-- --------------------------私信------------------------------- -->
<style type="text/css">
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
			var infoid=<%=session.getAttribute("infoid")%>;
			if(infoid!=null){
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
<body>
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
	/*getInfo get = new getInfo();
	String name = (String)session.getAttribute("userid");
	UserEdit u = get.getInfoById(name);
	String id = String.valueOf(11);
	String id0= String.valueOf(11);
	UserCountAction usercount = new UserCountAction();
	usercount.doo(id,id0);*/
%>



<!----------------顶部菜单--------------->
<div class="header">
<a class="return1" href="home.jsp">主界面</a>
<a href="homePage.jsp"><img src="<%//=u.getUheadphoto() %>" class="return2"></a>
<a class="return3">尊敬的<%=request.getSession().getAttribute("username") %>欢迎光临</a>
<a class="return4" href = "javascript:void(0)" onclick = "document.getElementById('light2').style.display='block';document.getElementById('fade').style.display='block'">反馈</a>

	
</div>



<div class="information">
    <div id="username" class="info">
        <tr>
            <td>用户名 </td>
            <td><%=ownername%></td>
        </tr>
    </div>
<<<<<<< HEAD
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
    
        <div id="userlocation" class="info">
            <tr>
                <td>所在地: </td>
                <td><%//=province%> <%//=city %></td>
            </tr>
        </div>
    
        <div id="userdate" class="info">
            <tr>
                <td>生日: </td>
                <td><%//=birthday %></td>
            </tr>
        </div>
    
        <div id="usersex" class="info">
            <tr>
                <td>性别: </td>
                <td><%//=sex%></td>
            </tr>
        </div>
    
        <div id="userschool" class="info">
            <tr>
                <td>学校: </td>
                <td><%//=school%></td>
            </tr>
        </div>
    
        <div id="userclass" class="info">
            <tr>
                <td>专业: </td>
                <td><%//=profession%></td>
            </tr>
        </div>
        <div id="userinformation" class="info">
            <tr>
                <td>个人简介: </td>
                <td><%//=introduce%></td>
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
           
=======
    
    <div id="userid" class="info">
        <tr>
            <td>用户账号 </td>
            <td><%=ownerid%></td>
        </tr>
    </div>
    
    <div id="userlocation" class="info">
        <tr>
            <td>所在地 </td>
            <td><%=province%> <%=city %></td>
        </tr>
    </div>
    
    <div id="userdate" class="info">
        <tr>
            <td>生日 </td>
            <td><%=birthday %></td>
        </tr>
    </div>
    
    <div id="usersex" class="info">
        <tr>
            <td>性别 </td>
            <td><%=sex%></td>
        </tr>
    </div>
    
    <div id="userschool" class="info">
        <tr>
            <td>学校 </td>
            <td><%=school%></td>
        </tr>
    </div>
    
    <div id="userclass" class="info">
        <tr>
            <td>专业 </td>
            <td><%=profession%></td>
        </tr>
>>>>>>> 2e829be3c0360a2013448de38454c95db42d2a9d
    </div>
    <div id="userinformation" class="info">
        <tr>
            <td>个人简介 </td>
            <td><%=introduce%></td>
        </tr>
    </div>
    <%
	String id1 = String.valueOf(11);
	String id2= String.valueOf(11);
	UserCountAction visitorcount = new UserCountAction();
	visitorcount.doo(id1,id2);
	%>
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
	<a class="focus" href="doFollow" onclick="focus();">关注</a>
</div>
<div class="same">
	<strong><%=follow %></strong>关注<br>
	<strong class="look"><%=view %></strong>浏览
</div>
<!-- ---------------------------------------------私信----------------------------------------------- -->
<div class="sixin"><a href="#" onclick="return PopLayer(this)">私信</a></div>
<div id="lightbox2"></div>
<div id="pop2" style="background-image:url(picture/back.jpg)">
    <form action = "doMessage" method = "post">
		<div class="close">
        	<input type="button" value="×" onclick="PopLayer()" /> 
        </div>	
        <div class="char">
        	<textarea name="content" id="te" rows="11" cols="65"></textarea>
        </div>
        <div>
        	<input class="check" type="submit" value="提交" onclick="check()"/>
        </div>
	</form>
<<<<<<< HEAD
</div> 


<div id="fade" class="black_overlay"></div> 

<%
	String id1 = String.valueOf(11);
	String id2= String.valueOf(11);
	UserCountAction visitorcount = new UserCountAction();
	visitorcount.doo(id1,id2);
%>   
<%
	/* String ownerid=(String)request.getParameter("ownerid");
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
	request.getSession().setAttribute("ownerid",ownerid); */
	/*getInfo get = new getInfo();
	String name = (String)session.getAttribute("userid");
	UserEdit u = get.getInfoById(name);
	String id = String.valueOf(11);
	String id0= String.valueOf(11);
	UserCountAction usercount = new UserCountAction();
	usercount.doo(id,id0);*/
%>



=======
</div>
<script>
    var pop=document.getElementById('pop2'),popf=pop.getElementsByTagName('form')[0],lightbox=document.getElementById('lightbox2')
    function PopLayer(obj) {
        lightbox.style.display = pop.style.display = obj ? 'block' : 'none';
        if (obj) {
            var tr = obj.parentNode.parentNode
            popf.name.value = tr.cells[0].innerHTML
            popf.birthday.value = tr.cells[1].innerHTML
            popf.address.value = tr.cells[2].innerHTML
        }
        return false
    }
</script>
<!-- -------------------------------------------------------------------------------------------------- -->
>>>>>>> 2e829be3c0360a2013448de38454c95db42d2a9d





</body>
</html>