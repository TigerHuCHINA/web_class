<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="com.action.Create"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>网站主界面</title>

<link href="css/bootstrap-3.1.1.min.css" rel='stylesheet' type='text/css'>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>


<link href='https://fonts.googleapis.com/css?family=Oswald:300,400,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=PT+Sans:400,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Fugaz+One' rel='stylesheet' type='text/css'>
<link href="css/style.css" rel='stylesheet' type='text/css'>
<!-- 实现登陆注册界面的下滑 邓慧颖、常庭瑞 -->
<script>
$(document).ready(function(){
    $(".dropdown").hover(            
        function() {
            $('.dropdown-menu', this).stop( true, true ).slideDown("fast");
            $(this).toggleClass('open');        
        },
        function() {
            $('.dropdown-menu', this).stop( true, true ).slideUp("fast");
            $(this).toggleClass('open');       
        }
    );
});
</script>

</head>

<body onload = "init()">
<div class="header">
	<div class="container">
	    <!-- 登录 注册 button 邓慧颖 -->
		<div class="top-menu">
			<ul>
				<li><a id="login" href="#" class="btn btn-default btn1 pull-left" data-toggle="modal" data-target="#applyModal">登录</a></li>
				<li><a id="register" href="#" class="btn btn-default btn1 pull-left" data-toggle="modal" data-target="#applyModal_1">注册</a></li>
			    <li><a id="register" href="#" class="btn btn-default btn1 pull-left" data-toggle="modal" data-target="#applyModal_2">反馈</a></li>
			</ul>
		</div>
		
		<!-- 登录界面 邓慧颖 -->	
		<div class="modal fade" id="applyModal" tabindex="-1" role="dialog" aria-labelledby="applyModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog_1">
				<div class="modal-content">
							    	
				    <div class="modal-header">
					    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
					    <h4 class="modal-title" id="myModalLabel">
					        <div class="head_4"><p>login</p></div>
			            </h4>
					</div>
					      	
	                <div class="modal-body">
                        <form name=row class="login" action="doLogin" method="post" onsubmit="return checkLogin();">
                             
                            <div class="section">
                                <input type="text" name="userid" id="LoginUserId" placeholder="请输入账号">                               
                            </div>
                            <div class="section">
                                <input type="password" name="password" id="LoginPassword" placeholder="请输入密码">
                            </div>
                            <div class="section">
                                <div class="submit">
                                    <input type="submit" name="submit" onclick="myFunction()" value="登录">
                                </div>
                            </div>
                               
                            <ul class="new">
                                <li class="new">
                                    <p class="sign">没有账号 ?&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#applyModal_1">注册</a></p>
                                </li>
						    </ul>
                             
                        </form>
                    </div>
				</div>
		    </div>
		</div>
		
        <!-- 注册界面 常庭瑞 -->
		<div class="modal fade" id="applyModal_1" tabindex="-1" role="dialog" aria-labelledby="applyModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog_2">
				<div class="modal-content">
					<div class="modal-header">
					    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
					    <h4 class="modal-title" id="myModalLabel">
					        <div class="head_4"><p>Register</p></div>
			            </h4>
					</div>
					
					<div class="modal-body">
					    <form name="row" class="register" method="post" action="doRegister" onsubmit="return checkRegister();">
					        <div class="section">
                                <input type="text" name="userid" id="RegisterUserId" placeholder="请输入账号">
                            </div>   
                            <div class="section">
                                <input type="password" name="password" id="RegisterPassword" placeholder="请输入密码">
                            </div>               
                            <div class="section">
                                <input type="password" name="password2" id="RegisterPassword2" placeholder="请确认密码">
                            </div>
                            <div class="section">
                                <input type="text" name="username" id="Username" placeholder="请输入昵称">
                            </div>                                                                                               
                            <div class="section">
                                <div class="submit">
                                    <input type="submit" name="submit" onclick="myFunction()" value="提交">
                                </div>
                            </div>
                            <div class="checkbox check_1">
							    <input id="check1" type="checkbox" name="check" value="check1">
							    <label for="check1">我同意服务条款和隐私政策&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							    </label>
							    <a id="toggle" href="#">查看条款</a>
							</div>
							  <!-- 	--------------条款------------------------ -->
							<div style="display:none;" id="a">
								<p>用户在注册帐号过程中，需要提供一些必要信息，包括但不限于有效的身份证明材料及相关必要信息
								（包括但不限于您的姓名、电子邮件地址、联系电话、联系地址等）。</p>
								<p>除非法律允许或者经网站事先书面许可，您使用网站相关服务不得使用未经网站授权或许可的任何软件、插件、外挂、系统
								或第三方工具对网站相关软件或服务的正常运行进行干扰、破坏、修改或施加其他影响。</p>
							</div>
	 						 <script type="text/javascript">
	 						$(function() {
	 							   $("#toggle").click(function() {
	 							         $(this).text($("#a").is(":hidden") ? "收起" : "展开");
	 							         $("#a").slideToggle();
	 							     });
	 							 });
	 						
     						  </script>
  							 <!-- ----------------条款结束------------------------- -->
							
						</form>   			                                       
	                </div>     
                 </div>
		     </div>
		 </div>
	
		 <div class="modal fade" id="applyModal_2" tabindex="-1" role="dialog" aria-labelledby="applyModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog_1">
				<div class="modal-content">
							    	
				    <div class="modal-header">
					    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
					    <h4 class="modal-title" id="myModalLabel">
					        <div class="head_4"><p>反馈</p></div>
			            </h4>
					</div>
					      	
	                <div class="modal-body">
                        <form action="doFeedback" method="post" onsubmit="return checkMessage();">
                             
                            <div>
                                <textarea id="message" name="content" type="text" placeholder="请输入反馈" style="width:550px;height:200px;"></textarea>                               
                            </div>
                            
                            <div class="section">
                                <div class="submit">
                                    <input type="submit" name="submit" onclick="myFunction()" value="提交">
                                </div>
                            </div>
                               
                            
                             
                        </form>
                    </div>
				</div>
		    </div>
		</div>
		 
		 
		<div class="dropdown">
		<img id="istrue2" src="ImageDisplay" class="btn btn-default btn1 pull-left" style="width:50px;height:50px;border:1px solid black;" >
		<a id="istrue" href="#" class="btn btn-default btn1 pull-left" data-toggle="modal" data-target="#applyModal_2">尊敬的<%=request.getSession().getAttribute("username") %>欢迎光临</a>

			
             <div class="dropdown-content">
                 <a href="homePage.jsp">个人主页</a>
                 <a href="upload.jsp">上传视频</a>
                 <a onclick="logout()">退出登录</a>
             </div>
         </div>
