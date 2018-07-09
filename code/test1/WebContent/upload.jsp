<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传视频</title>
<style>
body {background-color:#C0C0C0;}
#video_info {
 width:700px;
 height:150px;
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
</head>
<body>
     <div id="pickfiles" class="bigBtn">
        <p>
         <span class="tit">网页上传</span>
         <span class="txt">仅支持FLV或MP4文件格式</span>
        </p>                              
     </div>
  <div class="upload">
    <form method="post" action="UploadAction" onsubmit="return check();">
        <div>  
            <input id="file" type="file" name="file"></input> 
        </div>
        <div>
            <select name="subject">
		    <option value="">选择科目</option>
			<option value="">语文</option>
			<option value="">数学</option>
			<option value="">英语</option>			                         		                        
		    </select>
        </div>
      <p class="drag_tip">拖拽视频到此也可上传</p>
           <!-- 填写资料 -->
                <div class="sub_input">
                   <div class="cover_txt">
                                <p>建议上传比例为 16:9，尺寸 ≥800*450；</p>
                   </div>
			
                    <div class="info_right">
                        <div class="type">
                            <label class="label_tit">所属类别：</label>
                            <span class="txt_num">0/20</span>
                            <input name="type" type="text" id="video_type" maxlength="20" value=""/>
                        </div>
                        <div class="title">
                            <label class="label_tit"><b>*</b>视频标题：</label>
                            <span class="txt_num">0/30</span>
                            <input name="title" type="text" id="video_title"  maxlength="30" value="视频标题不能为空！"
                             onblur="if(this.value=='') {this.value='视频标题不能为空！'}"
                             onfocus="if(this.value=='视频标题不能为空！') {this.value='';}"
                            />
                           <!--  <span>视频标题不能为空！</span> -->
                        </div>
                        <div class="info">
                            <label class="label_tit"><b>*</b>视频简介：视频简介不能为空！0/200</label></br>
                            <textarea name="info" id="video_info" 
                              onKeyDown="textdown(event)"  onKeyUp="textup()">
                               </textarea>
                           <!--  <span>0/200</span>
                            <span>视频简介不能为空！</span> -->
                        </div>

                        <div class="tag">
                            <label class="label_tit">视频标签：</label>
                            <div class="tag_box">
                                <input name="label" type="text" id="video_tag" maxLength="5"/>
                                <input name="label" type="text" id="video_tag" maxLength="5"/>
                                <input name="label" type="text" id="video_tag" maxLength="5"/>
                                <input name="label" type="text" id="video_tag" maxLength="5"/>
                                <input name="label" type="text" id="video_tag" maxLength="5"/>
                                <input name="label" type="text" id="video_tag" maxLength="5"/>
                            </div>
                            <div class="tag_tips">
                                <div class="txt">每标签最多5个字，最多填写6个标签。标签是根据视频内容、属性所概括出的一组关键词。标签可以让别人更快速、准确的搜索到您的视频！</div>
                            </div>
                        </div>
                    </div>
                </div>
        
         <div class="suc_box">
         `<p><i class="suc_ico"></i>视频上传完成后将自动为您发布，在此期间请勿关闭网页。</p>
          <input type="submit" value="提交" onclick="myFunction();"/>
         </div>
      </form>
     </div>

</body>
</html>