<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>






<link href="css/header.css" rel='stylesheet' type='text/css'>
<link href="css/button.css" rel='stylesheet' type='text/css'>



<script type="text/javascript" src="js/down.js"></script>
<script type="text/javascript" src="js/selectFilter.js"></script>
<link rel="stylesheet" type="text/css" href="css/selectFilter.css" />

<link href="css/uploadstyle.css" rel='stylesheet' type='text/css'>




<title>上传视频</title>




</head>


<body>

<!-- 顶部菜单 -->
<div class="header">


    <a class="head1" href="home.jsp">主界面</a>

    <a class="head2" href="homePage.jsp"><img src="ImageDisplay" width="100%" height="100%"></a>
        
    <a class="head3">尊敬的<%=request.getSession().getAttribute("username") %>欢迎光临</a>

    <a class="head4" href = "javascript:void(0)" onclick = "document.getElementById('light1').style.display='block';document.getElementById('fade').style.display='block'">反馈</a>


</div>









<div class="upload">
    <form method="post" action="UploadAction" onsubmit="return check();">
    
    
    
    
    
    
    
    

 
    
    
    
    

        <div class="fileInputContainer">  
            <a href="#" class="mybtn1 btn btn-medium type1" onclick="addVideo()">点击上传视频</a>
            <input id="file" type="file" name="file" style="display:none;"/>
            <input id="text" type="text"/>
        </div>
        
        
        <div class="item">
	        <div class="filter-box">
		        <div class="filter-text">
			        <input class="filter-title" type="text" readonly placeholder="选择科目" />
			        <i class="icon icon-filter-arrow"></i>
		        </div>
		        <select name="filter">
			        <option value="">语文</option> 
			        <option value="">数学</option>
			        <option value="">英语</option>
		        </select>
	        </div>
        </div>
        
        <div class="title">
            <input class="filter-title" name="title" id="video_title" type="text"  placeholder="请输入视频标题" maxlength="30"/>
        </div>
              
        <div class="info">
            <textarea name="info" id="video_info" onKeyDown="textdown(event)"  onKeyUp="textup()" placeholder="请输入视频简介"></textarea>
        </div>
        <div class="submit">
            <a class="mybtn1 btn btn-large type3"type=" submit" onclick="myFunction();">提交</a>
        </div>       
    </form>
</div>
     
     
     
     
<script>
function addVideo(){
	document.getElementById("file").click();
	document.getElementById("text").value=document.getElementById("file").value;
}
</script>    
     
 
<script>
function check() {
	var x=document.getElementById("video_title").value;
	var y=document.getElementById("video_info").value;
	var z=document.getElementById("file").value;
    if(x=="") {
          alert("请输入标题!");
          return false;
     }
	if(y==""){
          alert("请输入简介!");
          return false;
    }
	if(z==""){
        alert("请上传文件!");
        return false;
 	}
    return true;
}
</script>

<script type="text/javascript">    
function textdown(e) {
    textevent = e;
    if (textevent.keyCode == 8) {
        return;
    }
    if (document.getElementById("video_info").value.length >= 200) {
        alert("此处限字200")
        if (!document.all) {
            textevent.preventDefault();
        } else {
            textevent.returnValue = false;
        }
    }
}
function textup() {
    var s = document.getElementById("video_info").value;
    //判断ID为text的文本区域字数是否超过200个 
    if (s.length > 200) {
        document.getElementById("video_info").value = s.substring(0, 200);
    }
}
</script> 

<script type="text/javascript">
	//这里是初始化
	$('.filter-box').selectFilter({
		callBack : function (val){
			//返回选择的值
			console.log(val+'-是返回的值')
		}
	});
</script>



</body>
</html>