<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>网站主界面</title>
<link href="css/bootstrap-3.1.1.min.css" rel='stylesheet' type='text/css' />
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/style.css" rel='stylesheet' type='text/css' />

<link href='https://fonts.googleapis.com/css?family=Oswald:300,400,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=PT+Sans:400,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Fugaz+One' rel='stylesheet' type='text/css'>

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

function addNode(){
	var id=document.all.nodeId.value;
	/* window.location.href="AddNodeManager.jsp?id="+id; */
	window.location.href="video.jsp";
	
}

/* ------return top------------ */
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
 body,div,ul,li,a,img{margin: 0;padding: 0;}
  ul,li{list-style: none;}
  a{text-decoration: none;}
 
  #wrapper{position: relative;margin: 30px auto;width: 400px;height: 200px;}
  #banner{position:relative;width: 400px;height: 200px;overflow: hidden;}
  .imgList{position:relative;width:2000px;height:200px;z-index: 10;overflow: hidden;}
  .imgList li{float:left;display: inline;}
  #prev,
  #next{position: absolute;top:80px;z-index: 20;cursor: pointer;opacity: 0.2;filter:alpha(opacity=20);}
  #prev{left: 10px;}
  #next{right: 10px;}
  #prev:hover,
  #next:hover{opacity: 0.5;filter:alpha(opacity=50);}
  .bg{position: absolute;bottom: 0;width: 400px;height: 40px;z-index:20;opacity: 0.4;filter:alpha(opacity=40);background: black;}
  .infoList{position: absolute;left: 10px;bottom: 10px;z-index: 30;}
  .infoList li{display: none;}
  .infoList .infoOn{display: inline;color: white;}
  .indexList{position: absolute;right: 10px;bottom: 5px;z-index: 30;}
  .indexList li{float: left;margin-right: 5px;padding: 2px 4px;border: 2px solid black;background: grey;cursor: pointer;}
  .indexList .indexOn{background: red;font-weight: bold;color: white;}


*{padding: 0;margin:0;list-style: none;text-decoration: none;font-family:Microsoft YaHei}
.ul2{margin:30px 0 0 50px;width: 800px;height: 200px;}

.ul2 li{float: left; margin-right: 20px;}

