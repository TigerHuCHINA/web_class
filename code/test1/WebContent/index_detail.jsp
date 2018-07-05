<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<body>
<div class="header">
	<div class="container">
	
		<div class="top-menu">
			<ul>
				<li><a href="#" class="btn btn-default btn1 pull-left" data-toggle="modal" data-target="#applyModal">登录</a></li>
				<li><a href="#" class="btn btn-default btn1 pull-left" data-toggle="modal" data-target="#applyModal_1">注册</a></li>
			</ul>
		</div>
		
			
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
                        <form name=row class="login" action="doLogin" method="post">
                             
                            <div class="section">
                                <input type="text" name="userid" id="userid" placeholder="请输入账号">                               
                            </div>
                            <div class="section">
                                <input type="password" name="password" id="password" placeholder="请输入密码">
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
					    <form name="row" class="register" action="doRegister" method="post">
					        <div class="section">
                                <input type="text" name="userid" id="userid" placeholder="请输入账号">
                            </div>   
                            <div class="section">
                                <input type="password" name="password" id="password" placeholder="请输入密码">
                            </div>               
                            <div class="section">
                                <input type="password" name="password2" id="password2" placeholder="请确认密码">
                            </div>
                            <div class="section">
                                <input type="text" name="username" id="username" placeholder="请输入昵称">
                            </div>                         
                            <div class="section">                                  
                                <select id="country" class="form-control input-sm">
				                    <option value="">请选择省份</option>
				                    <option value="">北京</option>
				                    <option value="">上海</option>
				                    <option value="">江苏</option>
				                    <option value="">河南</option>
				                    <option value="">湖北</option> 
				                    <option value="">河北</option> 
				                    <option value="">浙江</option> 
				                    <option value="">吉林</option> 
				                    <option value="">广西</option> 
				                    <option value="">广东</option> 
				                </select>                             
                            </div>                              
                            <div class="section">
                                <div class="submit"><input type="submit" onclick="myFunction()" value="提交"></div>
                            </div>
                            <div class="checkbox check_1">
							    <input id="check1" type="checkbox" name="check" value="check1">
							    <label for="check1">我同意服务条款和隐私政策</label>
							</div>
						</form>      			                                       
	                </div>     
                 </div>
		     </div>
		 </div>
		 
	</div>
</div>


<div id="wrapper"><!-- 最外层部分 -->
    <div id="banner"><!-- 轮播部分 -->
      <ul class="imgList"><!-- 图片部分 -->
      <li><a href="#"><img src="picture/2.jpg" width="1500px" height="500px" alt="puss in boots1"></a></li>
      <li><a href="#"><img src="picture/3.jpg" width="1500px" height="500px" alt="puss in boots2"></a></li>
      <li><a href="#"><img src="picture/4.jpg" width="1500px" height="500px" alt="puss in boots3"></a></li>
      <li><a href="#"><img src="picture/5.jpg" width="1500px" height="500px" alt="puss in boots4"></a></li>
      <li><a href="#"><img src="picture/6.jpg" width="1500px" height="500px" alt="puss in boots5"></a></li>
      </ul>
      <img src="./img/prev.png" width="20px" height="40px" id="prev">
      <img src="./img/next.png" width="20px" height="40px" id="next">
      <div class="bg"></div> <!-- 图片底部背景层部分-->
      <ul class="infoList"><!-- 图片左下角文字信息部分 -->
        <li class="infoOn">puss in boots1</li>
        <li>puss in boots2</li>
        <li>puss in boots3</li>
        <li>puss in boots4</li>
        <li>puss in boots5</li>
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
<script type="text/javascript">
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
  },2500);
 
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
    if(dist == 1500){ //第一次时设置left为0px 或者直接使用内嵌法 style="left:0;"
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
   for(var i=0;i<=dist/20;i++)
   {//这里设定缓慢移动，10阶每阶40px
      (function(_i)
    		  { 
        var pos = parseInt(elem.style.left); //获取当前left
        setTimeout(function()
        		{ 
          pos += (toLeft)? -(_i * 20) : (_i * 20); //根据toLeft值指定图片组位置改变
          //console.log(pos);
          elem.style.left = pos + "px";
        },_i * 25); //每阶间隔50毫秒
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
String message = (String)session.getAttribute("register");
if(message!=null)
{
	out.print("<script>window.alert(\"" + message + "\");</script>");
	session.removeAttribute("register");
}
%>























<nav>
    <ul class="ul1">
        <li>
            <div class="box1">
                <a class="avatar_pic" target="_blank" href="xxxxx.jsp">
                    <img src="picture/1.png"/>
                </a>
                <div class="first">
                    <p class="top2">PHP入门篇</p>
                    <p class="bottom2">更新至7-14<span>课程时长:5小时56分</span></p>
                </div>
                <div class="last">
                    <p class="top2">3小时轻松帮你快速掌握PHP语言基础知识,为后续PHP进级课程学习打下基础。</p>
                    <p class="bottom2">2015-08-17<span>272648人学习</span></p>
                </div>
            </div>
        </li>
  
        <li>
            <div class="box1">
                <a class="avatar_pic" target="_blank" href="xxxxx.jsp">
                    <img src="picture/1.png"/>
                </a>
                <div class="first">
                <p class="top2">PHP入门篇</p>
                <p class="bottom2">更新至7-14<span>课程时长:5小时56分</span></p>
                </div>
                <div class="last">
                    <p class="top2">3小时轻松帮你快速掌握PHP语言基础知识,为后续PHP进级课程学习打下基础。</p>
                    <p class="bottom2">2015-08-17<span>272648人学习</span></p>
                </div>
            </div>
        </li>
  
        <li>
            <div class="box1">
                <a class="avatar_pic" target="_blank" href="xxxxx.jsp">
                    <img src="picture/1.png";"/>
                </a>
                <div class="first">
                    <p class="top2">PHP入门篇</p>
                    <p class="bottom2">更新至7-14<span>课程时长:5小时56分</span></p>
                </div>
                <div class="last">
                    <p class="top2">3小时轻松帮你快速掌握PHP语言基础知识,为后续PHP进级课程学习打下基础。</p>
                    <p class="bottom2">2015-08-17<span>272648人学习</span></p>
                </div>
            </div>
        </li>
    </ul>
</nav>

</body>
</html>