<!-- 个人界面下拉菜单 邓慧颖 -->         
<style>
.dropdown{
    position:relative;
    z-index:100;
    display:inline-block;
}

/* 下拉菜单内容，设置为隐藏 */
.dropdown-content{
    min-width:150px;
    background-color:#F5F5F5;
    position:absolute;
    display:none;
    box-shadow:0px 8px 15px 0px rgba(0,0,0,0.2);
}

/* 下拉按钮样式 */
.dropbtn{
    color:white;
    font-size:16px;
    padding:15px;
    border:none;
    background-color:#00CD66;
    cursor:pointer;
}

/* 下拉菜单链接的样式 */
.dropdown-content a{
    color:black;
    text-decoration:none;
    padding:12px 15px;
    display:block;
}

/* 鼠标移入后显示下拉菜单 */
.dropdown:hover .dropdown-content{
    display:block;
}

/* 鼠标移入后修改链接的背景色 */
.dropdown-content a:hover{
    background-color:#E8E8E8;
}

/* 下拉菜单显示后修改下拉按钮的背景色 */
.dropdown:hover .dropbtn{
    background-color:#008B00;
}
</style>
		 
	</div>
</div>


<!-- 对登录 注册进行一些限制 常庭瑞 -->
<script>
function checkLogin(){
	var x=document.getElementById("LoginUserId").value;
	var y=document.getElementById("LoginPassword").value;
	if(x==""){
		alert("账号不能为空");
	    return false;
	}
	if(y==""){
	    alert("密码不能为空");
	    return false;
	}	        
	return true;
}
		
