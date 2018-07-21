<!--  邓慧颖  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/header.css" rel='stylesheet' type='text/css'>
<link href="css/button.css" rel='stylesheet' type='text/css'>
<link href="css/subject.css" rel='stylesheet' type='text/css'>
<title>录入题目</title>
</head>
<body>
<!-- 顶部菜单 -->
<div class="header">

    <a class="head1" href="home.jsp">主界面</a>

    <a class="head2" style="cursor:default;"><img src="ImageDisplay?id=user" width="75px" height="75px"></a>
        
    <a class="head3" style="cursor:default;"><%=request.getSession().getAttribute("username") %></a>

    <a class="head4" href = "javascript:void(0)" onclick = "document.getElementById('light1').style.display='block';document.getElementById('fade').style.display='block'">反馈</a>


</div>
<div class="content">


<div class="maincontentinner">
	   <!-- -----------------------------------------切换开始---------------------- -->
<script type="text/javascript">
 function test(){
 
 document.getElementById('a').style.display='none';
 document.getElementById('b').style.display='none';
 var value=document.getElementById('select').value;
 document.getElementById(value).style.display='block';
 }
 </script>

<form class="stdform" action="doQuestion" method="post">
<select name="questionType" id="select" onchange="test()">
 <option value="a" selected>单选题</option>
 <option value="b">填空题</option>
 </select>
 
 <div id="a" style="display:block">
 	<div class="widget">
							
							<div class="widgetcontent">
									<p>
										
										 <span class="field"><textarea class="mytitle" name="stTitle1" cols="80" rows="3" class="span5" placeholder="请输入试题题目"></textarea></span> 
									</p>
									<p>
										<label>选项A:</label>
										<span class="field"><input type="text" name="stOptionA"  class="input-large" placeholder="选项A"></span>
									</p>
									<p>
										<label>选项B:</label>
										<span class="field"><input type="text" name="stOptionB" class="input-large" placeholder="选项B"></span>
									</p>
									<p>
										<label>选项C:</label>
										<span class="field"><input type="text" name="stOptionC" class="input-large" placeholder="选项C"></span>
									</p>
									<p>
										<label>选项D:</label>
										<span class="field"><input type="text" name="stOptionD" class="input-large" placeholder="选项D"></span>
									</p>
									<p>
										<label>答案</label>
										<input name="stAnswer" type="radio" value="A" class="choose"/><label>A</label>
										<input name="stAnswer" type="radio" value="B" class="choose"/><label>B</label>
										<input name="stAnswer" type="radio" value="C" class="choose"/><label>C</label>
										<input name="stAnswer" type="radio" value="D" class="choose"/><label>D</label>
									</p>
									<p>
										
										 <span class="field"><textarea name="stParse1" cols="80" rows="5" class="span5" placeholder="试题解析"></textarea></span> 
									</p>
									
									<p>
										
										 <span class="field"><input name="score1" type="text" placeholder="分值" class="score"></span> 
									</p>
								
									<p class="stdformbutton">
										<input type="submit" value="录入" class="btn btn-medium type1">
										<input type="reset" value="重置" class="btn btn-medium type2">
										<input type="button" value="完成" onclick="sub()" class="btn btn-medium type3"/>
									</p>
							</div>
							<!--widgetcontent-->
						</div>
						<!--widget-->
 </div>
 <div id="b" style="display:none">
 	<div class="widget">
							<div class="widgetcontent">
									<p>
										 <span class="field"><textarea class="mytitle" placeholder="请输入试题题目" id="table2" name="stTitle2" cols="80" rows="3" class="span5"></textarea></span> 
									</p>
									<p>
										
										<span id="table" class="answer2" placeholder="请输入答案"></span><!-- name="questions[ + this.qno + ]" -->
									</p>
									<p>
										 <span class="field"><textarea name="stParse2" cols="80" rows="5" class="span5" placeholder="请输入解析"></textarea></span> 
									</p>
								
									<p>
										
										 <span class="field"><input class="score" name="score2" type="text" placeholder="请输入分值"></span> 
									</p>
								
									<p class="stdformbutton2">
										<input type="button" class="btn btn-medium type2" value="增加空" onclick="createQuestion();" />
										<input id="luru" type="submit" value="录入" class="btn btn-medium type2"/>
										<input type="button" value="重置" onclick="replaceDoc()" class="btn btn-medium type2">
										<input type="button" value="完成" onclick="sub()" class="btn btn-medium type2"/>
									</p>
							</div>
							<!--widgetcontent-->
						</div>
						<!--widget-->
 </div>
		
</form>
</div>
<!--maincontentinner-->

<!-- ----------------------动态增加文本框-------------------------------------- -->
<script>
var qus = new Array();

function Question() {
	this.qno = qus.length+1;
	this.ono = 0;
	this.create = function(table) {
		var qstr = "";
		qstr += "<b id=\"qu" + this.qno + "><div class=\"\" id=\"qu" + this.qno + "\">";
		qstr += "<input type=\"text\" name=\"questions[" + this.qno + "]\" required=\"required\" placeholder=\"答案" + this.qno + "\" />";
		qstr += "</div>";
		table.innerHTML += qstr;
		
		//table2
		document.getElementById('table2').innerHTML += '____'; 
	}
}

function createQuestion() {
	var qu = new Question();
	qus.push(qu);
	qu.create(document.getElementById('table'));
}
function replaceDoc()
{
    window.location.replace("subject.jsp")
}

function sub(){
	document.getElementById('luru').click();
	window.location="homePage.jsp";
}
</script>
</div>
</body>
</html>