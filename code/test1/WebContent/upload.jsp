<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传视频</title>
</head>
<body>
     <div id="pickfiles" class="bigBtn">
        <p>
         <span class="tit">网页上传</span>
         <span class="txt">仅支持FLV或MP4文件格式</span>
        </p>                              
     </div>
  <div class="upload">
    <form method="post" action="UploadAction">
        <div>  
            <input type="file" name="file"></input> 
        </div>
        <div>
            <select>
		    <option value="">选择科目</option>
			<option value="">语文</option>
			<option value="">数学</option>
			<option value="">英语</option>			                         		                        
		    </select>
        </div>
 <!--   </form> --> 
<!-- </div> -->
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
                            <input type="text" class="video_type" maxlength="20" value=""/>
                        </div>
                        <div class="title">
                            <label class="label_tit"><b>*</b>视频标题：</label>
                            <div class="inp_txt">
                                <span class="txt_num">0/30</span>
                                <input type="text" class="video_title"  maxlength="30" value=""/>
                            </div>
                            <span class="err_tips hidden">视频标题不能为空！</span>
                        </div>
                        <div class="info">
                            <label class="label_tit"><b>*</b>视频简介：</label>
                            <textarea class="video_info" value=""></textarea>
                            <span class="txt_num">0/200</span>
                        </div>

                        <div class="tag">
                            <label class="label_tit">视频标签：</label>
                            <div class="tag_box">
                                <input type="text" class="video_tag" maxLength="5"/>
                                <input type="text" class="video_tag" maxLength="5"/>
                                <input type="text" class="video_tag" maxLength="5"/>
                                <input type="text" class="video_tag" maxLength="5"/>
                                <input type="text" class="video_tag" maxLength="5"/>
                                <input type="text" class="video_tag" maxLength="5"/>
                            </div>
                            <div class="tag_tips">
                                <div class="txt">每标签最多5个字，最多填写6个标签。标签是根据视频内容、属性所概括出的一组关键词。标签可以让别人更快速、准确的搜索到您的视频！</div>
                            </div>
                        </div>
                    </div>
                </div>
         </form>
         </div>
                <div class="suc_box">
                    <p><i class="suc_ico"></i>视频上传完成后将自动为您发布，在此期间请勿关闭网页。</p>
                  	<input type="button" value="提交" onclick="return check();"/>
                </div>
<script type="text/javascript">
   function check(){
	   var title=$("#title").val();
	   if(title==null||npassword==""){
		    alert("标题不能为空！");
		    $("#title").focus();
		    return false;
	   } else{
		   $("#form").submit();
	   } 
   }
 
</script>
</body>
</html>