function checkRegister(){
	var x=document.getElementById("RegisterUserId").value;
	var y=document.getElementById("RegisterPassword").value;
	var z=document.getElementById("RegisterPassword2").value;
	var m=document.getElementById("Username").value;
	var check=document.getElementById("check1");
	if(x==""){
	    alert("请输入账号");
	    return false;
	}
	if(y==""){
	    alert("请输入密码");
	    return false;
	}
	if(z==""){
	    alert("请确认密码");
	    return false;
	}
	if(y!=z){
	    alert("两次密码不一致");
	    return false;
	}
	if(m==""){
	    alert("请输入昵称");
	    return false;
	}
	if(!check.checked){
		alert("未同意");
		return false;
	}
	return true;
}

//判断是否登录及错误-杜宇航
function init(){
	var userid = "<%=request.getSession().getAttribute("userid")%>";
	var username = "<%=request.getSession().getAttribute("username")%>";
	if(userid!="null")
		{
		var register=document.getElementById("register");
	      var login=document.getElementById("login");
	      register.style.display='none';
	      login.style.display='none';
	      //istrue.style.display='inline-block';
	      //istrue.style.visibility='visible';
		}
	/*else
		{
		var istrue=document.getElementById("istrue");
    	 istrue.style.display='none';
		}*/
	else
	{
		/*alert("1")
		var username_ = getCookie("username");
		var userid_ = getCookie("userid");
		if(userid_==""){
			alert(userid_);*/
			  var istrue=document.getElementById("istrue");
	     	 istrue.style.display='none';
	     	var istrue2=document.getElementById("istrue2");
	     	 istrue2.style.display='none';
	    /*}else{
	    	alert(userid_);
	    	  var register=document.getElementById("register");
			      var login=document.getElementById("login");
			      register.style.display='none';
			      login.style.display='none';
			      //location.href="login";
			      //istrue.style.display='inline-block';
			      //istrue.style.visibility='visible';
	    }*/
	}
	//登录注册错误
	var error = "<%=request.getSession().getAttribute("error")%>";
	  if(error!="null")
	  {
	  	alert("\"" +error + "\"");
	  	<%request.getSession().removeAttribute("error");%>
	  }
}

function logout() {
	<%/*session.removeAttribute("userid");
	session.removeAttribute("username");*/%>
	delCookie("userid");
	delCookie("username");//未能删除，等待修改
	//alert(getCookie("userid"));
	location.href("logout");
}

function getCookie(c_name) {
	if (document.cookie.length > 0) {
		c_start = document.cookie.indexOf(c_name + "=")
		if (c_start != -1) {
			c_start = c_start + c_name.length + 1
			c_end = document.cookie.indexOf(";", c_start)
			if (c_end == -1)
				c_end = document.cookie.length
			return unescape(document.cookie.substring(c_start, c_end))
		}
	}
	return "";
}


function delCookie(name)
{
    var exp = new Date();
    exp.setTime(exp.getTime() - 1000);
    var cval=getCookie(name);
    if(cval!=null)
        document.cookie= name + "="+cval+";expires="+exp.toGMTString();
    //alert(getCookie(name));
}

//判断反馈格式
function checkMessage(){
	var x=document.getElementById("message").value;
	if(x==""){
		alert("反馈不能为空");
	    return false;
	}	        
	return true;
}
</script>






<!-- 搜索界面 常庭瑞 -->

<div class="search1 dd1">
    <form class="search1" action="searchvideo.jsp">
        <input type="text" name="content" placeholder="搜索你感兴趣的课程">
		<button id="search" class="button" type="submit" style="background-image:url(picture/8.jpg); background-size:100% 100%;"></button>
    </form>
</div>

 


