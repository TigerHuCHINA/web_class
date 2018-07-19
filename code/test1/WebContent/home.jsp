<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="com.action.Create"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>网站主界面</title>


<link href="css/wrapper.css" rel='stylesheet' type='text/css'>
<link href="css/wrapper2.css" rel='stylesheet' type='text/css'>
<link href="css/bootstrap-3.1.1.min.css" rel='stylesheet' type='text/css'>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>



<link href="css/dropdown.css" rel='stylesheet' type='text/css'>
<link href="css/video.css" rel='stylesheet' type='text/css'>
<link href="css/searchbox.css" rel='stylesheet' type='text/css'>


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
<style>
#istrue{
display:none;
}
#istrue2{
display:none
}
</style>
</head>

<body onload = "init()" style="background-image: linear-gradient(135deg, #fdfcfb 0%, #e2d1c3 100%);background-attachment: fixed;background-repeat: no-repeat;background-size: cover;">
<div class="header" style="background-color:black; height:50px;">
	<div class="container" >
	    <!-- 登录 注册 button 邓慧颖 -->
		<div class="top-menu"> 
				<a id="login" href="#" class="btn btn-default btn1 pull-left" data-toggle="modal" data-target="#applyModal" onfocus="this.blur();" style="color:white;">登录</a>
				<a id="register" href="#" class="btn btn-default btn1 pull-left" data-toggle="modal" data-target="#applyModal_1" onfocus="this.blur();" style="color:white;">注册</a>
			    <a id="return" href="#" class="btn btn-default btn1 pull-left" data-toggle="modal" data-target="#applyModal_2" onfocus="this.blur();" style="color:white;">反馈</a>	
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
                               
                            <ul class="section">
                                <p class="sign">没有账号 ?&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#applyModal_1">注册</a></p>
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
					    <button type="button" id="close3" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
					    <h4 class="modal-title" id="myModalLabel">
					        <div class="head_4"><p>反馈</p></div>
			            </h4>
					</div>
					      	
	                <div class="modal-body">
                        <form action="doFeedback" method="post" onsubmit="return checkMessage();">
                             
                            <div>
                                <textarea id="message" name="content" type="text" placeholder="请输入反馈" style="width:550px;height:200px;margin-bottom:20px;"></textarea>                               
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
		<img id="istrue2" src="ImageDisplay?id=user" class="btn btn-default btn1 pull-left" style="width:50px;height:50px;margin-left:-200px;border:1px solid white;border-radius:3px;" >
            <div class="dropdown-content">
                <a href="homePage.jsp" onfocus="this.blur();">个人主页</a>
                <a href="upload.jsp" onfocus="this.blur();">上传视频</a>
                <a onclick="logout()" onfocus="this.blur();">退出登录</a>
            </div>
        </div>
        <a id="istrue" style="position:relative;left:-110px;top:-35px;cursor:default;color:white;text-decoration: none; "><%=request.getSession().getAttribute("username") %></a>		 
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
	      istrue.style.display='block';
	      istrue2.style.display='block';
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
 
	var userid = "<%=request.getSession().getAttribute("userid")%>";
	if(userid=="null"){
		document.getElementById("close3").click();
		document.getElementById("login").click();
	    
		return false;
	     
		}
	
	var x=document.getElementById("message").value;
	if(x==""){
		alert("反馈不能为空");
	    return false;
	}	        
	return true;
}
</script>



<!-- 搜索框 常庭瑞 -->
<div class="search1 bar1">
    <form action="searchvideo.jsp" onsubmit="return login2()">
        <input type="text" name="content" placeholder="请输如你感兴趣的课程或用户">
        <button id="search" type="submit"></button>
    </form>
</div>







<!-- 轮播1 -->
<div class="wbox">

	<div class="list">
		<nav>
			<li class="p7"><a href="#"><img class="wimg" src="picture/1.png" alt="" /></a></li>
			<li class="p6"><a href="#"><img class="wimg" src="picture/2.jpg" alt="" /></a></li>
			<li class="p5"><a href="#"><img class="wimg" src="picture/3.jpg" alt="" /></a></li>
			<li class="p4"><a href="#"><img class="wimg" src="picture/4.jpg" alt="" /></a></li>
			<li class="p3"><a href="#"><img class="wimg" src="picture/5.jpg" alt="" /></a></li>
			<li class="p2"><a href="#"><img class="wimg" src="picture/6.jpg" alt="" /></a></li>
			<li class="p1"><a href="#"><img class="wimg" src="picture/7.jpg" alt="" /></a></li>
		</nav>
	</div>
	
	<a href="javascript:;" class="prev tbtn" onfocus="this.blur();"><</a>
	<a href="javascript:;" class="next tbtn"onfocus="this.blur();">></a>

	<div class="tbuttons">
		<a href="javascript:;" onfocus="this.blur();"><span class="blue qqq"></span></a>
		<a href="javascript:;" onfocus="this.blur();"><span class="qqq"></span></a>
		<a href="javascript:;" onfocus="this.blur();"><span class="qqq"></span></a>
		<a href="javascript:;" onfocus="this.blur();"><span class="qqq"></span></a>
		<a href="javascript:;" onfocus="this.blur();"><span class="qqq"></span></a>
		<a href="javascript:;" onfocus="this.blur();"><span class="qqq"></span></a>
		<a href="javascript:;" onfocus="this.blur();"><span class="qqq"></span></a>
	</div>