nav .box2{width: 225px;height: 175px;box-shadow: 0 4px 20px #ccc;position: relative;overflow: hidden;cursor: pointer;transition: 0.5s}
nav .ul2 .first{background: #fff;position: absolute;top:105px;}
nav .ul2 .first .top2{width: 225px;height: 40px;text-align: center;line-height: 40px;font-size: 15px;}
nav .ul2 .box2 .bottom2{width: 205px;height: 30px;line-height: 30px;font-size: 12px;color:#999;padding: 0 10px}
nav .ul2 .box2 .bottom2 span{float: right;}
nav .ul2 .last{background: #fff;position: absolute;top:105px;display: none;}
nav .ul2 .last .top2{color: #666;font-size: 12px;text-align: center;width: 225px;height: 30px;padding: 5px 0}
nav .ul2 .box2 img{transition: 1.5s}
nav .ul2 .box2:hover img{transform: scale(1.3); }
nav .ul2 .box2:hover .last{display: block;}
nav .ul2 .box2:hover{box-shadow: 0 4px 30px #B2B2B2;}

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
</head>

<body>
<div class="header">
		<div class="container">
		    <div class="col-sm-9 logo_right">
			<span class="menu"></span>
			<div class="top-menu">
				<ul>
					<li><a href="#" class="btn btn-default btn-default_2 pull-left" data-toggle="modal" data-target="#applyModal">登录</a></li>
					<li><a href="#" class="btn btn-default btn-default_2 pull-left" data-toggle="modal" data-target="#applyModal_1">注册</a></li>
				</ul>
			</div>
		
			<div class="clearfix"> </div>
				<div class="modal fade" id="applyModal" tabindex="-1" role="dialog" aria-labelledby="applyModalLabel" aria-hidden="true">
				  	<div class="modal-dialog modal-dialog_2">
				    	<div class="modal-content">
					      	<div class="modal-header">
					        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
					        	<h4 class="modal-title" id="myModalLabel">
					        		<div class="head_4">
			                          <p>login</p>
			                        </div>
			                    </h4>
					      	</div>
	                        <div class="modal-body">
                             <form class="register">
                               <div class="section">
                                <label for="username" class="field prepend-icon">
                                    <input type="text" name="username" id="username" placeholder="Username">
                                    <label for="username" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                               </div>
                               <div class="section">
                                <label for="password" class="field prepend-icon">
                                    <input type="password" name="password" id="password" placeholder="Password">
                                    <label for="password" class="field-icon">
                                        <i class="fa fa-lock"></i>
                                    </label>
                                </label>
                               </div>
                             <div class="section">
                                <div class="submit"><input type="submit" onclick="myFunction()" value="登录"></div>
                             </div>
                             <ul class="new">
                                <li class="new"><p class="sign">没有账号 ?&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#applyModal_1">注册</a></p></li>
						     </ul>
                           </form>
                        </div>
				    </div>
				 </div>
				</div>
				 <!-- Modal -->
				<div class="modal fade" id="applyModal_1" tabindex="-1" role="dialog" aria-labelledby="applyModalLabel" aria-hidden="true">
				  	<div class="modal-dialog dialog_3">
				    	<div class="modal-content">
					      	<div class="modal-header">
					        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
					        	<h4 class="modal-title" id="myModalLabel"><div class="head_4">
			                         <p>Register</p>
			                        </div></h4>
					      	</div>
					      	<form name="row" method="post" class="register">
					      		
	                            <!-- <div class="section">
                                  <label for="hhhhh" class="field prepend-icon">
                                    <select path="country" id="country" class="form-control input-sm">
				                        <option value="">学生用户</option>
				                        <option value="">教师用户</option>
				                    </select>
				                  </label>
                                </div> -->
                                
	                            <div class="section">
                                  <label for="username" class="field prepend-icon">
                                    <input type="text" name="email id" id="Email id" placeholder="Username">
                                    <label for="email id" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                  </label>
                                </div>
                               
                               <div class="section">
                                 <label for="password" class="field prepend-icon">
                                    <input type="password" name="password" id="password" placeholder="Password">
                                    <label for="password" class="field-icon">
                                        <i class="fa fa-lock"></i>
                                    </label>
                                 </label>
                               </div>
                               
                               <div class="section">
                                 <label for="password" class="field prepend-icon">
                                    <input type="password" name="password" id="password" placeholder="Password Again">
                                    <label for="password" class="field-icon">
                                        <!-- <i class="fa fa-lock"></i> -->
                                    </label>
                                 </label>
                               </div>
                               
                               
                               <div class="section">
                                  <label for="username" class="field prepend-icon">
                                    <input type="text" name="mobile number" id="Mobile Number" placeholder="Your name">
                                    <label for="mobile number" class="field-icon">
                                        <i class="fa fa-phone"></i>
                                    </label>
                                  </label>
                               </div>
                               
                               <div class="section">
                                  <label for="name" class="field prepend-icon">
                                    <select path="country" id="country" class="form-control input-sm">
				                        <option value="">Select Country</option>
				                        <option value="">Japan</option>
				                        <option value="">Kenya</option>
				                        <option value="">Dubai</option>
				                        <option value="">Italy</option>
				                        <option value="">Greece</option> 
				                        <option value="">Iceland</option> 
				                        <option value="">China</option> 
				                        <option value="">Doha</option> 
				                        <option value="">Irland</option> 
				                        <option value="">Srilanka</option> 
				                        <option value="">Russia</option> 
				                        <option value="">Hong Kong</option> 
				                        <option value="">Germany</option>
				                        <option value="">Canada</option>  
				                        <option value="">Mexico</option> 
				                        <option value="">Nepal</option>
				                        <option value="">Norway</option> 
				                        <option value="">Oman</option>
				                        <option value="">Pakistan</option>  
				                        <option value="">Kuwait</option> 
				                        <option value="">Indonesia</option>  
				                        <option value="">Spain</option>
				                        <option value="">Thailand</option>  
				                        <option value="">Saudi Arabia</option> 
				                        <option value="">Poland</option> 
				                    </select>
                                    <label for="name" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                  </label>
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
			<div class="clearfix"></div>
		 </div>
	   </div>
</div>

 <div id="wrapper"><!-- 最外层部分 -->
    <div id="banner"><!-- 轮播部分 -->
      <ul class="imgList"><!-- 图片部分 -->
        <li><a href="#"><img src="./img/test1.jpg" width="400px" height="200px" alt="puss in boots1"></a></li>
      <li><a href="#"><img src="./img/test2.jpg" width="400px" height="200px" alt="puss in boots2"></a></li>
      <li><a href="#"><img src="./img/test3.jpg" width="400px" height="200px" alt="puss in boots3"></a></li>
      <li><a href="#"><img src="./img/test4.jpg" width="400px" height="200px" alt="puss in boots4"></a></li>
      <li><a href="#"><img src="./img/test5.jpg" width="400px" height="200px" alt="puss in boots5"></a></li>
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
    goLeft(imgList,num*400); //左移一定距离
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
    if(dist == 400){ //第一次时设置left为0px 或者直接使用内嵌法 style="left:0;"
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
   for(var i=0;i<= dist/20;i++){ //这里设定缓慢移动，10阶每阶40px
      (function(_i){ 
        var pos = parseInt(elem.style.left); //获取当前left
        setTimeout(function(){ 
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


<nav>
<ul class="ul2">
<li>
<div class="box2">
<img src="../img/01.jpg" onClick="addNode();"/>
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
<div class="box2">
<img src="../img/01.jpg" onClick="addNode();"/>
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
<div class="box2">
<img src="../img/01.jpg" onClick="addNode();"/>
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
<div class="box2">
<img src="../img/01.jpg" onClick="addNode();"/>
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
<div class="box2">
<img src="../img/01.jpg" onClick="addNode();"/>
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
<div class="box2">
<img src="../img/01.jpg" onClick="addNode();"/>
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

<form action="doUpload.jsp" method="post" enctype="multipart/form-data">
<!-- 类型enctype用multipart/form-data，这样可以把文件中的数据作为流式数据上传，不管是什么文件类型，均可上传。 -->
请选择要上传的文件<input type="file" name="upfile" size="50">
<input type="submit" value="提交">
</form>

<div class="return_top"></div>

</body>

</html>