<!-- 轮播 邓慧颖 -->
<div id="wrapper"><!-- 最外层部分 -->
    <div id="banner"><!-- 轮播部分 -->
      <ul class="imgList"><!-- 图片部分 -->
      <li><a href="#"><img src="picture/2.jpg" width="1500px" height="600px" alt="puss in boots1"></a></li>
      <li><a href="#"><img src="picture/3.jpg" width="1500px" height="600px" alt="puss in boots2"></a></li>
      <li><a href="#"><img src="picture/4.jpg" width="1500px" height="600px" alt="puss in boots3"></a></li>
      <li><a href="#"><img src="picture/5.jpg" width="1500px" height="600px" alt="puss in boots4"></a></li>
      <li><a href="#"><img src="picture/6.jpg" width="1500px" height="600px" alt="puss in boots5"></a></li>
      </ul>
      <img src="picture/7.jpg" width="100px" height="100px" id="prev">
      <img src="picture/7.jpg" width="100px" height="100x" id="next">
      <div class="bg"></div> <!-- 图片底部背景层部分-->
      <ul class="infoList"><!-- 图片左下角文字信息部分 -->
        <li class="infoOn">视频1</li>
        <li>视频2</li>
        <li>视频3</li>
        <li>视频4</li>
        <li>视频5</li>
      </ul>
      <ul class="indexList"><!-- 图片右下角序号部分 -->
        <li class="indexOn">1</li>
        <li>2</li>
        <li>3</li>
        <li>4</li>
        <li>5</li>
      </ul>
    </div>
</div>
<script>
  var curIndex = 0, //当前index
      imgArr = getElementsByClassName("imgList")[0].getElementsByTagName("li"), //获取图片组
      imgLen = imgArr.length,
      infoArr = getElementsByClassName("infoList")[0].getElementsByTagName("li"), //获取图片info组
      indexArr = getElementsByClassName("indexList")[0].getElementsByTagName("li"); //获取控制index组
     // 定时器自动变换2.5秒每次
  var autoChange = setInterval(function(){ 
    if(curIndex < imgLen -1){ 
      curIndex ++; 
    }else{ 
      curIndex = 0;
    }
    //调用变换处理函数
    changeTo(curIndex); 
  },1000);
 
  //清除定时器时候的重置定时器--封装
  function autoChangeAgain(){ 
      autoChange = setInterval(function(){ 
      if(curIndex < imgLen -1){ 
        curIndex ++;
      }else{ 
        curIndex = 0;
      }
    //调用变换处理函数
      changeTo(curIndex); 
    },2500);
    }
 
  //调用添加事件处理
  addEvent();
 
  //给左右箭头和右下角的图片index添加事件处理
 function addEvent(){
  for(var i=0;i<imgLen;i++){ 
    //闭包防止作用域内活动对象item的影响
    (function(_i){ 
    //鼠标滑过则清除定时器，并作变换处理
    indexArr[_i].onmouseover = function(){ 
      clearTimeout(autoChange);
      changeTo(_i);
      curIndex = _i;
    };
    //鼠标滑出则重置定时器处理
    indexArr[_i].onmouseout = function(){ 
      autoChangeAgain();
    };
     })(i);
  }
 
  //给左箭头prev添加上一个事件
  var prev = document.getElementById("prev");
  prev.onmouseover = function(){ 
    //滑入清除定时器
    clearInterval(autoChange);
  };
  prev.onclick = function(){ 
    //根据curIndex进行上一个图片处理
    curIndex = (curIndex > 0) ? (--curIndex) : (imgLen - 1);
    changeTo(curIndex);
  };
  prev.onmouseout = function(){ 
    //滑出则重置定时器
    autoChangeAgain();
  };
 
   //给右箭头next添加下一个事件
  var next = document.getElementById("next");
  next.onmouseover = function(){ 
    clearInterval(autoChange);
  };
  next.onclick = function(){ 
    curIndex = (curIndex < imgLen - 1) ? (++curIndex) : 0;
    changeTo(curIndex);
  };
  next.onmouseout = function(){ 
    autoChangeAgain();
  };
}
 
  //左右切换处理函数
  function changeTo(num){ 
    //设置image
    var imgList = getElementsByClassName("imgList")[0];
    goLeft(imgList,num*1500); //左移一定距离
    //设置image 的 info
    var curInfo = getElementsByClassName("infoOn")[0];
    removeClass(curInfo,"infoOn");
    addClass(infoArr[num],"infoOn");
    //设置image的控制下标 index
    var _curIndex = getElementsByClassName("indexOn")[0];
    removeClass(_curIndex,"indexOn");
    addClass(indexArr[num],"indexOn");
  }
 
 
  //图片组相对原始左移dist px距离
  function goLeft(elem,dist){ 
    if(dist == 0){ //第一次时设置left为0px 或者直接使用内嵌法 style="left:0;"
      elem.style.left = "0px";
    }
    var toLeft; //判断图片移动方向是否为左
    dist = dist + parseInt(elem.style.left); //图片组相对当前移动距离
    if(dist<0){  
      toLeft = false;
      dist = Math.abs(dist);
    }else{ 
      toLeft = true;
    }
   for(var i=0;i<=dist/100;i++)
   {//这里设定缓慢移动，10阶每阶40px
      (function(_i)
    		  { 
        var pos = parseInt(elem.style.left); //获取当前left
        setTimeout(function()
        		{ 
          pos += (toLeft)? -(_i * 100) : (_i * 100); //根据toLeft值指定图片组位置改变
          //console.log(pos);
          elem.style.left = pos + "px";
        },_i * 20); //每阶间隔50毫秒
      })(i);
    }
  }
    
  
 
  //通过class获取节点
  function getElementsByClassName(className){ 
    var classArr = [];
    var tags = document.getElementsByTagName('*');
    for(var item in tags){ 
      if(tags[item].nodeType == 1){ 
        if(tags[item].getAttribute('class') == className){ 
          classArr.push(tags[item]);
        }
      }
    }
    return classArr; //返回
  }
 
  // 判断obj是否有此class
  function hasClass(obj,cls){  //class位于单词边界
    return obj.className.match(new RegExp('(\\s|^)' + cls + '(\\s|$)'));
   }
   //给 obj添加class
  function addClass(obj,cls){ 
    if(!this.hasClass(obj,cls)){ 
       obj.className += cls;
    }
  }
  //移除obj对应的class
  function removeClass(obj,cls){ 
    if(hasClass(obj,cls)){ 
      var reg = new RegExp('(\\s|^)' + cls + '(\\s|$)');
         obj.className = obj.className.replace(reg,'');
    }
  }
