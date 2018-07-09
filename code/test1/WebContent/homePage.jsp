<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/homePageStyle.css" rel='stylesheet' type='text/css'>
<script src="js/calender.js"></script>
<script src="js/location.js"></script>
<title>个人主页</title>	
</head>
<body style="background-image:url('picture/4.jpg');background-attachment: fixed;background-repeat: no-repeat;background-size: cover;">

<div class="image">
    <img src="<%//image的地址 %>">
</div>

<div class="information">
    <div id="username" class="info">
        <tr>
            <td>用户名 </td>
            <td><%//这里放用户昵称 %></td>
        </tr>
    </div>
    
    <div id="userid" class="info">
        <tr>
            <td>用户账号 </td>
            <td><%//这里放用户账号 %></td>
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
            <td><%//这里放生日 %></td>
        </tr>
    </div>
    
    <div id="usersex" class="info">
        <tr>
            <td>性别 </td>
            <td><%//这里放性别 %></td>
        </tr>
    </div>
    
    <div id="userinformation" class="info">
        <tr>
            <td>个人简介 </td>
            <td><%//这里放个人简介 %></td>
        </tr>
    </div>
</div>

<div class="editinfo">
    <a class="edit" href="#" onclick="return PopLayer(this)">编辑资料</a>
</div>

<div class="videos">
    <div class="myvideo">
        <div class="title">我的视频： 共0个视频</div>
    </div>

    <div class="mycollect">
        <div class="title">我的收藏： 共0个视频</div>
    </div>
</div>

<div class="uploadinfo">
    <a class="upload" href="upload.jsp">上传视频</a>
</div>







<div id="lightbox"></div>
<div id="pop">
    <form>
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
                <input type="text" name="birthday" onfocus="HS_setDate(this)" placeholder="请输入新的生日"/>
            </div>
            <div id="molocation" class="mo">
                <select id="s_province" name="s_province"></select> 
                <select id="s_city" name="s_city"></select> 
                <script type="text/javascript">_init_area();</script>              
            </div>
            <div>
                <input type="button" value="保存" class="save" />
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