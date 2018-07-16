<%@page import="com.dao.VideoDao"%>
<%@page import="com.action.getCollect"%>
<%@page import="com.pojo.UserEdit"%>
<%@page import="com.action.getInfo"%>
<%@page import="com.action.Create"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<link href="css/header.css" rel='stylesheet' type='text/css'>
<link href="css/button.css" rel='stylesheet' type='text/css'>
<link href="css/homePageStyle.css" rel='stylesheet' type='text/css'>
<link href="css/style.css" rel='stylesheet' type='text/css'>

<script src="js/calender.js"></script>
<script src="js/location.js"></script>
<title>我的个人主页</title>	
</head>
<body>

<%
	getInfo get = new getInfo();
	String name = (String)session.getAttribute("userid");
	System.out.println(name);
	UserEdit u = get.getInfoById(name);
	/*String path="C:\\Users\\acer\\Desktop\\"+u.getUheadphoto();
	System.out.print(path);*/
%>
<!-- 顶部菜单 -->
<div class="header">

    <a class="head1" href="home.jsp">主界面</a>

    <a class="head2" href="homePage.jsp"><img src="ImageDisplay" width="75px" height="75px"></a>
        
    <a class="head3">尊敬的<%=request.getSession().getAttribute("username") %>欢迎光临</a>

    <a class="head4" href = "javascript:void(0)" onclick = "document.getElementById('light1').style.display='block';document.getElementById('fade').style.display='block'">反馈</a>


</div>



<!-- 个人头像与信息 -->
<div class="myinformation">
    <div class="image">
        <img src="ImageDisplay" width="200px" height="200px"/>    
    </div>
    <div class="informationbox">
        <div id="username" class="info">
            <tr>
                <td>用户名: </td>
                <td><%=u.getUname() %></td>
            </tr>
        </div>
    
        <div id="userid" class="info">
            <tr>
                <td>用户账号: </td>
                <td><%=u.getUid() %></td>
            </tr>
        </div>
    
        <div id="userlocation" class="info">
            <tr>
                <td>所在地: </td>
                <td><%=u.getUprovince()%> <%=u.getUcity() %></td>
            </tr>
        </div>
    
        <div id="userdate" class="info">
            <tr>
                <td>生日: </td>
                <td><%
                if(u.getUbirthday() != null) out.print(u.getUbirthday());
                else out.print("未知");
                %></td>
            </tr>
        </div>
    
        <div id="usersex" class="info">
            <tr>
                <td>性别: </td>
                <td><%=u.getUsex() %></td>
            </tr>
        </div>
    
        <div id="userschool" class="info">
            <tr>
                <td>学校: </td>
                <td><%=u.getUschool() %></td>
            </tr>
        </div>
    
        <div id="userclass" class="info">
            <tr>
                <td>专业: </td>
                <td><%=u.getUprofession() %></td>
            </tr>
        </div>
        <div id="userinformation" class="info">
            <tr>
                <td>个人简介: </td>
                <td><%
                if(u.getUintroduce() != null) out.print(u.getUintroduce());
                else out.print("还没有个人简介");%></td>
            </tr>
        </div>
    
        <div id="userfocus" class="info">
            <tr>
                <td>关注量: </td>
                <td><%=u.getFollow() %></td>
            </tr>
        </div>
    
        <div id="userread" class="info">
	        <tr>
	            <td>浏览量: </td>
	            <td><%=u.getView() %></td>
	        </tr>
        </div>
           
    </div>

</div>




<!-- 按键 -->
<div class="mybuttons">
    <div>
	    <a class="mybtn1 btn btn-medium type1" href = "javascript:void(0)" onclick = "document.getElementById('light2').style.display='block';document.getElementById('fade').style.display='block'">编辑头像</a>
    </div>
    <div>
        <a class="mybtn1 btn btn-medium type2" href="javascript:void(0)" onclick="document.getElementById('light3').style.display='block';document.getElementById('fade').style.display='block'">编辑资料</a>
    </div>
    <div>
        <a class="mybtn1 btn btn-medium type3" href="message.jsp">查看留言</a>
    </div>
    <div>
        <a class="mybtn1 btn btn-medium type1" href="upload.jsp">上传视频</a>
    </div>
    <div>
        <a class="mybtn1 btn btn-medium type2" href="dynamic.jsp">查看动态</a>
    </div>
</div>



<div class="videos">
    <div class="myvideo">
        <div class="title">我的视频： 共     
        <%
        VideoDao dao = new VideoDao();
        out.print(dao.getInfoByUserId(name).size());
        %>
        个视频</div>
    </div>

	<%
Create cv=new Create();
StringBuilder s=cv.createUploadVideo(name);
out.println(s);
%>

    <div class="mycollect">
        <div class="title">我的收藏： 共
    <%
    getCollect getC = new getCollect();
    out.print(getC.getById(name).size());
    %>    
        个视频</div>
    </div>
<%
StringBuilder s_=cv.createCollectVideo(name);
out.println(s_);
%>
</div>














<!-- 隐藏界面1 -->
<div id="light1">
    <a href = "javascript:void(0)" id= "close1" onclick = "document.getElementById('light1').style.display='none';document.getElementById('fade').style.display='none'">×</a>
    
    <form action="doFeedback" method="post" onsubmit="return checkMessage();">
         <textarea class="mymessage" id="message" name="content" type="text" placeholder="请输入反馈" style="width:300px;height:150px;"></textarea>                               
         <input type="submit" name="submit" onclick="myFunction()" value="提交">                        
    </form>
</div> 


<!-- 隐藏界面2 -->
<div id="light2">
    <a href = "javascript:void(0)" id= "close2" onclick = "document.getElementById('light2').style.display='none';document.getElementById('fade').style.display='none'">×</a>
    <form method="post" action="ImageAction">
        <input class="fileInput" id="file" type="file" name="file"/>
        <input class="submitimage" type="submit" value="提交"/>
    </form>
</div>

<!-- 隐藏界面3 -->
<div id="light3">
    <a href = "javascript:void(0)" id= "close3" onclick = "document.getElementById('light3').style.display='none';document.getElementById('fade').style.display='none'">×</a>
    <form action = "doEdit" method = "post"> 
        <div id="modified" style="OVERFLOW-Y: auto; OVERFLOW-X:hidden;">
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
                <input type="submit" value="保存" class="mybtn2 btn btn-medium type3" />
        	</div>
        </div>
        
        
    </form>
</div>




<div id="fade" class="black_overlay"></div> 


























</body>
</html>