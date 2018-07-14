<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<link href="css/header.css" rel='stylesheet' type='text/css'>
<link href="css/button.css" rel='stylesheet' type='text/css'>

<title>上传视频</title>




</head>


<body>

<!-- 顶部菜单 -->
<div class="header">


    <a class="head1" href="home.jsp">主界面</a>

    <a class="head2" href="homePage.jsp"><img src="picture/1.png" width="100%" height="100%"></a>
        
    <a class="head3">尊敬的<%=request.getSession().getAttribute("username") %>欢迎光临</a>

    <a class="head4" href = "javascript:void(0)" onclick = "document.getElementById('light1').style.display='block';document.getElementById('fade').style.display='block'">反馈</a>


</div>









<div class="upload">
    <form method="post" action="UploadAction" onsubmit="return check();">
    
    
    
    
    
    
    
    

 
    
    
    
    

        <div class="fileInputContainer">  
            <a href="#" class="mybtn1 btn btn-medium type1" onclick="addVideo()">点击上传视频</a>
            <input id="file" type="file" name="file" style="display:none;"/>
            <input type="text" id="text"/>
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

                <div class="sub_input">
                   <div class="cover_txt">
                                <p>建议上传比例为 16:9，尺寸 ≥800*450；</p>
                   </div>
			
                    <div class="info_right">
                        <div class="type">
                            <label class="label_tit">&nbsp;&nbsp;所属类别：</label>
                            <span class="txt_num">0/20</span>
                            <input name="type" type="text" id="video_type" maxlength="20" value=""/>
                        </div></br>
                        <div class="title">
                            <label class="label_tit"><b>*</b>视频标题：</label>
                            <span class="txt_num">0/30</span>
                            <input style="border-radius:5px" class="filter-title" name="title" id="video_title" type="text"  placeholder="视频标题不能为空！" maxlength="30"/>
                        </div></br>
                        <div class="info">
                            <label class="label_tit"><b>*</b>视频简介：视频简介不能为空！0/200</label></br>
                            <textarea style="border-radius:5px" name="info" id="video_info" 
                              onKeyDown="textdown(event)"  onKeyUp="textup()"></textarea>
                            <span>0/200</span>
                            <span>视频简介不能为空！</span>
                        </div></br>

                        
                    </div>
                </div>
        
         <div class="suc_box">
         `<p><i class="suc_ico"></i>视频上传完成后将自动为您发布，在此期间请勿关闭网页。</p>
          <input style="width:80px;height:30px" type="submit" value="提交" onclick="myFunction();"/>
         </div>
         
         
         
         
      </form>
     </div>
     
<script>
function addVideo(){
	document.getElementById("file").click();
	document.getElementById("text").value=document.getElementById("file").value;
}
</script>    
     
<!-- ------------------------------下拉------------------------------------ -->
<script type="text/javascript" src="js/down.js"></script>
<script type="text/javascript" src="js/selectFilter.js"></script>
<link rel="stylesheet" type="text/css" href="css/selectFilter.css" />
<style type="text/css">
	.item {
		width: 240px;
		height: 32px;
		position:absolute;
		margin: 60px auto;
		left:300px;
	}
</style>
<!-- -----------------下拉结束-------------------- -->

<style>

.fileInputContainer{
    position:absolute;
    left:100px;
    top:800px;
}
#video_info {
 width:700px;
 height:150px;
}
#video_type{
  	border-radius:5px;
}
.drag_tip{
	font-family:"华文新魏";
	left:90px;
}
</style> 
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
<!-- ----------------------------------textarea的格式-------------------------- -->
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
<!-- ----------------------------上传图标------------------------------   --> 
<style type="text/css">

 /* ----------- 标题-------- */
 .tit{
 font-size:400%;
 font-family:"华文楷体";
 }
 .Home{
 position:absolute;
 left:10px;
 top:10px;
 font-size:120%;
 }
 .sub_input{
 	 position:relative;
 	 top:0;
 	 left:10%;
 	 text-align:left;
 }
.suc_box{
	 position:relative;
 	 top:0;
 	 left:10%;
 	 text-align:left;
}
</style>     
     

<!-- -----------------下拉------------------------- -->
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