</div>

<script type="text/javascript">
var $a=$(".tbuttons a");
var $s=$(".tbuttons span");
var cArr=["p7","p6","p5","p4","p3","p2","p1"];
var index=0;
$(".next").click(
	function(){
	nextimg();
	}
)
$(".prev").click(
	function(){
	previmg();
	}
)
//上一张
function previmg(){
	cArr.unshift(cArr[6]);
	cArr.pop();
	//i是元素的索引，从0开始
	//e为当前处理的元素
	//each循环，当前处理的元素移除所有的class，然后添加数组索引i的class
	$("li").each(function(i,e){
		$(e).removeClass().addClass(cArr[i]);
	})
	index--;
	if (index<0) {
		index=6;
	}
	show();
}

//下一张
function nextimg(){
	cArr.push(cArr[0]);
	cArr.shift();
	$("li").each(function(i,e){
		$(e).removeClass().addClass(cArr[i]);
	})
	index++;
	if (index>6) {
		index=0;
	}
	show();
}

//通过底下按钮点击切换
$a.each(function(){
	$(this).click(function(){
		var myindex=$(this).index();
		var b=myindex-index;
		if(b==0){
			return;
		}
		else if(b>0) {
			/*
			 * splice(0,b)的意思是从索引0开始,取出数量为b的数组
			 * 因为每次点击之后数组都被改变了,所以当前显示的这个照片的索引才是0
			 * 所以取出从索引0到b的数组,就是从原本的这个照片到需要点击的照片的数组
			 * 这时候原本的数组也将这部分数组进行移除了
			 * 再把移除的数组添加的原本的数组的后面
			 */
			var newarr=cArr.splice(0,b);
			cArr=$.merge(cArr,newarr);
			$("li").each(function(i,e){
			$(e).removeClass().addClass(cArr[i]);
			})
			index=myindex;
			show();
		}
		else if(b<0){
			/*
			 * 因为b<0,所以取数组的时候是倒序来取的,也就是说我们可以先把数组的顺序颠倒一下
			 * 而b现在是负值,所以取出索引0到-b即为需要取出的数组
			 * 也就是从原本的照片到需要点击的照片的数组
			 * 然后将原本的数组跟取出的数组进行拼接
			 * 再次倒序,使原本的倒序变为正序
			 */
			cArr.reverse();
			var oldarr=cArr.splice(0,-b)
			cArr=$.merge(cArr,oldarr);
			cArr.reverse();
			$("li").each(function(i,e){
			$(e).removeClass().addClass(cArr[i]);
			})
			index=myindex;
			show();
		}
	})
})

//改变底下按钮的背景色
function show(){
		$($s).eq(index).addClass("blue").parent().siblings().children().removeClass("blue");
}

//点击class为p2的元素触发上一张照片的函数
$(document).on("click",".p2",function(){
	previmg();
	return false;//返回一个false值，让a标签不跳转
});

//点击class为p4的元素触发下一张照片的函数
$(document).on("click",".p4",function(){
	nextimg();
	return false;
});

//			鼠标移入box时清除定时器
$(".wbox").mouseover(function(){
	clearInterval(timer);
})

//			鼠标移出box时开始定时器
$(".wbox").mouseleave(function(){
	timer=setInterval(nextimg,4000);
})

//			进入页面自动开始定时器
timer=setInterval(nextimg,4000);
</script>

<div style="text-align:center;clear:both">

</div>



