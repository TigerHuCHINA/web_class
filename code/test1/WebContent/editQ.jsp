<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑试卷</title>
</head>
<body>
<h1 align="center">编辑试卷</h1>

<form>
<div name="ti"></div>
  <table width="300">
		<tr>
		  <td><a href="tQuery.jsp">标题1</a></td><td><input type="button" value="发布" onClick="msgbox()"></td><td><input type="button" value="删除"></td>
		</tr>
		<tr>
		  <td><a href="tQuery.jsp">标题2</a></td><td><input type="button" value="发布" onclick="msgbox()"></td> <td><input type="button" value="删除"></td>
		</tr>
  </table>	
<div id='mydiv' style='display:none;'>
<textarea id='pinlun' ></textarea>
<input type="submit" id='sbmt' value='提交' >
</div>
<input type="button" value="添加" onclick="window.location='query.jsp'">

<script>
function msgbox(){
	window.prompt("填写发布时间","");
	/* var r=window.confirm("弹出确认取消框,并将本段字符串显示,返回一个Boolean值"); */
}
</script>
</form>
</body>
</html>