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
<title>我的个人主页</title>	
</head>
<body style="background-image:url('picture/4.jpg');background-attachment: fixed;background-repeat: no-repeat;background-size: cover;">
<%
	getInfo get = new getInfo();
	String name = (String)session.getAttribute("userid");
	UserEdit u = get.getInfoById(name);
	String path="C:\\Users\\acer\\Desktop\\"+u.getUheadphoto();
	System.out.print(path);
%>

<a class="return1" href="home.jsp">主界面</a>
<img src=<%=path %> class="return2" style="width:50px;height:50px;border:1px solid black;" >
<a class="return3">尊敬的<%=request.getSession().getAttribute("username") %>欢迎光临</a>
<a class="return4" href = "javascript:void(0)" onclick = "document.getElementById('light2').style.display='block';document.getElementById('fade').style.display='block'">反馈</a>


<div class="image">
    <img src="ImageDisplay" width="200px" height="200px"/>
    
</div>








<div id="light1" class="white_content">
    <a href = "javascript:void(0)" id= "close1" onclick = "document.getElementById('light1').style.display='none';document.getElementById('fade').style.display='none'">×</a>
    <form method="post" action="ImageAction">
        <input class="fileInput" id="file" type="file" name="file"/>
        <input class="submitimage" type="submit" value="提交"/>
    </form>
</div> 
    <div id="fade" class="black_overlay">
</div> 

<div id="light2" class="white_content">
    <a href = "javascript:void(0)" id= "close2" onclick = "document.getElementById('light2').style.display='none';document.getElementById('fade').style.display='none'">×</a>
    
    <form action="doFeedback" method="post" onsubmit="return checkMessage();">
         <textarea class="mymessage" id="message" name="content" type="text" placeholder="请输入反馈" style="width:300px;height:150px;"></textarea>                               
         <input type="submit" name="submit" onclick="myFunction()" value="提交">                        
    </form>
</div> 
<div id="fade" class="black_overlay">
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
            <td><%=u.getUprovince()%> <%=u.getUcity() %></td>
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
    
    <div id="userfocus" class="info">
        <tr>
            <td>关注量</td>
            <td><%=u.getFollow() %></td>
        </tr>
    </div>
    
    <div id="userread" class="info">
	    <tr>
	        <td>浏览量</td>
	        <td><%=u.getView() %></td>
	    </tr>
    </div>
</div>

<div class="mybuttons">
    <div>
	    <a class="buttons" href = "javascript:void(0)" onclick = "document.getElementById('light1').style.display='block';document.getElementById('fade').style.display='block'">编辑头像</a>
    </div>
    <div>
        <a class="buttons" href="#" onclick="return PopLayer(this)">编辑资料</a>
    </div>
    <div>
        <a class="buttons" href="message.jsp">查看留言</a>
    </div>
    <div>
        <a class="buttons" href="upload.jsp">上传视频</a>
    </div>
    <div>
        <a class="buttons" href="dynamic.jsp">查看动态</a>
    </div>
</div>





<div class="videos">
    <div class="myvideo">
        <div class="title">我的视频： 共0个视频</div>
    </div>

    <div class="mycollect">
        <div class="title">我的收藏： 共0个视频</div>
    </div>
</div>









<div id="lightbox"></div>
<div id="pop">
    <form action = "doEdit" method = "post">
        <div id="modified" style="OVERFLOW-Y: auto; OVERFLOW-X:hidden;">
            <div class="close">
                <input type="button" value="×" onclick="PopLayer()" /> 
        	</div>
        	
            <div class="moheader">
                <p>修改信息</p>
            </div>
   
            <div id="moname" class="mo">               
                <input type="text" name="name" placeholder="请输入新的用户名"/>
            </div>
            <div id="modate" class="mo">
                <input type="text" name="birthday" onfocus="HS_setDate(this)" readonly placeholder="请输入新的生日"/>
            </div>
            <div id="molocation" class="mo">
                <select id="s_province" name="province"></select> 
                <select id="s_city" name="city"></select> 
                <script type="text/javascript">_init_area();</script>              
            </div>
            <div id="moschool" class="mo">               
                <input type="text" name="school" placeholder="请输入新的学校"/>
            </div>
            <div id="moclass" class="mo">               
                <input type="text" name="profession" placeholder="请输入新的专业"/>
            </div>
            <div id="moinformation" class="mo">               
                <input type="text" name="introduce" placeholder="请输入新的简介"/>
            </div>
            <div id="mosex" class="mo">               
                <select path="country" id="sex" name="sex">
                    <option value="" disabled selected>性别</option>
				      <option value="男">男</option>
				    <option value="女">女</option>
				    <option value="保密">保密</option>
				</select>
            </div>
            <div>
                <input type="submit" value="保存" class="save" />
        	</div>
        </div>
    </form>
</div>



<script>
    var pop=document.getElementById('pop'),popf=pop.getElementsByTagName('form')[0],lightbox=document.getElementById('lightbox')
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

</body>
</html>