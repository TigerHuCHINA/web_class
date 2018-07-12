<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传视频</title>
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
body {
	background:url(picture/upload-back.jpg);
  	background-color:rgba(0,0,0,1);
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
    .fileInputContainer{
        height:125px;
        width: 113px;
        background:url(picture/upload.png);
        position:relative;
        background-repeat:no-repeat;
    }
    .fileInput{
        height:115px;
        font-size: 300px;
        position:absolute;
        right:0;
        top:0;
        opacity: 0;
        filter:alpha(opacity=0);
        cursor:pointer;
    }
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
</head>
<body>
     <div id="pickfiles" class="bigBtn">
     	<a class="Home" href="home.jsp">主界面</a>
        <p align="center">
         <span class="tit"><strong>网页上传</strong></span>
        <!--  <span class="txt">仅支持FLV或MP4文件格式</span> -->
        </p>                              
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
  <div class="upload">
    <form method="post" action="UploadAction" onsubmit="return check();">
        <div class="fileInputContainer">  
            <input class="fileInput" id="file" type="file" name="file"/>
        </div>
      <p class="drag_tip" style="font-size:200%"><strong>点击图片上传视频</strong></p><br><br><br><br>
           <!-- 填写资料 -->
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
                           <!--  <span>0/200</span>
                            <span>视频简介不能为空！</span> -->
                        </div></br>

                        <div class="tag">
                            <label class="label_tit">&nbsp;&nbsp;视频标签：</label>
                            <div class="tag_box">
                                <input style="border-radius:5px" name="label" type="text" id="video_tag" maxLength="5"/>
                                <input style="border-radius:5px" name="label" type="text" id="video_tag" maxLength="5"/>
                                <input style="border-radius:5px" name="label" type="text" id="video_tag" maxLength="5"/>
                                <input style="border-radius:5px" name="label" type="text" id="video_tag" maxLength="5"/>
                                <input style="border-radius:5px" name="label" type="text" id="video_tag" maxLength="5"/>
                                <input style="border-radius:5px" name="label" type="text" id="video_tag" maxLength="5"/>
                            </div>
                            <div class="tag_tips">
                                <div class="txt">每标签最多5个字，最多填写6个标签。标签是根据视频内容、属性所概括出的一组关键词。标签可以让别人更快速、准确的搜索到您的视频！</div>
                            </div>
                        </div>
                    </div>
                </div>
        
         <div class="suc_box">
         `<p><i class="suc_ico"></i>视频上传完成后将自动为您发布，在此期间请勿关闭网页。</p>
          <input style="width:80px;height:30px" type="submit" value="提交" onclick="myFunction();"/>
         </div>
      </form>
     </div>
     

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