<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>上传视频界面</title>
</head>
<body>
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
    
        <div>    
            <input type="submit" value="提交"/>  
        </div>
    
   </form> 
</div>


</body>
</html>