</script>
<%
Create cv=new Create();
StringBuilder s=cv.createVideo();
out.println(s);
%>
<!-- 显示视频 常庭瑞 -->
<div id="videos">
    <ul class="ul1">
    
    
        <li>
            <div class="box1">
                <a class="avatar_pic" target="_self" href="video.jsp">
                    <img src="cover/cover.png"/>
                </a>
                <div class="first">
                    <p class="top2"><%//视频名称 %></p>
                    <p class="bottom2"><%//视频类别 %></p>
                </div>
                <div class="last">
                    <p class="top2"><%//视频简介 %></p>
                    <p class="bottom2"><%//上传时间 %><span><%//播放量 %></span></p>
                </div>
            </div>
        </li>
  
        
        
    </ul>
</div>






































<!-- 返回顶部 邓慧颖 -->

<div class="return_top"></div>
<script>
$(function(){
    $(window).scroll(function(){
      var topDistance=$(window).scrollTop();  //获取鼠标在本窗口现有状态下移动的高度
      if(topDistance>100){  //如果移动高度大于100px,顶部图标单单显示出，如果移动高度小于等于100，顶部图标不显示
        $('.return_top').fadeIn(800);
      }else{
        $('.return_top').fadeOut(800);
      }
    });
    $('.return_top').on('click',function(){
      $('html,body').animate({scrollTop:0},800); //必须用$('html,body')选择，不然没效果
    })
  });
</script>
<style>
.return_top{ 
  width: 50px;
  height: 50px; 
  background: url(images/top.png) no-repeat center #FF8D16; 
  position:fixed; 
  right: 30px; 
  bottom: 30px; 
  display: none; 
  cursor: pointer; 
  z-index: 99;
}
</style>


</body>
</html>