<!-- 轮播2 -->
<div class="wbox2" id="j_silder_outer">
	<div class="img-item">
		<div class="img2" style="background: url(picture/1.png) no-repeat;"></div>
		<div class="img2" style="background: url(images/2.png) no-repeat;"></div>
		<div class="img2" style="background: url(images/3.png) no-repeat;"></div>
		<div class="img2" style="background: url(images/4.png) no-repeat;"></div>
	</div>
	<div class="img-item">
		<div class="img2" style="background: url(picture/1.png) no-repeat;"></div>
		<div class="img2" style="background: url(images/2.png) no-repeat;"></div>
		<div class="img2" style="background: url(images/3.png) no-repeat;"></div>
		<div class="img2" style="background: url(images/4.png) no-repeat;"></div>
	</div>
	<div class="img-item">
		<div class="img2" style="background: url(picture/1.png) no-repeat;"></div>
		<div class="img2" style="background: url(images/2.png) no-repeat;"></div>
		<div class="img2" style="background: url(images/3.png) no-repeat;"></div>
		<div class="img2" style="background: url(images/4.png) no-repeat;"></div>
	</div>
	<div class="img-item">
		<div class="img2" style="background: url(picture/1.png) no-repeat;"></div>
		<div class="img2" style="background: url(images/2.png) no-repeat;"></div>
		<div class="img2" style="background: url(images/3.png) no-repeat;"></div>
		<div class="img2" style="background: url(images/4.png) no-repeat;"></div>
	</div>
	<div class="img-item">
		<div class="img2" style="background: url(picture/1.png) no-repeat;"></div>
		<div class="img2" style="background: url(images/2.png) no-repeat;"></div>
		<div class="img2" style="background: url(images/3.png) no-repeat;"></div>
		<div class="img2" style="background: url(images/4.png) no-repeat;"></div>
	</div>
	
</div>
<div class="btns2" data-num="0">
		<div class="prev2"><</div>
		<div class="next2">></div>
</div>

<div style="text-align:center;clear:both">

</div>
<script type="text/javascript">
	$(function (){
		var num = 0;
		$("#j_silder_outer .img-item").each(function(index, el) {
			$(this).css({
				"left":$(this).width() * index + "px",
				/*让每个img-item延时一定时间执行动画*/
				"transitionDelay": index * 0.3 + "s"
			});
			$(this).find(".img2").css({
				"backgroundPosition": -$(this).width() * index + "px"
			});;
		});

		$(".prev2").on("click",function (){
			$("#j_silder_outer .img-item").css("transform", "rotateX(" + (++num * 90) + "deg)");
		});

		$(".next2").on("click",function (){
			$("#j_silder_outer .img-item").css("transform", "rotateX(" + (--num * 90) + "deg)");
		});
		
		var timejg=4000;//轮播间隔时间
		var time = setInterval(move,timejg);
		function move(){
			$("#j_silder_outer .img-item").css("transform", "rotateX(" + (--num * 90) + "deg)");
		}
		$('.wbox2').hover(function(){
			clearInterval(time);
		},function(){
			time = setInterval(move,timejg);
		});


	})
</script>


<!-- 两个广告块 -->
<div class="ad" id="ad1" style="background-image:url(picture/1.png);background-size:cover;">
<img src="picture/1.png" width="100%" height="100%" style="border-radius:10px;"/>
</div>

<div class="ad" id="ad2" style="background-image:url(picture/2.jpg);background-size:cover;">
<img src="picture/3.jpg" width="100%" height="100%" style="border-radius:10px;"/>
</div>
















<%
Create cv=new Create();
StringBuilder s=cv.createVideo();
out.println(s);
%>




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
  background-image:url('picture/top.png'); 
  background-size:cover;
  position:fixed; 
  right: 30px; 
  bottom: 30px; 
  display: none; 
  cursor: pointer; 
  z-index: 99;
  
}
</style>

<script>
function  showImg(){
	 document.getElementById("logo-image").style.display='block';
	 }
	 function hideImg(){
	 document.getElementById("logo-image").style.display='none';
	 }
</script>
<div id="logo">
	<a href="javascript:void(0);" onMouseOut="hideImg()"  onmouseover="showImg()">
		<img src="picture/mylogo.png"  style="position:absolute;left:20px;top:-163px;height:30px;">
	</a>
</div>

<div id="logo-image" style="display: none;">
	<img src="picture/logo.jpg" width="250px" height="250px" style="position:absolute;left:0;top:0;border:2px solid black;border-radius:15px;">
</div>
<style>
#logo{
 position: absolute;
 z-index: 111;
 height: 50px;
 width: 50px;
 left:0px;
 top:175px;
}
#logo img{
 width: 50px;
 height: 50px;
}
#logo-image{
 display: none;
 position: absolute;
 z-index: 111;
 top:60px;
 left:10px;
}
</style>
<!-- -----------------------检查是否登陆--------------------- -->
<script>


function login2()
{
	var userid = "<%=request.getSession().getAttribute("userid")%>";
	if(userid=="null")
		{
		document.getElementById("login").click();
	      return false;
		}
}
</script>
</body>
</html>